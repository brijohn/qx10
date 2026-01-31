;=============================================================================
; cmosload.asm - Load SRAM.DMP into CMOS SRAM with signature and checksum
;
; Usage: cmosload
;
; Loads hddboot code into the first 512 bytes of CMOS SRAM
;
; Assemble with z80asm -ocmosload.com cmosload.asm
;=============================================================================

        ORG     0E000H

CMOS:    EQU     20H             ; CMOS enable/disable port
BDOS:    EQU     0005H           ; CP/M BDOS entry
PSTRING: EQU     09H             ; Print string function
FOPEN:   EQU     0FH             ; Open file
FCLOSE:  EQU     10H             ; Close file
FREAD:   EQU     14H             ; Read sequential
SETDMA:  EQU     1AH             ; Set DMA address

;-----------------------------------------------------------------------------
; Position-independent loader (executes at 0x0100 when CP/M loads it)
;-----------------------------------------------------------------------------
START:
        LD      HL,0100H        ; Source (CP/M loads us at 0x0100)
        LD      DE,0E000H       ; Destination
        LD      BC,PROGEND-START ; Length
        LDIR                    ; Copy everything to 0xE000
        JP      0E000H+(MAIN-START) ; Jump to main code at 0xE000

;-----------------------------------------------------------------------------
; Main program (executes at 0xE000 after relocation)
;-----------------------------------------------------------------------------
MAIN:
        ; Open SRAM.DMP
        LD      DE,FCB          ; FCB
        LD      C,FOPEN
        CALL    BDOS
        CP      0FFH
        JP      Z,OPENERR       ; File not found

        ; Zero out 512 bytes at 0x0100
        LD      HL,0100H
        LD      DE,0101H
        LD      BC,01FFH        ; 511 bytes
        LD      (HL),0
        LDIR                    ; Fill 0x100-0x2FF with zeros

        ; Read file into 0x0100 (until EOF, max 508 bytes)
        LD      HL,0100H
        LD      (DMAPTR),HL

READLOOP:
        ; Set DMA address for next read
        LD      DE,(DMAPTR)
        LD      C,SETDMA
        CALL    BDOS

        ; Read next record
        LD      DE,FCB          ; FCB
        LD      C,FREAD
        CALL    BDOS
        OR      A
        JP      NZ,READEOF      ; EOF or error (treat EOF as success)

        ; Advance DMA by 128 bytes for next record
        LD      HL,(DMAPTR)
        LD      DE,80H
        ADD     HL,DE
        LD      (DMAPTR),HL

        ; Check if we've exceeded 508 bytes (0x1FC)
        LD      DE,02FCH        ; 0x100 + 0x1FC
        OR      A
        SBC     HL,DE
        JP      NC,READEOF      ; Stop if we've read enough

        ; Restore HL and continue
        LD      HL,(DMAPTR)
        JP      READLOOP

READEOF:

        ; Close file
        LD      DE,FCB
        LD      C,FCLOSE
        CALL    BDOS

        ; Write signature 0xAA55 at offset 0x1FC (address 0x02FC)
        LD      HL,02FCH
        LD      (HL),55H        ; Low byte first
        INC     HL
        LD      (HL),0AAH       ; High byte

        ; Calculate checksum (16-bit XOR+shift on 0x100-0x2FD)
        LD      HL,0            ; Checksum starts at 0
        LD      DE,0100H        ; Start address
CHKLOOP:
        LD      A,(DE)          ; Get byte
        XOR     L               ; XOR with low byte of HL
        LD      L,A
        LD      BC,0
        ADD     HL,HL           ; Shift HL left by 1 bit
        ADC     HL,BC           ; Add carry
        INC     DE
        LD      A,02H           ; Check if DE = 0x02FE
        CP      D
        JP      NZ,CHKLOOP
        LD      A,0FEH
        CP      E
        JP      NZ,CHKLOOP

        ; Store 16-bit checksum at 0x2FE (little endian)
        LD      (02FEH),HL

        ; Enable CMOS SRAM
        LD      A,1
        OUT     (CMOS),A

        ; Copy 512 bytes from 0x0100 to 0x8000 (CMOS)
        LD      HL,0100H        ; Source
        LD      DE,8000H        ; Destination (CMOS)
        LD      BC,0200H        ; 512 bytes
        LDIR

        ; Disable CMOS SRAM
        XOR     A
        OUT     (CMOS),A

        ; Display success message
        LD      DE,DONEMSG
        LD      C,PSTRING
        CALL    BDOS

        ; Exit to CP/M
        JP      0000H

OPENERR:
        LD      DE,ERRMSG1
        LD      C,PSTRING
        CALL    BDOS
        JP      0000H

READERR:
        LD      DE,ERRMSG2
        LD      C,PSTRING
        CALL    BDOS
        JP      0000H

DMAPTR:
        DW      0100H

DONEMSG:
        DB      'CMOS SRAM loaded successfully.',13,10,'$'

ERRMSG1:
        DB      'Error: SRAM.DMP not found.',13,10,'$'

ERRMSG2:
        DB      'Error: Read failed.',13,10,'$'

;-----------------------------------------------------------------------------
; File Control Block for SRAM.DMP
;-----------------------------------------------------------------------------
FCB:
        DB      0               ; Drive (0 = default)
        DB      'SRAM    '      ; Filename (8 chars)
        DB      'DMP'           ; Extension (3 chars)
        DS      24              ; Rest of FCB (cleared to 0)

PROGEND:

        END
