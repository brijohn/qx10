; Epson QX-16 DOS driver for CF adapter
; (c) Copyright 2022 Brian Johnson <brijohn@gmail.com>
;
; Driver for Epson QX-16 running DOS 2.11
;
; nasm -o cfide.sys -l cfide.lst cfide.asm
cpu 8086

BASE_PORT      equ 0d0h
DATA_PORT      equ BASE_PORT+0
ERROR_PORT     equ BASE_PORT+1
FEATURE_PORT   equ ERROR_PORT
NSECTOR_PORT   equ BASE_PORT+2
SECTOR_PORT    equ BASE_PORT+3
CYLINDERL_PORT equ BASE_PORT+4
CYLINDERH_PORT equ BASE_PORT+5
DRIVEHEAD_PORT equ BASE_PORT+6
STATUS_PORT    equ BASE_PORT+7
CMD_PORT       equ STATUS_PORT

struc rhc
	.length   resb 1                                    ;Length of Request Header (including data)
	.unit     resb 1                                    ;Unit code (partition)
	.cmd      resb 1                                    ;Command code
	.status   resw 1                                    ;Status
	.reserved resd 2                                    ;Reserved for DOS
endstruc

struc rh0
	.common   resb rhc_size                             ;Common portion
	.units    resb 1                                    ;Number of units
;set >= 1 if installation succeeds,
;set to 0 to cause installation failure
	.end_off  resw 1                                    ;Offset of ending address
	.end_seg  resw 1                                    ;Segment of ending address
	.bpb_off  resw 1                                    ;Offset of BPB array address
	.bpb_seg  resw 1                                    ;Segment of BPB array address
	.drive    resb 1                                    ;Drive code (DOS 3 only)
endstruc

struc rh1
	.common   resb rhc_size                             ;Common portion
	.media    resb 1                                    ;Media descriptor
	.return   resb 1                                    ;Return information
endstruc

struc rh2
	.common   resb rhc_size                             ;Common portion
	.media    resb 1                                    ;Media descriptor
	.xfer_off resw 1                                    ;Offset of transfer address
	.xfer_seg resw 1                                    ;Segment of transfer address
	.bpb_off  resw 1                                    ;Offset of BPB table address
	.bpb_seg  resw 1                                    ;Segment of BPB table address
endstruc

struc rh4
	.common   resb rhc_size                             ;Common portion
	.media    resb 1                                    ;Media descriptor
	.xfer_off resw 1                                    ;Offset of transfer address
	.xfer_seg resw 1                                    ;Segment of transfer address
	.count    resw 1                                    ;Sector count
	.start    resw 1                                    ;Starting sector number
endstruc

struc bpb
	.sector_size  resw 1                                ;Number of bytes per disk sector
	.cluster_size resb 1                                ;Sectors per allocation unit
	.reserved     resw 1                                ;Number of reserved sectors (for boot record)
	.num_fats     resb 1                                ;Number of File Allocation Table (FAT) copies
	.root_entries resw 1                                ;Number of root directory entries
	.num_sectors  resw 1                                ;Total number of sectors
	.media        resb 1                                ;Media descriptor byte
	.fat_size     resw 1                                ;Number of sectors occupied by a single FAT
; not part of DOS BPB
	.flags        resb 1                                ;Status flags for device
; partition data
	.active       resb 1                                ;Partition active byte)
	.chs_start    resb 3                                ;CHS start
	.type         resb 1                                ;Partition type
	.chs_end      resb 3                                ;CHS end
	.lba_start    resb 4                                ;LBA start sector
	.lba_sectors  resb 4                                ;LBA total number of sectors
endstruc

code    segment use16
        org     0000h

header:
	dw      0ffffh, 0ffffh                              ;Link to next driver
	dw      02000h                                      ;Driver attribute (Block driver, NON-IBM format)
	dw      strategy                                    ;Pointer to strategy routine
	                                                    ;(first called)
	dw      interrupt                                   ;Pointer to interrupt routine
	                                                    ;(called after strategy)
	db      1                                           ;number of units (overwritten by init command)
	db      "CFIDE"                                     ;driver signature
	dw      bpb_ptr                                     ;offset of BPB pointer array

