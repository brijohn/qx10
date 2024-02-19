	org 099b1h

include "bios-ioports.inc"

handle_disk_error:    equ 0x9a3a
hdd_setup_access:     equ 0x9a5f

l9acch:               equ 0x9acc
hdd_part2_off:        equ 0x9ae1
hdd_track:            equ 0x9ad0
hdd_error:            equ 0x9adb
hdd_buffer:           equ 0xde00

hdd_read_sector:
	xor a                         ; Zero A register
	ld (hdd_error),a              ; Store 0 (OK) in hdd_error
	ld de,(hdd_track)             ; DE = current track to read
	ld hl,(hdd_part2_off)         ; HL = offset to second CP/M partition
	or a                          ; Clear carry bit
	sbc hl,de                     ; Compare current track to Partition 2 offset
	jp nc,l99c6h;                 ; If current track is less then we are good
	ld a,001h                     ; Else set A to 1
	jr hdd_read_sector_exit       ; and jump to exit
l99c6h:
	call hdd_setup_access         ; setup drive access parameters
	ld a,020h                     ; write 'read' command
	out (CF_COMMAND),a            ; to drive command register
	ld hl,hdd_buffer              ; HL = address of read buffer
	ld bc,(0x00 << 8) | CF_DATA   ; B = read cound (0 = 256), C = data port
	call wait_not_bsy             ; Wait till drive is not busy
	inir                          ; Read 512 bytes from device data register
	inir                          ; into hdd_buffer
	nop
	nop
	and 001h                      ; Test status byte for error condition
	ret z                         ; Return if no error

	ld a,(l9acch)                 ; A = ???
	or a                          ; Set flags
	ld a,b                        ; A = Status byte
	jr z,hdd_read_sector_exit     ; If l9acc was 0 then exit
	xor a                         ; Zero A register
	ld (l9acch),a                 ; l9acc = 0
	in a,(CF_ERROR)               ; Read error register 
	and 010h                      ; Check ID not found bit
	ld a,b                        ; A = status byte 
	ret nz                        ; return if ID not found
hdd_read_sector_exit:
	and 001h                      ; Test status for error condition
	call handle_disk_error        ; Handle error
	jp hdd_read_sector            ; Retry read operation

wait_not_bsy:
	in   a, (CF_STATUS)           ; Read status byte
	bit  7, a                     ; check bit 7 (BSY bit)
	jr   nz, wait_not_bsy         ; While bit 7 is set
	ret

hdd_write_sector:
	xor a                         ; Zero A register
	ld (hdd_error),a              ; Store 0 (OK) in hdd_error
	ld de,(hdd_track)             ; DE = current track to read
	ld hl,(hdd_part2_off)         ; HL = offset to second CP/M partition
	or a                          ; Clear carry bit
	sbc hl,de                     ; Compare current track to Partition 2 offset
	jp nc,l9a14h                  ; If current track is less then we are good
	ld a,001h                     ; Else set A to 1
	jr l9a34h                     ; and jump to exit
l9a14h:
	call hdd_setup_access         ; setup drive access parameters
	ld a,030h                     ; Write 'write' command
	out (CF_COMMAND),a            ; to drive command register
	ld hl,hdd_buffer              ; HL = address of write buffer
	ld bc,(0x00 << 8) | CF_DATA   ; B = write count (0 = 256), C = data port
wait_drq:
	in a,(CF_STATUS)              ; Read status byte
	and 088h                      ; Mask BSY and DRQ bits
	cp 08h                        ; DRQ and not BSY
	jr nz, wait_drq               ; Wait for DRQ and not BSY
	otir                          ; Write 512 bytes from hdd_buffer to
	otir                          ; drive's data register
	call wait_not_bsy             ; Wait till drive not busy
	nop
	and 001h                      ; Test status byte for error condition
	ret z                         ; Return if there was no error
l9a34h:
	call handle_disk_error        ; Handle Error
	jp hdd_write_sector           ; Retry write operation
