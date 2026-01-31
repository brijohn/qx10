;=============================================================================
; cmosdump.asm - Dump CMOS SRAM contents for Epson QX-10/16
;
; Usage: cmosdump
;
; Dumps first 512 bytes of CMOS SRAM to screen in hex format and saves it to sram.dmp
;
; Assemble with z80asm -ocmosdump.com cmosdump.asm
;=============================================================================

        ORG     0E000H

CMOS:    EQU     20H             ; CMOS enable/disable port
BDOS:    EQU     0005H           ; CP/M BDOS entry
CONOUT:  EQU     02H             ; Console output function
PSTRING: EQU     09H             ; Print string function
FCREATE: EQU     16H             ; Create file
FCLOSE:  EQU     10H             ; Close file
FWRITE:  EQU     15H             ; Write sequential
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
        ; Print banner
        LD      DE,MSG_BANNER
        LD      C,PSTRING
        CALL    BDOS

        ; Enable CMOS SRAM at 0x8000
        LD      A,1
        OUT     (CMOS),A

        ; Copy 512 bytes from CMOS to 0x0100
        LD      HL,8000H        ; Source: CMOS
        LD      DE,0100H        ; Destination: TPA
        LD      BC,0200H        ; 512 bytes
        LDIR

        ; Disable CMOS SRAM (BEFORE any BDOS calls)
        XOR     A
        OUT     (CMOS),A

        ; Create output file
        LD      DE,FCB
        LD      C,FCREATE
        CALL    BDOS
        CP      0FFH
        JP      Z,FILEERR       ; File create error

        ; Write 512 bytes to file (4 records of 128 bytes from 0x0100)
        LD      HL,0100H        ; Data at 0x0100
        LD      B,4             ; 4 records (512 bytes total)
FILELOOP:
        PUSH    BC
        PUSH    HL
        EX      DE,HL
        LD      C,SETDMA        ; Set DMA address to 0x0100 area
        CALL    BDOS
        LD      DE,FCB
        LD      C,FWRITE        ; Write 128-byte record
        CALL    BDOS
        OR      A
        JP      NZ,FILEERR      ; Write error
        POP     HL
        LD      BC,80H          ; 128 bytes
        ADD     HL,BC
        POP     BC
        DJNZ    FILELOOP

        ; Close file
        LD      DE,FCB
        LD      C,FCLOSE
        CALL    BDOS

        ; Print saved message
        LD      DE,MSG_SAVED
        LD      C,PSTRING
        CALL    BDOS

        ; Dump 512 bytes to screen (32 lines of 16 bytes each)
        LD      HL,0100H        ; Dumped data at 0x0100
        LD      B,32            ; Number of lines

DUMPLOOP:
        PUSH    BC
        PUSH    HL

        ; Print address (4 hex digits)
        CALL    PRADDR

        ; Print separator
        LD      A,':'
        CALL    PRCHR
        LD      A,' '
        CALL    PRCHR

        ; Print 16 bytes in hex
        POP     HL
        PUSH    HL
        LD      B,16

HEXLOOP:
        LD      A,(HL)          ; Get byte from buffer
        CALL    PRHEX           ; Print as hex
        LD      A,' '
        CALL    PRCHR           ; Space separator
        INC     HL
        DJNZ    HEXLOOP

        ; Print ASCII representation
        LD      A,' '
        CALL    PRCHR
        LD      A,'|'
        CALL    PRCHR

        POP     HL
        PUSH    HL
        LD      B,16

ASCLOOP:
        LD      A,(HL)          ; Get byte from buffer
        CP      20H             ; Printable?
        JR      C,ASCNP
        CP      7FH
        JR      NC,ASCNP
        JR      ASCPR
ASCNP:
        LD      A,'.'           ; Non-printable = dot
ASCPR:
        CALL    PRCHR
        INC     HL
        DJNZ    ASCLOOP

        LD      A,'|'
        CALL    PRCHR

        ; New line
        LD      A,0DH
        CALL    PRCHR
        LD      A,0AH
        CALL    PRCHR

        POP     HL
        LD      BC,16
        ADD     HL,BC           ; Next line address
        POP     BC
        DJNZ    DUMPLOOP

        ; Print completion message
        LD      DE,MSG_DONE
        LD      C,PSTRING
        CALL    BDOS

        ; Return to CP/M
        JP      0000H

;-----------------------------------------------------------------------------
; PRADDR: Print address in HL as 4 hex digits
;-----------------------------------------------------------------------------
PRADDR:
        LD      A,H
        CALL    PRHEX
        LD      A,L
        CALL    PRHEX
        RET

;-----------------------------------------------------------------------------
; PRHEX: Print byte in A as 2 hex digits
;-----------------------------------------------------------------------------
PRHEX:
        PUSH    AF
        RRCA
        RRCA
        RRCA
        RRCA
        CALL    PRNIB
        POP     AF
        CALL    PRNIB
        RET

;-----------------------------------------------------------------------------
; PRNIB: Print low nibble of A as hex digit
;-----------------------------------------------------------------------------
PRNIB:
        AND     0FH
        ADD     A,90H
        DAA
        ADC     A,40H
        DAA
        ; Fall through to PRCHR

;-----------------------------------------------------------------------------
; PRCHR: Print character in A to console
;-----------------------------------------------------------------------------
PRCHR:
        PUSH    BC
        PUSH    DE
        PUSH    HL
        LD      E,A
        LD      C,CONOUT
        CALL    BDOS
        POP     HL
        POP     DE
        POP     BC
        RET

;-----------------------------------------------------------------------------
; FILEERR: File I/O error handler
;-----------------------------------------------------------------------------
FILEERR:
        ; Disable CMOS
        XOR     A
        OUT     (CMOS),A
        ; Print error message
        LD      DE,MSG_FERR
        LD      C,PSTRING
        CALL    BDOS
        JP      0000H           ; Return to CP/M

;-----------------------------------------------------------------------------
; Messages
;-----------------------------------------------------------------------------
MSG_BANNER:
        DB      'CMOS SRAM Dump (512 bytes)',0DH,0AH
        DB      '==========================',0DH,0AH,'$'

MSG_SAVED:
        DB      'Saved to SRAM.DMP',0DH,0AH,0DH,0AH,'$'

MSG_DONE:
        DB      0DH,0AH,'Dump complete.',0DH,0AH,'$'

MSG_FERR:
        DB      0DH,0AH,'File I/O error!',0DH,0AH,'$'

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