rh_ptr:
	dw      0000h, 0000h                                ;Address of device request header

;BIOS Paramter Block array
bpb_entries:
	times  4 * bpb_size db 0
;Number of devices (DOS partitions)
num_devices:
	db 0
;BIOS Parameter Block pointer array (4 entries)
bpb_ptr:
	dw bpb_entries + (0 * bpb_size)
	dw bpb_entries + (1 * bpb_size)
	dw bpb_entries + (2 * bpb_size)
	dw bpb_entries + (3 * bpb_size)
;Current Compact Flash LBA sector, used when reading or writing
cur_sector:
	dd 0
;Number of sectors to read/write
sector_count:
	dw 0

;Strategy entry point for device driver
strategy:
	mov     [cs:rh_ptr], bx                             ;Set request header address in
	mov     [cs:rh_ptr+02h], es                         ;the RH_PTR variable
	retf

cmd_table:
	dw device_init                                      ; 0 - Initialization
	dw media_check                                      ; 1 - Media check
	dw get_bpb                                          ; 2 - Build BPB
	dw unimpl                                           ; 3 - IOCTL input
	dw handle_io                                        ; 4 - Input
	dw unimpl                                           ; 5 - Non destructive input no wait
	dw unimpl                                           ; 6 - Input status
	dw unimpl                                           ; 7 - Input flush
	dw handle_io                                        ; 8 - Output
	dw handle_io                                        ; 9 - Output with verify
	dw unimpl                                           ;10 - Output status
	dw unimpl                                           ;11 - Output flush
max_cmd equ ($-cmd_table)/2                             ;highest valid command follows
	dw unimpl                                           ;12 - IOCTL output

;Interrupt entry point for device driver
interrupt:
	push ds
	push es
	push ax
	push bx
	push cx
	push dx
	push di
	push si
	push bp                                             ;Preserve registers
	cld                                                 ;Clear direction flag
	lds bx, [cs:rh_ptr]                                 ;Load DS:BX with the segment:offset of the request header pointer
	mov al, byte [ds:bx+rhc.cmd]                        ;Get command code from request header
	cbw
	cmp al, max_cmd                                     ;If command out of range
	ja int_cmd_high                                     ;jump to error handler
	mov di, int_cmd_exit                                ;Return address for command functions
	push di                                             ;Push it onto the stack
	add ax, ax                                          ;Multiply index by 2 to get offset into table
	mov di, ax                                          ;Store in index register
	xor ax, ax                                          ;Initialize return register to "no error"
	jmp [cs:cmd_table+di]                               ;Jump to command handler

;Entry point for unimplemented commands
unimpl:
	pop ax                                              ;Pop return address off stack

;Command was greater then max_cmd
int_cmd_high:
	mov ax, 8003h                                       ;Set return status to `Unknown Command`

int_cmd_exit:
	lds bx, [cs:rh_ptr]
	or ah, 1                                            ;Mark command as `Done`
	mov word [ds:bx+rhc.status], ax                     ;Write status value to request header
	pop bp
	pop si
	pop di
	pop dx
	pop cx
	pop bx
	pop ax
	pop es
	pop ds                                              ;Restore registers
	retf


; Media Check command
; On entry:
;   AX = 0
;   DS:BX = far pointer to request header
;
media_check:
	mov al, byte [ds:bx+rhc.unit]                       ;Load unit from request
	cmp al, byte [cs:num_devices]                       ;Check against number of devices
	jae err_invalid_unit                                ;If above or equal we have a bad unit number
	mov byte [ds:bx+rh1.return], 1                      ;Return 1 (media has not changed)
	mov cx, bpb_size
	mul cx                                              ;Multiply unit number (AX) by bpb record size
	mov bp,ax
	test byte [cs:bpb_entries+bp+bpb.flags], 080h       ;Check media changed flag
	jz  media_check_done                                ;If not set return
	mov byte [ds:bx+rh1.return], -1                     ;Else set return to -1 (media changed)
media_check_done:
	ret

