	org 0bc35h

include "bios-ioports.inc"

setup_hdd_access:       equ 0xbcef
hdd_sector_buffer:      equ 0xbda1
print_disk_error:       equ 0xbc81

hdd_write_sector:
	call setup_hdd_access                 ; Setup disk access paramters (LBA)
	ld   a, 030h                          ; Write 'write' commnd
	out  (CF_COMMAND), a                  ; to drive command register
	ld   hl, hdd_sector_buffer            ; HL = address of write buffer
	ld   bc, (0x00 << 8) | CF_DATA        ; B = write count (0 = 256), C = data port
lbc42h:
	in   a, (CF_STATUS)                   ; Read status byte
	and  088h                             ; Mask BSY and DRQ buts
	cp   008h                             ; DRQ and not BSY
	jr   nz, lbc42h                       ; Wait for DRQ and not BSY
	otir                                  ; Write 512 byts from hdd_sector_buffer
	otir                                  ; to data register
	call wait_not_bsy                     ; Wait till drive is not busy
	nop
	and  001h                             ; Test status byte for error condition
	ret  z                                ; and return if there was no error
	call print_disk_error                 ; Print error message / abort/retry
	jp   hdd_write_sector                 ; Retry write operation

hdd_read_sector:
	call setup_hdd_access                 ; Setup disk access parameters (LBA)
	ld   a, 020h                          ; Write 'read' command
	out  (CF_COMMAND), a                  ; to drive command register
	ld   hl, hdd_sector_buffer            ; HL = address of read buffer
	ld   bc, (0x00 << 8) | CF_DATA        ; B = read count (0 = 256), C = data port
	call wait_not_bsy                     ; Wait till drive is not busy
	inir                                  ; Read 512 bytes from data register
	inir                                  ; into hdd_sector_buffer
	nop
	nop
	and  001h                             ; Test status byte for error condition
	ret  z                                ; and return if there was no error
	call print_disk_error                 ; Print error message / abort/retry
	jp   hdd_read_sector                  ; Retry read operation

wait_not_bsy:
	in   a, (CF_STATUS)                   ; Read status byte
	bit  7, a                             ; check bit 7 (BSY bit)
	jr   nz, wait_not_bsy                 ; While bit 7 is set
	ret
