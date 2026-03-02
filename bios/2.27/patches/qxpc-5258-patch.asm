	org	5258h

found_partition:    equ 05264h
no_partition:       equ 052adh

l5258h:
	ld a,(hl)
	cp 0f2h
	jr z,found_partition
	add hl,de
	djnz l5258h
	nop
	jp no_partition
