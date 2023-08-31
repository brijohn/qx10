	org 0bcefh

include "bios-ioports.inc"

sub_1ae6h:            equ 0x1ae6
wait_not_bsy:         equ 0xbc7a
lbd8fh:               equ 0xbd8f
hdd_unit:             equ 0xbd93
hdd_track:            equ 0xbd94
hdd_sector:           equ 0xbd96

setup_hdd_access:
	ld   a, 0a0h                          ; A = A0 (CHS, Drive 0, head 0)
	out  (CF_SDH), a                      ; Write A register to SDH register
	ld   b, a                             ; Store A register in B register
	cpl                                   ; Invert the buts in the A register (XOR FF)
	out  (CF_CYLINDERLO), a               ; Write the A register to the Cylinder Low register
	in   a, (CF_SDH)                      ; Read the SDH register into A
	cp   b                                ; Check if SDH contains the value previously written to it
	jp   nz, lbd4dh                       ; If not equal jump to error condition
	in   a, (CF_STATUS)                   ; Read status byte
	and  0c0h                             ;
	cp   040h                             ; Examine Busy and Ready bits
	jp   nz, lbd4dh                       ; Error if busy or not ready
	ld   hl, (hdd_track)                  ; HL = CP/M track value
	ld   a, (hdd_unit)                    ; A = HDD unit. Valid values 0-5
	rra                                   ; Rotate bit 1 into carry flag
	jp   nc, lbd14h                       ; if hdd_unit is odd then we are using the disk's
	ld   de, 00264h                       ; second partition, so add a fixed offset to the
	add  hl, de                           ; track we are accessing.
lbd14h:
	nop
	nop
	nop
	nop
	ld   a, (hdd_unit)                    ; A = HDD unit
	rrca                                  ; This computes which drive to access.
	add  a,a                              ;  Unit 0,1: Drive 1
	add  a,a                              ;  Unit 2,3: Drive 2
	add  a,a                              ;  Unit 4,5: Drive 3
	or   0e0h                             ; Set LBA addressing mode
	and  0f0h                             ; Ensure head is 0 (We only support 16-bit LBA)
	out  (CF_SDH), a                      ; Write the computed calue to the SDH register
	ld   a, h                             ; A = High byte of track
	and  00fh                             ; Max track value is 0xFFF
	ld   h, a                             ; Load high byte of track with the clipped value
	add  hl,hl                            ; Multply track value by 16 by adding HL to HL 4 times
	add  hl,hl
	add  hl,hl
	add  hl,hl
	ld   a, (hdd_sector)                  ; A = Sector
	and  00fh                             ; Clip sector to 0-15
	add  a, l                             ; Add sector to low byte of track
	out  (CF_SECTOR), a                   ; Write low LBA (7-0) into sector register
	ld   a, h                             ; A = High LBA (15-8)
	out  (CF_CYLINDERLO), a               ; Write A to Cylinder Low register
	xor  a                                ; Zero A register
	out  (CF_CYLINDERHI), a               ; Write 0 to Cylinder High register
	ld   a, 001h
	out  (CF_SECTORCOUNT), a              ; Write 1 to sector count register
	call wait_not_bsy                     ; Wait till drive is not busy
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
	ret
lbd4dh:
	ld   a, 005h                          ; Drive not ready error code
	ld   (lbd8fh), a                      ; Store error code
	call sub_1ae6h                        ; Handle error
	jr   setup_hdd_access                 ; Retry
