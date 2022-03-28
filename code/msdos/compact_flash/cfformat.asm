; Compact Flash format module for MS-DOS 2.11
; (c) Copyright 2022 Brian Johnson <brijohn@gmail.com>
;
; This module is meant to be assembled and linked with the
; format.obj and formes.obj modules provided by microsoft
; for MS-DOS 2.11
;
; tasm cfformat
; tlink /m /t format formes cfformat,cfformat.com
;
CODE  SEGMENT  PUBLIC 'CODE'

        ASSUME CS:CODE,DS:CODE,ES:CODE

        PUBLIC FATID,HARDFLAG,SWITCHLIST,STARTSECTOR,FATSPACE,FREESPACE
        PUBLIC INIT,DISKFORMAT,BADSECTOR,WRTFAT,DONE
        EXTRN  DRIVE:BYTE,SWITCHMAP:WORD


INIT:
        MOV     AH,09H
        MOV     DX,OFFSET COPYRIGHT_MSG  ;POINTER TO COPYRIGHT MESSAGE
        INT     21H                      ;PRINT MESSAGE
        MOV     AH,50
        MOV     DL,[DRIVE]
        CMP     DL, 02H
        JB      INVALID_DRIVE            ;DRIVES A: AND B: ARE NOT SUPPORTED
        INC     DL
        INT     21H                      ;GET DRIVE PARAMETER BLOCK IN DS:BX
        LES     BP,[BX+012H]             ;ES:BP = ADDRESS OF DRIVER HEADER
        LEA     DI,[BP+0BH]              ;ES:DI = DRIVER SIGNATURE
        MOV     SI,OFFSET SIGNATURE      ;SI    = VALUE TO COMPARE
        MOV     CX,5
        MOV     DX,DS                    ;SAVE DS
        PUSH    CS
        POP     DS                       ;DS = CS
        REP     CMPSB                    ;CHECK FOR VALID SIGNATURE
        JNE     INVALID_DRIVE            ;UNSUPPORTED DRVIE IF NO MATCH
        MOV     WORD PTR [DEVHDR],BP     ;SAVE OFFSET OF DRIVER HEADER
        MOV     WORD PTR [DEVHDR+2],ES   ;SAVE SEGMENT OF DRIVER HEADER
        MOV     DS,DX                    ;RESTORE DS
        MOV     AL,[BX+4]                ;SECTORS PER CLUSTER - 1
        INC     AL
        XOR     CH,CH
        MOV     CL,AL                    ;CL = SECTORS PER CLUSTER
        CBW
        MOV     BP,[BX+0DH]              ;MAXCLUS + 1
        DEC     BP
        MUL     BP                       ;SECTORS PER CLUSTER * MAX CLUSTERS
        MOV     BP,AX
        ADD     BP,[BX+0BH]              ;+= SYSTEM SECTORS (BOOT, RESERVED, FAT, ROOT)
        MOV     DL,[BX+01H]              ;DL = DEVICE SUBUNIT
        MOV     AX,CS
        MOV     DS,AX                    ;DS = CS
        MOV     ES,AX                    ;ES = CS
        MOV     [UNIT],DL                ;STORE SUBUNIT
        MOV     [SPC],CL                 ;STORE SECTORS PER CLUSTER
        MOV     [FATSTART],CX            ;STORE START OF FIRST FAT
        MOV     [STARTSECTOR],CX         ;STARTSECTOR = FATSTART
        DEC     CX                       ;CX = SECTORS PER CLUSTER - 1
        NOT     CX                       ;CREATE MASK
        AND     BP,CX                    ;TRIM TOTAL SECTORS TO BE A MULTIPLE OF SPC
        MOV     [DSKSIZE], BP            ;STORE TOTAL SECTORS
        MOV     AX,[FATSIZE]
        MUL     [FATCNT]
        ADD     [STARTSECTOR],AX         ;STARTSECTOR += FATSIZE * FATCNT
        XOR     DX,DX
        MOV     AX,[ROOTENTRIES]         ;AX = ROOT DIR ENTRIES (512)
        MOV     CX, 20H
        MUL     CX                       ;MULTIPLY BY 32
        MOV     CX, 200H
        DIV     CX                       ;DIVIDE BY 512
        ADD     [STARTSECTOR],AX         ;STARTSECTOR += SIZE OF ROOT DIRECTORY
        AND     [SWITCHMAP],0FBH         ;DISABLE /O SWITCH OPERATION
        CLC
        RET