; Get BIOS Parameter Block (BPB) command
; On entry:
;   AX = 0
;   DS:BX = far pointer to request header
;
get_bpb:
	mov al, byte [ds:bx+rhc.unit]                       ;Load unit from request
	cmp al, byte [cs:num_devices]                       ;Check against number of devices
	jae err_invalid_unit                                ;If above or equal we have a bad unit number
	push ax                                             ;Store unit number
	lds di,[ds:bx+rh2.xfer_off]                         ;DS:DI = transfer address fir BPB
	call read_bpb                                       ;Read devuce BPB from disk
	pop ax                                              ;Restore unit
	mov cx, bpb_size
	mul cx                                              ;Multiply unit number (AX) by bpb record size
	add ax, bpb_entries                                 ;Add this to bpb_entries to get the index of the current unit
	lds bx, [cs:rh_ptr]
	mov [ds:bx+rh2.bpb_off], ax                         ;Store offset of bpb pointer array in request header
	mov [ds:bx+rh2.bpb_seg], cs                         ;BPB segment is the code segment of driver
	mov bp, ax
	and byte [cs:bp+bpb.flags], 07fh                    ;Clear media changed flag
	xor ax, ax                                          ;Return success (0) for the status
	ret


; IO Handler routine
;   Handles Read (4), Write (8) and Write w/ Verify (9) commands
; On entry:
;   AX = 0
;   DS:BX = far pointer to request header
;
handle_io:
	mov al, byte [ds:bx+rhc.unit]                       ;Load unit number from request header
	cmp al, byte [cs:num_devices]                       ;Check against number of devices
	jae err_invalid_unit                                ;If above or equal we have a bad unit number
	mov cx, bpb_size
	mul cx                                              ;Multiply unit number by bpb record size
	mov bp, ax                                          ;Store the bpb array index in BP
	mov cx, [cs:bpb_entries+bp+bpb.num_sectors]         ;Get the total sectors from bpb
	mov ax, [ds:bx+rh4.start]                           ;Get the start sector from request header
	cmp ax, cx                                          ;If start > total
	ja err_sector_not_found                             ;Jump to sector not found error
	add ax, [ds:bx+rh4.count]                           ;Add sector count to start sector
	cmp ax, cx                                          ;If start + count > total
	ja err_sector_not_found                             ;Jump to sector not found error
	mov ax, word [cs:bpb_entries+bp+bpb.lba_start+2]    ;Load AX:CX with 32-bit LBA start
	mov cx, word [cs:bpb_entries+bp+bpb.lba_start]      ;sector for partition entry
	add cx, [ds:bx+rh4.start]                           ;Add start sector to low word of partition offset
	adc ax, 0                                           ;Add possible carry to high word
	mov word [cs:cur_sector], cx
	mov word [cs:cur_sector+2], ax                      ;Store LBA sector for later
	mov ax, [ds:bx+rh4.count]
	mov [cs:sector_count], ax                           ;Store number of sectors to read/write
	mov al, byte [ds:bx+rhc.cmd]
	cmp al, 4                                           ;If command is read
	je read_sectors                                     ;Jump to read sectors function
	cmp al, 8                                           ;If command is write
	je write_sectors                                    ;Jump to write_sectors function
	cmp al, 9                                           ;If command is write w/ verify
	je write_sectors                                    ;Also jump to write verify is not supported

;Fallthrough for unknown command
err_unknown_cmd:
	mov ax, 08003h                                      ;Return error status for unknown command
	ret
err_invalid_unit:
	mov ax, 08001h                                      ;Return error status invalid unit
	ret
err_sector_not_found:
	mov ax, 08008h                                      ;Return error status sector not found
	ret

read_sectors:
	lds di, [ds:bx+rh4.xfer_off]                        ;Load DS:DI with transfer address
rd_next_sector:
	mov bx, word [cs:cur_sector]
	mov ax, word [cs:cur_sector+2]                      ;AX:BX contains sector to read
	call drive_read                                     ;Read sector
	cmp ax, 0
	jne io_error                                        ;If AX is non zero jump to error handling
	add word [cs:cur_sector], 1                         ;Add one to the current sector and
	adc word [cs:cur_sector+2], 0                       ;handle carry if necessary
	dec word [cs:sector_count]                          ;Decrement sector count
	cmp word [cs:sector_count], 0
	jne rd_next_sector                                  ;If sector count is non zero read next sector
	xor ax, ax                                          ;Clear AX to indicate success
	ret

