	org	53a5h

include "bios-ioports.inc"
delay:    equ 05463h

read_cf_sector:
	call setup_cf_access
	ld a,20h
	out (CF_COMMAND),a
	ld hl,2308h
	ld bc,00 | CF_DATA
	call wait_not_bsy
	inir
	inir
	and 01h
	ret z
	jp 5471h
	nop
	nop
	nop
	nop
	nop
	nop
	jp 5471h

write_cf_sector:
	call setup_cf_access
	ld a,30h
	out (CF_COMMAND),a
	ld hl,2308h
	ld bc,00 | CF_DATA
l53d5h:
	in a,(CF_STATUS)
	and 88h
	cp 08h
	jr nz,l53d5h
	otir
	otir
	call wait_not_bsy
	nop
	and 01h
	ret z
	jp 5471h

setup_cf_access:
	ld a,0e0h
	out (CF_SDH),a
	ld b,a
l53f0h:
	in a,(CF_SDH)
	cp b
	jr nz,setup_cf_access
	in a,(CF_STATUS)
	and 0c0h
	cp 40h
	jr nz,setup_cf_access
	ld hl,(5474h)
	ld a,0e0h
	out (CF_SDH),a
	ld a,h
	and 0fh
	ld h,a
	add hl,hl
	add hl,hl
	add hl,hl
	add hl,hl
	ld a,(5476h)
	and 0fh
	add a,l
	out (CF_SECTOR),a
	ld a,h
	out (CF_CYLINDERLO),a
	xor a
	out (CF_CYLINDERHI),a
	inc a
	out (CF_SECTORCOUNT),a
	ret

wait_not_bsy:
	in a,(CF_STATUS)
	bit 7,a
	jr nz,wait_not_bsy
	ret

setup_8bit_mode:
	ld a,01h
	out (CF_FEATURE),a
	ld a,0efh
	out (CF_COMMAND),a
	jr wait_not_bsy
	nop

cf_init:
	ld b,05h
l5432h:
	push bc
	ld a,0e0h
	out (CF_SDH),a
	ld b,a
	cpl
	out (CF_CYLINDERLO),a
	in a,(CF_SDH)
	cp b
	jr z,l5449h
	call delay
	pop bc
	djnz l5432h
	sub a
	dec a
	ret
l5449h:
	pop bc
	ld b,05h
l544ch:
	push bc
	in a,(CF_STATUS)
	bit 6,a
	jr nz,l545ch
	call delay
	pop bc
	djnz l544ch
	sub a
	dec a
	ret
l545ch:
	pop bc
	call setup_8bit_mode
	nop
	xor a
	ret