INVALID_DRIVE:
        MOV     AX,CS
        MOV     DS,AX
        MOV     ES,AX
        MOV     AH, 09H
        MOV     DX, OFFSET INVALID_DRIVE_MSG
        INT     21H                      ;PRINT INVALID DRIVE MESSAGE
        STC
        RET

DISKFORMAT:
        MOV     WORD PTR [MBR+0BH],200H  ;SET BYTES PER SECTOR TO 512 IN MBR
        MOV     AL,[SPC]
        CBW
        MOV     BYTE PTR [MBR+0DH],AL    ;SET SECTORS PER CLUSTER IN MBR
        MOV     WORD PTR [MBR+0EH],AX    ;SET RESERVED SDECTORS TO SPC VALUE IN MBR
        MOV     AL,[FATCNT]
        MOV     BYTE PTR [MBR+10H],AL    ;SET NUMBER OF FATS IN MBR (2)
        MOV     AX,[ROOTENTRIES]
        MOV     WORD PTR [MBR+11H],AX    ;SET NUMBER OF ROOT ENTRIES IN MBR (512)
        MOV     AX,[DSKSIZE]
        MOV     WORD PTR [MBR+13H],AX    ;SET TOTAL SECTORS IN MBR
        MOV     AL,[FATID]
        MOV     BYTE PTR [MBR+15H],AL    ;SET MEDIA DESCRIPTOR IN MBR (F8)
        MOV     AX,[FATSIZE]
        MOV     WORD PTR [MBR+16H],AX    ;SET NUMBER OF SECTORS PER FAT IN MBR (16)
        MOV     AL,0
        MOV     CX,4000H
        MOV     DI,OFFSET BUFFER
        REP     STOSB                    ;ZERO OUT CLUSTER BUFFER
        MOV     CX,2000H
        MOV     DI,OFFSET FATAREA
        REP     STOSB                    ;ZERO OUT FATAREA BUFFER
        CLC
        RET

WRSECTOR    DW  0                        ;CURRENT SECTOR TO WRITE
CURFAT      DB  0                        ;CURRENT FAT TO WRITE TO DISK

BADSECTOR:
        MOV     DX,[WRSECTOR]
        CMP     DX,[DSKSIZE]             ;COMPARE SECTOR NUMBER TO TOTAL SECTORS
        JAE     DONE                     ;IF >= WE HAVE FINISHED
        TEST    [SWITCHMAP],08H          ;TEST FOR /Q SWITCH
        JZ      FULL_FORMAT              ;IF NOT ZET WE ARE DOING A FULL FORMAT
        CMP     DX,[STARTSECTOR]         ;IF SET COMPARE SECTOR TO START OF DATA SECTOR
        JAE     DONE                     ;IF >= WE HAVE FINISHED
FULL_FORMAT:
        MOV     AL,BYTE PTR [DRIVE]      ;DRIVE NUMBER TO FORMAT
        MOV     CL,[SPC]                 ;WRITE ONE CLUSTER WORTH
        XOR     CH,CH
        MOV     BX,OFFSET BUFFER         ;BX = ZEROED BUFFER
        CMP     DX,0                     ;CHECK IF SECTOR NUMBER IS 0
        JNZ     WRDATA                   ;IF NOT THEN PERFORM WRITE FOR CURRENT CLUSTER
        MOV     BX,OFFSET MBR            ;ELSE USE MBR BUFFER
WRDATA: PUSH    CX                       ;SAVE SECTOR COUNT
        INT     26H                      ;TRY TO WRITE
        POP     AX                       ;CLEAN UP STACK (FLAGS ARE LEFT ON STACK AFTER INT26)
        POP     CX                       ;RESTORE SECTOR COUNT
        JC      GOTBAD                   ;IF WRITE FAILED (CARRY SET) MARK CURRENT CLUSTER AS BAD
        ADD     [WRSECTOR],CX            ;+= SECTORS PER CLUSTER
        JMP     BADSECTOR                ;WRITE NEXT CLUSTER

GOTBAD:
        MOV     AX,CX                    ;AX = NUMBER OF CONSECUTIVE BAD SECTORS
        MOV     BX,[WRSECTOR]            ;BX = FIRST BAD SECTOR NUMBER
        ADD     [WRSECTOR],AX            ;SET UP FOR NEXT CALL
        CLC
        RET

WRTFAT:
        MOV     AL,[FATCNT]
        MOV     [CURFAT],AL              ;SET CURRENT FAT TO TOTAL NUMBER OF FATS
        MOV     AX,[FATSTART]
        MOV     [WRSECTOR],AX            ;SET CURRENT SECTOR TO START OF FIRST FAT