write_sectors:
	lds si, [ds:bx+rh4.xfer_off]                        ;Load DS:SI with transfer address
wr_next_sector:
	mov bx, word [cs:cur_sector]
	mov ax, word [cs:cur_sector+2]                      ;AX:BX contains sector to write
	call drive_write                                    ;Write sector
	cmp ax, 0
	jne io_error                                        ;If AX is non zero jump to error handling
	add word [cs:cur_sector], 1                         ;Add one to current sector and
	adc word [cs:cur_sector+2], 0                       ;handle carry if necessary
	dec word [cs:sector_count]                          ;Decrement sector count
	cmp word [cs:sector_count], 0
	jne wr_next_sector                                  ;If sector count os non zero write next sector
	xor ax, ax                                          ;Clear AX to indicate success
	ret

;IO Error handling
io_error:
	lds bx, [cs:rh_ptr]                                 ;Load DS:BX with request header address
	mov cx, [ds:bx+rh4.count]                           ;Subtract the remaining sector count from
	sub cx, [cs:sector_count]                           ;from the total count and store it in
	mov [ds:bx+rh4.count], cx                           ;the request header.
	ret

; Read partition boot sector and extract its BPB
; On entry:
;   AX = Partition number (0-3)
;   DS:DI = sector buffer
read_bpb:
	cmp ax, [cs:num_devices]                            ;Compare partition number against number of devices
	jae read_bpb_return                                 ;If >= then return immediately
	push ds
	push cx                                             ;Preserve CX
	mov si, bpb_entries
	mov cx, bpb_size                                    ;Multiply unit number by the bpb record size
	mul cx                                              ;and then add it to the adressof the bpb array
	add si, ax                                          ;to get the a pointer to the current bpb entry
	push ax                                             ;Store bpb index on stack for later
	mov ax, cs
	mov es, ax                                          ;Set ES to CS
	mov ax, word [cs:si+bpb.lba_start+2]
	mov bx, word [cs:si+bpb.lba_start]                  ;Load AX:BX with the start sector of the selected partition
	push di                                             ;save buffer offset
	call drive_read                                     ;Read boot sector of partition
	pop di                                              ;pop buffer offset
	cmp ax, 000h
	jne bpb_install_defaults                            ;Goto error handler if read failed
	mov ax, word [ds:di+510]                            ;Check boot sector signature
	cmp ax, 0aa55h                                      ;If do not have a valid boot sector signature (55aa)
	jne bpb_install_defaults                            ;Then jump to error handler
	pop bx                                              ;Pop BPB index off stack
	lea si, [ds:di+00bh]                                ;SI points to the start of the bpb in the boot sector
	lea di, [cs:bpb_entries+bx]                         ;DI points to an entry in the BPB array
	mov cx, 00dh                                        ;DOS 2.11 BPB is only 13 bytes
	rep movsb                                           ;Copy BPB from boot sector
	pop cx                                              ;Restore CX
	pop ds
read_bpb_return:
	ret
;If there was no boot sector for the partition set up some defaults that
;make dos happy and allow us to get basic info about drive for formatting
bpb_install_defaults:
	pop bx                                              ;Pop BPB index from stack
	pop cx                                              ;Restore CX
	pop ds
	mov word [cs:bpb_entries+bx+bpb.sector_size], 200h  ;Default bytes per sector is 512
	mov byte [cs:bpb_entries+bx+bpb.cluster_size], 08h  ;8 sectors per cluster (4k) when total size < 15M
	mov ax, word [cs:bpb_entries+bx+bpb.lba_sectors]    ;Initialize num of sectors with the lba_sectors
	mov word [cs:bpb_entries+bx+bpb.num_sectors], ax    ;value in partition table.
	cmp ax, 07800h                                      ;If partition is < 15M then we are done setting defaults
	jb bpb_defaults_done
	mov byte [cs:bpb_entries+bx+bpb.cluster_size], 10h  ;Else increase cluster size to 8k (16M-31M partitions)
	cmp ax, 0f800h                                      ;If partition is < 31M then we are done setting defaults
	jb bpb_defaults_done
	mov byte [cs:bpb_entries+bx+bpb.cluster_size], 20h  ;Else increase cluster size to 16k (31M-32M partitions)
