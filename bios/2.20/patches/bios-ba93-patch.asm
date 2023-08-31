	org 0ba93h

include "bios-ioports.inc"

hdd_installed:  equ  0xb35f

hdd_init_drive:
	ld  a, 0a0h                    ; A = 0xA0
	out (CF_SDH), a                ; Write 0xA0 to IO port 0xD6
	ld  b, a                       ; Save in B register
	in  a, (CF_SDH)                ; Read value from IO port 0xD6
	cp  b                          ; If A == 0xA0
	jr  nz, no_hdd                 ; Then
	ld  a, 001h                    ; Feature 8-bit mode
	out (CF_FEATURE), a            ; Store A in feature register (0xD1)
	ld  a, 0efh                    ; Set Feature command
	out (CF_COMMAND), a            ; Write A to command register (0xD7)
	xor a                          ; A = 0 (Compact Flash card installed)
	jp  hdd_found
no_hdd:
	ld  a, 0ffh                    ; Else A = -1 (Compact Flash card not installed)
hdd_found:
	ld  (hdd_installed), a         ; Store card status
	ret