FATLOOP:
        MOV     AL,BYTE PTR [DRIVE]      ;AX = DRIVE NUMBER
        CBW
        MOV     CX,[FATSIZE]             ;NUMBER OF SECTORS PER FAT
        MOV     DX,[WRSECTOR]            ;START SECTOR
        MOV     BX,[FATSPACE]            ;FAT BUFFER
        INT     26H                      ;WRITE FAT TO DISK
        POP     AX                       ;CLEAN UP STACK
        JC      GORET                    ;IF ERROR RETURN
        MOV     CX,[FATSIZE]
        ADD     [WRSECTOR],CX            ;+= SECTORS PER FAT
        DEC     BYTE PTR [CURFAT]        ;DECREMENT FAT COUNTER
        JNZ     FATLOOP                  ;LOOP UNTIL ZERO
        CLC                              ;RESET CARRY FLAG
GORET:
        XOR     AX,AX                    ;ZERO AX
        MOV     [WRSECTOR],AX            ;AND RESET WRSECTOR TO ZERO
        RET

DONE:
        MOV     BL,[UNIT]                ;BX    = CUURENT SUBUNIT FOR DEVICE DRIVER
        XOR     BH,BH
        LDS     SI,[DEVHDR]              ;DS:SI = FAR POINTER TO DEVICE DRIVER HEADER
        MOV     SI,[SI+10H]              ;SI    = OFFSET OF DRIVER BPB POINTER ARRAY
        SHL     BX,1                     ;MULTPLY SUBUNIT BY 2
        MOV     SI,[SI+BX]               ;SI    = POINTER TO DRIVE BPB
        OR      BYTE PTR [DS:SI+0DH],80H ;SET MEDIA CHANGED FLAG FOR CURRENT DRIVE
        XOR     AX,AX
        PUSH    CS
        POP     DS                       ;DS = CS
        CLC
        RET

DEVHDR      DD  0
UNIT        DB  0
DSKSIZE     DW  0
SPC         DB  0
FATCNT      DB  2
FATSTART    DW  0
FATSIZE     DW  10H
ROOTENTRIES DW  200H
FATID       DB  0F8H
HARDFLAG    DB  1
SWITCHLIST  DB  4,"QOVS"
STARTSECTOR DW  0
FATSPACE    DW  FATAREA
FREESPACE   DW  ENDLOC

;DRIVER SIGNATURE
SIGNATURE:
        DB "CFIDE"

COPYRIGHT_MSG:
        DB "Compact Flash Formatter Ver 1.0", 0DH, 0AH
        DB "(c) Copyright 2022 by Microsoft and Brian Johnson", 0DH, 0AH, 0DH, 0AH, "$"
INVALID_DRIVE_MSG:
        DB "Specified drive is not a Compact Flash device.", 0DH, 0AH, 0DH, 0Ah, "$"