bpb_defaults_done:
	ret

;---------------------------------------------------------------------
; Compact flash IO functions
;---------------------------------------------------------------------

; Write Sector to CF Card
; On entry:
;   AX:BX = sector
;   DS:SI = buffer
drive_write:
	out CYLINDERH_PORT, al                              ;Set bits 16-23 of LBA sector
	mov al, ah
	and al, 00fh
	or al, 0e0h                                         ;Set LBA mode
	out DRIVEHEAD_PORT, al                              ;Confgiure drive to use LBA mode and set bits 24-27 of LBA sector
	mov al, bl
	out SECTOR_PORT, al                                 ;Set bits 0-7 of LBA sector
	mov al, bh
	out CYLINDERL_PORT, al                              ;Set bits 8-15 of LBA sector
	mov al, 1
	out NSECTOR_PORT, al                                ;Always read just a single sector
	mov al, 030h
	out CMD_PORT, al                                    ;Issue write command to compact flash
	mov cx, 0200h                                       ;512 byte write count
	call waitdrq                                        ;Wait for data request status
writedata:
	mov al, byte [ds:si]                                ;Move current byte in buffer into AL
	out DATA_PORT, al                                   ;and write it out to the CF card
	inc si                                              ;Increment buffer pointer
	loop writedata                                      ;Loop through all 512 bytes
	call waitrdy                                        ;Wait for device to indicate rdy status (or error) after sector is written
	ret

; Read Sector from CF Card
; On entry:
;   AX:BX = sector
;   DS:DI = buffer
drive_read:
	out CYLINDERH_PORT, al                              ;Set bits 16-23 of LBA sector
	mov al, ah
	and al, 00fh
	or al, 0e0h                                         ;Set LBA mode
	out DRIVEHEAD_PORT, al                              ;Confgiure drive to use LBA mode and set bits 24-27 of LBA sector
	mov al, bl
	out SECTOR_PORT, al                                 ;Set bits 0-7 of LBA sector
	mov al, bh
	out CYLINDERL_PORT, al                              ;Set bits 8-15 of LBA sector
	mov al, 1
	out NSECTOR_PORT, al                                ;Always write just a single sector
	mov al, 020h
	out CMD_PORT, al                                    ;Issue read command to compact flash
	mov cx, 0200h                                       ;512 byte read count
	call waitdrq                                        ;Wait for data request status
readdata:
	in al, DATA_PORT                                    ;Read current byte from compact flash into AL
	mov byte [ds:di], al                                ;and store it into the sector buffer
	inc di                                              ;Increment buffer pointer
	loop readdata                                       ;Loop through all 512 bytes
	call waitrdy                                        ;Wait for device to indicate rdy status (or error) after sector is read
	ret

; Waits for device to inidicate drq status and not busy
waitdrq:
	in al, STATUS_PORT                                  ;Read status
	test al, 01h                                        ;Check error condition
	jnz report_error                                    ;If error goto error handler
	and al, 088h                                        ;Keep busy and drq bits
	cmp al, 08h                                         ;Check for not busy and drq
	jnz waitdrq                                         ;If drq is not set or busy is set loop
	xor ax, ax                                          ;Return success (0) status
	ret

; Waits for device to inidicate rdy status and not busy
waitrdy:
	in al, STATUS_PORT                                  ;Read status
	test al, 01h                                        ;Check error condition
	jnz report_error                                    ;If error goto error handler
	and al, 0c0h                                        ;Keep busy and rdy bits
	cmp al, 040h                                        ;Check for not busy and rdy
	jnz waitrdy                                         ;If rdy is not set or busy is set loop
	xor ax, ax                                          ;Return success (0) status
	ret

