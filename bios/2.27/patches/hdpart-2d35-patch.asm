org 02d35h

include "bios-ioports.inc"

delay_loop:             equ 0x2d16

wait_not_busy:
	ld b,00ah
l2d37h:
	in a,(CF_STATUS)
	bit 7,a
	jp z,l2d45h
	call delay_loop
	djnz l2d37h
	ld a,0ffh
l2d45h:
	rra
	ret

