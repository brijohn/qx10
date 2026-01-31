	org	08000h

include "bios-ioports.inc"

var_unit:	equ 0x7000
var_track:	equ 0x7001
var_sector:	equ 0x7003
var_dma_buffer:	equ 0x7004

	jp drive_init
	jp read_mbr
	jp read_sectors
	jp write_mbr
	jp write_sector

;---------------------------------------------------
; Init CF device
; Returns:
;    A = 0 - OK
;    A = 1 - Device not Ready
;    A = 2 - No CF adapter installed
;---------------------------------------------------
drive_init:
	ld b,014h
l8011h:
	push bc
	ld a,0e0h
	out (CF_SDH),a
	ld b,a
	cpl
	out (CF_CYLINDERLO),a
	in a,(CF_SDH)
	cp b
	jr z,l8028h
	call delay_loop
	pop bc
	djnz l8011h
	ld a,002h                      ; Return of error 2
	ret
l8028h:
	pop bc
	ld b,028h
l802bh:
	push bc
	in a,(CF_STATUS)
	bit 6,a
	jr nz,l803bh
	call delay_loop
	pop bc
	djnz l802bh
	ld a,001h                      ; Return of error 1
	ret
l803bh:
	pop bc
	ld	a,1                        ; Feature 8-bit mode
	out	(CF_FEATURE),a             ; Store A in feature register (0x81)
	ld	a,0EFH                     ; Set Feature command
	out	(CF_COMMAND),a             ; Write A to command register (0x87)
	xor a                          ; Return with success
	ret

;---------------------------------------------------
; Read first sector (MBR)
; On entry DE -> DMA BUFFER
; Returns A = 0 if OK or A = 1 if failed
;---------------------------------------------------
read_mbr:
	ld a,000h                      ; Store 0 sector
	ld (var_sector),a
	ld hl,00000h                   ; Read 0th track
	jp read_sector

;---------------------------------------------------
; Read N sectors
; On entry DE -> DMA BUFFER
;	   B = number of sectors to read
;	   C = Head
;	   H = C8-9, S0-5
;	   L = C0-7
; Returns A = 0 if OK or A = 1 if failed
;---------------------------------------------------
read_sectors:
	ld a,h
	and 03fh                       ; Clamp sectors to 1-63
	dec a                          ; Make 0 indexed
	ld (var_sector),a
	ld a,h
	and 0c0h
	rlca
	rlca
	ld h,a
	add hl,hl
	add hl,hl
	ld a,b
	ld b,000h
	add hl,bc
	ld b,a                         ; Number of sectors to transfer
l8061h:
	push bc
	call read_sector
	pop bc
	ret nz
	ld a,(var_sector)
	inc a
	ld (var_sector),a
	ld hl,(var_track)
	djnz l8061h
	xor a
	ret

;---------------------------------------------------
; Write first sector (MBR)
; On entry DE -> DMA BUFFER
; Returns A = 0 if OK or A = 1 if failed
;---------------------------------------------------
write_mbr:
	ld (var_dma_buffer),de
	ld hl,00000h
	ld (var_track),hl
	xor a
	ld (var_unit),a
	ld a,000h
	ld (var_sector),a
	jp write_sector

;---------------------------------------------------
; Read Sector
; On Entry: DE -> DMA BUFFER
;           HL -> Cylinder / Head (C[11-2], H[1-0])
;	    (7003) -> sector number (base 0)
; On Return:
;	(7001) = HL on entry
;	(7004) = DE on entry
;	    DE -> DMA BUFFER + 512 bytes
;	     A = bit 0 of port (87H) before transfer
;---------------------------------------------------
read_sector:
	ld (var_track),hl
	ld (var_dma_buffer),de
	xor a
	ld (var_unit),a
	call setup_drive_params
	ld a,020h
	out (CF_COMMAND),a
	ld hl,(var_dma_buffer)
	ld bc,00 | CF_DATA
l80a3h:
	in a,(CF_STATUS)
	or a
	jp m,l80a3h
	inir
	inir
	ex de,hl
	and 001h
	ret z
	in a,(CF_ERROR)
	and 010h
	jr z,l80c1h
	ld a,002h
	jr l80c3h
l80c1h:
	ld a,001h
l80c3h:
	or a
	ret

write_sector:
	call setup_drive_params
	ld a,030h
	out (CF_COMMAND),a
	ld hl,(var_dma_buffer)
	ld bc,00 | CF_DATA
wait_drq:
	in a,(CF_STATUS)              ; Read status byte
	and 088h                      ; Mask BSY and DRQ bits
	cp 08h                        ; DRQ and not BSY
	jr nz, wait_drq               ; Wait for DRQ and not BSY
	otir
	otir
l80d6h:
	in a,(CF_STATUS)
	or a
	jp m,l80d6h
	and 001h
	ret
;---------------------------------------------------
; On Entry: (7001) -> word
;	    (7000) -> byte (= 0 for read)
; Ouputs:
;	    Bits from (7000) & (7001) -> port (86h)
;	    (7003) -> port (83h)
;	    Bits from (7001) & (7002) -> port (84h)
;	    Bits from (7001) & (7002) -> port (85h)
;	    01110000b to port (87h)
; On Return:
;	    <A> = input from port (87h) with bit 7 = 0
;---------------------------------------------------
setup_drive_params:
	ld a,0e0h
	out (CF_SDH),a
	ld b,a
	cpl
	out (CF_CYLINDERLO),a
	in a,(CF_SDH)
	cp b
	jp nz,setup_drive_params
	in a,(CF_STATUS)
	and 0c0h
	cp 040h
	jp nz,setup_drive_params
	ld hl,(var_track)
	ld a,(var_unit)
	rra
	jp nc,l810ah
	ld de,00264h
	add hl,de
l810ah:
	ld a,(var_unit)
	rrca
	add a,a
	add a,a
	add a,a
	or 0e0h
	and 0f0h
	out (CF_SDH),a
	ld a,h
	and 00fh
	ld h,a
	add hl,hl
	add hl,hl
	add hl,hl
	add hl,hl
	ld a,(var_sector)
	and 00fh
	add a,l
	out (CF_SECTOR),a
	ld a,h
	out (CF_CYLINDERLO),a
	xor a
	out (CF_CYLINDERLO),a
	ld a,1
	out (CF_SECTORCOUNT),a
l8137h:
	in a,(CF_STATUS)
	and a
	jp m,l8137h
	ret

delay_loop:
	ld b,005h
	ld de,0ffffh
l8143h:
	ld hl,039deh
l8146h:
	add hl,de
	jr c,l8146h
	djnz l8143h
	ret

	ds (08000h + 332) - $

	end