; Error handler for waitrdy and waitdrq functions
report_error:
	xor ax,ax                                           ;Clear AX
	or ah, 080h                                         ;Set error bit for return status
	in al, ERROR_PORT
	test al, 01h                                        ;Check AMNF error bit
	jz error_abort                                      ;If not set check ABRT bit
	mov al, 0ch                                         ;Return General Failure status
	ret
error_abort:
	test al, 04h                                        ;Check ABRT error bit
	jz error_snf                                        ;If not set check IDNF bit
	mov al, 02h
	ret
error_snf:
	test al, 010h                                       ;Check IDNF error bit
	jz error_crc                                        ;If not set check UNC bit
	mov al, 08h
	ret
error_crc:
	test al, 040h                                       ;Check UNC error bit
	jz error_badblk                                     ;If bit set check BBK bit
	mov al, 04h
	ret
error_badblk:
	test al, 080h                                       ;Check BBK error bit
	jz error_unknown                                    ;If not set we have an unkown error
	mov al, 0ah
	ret
error_unknown:
	mov al, 0ch                                         ;Return General Failure status
	ret

;Align to next 16 byte address
align 16
;Length of program in paragraphs
code_end equ ($-header) / 16

; Everything after this point is only used during driver initilization
; The driver will free the memory used after this point to allow it to
; be used by normal applications.


; Device intialization and detection routine
; On entry:
;   AX = 0
;   DS:BX = far pointer to request header
;
device_init:
	mov cx, cs
	mov ds, cx                                          ;Set DS to CS
	mov bx, init_msg                                    ;Load BX with string pointer
	call show_msg                                       ;and display string to console
	call drive_init                                     ;Initialize compact flash device
	cmp ax, 000h                                        ;Check return value
	jne nodevice                                        ;If non zero no device was detected
	call scan_partitions                                ;Scan partition table for inserted compact flash
	cmp byte [cs:num_devices], 000h                     ;Check number of devices found
	je nopartitions                                     ;If zero no partitions were found
	xor cx, cx                                          ;Zero out CX
next_bpb:
	mov ax, cx                                          ;AX = current parition
	mov di, scratch                                     ;DI = offset of scratch partition
	call read_bpb                                       ;Read boot sector (BPB) for current partition
	inc cx                                              ;Increment partition counter
	cmp cl, byte [cs:num_devices]                       ;Compare partition count to total number of devices
	jb next_bpb                                         ;If < read the BPB for the next device
	mov dx, cs                                          ;Add the number of paragraphs of code to the CS register,
	add dx, code_end                                    ;this will give ys the correct segment for the break address
	jmp print_partition_msg                             ;Print partitions found message
nodevice:
	mov dx, cs                                          ;CF device not detected free all driver memory
	mov bx, nodevice_msg                                ;Load BX with string pointer
	call show_msg                                       ;and print message to console
	jmp device_init_done
nopartitions:
	mov dx, cs                                          ;Ensure we free all memory used by driver
print_partition_msg:
	mov al, byte [cs:num_devices]                       ;Take the number of devices
	and al, 7                                           ;and convert it into the ascii
	add al, 030h                                        ;representation of that number (0-4)
	mov byte [cs:partition_msg+1], al                   ;Update the partition(s) found message
	mov bx, partition_msg                               ;Load BX with string pointer
	call show_msg                                       ;and display message to console
device_init_done:
	mov al, byte [cs:num_devices]
	lds bx, [cs:rh_ptr]                                 ;Load request header pointer int DS:BX
	mov byte [ds:bx+rh0.units], al                      ;Store number of devices detected in request header
	mov word [ds:bx+rh0.end_off], 00000h                ;Set the break address offset to 0
	mov word [ds:bx+rh0.end_seg], dx                    ;Set the break address segment to DX
	mov word [ds:bx+rh0.bpb_off], bpb_ptr               ;Set the offset for the BPB pointer array
	mov word [ds:bx+rh0.bpb_seg], cs                    ;BPB pointer array uses the CS as its segment
	xor ax, ax                                          ;Zero AX
	ret