MBR:
        DB 0EBH, 043H, 090H, 045H, 050H, 053H, 020H, 032H, 02EH, 031H, 031H, 000H, 002H, 002H, 001H, 000H
        DB 002H, 070H, 000H, 0D0H, 002H, 0FDH, 002H, 000H, 009H, 000H, 002H, 000H, 000H, 000H, 000H, 000H
        DB 00AH, 0CFH, 002H, 025H, 002H, 009H, 02AH, 0FFH, 050H, 0F6H, 019H, 00FH, 002H, 049H, 042H, 04DH
        DB 042H, 049H, 04FH, 020H, 020H, 020H, 043H, 04FH, 04DH, 045H, 050H, 053H, 04FH, 04EH, 042H, 049H
        DB 04FH, 020H, 043H, 04FH, 04DH, 0FCH, 0FAH, 031H, 0C0H, 08EH, 0D8H, 08EH, 0D0H, 0BCH, 000H, 07CH
        DB 0C7H, 006H, 078H, 000H, 021H, 07CH, 08CH, 00EH, 07AH, 000H, 0FBH, 0CDH, 013H, 073H, 003H, 0E9H
        DB 0A4H, 000H, 0BEH, 082H, 07DH, 0E8H, 00BH, 001H, 0A0H, 010H, 07CH, 030H, 0E4H, 0F7H, 026H, 016H
        DB 07CH, 003H, 006H, 00EH, 07CH, 003H, 006H, 01CH, 07CH, 089H, 0C3H, 0A1H, 011H, 07CH, 0B9H, 020H
        DB 000H, 0F7H, 0E1H, 031H, 0D2H, 0F7H, 036H, 00BH, 07CH, 001H, 0D8H, 0A3H, 0F3H, 07DH, 089H, 0D8H
        DB 0B5H, 001H, 0BBH, 050H, 000H, 08EH, 0C3H, 0BBH, 000H, 000H, 0E8H, 075H, 000H, 072H, 067H, 0BEH
        DB 02DH, 07CH, 0BFH, 000H, 000H, 0B9H, 00BH, 000H, 0A6H, 074H, 00CH, 0BEH, 039H, 07CH, 0BFH, 000H
        DB 000H, 0B9H, 00BH, 000H, 0A6H, 075H, 04FH, 026H, 0A1H, 01CH, 000H, 026H, 08BH, 016H, 01EH, 000H
        DB 0F7H, 036H, 00BH, 07CH, 009H, 0D2H, 074H, 001H, 040H, 088H, 0C5H, 0A1H, 0F3H, 07DH, 0BBH, 070H
        DB 000H, 08EH, 0C3H, 0BBH, 000H, 000H, 0E8H, 039H, 000H, 072H, 02BH, 00EH, 01FH, 0CDH, 011H, 0D0H
        DB 0C0H, 0D0H, 0C0H, 083H, 0E0H, 003H, 075H, 001H, 040H, 040H, 089H, 0C1H, 080H, 03EH, 01EH, 07CH
        DB 080H, 074H, 002H, 031H, 0C0H, 050H, 0BEH, 097H, 07DH, 0E8H, 077H, 000H, 058H, 08BH, 01EH, 0F3H
        DB 07DH, 0EAH, 000H, 000H, 070H, 000H, 0BEH, 0ACH, 07DH, 0E8H, 067H, 000H, 030H, 0E4H, 0CDH, 016H
        DB 0CDH, 019H, 051H, 031H, 0D2H, 0F7H, 036H, 018H, 07CH, 088H, 0D1H, 0FEH, 0C1H, 031H, 0D2H, 0F7H
        DB 036H, 01AH, 07CH, 088H, 0C5H, 0D0H, 0CCH, 0D0H, 0CCH, 080H, 0E4H, 0C0H, 080H, 0E1H, 03FH, 008H
        DB 0E1H, 088H, 0D6H, 058H, 088H, 0E0H, 08AH, 016H, 018H, 07CH, 028H, 0CAH, 0FEH, 0C2H, 038H, 0D0H
        DB 072H, 002H, 088H, 0D0H, 028H, 0C4H, 050H, 08AH, 016H, 01EH, 07CH, 0B4H, 002H, 0CDH, 013H, 058H
        DB 072H, 020H, 008H, 0E4H, 074H, 01CH, 052H, 08BH, 016H, 00BH, 07CH, 001H, 0D3H, 0FEH, 0C8H, 075H
        DB 0F6H, 05AH, 0B1H, 001H, 0FEH, 0C6H, 03AH, 036H, 01AH, 07CH, 075H, 0C8H, 030H, 0F6H, 0FEH, 0C5H
        DB 0EBH, 0C2H, 0C3H, 02EH, 0ACH, 008H, 0C0H, 074H, 008H, 0B4H, 00EH, 0B7H, 007H, 0CDH, 010H, 0EBH
        DB 0F2H, 0C3H, 04CH, 06FH, 061H, 064H, 069H, 06EH, 067H, 020H, 053H, 079H, 073H, 074H, 065H, 06DH
        DB 020H, 02EH, 02EH, 02EH, 020H, 00DH, 000H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H
        DB 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 020H, 00DH, 000H, 04EH, 06FH, 06EH, 02DH
        DB 053H, 079H, 073H, 074H, 065H, 06DH, 020H, 064H, 069H, 073H, 06BH, 020H, 06FH, 072H, 020H, 064H
        DB 069H, 073H, 06BH, 020H, 065H, 072H, 072H, 06FH, 072H, 00DH, 00AH, 052H, 065H, 070H, 06CH, 061H
        DB 063H, 065H, 020H, 061H, 06EH, 064H, 020H, 073H, 074H, 072H, 069H, 06BH, 065H, 020H, 061H, 06EH
        DB 079H, 020H, 06BH, 065H, 079H, 020H, 077H, 068H, 065H, 06EH, 020H, 072H, 065H, 061H, 064H, 079H
        DB 00DH, 00AH, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 000H, 055H, 0AAH

BUFFER      LABEL    BYTE
            DB 4000H DUP (?)             ;CLUSTER BUFFER
FATAREA     LABEL    BYTE
            DB 2000H DUP (?)             ;FATAREA BUFFER
ENDLOC      LABEL    BYTE
CODE ENDS
     END
