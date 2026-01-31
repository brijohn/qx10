org 02cb5h

include "bios-ioports.inc"

no_hdd_exit:            equ 0x2d2a
wait_not_busy:          equ 0x2d35
var_sector:             equ 0x2de6
var_cylinder:           equ 0x2dea
empty_track_buffer:     equ 0x2df2
write_track_error_msg:  equ 0x2dc7

write_sector:
	call set_cylinder_head
	ld a,(var_sector)
	inc a
	out (CF_SECTOR),a
	ld (var_sector),a
	ld a,030h
	out (CF_COMMAND),a
	ld bc,0 | CF_DATA
	ld hl,empty_track_buffer
	otir
	otir
	call wait_not_busy
	call c,write_track_error_exit
	ret

write_track_error_exit:
	ld a,(02df1h)
	or a
	ret nz
	dec a
	ld (02df1h),a
	ld de,write_track_error_msg
	ld c,009h
	call 00005h
	jp 00000h

set_cylinder_head:
	call check_hdd_existence
	ld a,0a0h
	out (CF_SDH),a
	ld hl,(var_cylinder)
	ld a,l
	out (CF_CYLINDERLO),a
	ld a,h
	out (CF_CYLINDERHI),a
	ld a,1
	out (CF_SECTORCOUNT),a
	ret

check_hdd_existence:
	ld a,0a0h
	out (CF_SDH),a
	ld b,a
	cpl
	out (CF_CYLINDERLO),a
	in a,(CF_SDH)
	cp b
	jr nz,no_hdd_exit
	in a,(CF_STATUS)
	and 0c0h
	cp 040h
	jp nz,no_hdd_exit
	ret