; Scans paritition table of compact flash card
;   Stores number of valid partitions found in cs:num_devices
scan_partitions:
	mov byte [cs:num_devices], 0                        ;Set number of devices to 0
	mov ax, cs
	mov es, ax                                          ;Set ES to CS
	mov ds, ax                                          ;Set DS to CS
	mov ax, 000h
	mov bx, ax                                          ;AX:BX = sector 0
	mov di, scratch                                     ;Use scratch space to read disk MBR
	call drive_read                                     ;Read Sector 0 (mbr) from compact flash
	cmp ax, 000h                                        ;Check return for success (0)
	jne scan_done                                       ;If error during read report no drives found
	mov ax, word [cs:scratch+510]                       ;Check boot sector signature
	cmp ax, 0aa55h                                      ;If not 55aa then
	jne scan_done                                       ;report no drives found
	xor cx, cx                                          ;Zero out CX (current partition)
	mov si, scratch+01beh                               ;Set SI to point to partition table in mbr
next_partition:
	mov ax, 010h                                        ;Each partion entry is 16 bytes
	mul cx                                              ;Multiply with current partition number
	mov bx, ax                                          ;Gives the index the for current entry
	cmp byte [cs:si+bx+4], 001h                         ;Check that it is using a FAT12 partition
	jne skip_partition                                  ;If it isn't check next primary partition
	cmp word [cs:si+bx+0eh], 000h                       ;Check size is not more then 32 MB
	jne skip_partition                                  ;If it is check next primary partition
	push cx                                             ;Preserve CX
	push si                                             ;Preserve SI
	mov cl, byte [cs:num_devices]                       ;Multiply the current num_devices
	mov ax, bpb_size                                    ;by the BPB record size to get
	mul cx                                              ;the index for the current BPB
	mov bp, ax                                          ;and store it in bp
	mov cx, 010h                                        ;Set count to 0x10 (partitoin entry size)
	lea di, [cs:bpb_entries+bp+bpb.active]              ;Set destination for copy
	lea si, [cs:si+bx]                                  ;Set source for copy
	rep movsb                                           ;Copy partition entry from mbr to current BPB record
	inc byte [cs:num_devices]                           ;Increment count of devices
	pop si                                              ;Restore SI
	pop cx                                              ;Restore CX
skip_partition:
	inc cx                                              ;Increment partition counter
	cmp cx, 03h                                         ;There are only 4 parimary partitions (0-4)
	jbe next_partition                                  ;Continue if CX is 3 or less
scan_done:
	ret

drive_init:
	mov al, 0e0h                                        ;LBA Mode
	out DRIVEHEAD_PORT, al                              ;Set LBA Mode
	in al, DRIVEHEAD_PORT                               ;Read back value
	cmp al, 0e0h                                        ;Check if write was successful
	jne no_card                                         ;If not no card was installed
	in al, STATUS_PORT                                  ;Read compact flash status register
	and al, 050h                                        ;Check if compact flash card is ready
	cmp al, 050h
	jne no_card                                         ;If no, then cfcard not inserted/ready
	mov al, 1                                           ;8-bit mode feature
	out FEATURE_PORT, al                                ;Enable 8-bit mode feature
	mov al, 0efh                                        ;Set Feature command
	out CMD_PORT, al                                    ;Set 8-bit mode feature
	call waitrdy                                        ;Check for error and wait till device becomes ready
	jmp drive_init_done
no_card:
	mov ax, 0ffffh
drive_init_done:
	ret

; Print Message (used during init function)
; On entry:
;   BX = Pointer to to string
show_msg:
	push ax                                             ;Preserve AX across call
	push dx                                             ;Preserve DX across call
	mov dx, bx
	mov ah, 09h                                         ;DOS print string function
	int 21h                                             ;Call DOS interrupt service
	pop dx                                              ;Restore DX
	pop ax                                              ;Restore AX
	ret

init_msg:
	db `\r\nEpson QX-16 Compact Flash Driver\r\nBy Brian Johnson (c) 2022\r\n$`
nodevice_msg:
	db `\tNo device found\r\n$`
partition_msg:
	db `\tn partition(s) found\r\n$`

scratch:
	times 512 db 0
