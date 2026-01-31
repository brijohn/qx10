;=============================================================================
; loadrom.asm - loads BIOS.ROM to 0x0000, and jumps to it
;
;
; Assemble with z80asm -oloadrom.com loadrom.asm
;=============================================================================

BDOS:     EQU     0005h           ; BDOS entry point
SETDMA:   EQU     1Ah             ; Set DMA address function
FOPEN:    EQU     0Fh             ; Open file function
FREAD:    EQU     14h             ; Read sequential function
PSTRING:  EQU     09h             ; Print string function
WARMBOOT: EQU     00h             ; Warm boot address

CPMBASE: EQU     0100h           ; CP/M program load address
RELOC:   EQU     2000h           ; Relocation address (above 8K)
ROMBUF:  EQU     4000h           ; ROM buffer in high memory
ROMADDR: EQU     0000h           ; ROM load address
ROMSIZE: EQU     2000h           ; 8K ROM size

; ============================================================================
; Assemble for final location at 0x2000
; CP/M loads at 0x0100, but we relocate immediately
; ============================================================================
        ORG     RELOC

START:
        ; Position-independent relocation stub
        LD      HL,CPMBASE      ; Source: where CP/M loaded us (0x0100)
        LD      DE,RELOC        ; Destination: where we want to be (0x2000)
        LD      BC,PROGEND-START ; Length of entire program
        LDIR                    ; Copy to high memory

        ; Calculate jump address: RELOC + (MAIN - START)
        LD      HL,RELOC + (MAIN - START)
        JP      (HL)            ; Jump to relocated MAIN

MAIN:
        ; Now running at correct address (0x2000+offset)

        ; Print startup message
        LD      DE,MSG_START
        LD      C,PSTRING
        CALL    BDOS

        ; Open BIOS.ROM file
        LD      DE,FCB
        LD      C,FOPEN
        CALL    BDOS
        CP      0FFh            ; 0xFF = file not found
        JP      Z,ERROR_NOTFOUND

        ; File opened successfully
        LD      DE,MSG_LOADING
        LD      C,PSTRING
        CALL    BDOS

        ; Read 8K into high memory buffer (64 sectors of 128 bytes each)
        LD      B,64            ; 64 sectors = 8K
        LD      HL,ROMBUF       ; Start loading at high memory buffer

READLOOP:
        PUSH    BC
        PUSH    HL

        ; Set DMA address for this sector
        EX      DE,HL           ; DMA address in DE
        LD      C,SETDMA
        CALL    BDOS

        ; Read one sector
        LD      DE,FCB
        LD      C,FREAD
        CALL    BDOS

        POP     HL
        POP     BC

        ; Check for read error
        OR      A               ; A=0 means success
        JP      NZ,ERROR_READ

        ; Move to next sector (128 bytes)
        LD      DE,128
        ADD     HL,DE

        DJNZ    READLOOP

        ; All sectors read successfully
        LD      DE,MSG_SUCCESS
        LD      C,PSTRING
        CALL    BDOS

        ; *** NO MORE BDOS CALLS AFTER THIS POINT ***

        ; Copy 8K from buffer to 0x0000
        LD      HL,ROMBUF       ; Source: high memory buffer
        LD      DE,ROMADDR      ; Destination: 0x0000
        LD      BC,ROMSIZE      ; Length: 8K
        LDIR                    ; Block copy (overwrites BDOS!)

        ; Jump to ROM at 0x0000
        JP      ROMADDR

ERROR_NOTFOUND:
        LD      DE,MSG_NOTFOUND
        LD      C,PSTRING
        CALL    BDOS
        JP      WARMBOOT

ERROR_READ:
        LD      DE,MSG_READERR
        LD      C,PSTRING
        CALL    BDOS
        JP      WARMBOOT

; Messages
MSG_START:
        DB      'Loading BIOS.ROM...',13,10,'$'

MSG_LOADING:
        DB      'File opened, reading 8K...',13,10,'$'

MSG_SUCCESS:
        DB      'Complete! Jumping to ROM...',13,10,'$'

MSG_NOTFOUND:
        DB      'ERROR: BIOS.ROM not found!',13,10,'$'

MSG_READERR:
        DB      'ERROR: Disk read error!',13,10,'$'

; File Control Block (FCB) for BIOS.ROM
FCB:
        DB      0               ; Drive (0 = default)
        DB      'BIOS    '      ; Filename (8 chars, space-padded)
        DB      'ROM'           ; Extension (3 chars)
        DB      0               ; Current block
        DB      0,0             ; Record size
        DB      0,0,0,0         ; File size
        DS      16              ; Reserved by CP/M
        DB      0               ; Current record
        DB      0,0,0           ; Random record

PROGEND:
