	org 09f2bh

include "bios-ioports.inc"

hdd_read_sector:      equ 0x99b1

SYSDRV:               equ 0x273c
set_8bit_mode:        equ 0x9abf
l9acch:               equ 0x9acc
hdd_part1_off:        equ 0x9adf
hdd_part2_off:        equ 0x9ae1
hdd_track:            equ 0x9ad0
hdd_unit:             equ 0x9acf
hdd_sector:           equ 0x9ad2
hdd_found:            equ 0x9e4d
init_not_run:         equ 0x9fed
DSM:                  equ 0xf708

hdd_init_drive:
	ld a,(init_not_run)           ; A = init_not_run
	dec a                         ; Dec A
	ld (init_not_run),a           ; Store updated value
	ret nz                        ; Return if init has already run
	ld a,0a0h                     ; A = 0xA0 
	out (CF_SDH),a                ; Write 0xA0 to SDH register
	ld b,a                        ; Save in B register
	cpl                           ; One's complement of A register (0x5F)
	out (CF_CYLINDERLO),a         ; Write 0x5F to CYLINDERLO register
	in a,(CF_SDH)                 ; Read value from SDH register
	cp b                          ; Compare value to old value stored in B
	jp nz,no_drive                ; If not equal no hard disk
	xor a                         ; A = 0 (hard drive adapter found)
	ld (hdd_found),a              ; Store hdd found flag
	call set_8bit_mode            ; Feature 8-bit mode
	nop
	nop
	nop
	nop
	nop
	ld a,(SYSDRV)                 ; A = (SYSDRV) 0 = Floppy, 1 = Hard Drive (QX-16 only) 
	or a                          ; 
	jr nz,hdd_sysdrv              ; If SYSDRV != 0
	ld a,0ffh                     ;
	ld (l9acch),a                 ; Store 0xFF (-1) in l9acch
 
	ld hl,0000h                   ; 
	ld (hdd_track),hl             ; Set track to 0
	xor a                         ;
	ld (hdd_unit),a               ; Set unit to 0
	ld a,000h                     ;
	ld (hdd_sector),a             ; Set sector to 0
	call hdd_read_sector          ; Reads disk MBR
	or a                          ; Z flag set if successful
	jr z,check_mbr                ; If sucessful continue
	jp exit_init                  ; Else exit
 
hdd_sysdrv:
	ld hl,0000h                   ; 
	ld (hdd_track),hl             ; Set track to 0
	xor a                         ;
	ld (hdd_unit),a               ; Set unit to 0
	ld a,000h                     ;
	ld (hdd_sector),a             ; Set sector to 0
	call hdd_read_sector          ; Reads disk MBR
	or a                          ; Z flag set if successful 
	jr nz,no_drive                  ; If NZ exit
check_mbr:
	ld hl,(0dffeh)                ; HL = MBR signature
	ld de,0aa55h                  ; Compare to aa55
	or a                          ; Clear carry bit
	sbc hl,de                     ; Check if signautre is equal to aa55
	jp nz,exit_init               ; If not exit
	ld hl,0dfc2h                  ; HL = Address of first partion entry+4 (Type)
	ld de,0010h                   ; DE = Partion entry size (16)
	ld b,004h                     ; B = Max size of partition table (4)
next_partition:
	ld a,(hl)                     ; A = partition type
	cp 0f0h                       ;
	jr z,found_partition          ; If type == 0xF0 we found avalid partition
	add hl,de                     ; Else check next partition's type
	djnz next_partition           ; Next partition
	jr no_drive                   ; If no valid partition found exit with failure
found_partition:
	push hl                       ; Store partition entry pointer on stack
	dec hl                        ; HL = address of partition start cylinder (7-0)
	ld e,(hl)                     ; E = Low 8 bits of start cylinder
	dec hl                        ; HL = ddress of starting sector/high bits of cylinder 
	ld a,(hl)                     ; A = (7-6) high bits of cylinder, (5-0) sector
	and 0c0h                      ; Keep only cylinder bits 
	rlca                          ;
	rlca                          ; Rotate bits 7-6 -> 1-0
	ld d,a                        ; DE = starting cylinder
	dec hl                        ; HL = address of starting head
	ld c,(hl)                     ; 
	ld b,000h                     ; BC = head
	ex de,hl                      ; HL = cylinder
	add hl,hl                     ; 
	add hl,hl                     ; 
	add hl,bc                     ; HL = (cylinder * 4) + head
	ld (hdd_part1_off),hl         ; Store offset to start of partition
	pop hl                        ; Restore partition table offset
	inc hl                        ; HL = address of end of partition head
	ld c,(hl)                     ; C = head
	inc hl                        ; HL = address of end of partition top bits of cylinder (7-6)
	ld a,(hl)                     ; A = (7-6) high bits of cylinder
	and 0c0h                      ; Keep only the top cylinder bits
	rlca                          ;
	rlca                          ; Rotate vuts 7-6 -> 1-0
	inc hl                        ; HL = address of end of partition cylinder (5-0)
	ld l,(hl)                     ;
	ld h,a                        ; HL = end of partition cylinder
	add hl,hl
	add hl,hl
	add hl,bc                     ; HL = (cylinder * 4) + heax
	ld de,(hdd_part1_off)         ; DE = offset to start of maiin partition
	or a                          ; Clear carry bit 
	sbc hl,de                     ; Calculate total length of first partition
	inc hl                        ; HL += 1
	srl h                         ;
	rr l                          ; Divide length by 2
	ld (hdd_part2_off),hl         ; Set start of second partition (length of first partition)
	dec hl                        ; 
	dec hl                        ; HL -= 2
	sla l                         ;
	rl h                          ;
	sla l                         ;
	rl h                          ; HL = (HL * 4)
	dec hl                        ; HL -= 1
	ld (DSM),hl                   ; Store HL (this is the DSM for the hard drive DPB)
	jp exit_init                  ; Drive found and variables set, we can exit now
no_drive:
	ld a,0ffh                     ; 
	ld (hdd_found),a              ; Failed to find a hard drive, mark as not found
exit_init:
	ret

