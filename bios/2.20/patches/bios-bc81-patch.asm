	org 0bc81h

include "bios-ioports.inc"

sub_1ae6h:            equ 0x1ae6
sys_page_err_diag:    equ 0x2c62
print_string:         equ 0xbd57
print_byte:           equ 0xbd67
lbd9dh:               equ 0xbd9d

print_disk_error:
	ld   b, a
	ld   a, (sys_page_err_diag)
	or   a
	ld   a, b
lbc87h:
	call sub_1ae6h
	cp   052h
	ret  z
	cp   049h
	jp   z, lbceah
	cp   043h
	jp   nz, lbc87h
	pop  hl
	call print_string
	defm "\r\nError", 0a0h
	in   a, (CF_ERROR)
	call print_byte
	call print_string
	defm " at LBA", 0a0h
	in   a, (CF_CYLINDERLO)
	call print_byte
	in   a, (CF_SECTOR)
	call print_byte
	ld   a, 001h
lbce6h:
	ld   (lbd9dh), a
	ret
lbceah:
	pop  hl
	xor  a
	jp   lbce6h

	defs 39                                      ; Fill extra space with NOP
