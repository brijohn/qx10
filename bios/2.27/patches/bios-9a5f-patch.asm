	org 09a5fh

include "bios-ioports.inc"

sub_909eh:            equ 0x909e
wait_not_bsy:         equ 0x99f8

l9acdh:               equ 0x9acd
hdd_part1_off:        equ 0x9adf
hdd_part2_off:        equ 0x9ae1
hdd_track:            equ 0x9ad0
hdd_unit:             equ 0x9acf
hdd_sector:           equ 0x9ad2

hdd_setup_access:
	ld a,0a0h                     ; A = A0 (ECC, 512 byte sectors, drive 1, head 0)
	out (CF_SDH),a                ; Write A register to SDH register
	ld b,a                        ; Store A register in B register
	cpl                           ; One's complement of A register (0x5F)
	out (CF_CYLINDERLO),a         ; Write A register to Cylinder Low register
	in a,(CF_SDH)                 ; Read SDH register into A register
	cp b                          ; Check if SDH register contains value previously written to it
	jp nz,l9ac2h                  ; If values are not equal jump to error condition
	in a,(CF_STATUS)              ; Read status byte 
	and 0c0h                      ;
	cp 040h                       ; Examine both busy and ready bit
	jp nz,l9ac2h                  ; Error if busy or not ready
	ld hl,(hdd_track)             ; HL = CP/M track value from settrk BIOS call 
	ld de,(hdd_part1_off)         ; DE = Offset to partition, 0 if no MBR
	add hl,de                     ; Add offset to current track
	ld a,(hdd_unit)               ; A = HDD unit, Valid values are 0-5 
	rra                           ; Rotate bit 1 into carry flag
	jp nc,l9a8ah                  ; If hdd_unit is odd then we are using the disk's
	ld de,(hdd_part2_off)         ; second partition, so add the offset to the track
	add hl,de                     ; we are accessing
l9a8ah:
	nop
	nop
	nop
	nop
	ld a,(hdd_unit)               ; A = HDD unit
	rrca                          ; This computes which drive to access
	add a,a                       ;  Unit 0,1: Drive 1
	add a,a                       ;  Unit 2,3: Drive 2
	add a,a                       ;  Unit 4,5: Drive 3
	or 0e0h                       ; Set LBA addressing mode
	and 0f0h                      ; Ensure head is 0 (We only support 16-bit LBA)
	out (CF_SDH),a                ; Write computed value to the SDH register
	ld   a, h                     ; A = High byte of track
	and  00fh                     ; Max track value is 0xFFF
	ld   h, a                     ; Load high byte of track with the clipped value
	add  hl,hl                    ; Multply track value by 16 by adding HL to HL 4 times
	add  hl,hl
	add  hl,hl
	add  hl,hl
	ld   a, (hdd_sector)          ; A = Sector
	and  00fh                     ; Clip sector to 0-15
	add  a, l                     ; Add sector to low byte of track
	out  (CF_SECTOR), a           ; Write low LBA (7-0) into sector register
	ld   a, h                     ; A = High LBA (15-8)
	out  (CF_CYLINDERLO), a       ; Write A to Cylinder Low register
	xor  a                        ; Zero A register
	out  (CF_CYLINDERHI), a       ; Write 0 to Cylinder High register
	ld   a, 001h
	out  (CF_SECTORCOUNT), a      ; Write 1 to sector count register
	call wait_not_bsy             ; Wait till drive is not busy
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
l9ac2h:
	ld a,005h                     ; 
	ld (l9acdh),a                 ;
	call sub_909eh                ; Handle error
	jr hdd_setup_access           ; Retry
