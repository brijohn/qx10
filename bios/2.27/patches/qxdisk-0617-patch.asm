	org	0617h

include "bios-ioports.inc"
delay:    equ 006dbh
exit:     equ 006e9h

read_cf_sector:
	call setup_cf_access
	ld a,20h
	out (CF_COMMAND),a
	ld hl,(06f5h)
	ld bc,00 | CF_DATA
	call wait_not_bsy
	inir
	inir
	ld (06f5h),hl
	and 01h
	ret z
	jp exit
	nop
	nop
	nop
	nop
	nop
	nop
	jp exit

write_cf_sector:
	call setup_cf_access
	ld a,30h
	out (CF_COMMAND),a
	ld hl,(06f5h)
	ld bc,00 | CF_DATA
l064ah:
	in a,(CF_STATUS)
	and 88h
	cp 08h
	jr nz,l064ah
	otir
	otir
	ld (06f5h),hl
	call wait_not_bsy
	nop
	and 01h
	ret z
	jp exit


setup_cf_access:
	ld a,0e0h
	out (CF_SDH),a
	ld b,a
	in a,(CF_SDH)
	cp b
	jr nz,setup_cf_access
	in a,(CF_STATUS)
	and 0c0h
	cp 40h
	jr nz,setup_cf_access
	ld hl,(06f3h)
	ld a,0e0h
	out (CF_SDH),a
	ld a,h
	and 0fh
	ld h,a
	add hl,hl
	add hl,hl
	add hl,hl
	add hl,hl
	ld a,(06f2h)
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
	ld b,014h
l06aah:
	push bc
	ld a,0e0h
	out (CF_SDH),a
	ld b,a
	cpl
	out (CF_CYLINDERLO),a
	in a,(CF_SDH)
	cp b
	jr z,l06c1h
	call delay
	pop bc
	djnz l06aah
	sub a
	dec a
	ret
l06c1h:
	pop bc
	ld b,028h
l06c4h:
	push bc
	in a,(CF_STATUS)
	bit 6,a
	jr nz,l06d4h
	call delay
	pop bc
	djnz l06c4h
	sub a
	dec a
	ret
l06d4h:
	pop bc
	call setup_8bit_mode
	nop
	xor a
	ret
