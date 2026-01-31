	org	02c61h

include "bios-ioports.inc"

write_track:            equ 0x2ca7
check_hdd_existence:    equ 0x2cff
set_cylinder_head:      equ 0x2cea

format_and_write_track:
	call format_track
	call write_track
	ret
	nop
	nop
	nop
	nop

seek_trk0:
	call check_hdd_existence
	ld a,0a0h
	out (CF_SDH),a
	xor a
	out (CF_CYLINDERLO),a
	out (CF_CYLINDERHI),a
	inc a
	out (CF_SECTOR),a
	out (CF_SECTORCOUNT),a
	xor a
	ret
	nop
	nop
	nop
	nop
	nop

format_track:
	call set_cylinder_head
	xor a
	ret
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop
	nop

