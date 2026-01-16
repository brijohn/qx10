; z80dasm 1.1.6
; command line: z80dasm -g 0xf000 -l -S ./symbols.lst -b bios.blk bios.sys

	org 0f000h
display_string:       equ 0x12ec
floppy_select:        equ 0x91dd
floppy_home:          equ 0x9234
floppy_read:          equ 0x9328
floppy_write:         equ 0x9358
hdd_select:           equ 0x9841
hdd_home:             equ 0x986a
hdd_read:             equ 0x987b
hdd_write:            equ 0x988d
mem_disk_select:      equ 0x9ae3
mem_disk_home:        equ 0x9ae4
mem_disk_read:        equ 0x9aec
mem_disk_write:       equ 0x9af2
cold_boot:            equ 0x9c0c
hdd_init:             equ 0x9f2b
hdd1_alloc_vec:       equ 0xf92c
hdd2_alloc_vec:       equ 0xfa5d
hdd_sector_buffer:    equ 0xfb8e
mem_sector_buffer:    equ 0xfc0e
lfloppy_alloc_vec:    equ 0xfc8e
rfloppy_alloc_vec:    equ 0xfcbf
lfloppy_chksum_vec:   equ 0xfcf0
rfloppy_chksum_vec:   equ 0xfd30
floppy_sector_buffer: equ 0xff70

bios_vector:
	jp boot
warm_boot_vector:
	jp wboot
	jp const
	jp conin
	jp conout
	jp list
	jp punch
	jp reader
	jp home
	jp seldsk
	jp settrk
	jp setsec
	jp setdma
	jp read
	jp write
	jp listst
	jp sectrn
	jp empty_bios
	jp empty_bios
	jp empty_bios
	jp empty_bios
	jp empty_bios
	jp empty_bios
	jp empty_bios
	jp empty_bios
	jp empty_bios
	jp empty_bios
	jp empty_bios
	jp empty_bios
	jp empty_bios
qxfunc:
	jp userf

	defw memcopy_buffer
	defw 09c5eh
	defw cold_boot

empty_bios:
	ret

iobyte:
	defb 000h

saved_bank:
	defb 001h

lf066h:
	defb 000h

lf067h:
	defb 000h

buffer_size:
	defw 00000h

restore_bank:
	defb 000h

last_block_flag:
	defb 000h

current_bank:
	defb 000h

	ds 3

source_pointer:
	defw 00000h

destination_pointer:
	defw 00000h

bytes_remaining:
	defw 00000h

	ds 10

interrupt_vec_master:
	di
	ld (int_saved_areg),a
	ld a,000h
	jr interrupt_entry
	di
	ld (int_saved_areg),a
	ld a,003h
	jr interrupt_entry
	di
	ld (int_saved_areg),a
	ld a,006h
	jr interrupt_entry
	di
	ld (int_saved_areg),a
	ld a,009h
	jr interrupt_entry
	di
	ld (int_saved_areg),a
	ld a,00ch
	jr interrupt_entry
	di
	ld (int_saved_areg),a
	ld a,00fh
	jr interrupt_entry
	di
	ld (int_saved_areg),a
	ld a,012h
	jr interrupt_entry
	di
	ld (int_saved_areg),a
	ld a,015h
	jr interrupt_entry
interrupt_vec_slave:
	di
	ld (int_saved_areg),a
	ld a,018h
	jr interrupt_entry
	di
	ld (int_saved_areg),a
	ld a,01bh
	jr interrupt_entry
	di
	ld (int_saved_areg),a
	ld a,01eh
	jr interrupt_entry
	di
	ld (int_saved_areg),a
	ld a,021h
	jr interrupt_entry
	di
	ld (int_saved_areg),a
	ld a,024h
	jr interrupt_entry
	di
	ld (int_saved_areg),a
	ld a,027h
	jr interrupt_entry
	di
	ld (int_saved_areg),a
	ld a,02ah
	jr interrupt_entry
	di
	ld (int_saved_areg),a
	ld a,02dh
interrupt_entry:
	jp interrupt_handler

;
; BIOS: Cold Boot Entry
;
;
boot:
	exx
	ld hl,cold_boot
	jp bios2

;
; BIOS: Warm Boot Entry
;
;
wboot:
	exx
	ld hl,0006eh
	jp bios2

;
; BIOS: Console Status
;   Returns
;     A = 0  - No character ready
;     A = FF - Character is available
;
const:
	exx
	ld a,0ffh
	ld (console_status_flag),a      ; Set flag that indicating const was called
	ld hl,0125bh
	jp bios2

;
; BIOS: Console Input
;   Returns
;      A = Character
;
conin:
	exx
	ld hl,01269h
	jp bios2

;
; BIOS: Console Output
;   Parameters
;      C = Character to output
;
conout:
	exx
	ld hl,01277h
	jp bios2

;
; BIOS: List Output
;   Parameters
;     C = Character to send to printer
;
list:
	exx
	ld hl,012a7h
	jp bios2

;
; BIOS: Punch Output
;   Parameters
;      C = Character to output
;
punch:
	exx
	ld hl,01285h
	jp bios2

;
; BIOS: Reader Input
;   Returns
;      A = Character
;
reader:
	exx
	ld hl,01297h
	jp bios2

;
; BIOS: Home Selected Disk
;
;
home:
	exx
	ld hl,09039h
	jp bios2

;
; BIOS: Select Disk
;   Parameters
;      C = disk to select
;      E = 0 | 1
;   Returns
;      HL = DPH address of selected disk
;
seldsk:
	exx
	ld hl,08ffbh
	jp bios2

;
; BIOS: Set Track Number
;   Parameters
;      BC = track number
;
settrk:
	exx
	ld hl,09051h
	jp bios2

;
; BIOS: Set Sector Number
;   Parameters
;      BC = sector number
;
setsec:
	exx
	ld hl,09056h
	jp bios2

;
; BIOS: Set DMA Address
;   Parameters
;      BC = DMA address
;
setdma:
	exx
	ld hl,0905eh
	jp bios2

;
; BIOS: Read Sector
;   Returns
;      A = 0 - Success
;      A = 1 - Failure
;
read:
	exx
	ld hl,09063h
	jp bios2

;
; BIOS: Write Sector
;   Returns
;      A = 0 - Success
;      A = 1 - Failure
;
write:
	exx
	ld hl,0907dh
	jp bios2

;
; BIOS: List Status
;   Returns
;      A = 0  - Not Ready
;      A = FF - Ready
;
listst:
	exx
	ld hl,012b7h
	jp bios2

;
; BIOS: Sector Translate
;   Parameters
;      BC = logical sector
;      DE = address of translation table
;   Returns
;      HL = physical sector number
;
sectrn:
	exx
	ld hl,0905bh
	jp bios2

;
; BIOS: QX-10 XBIOS entry point
;   Parameters
;      C = XBIOS function number
;
userf:
	push af
	ld a,c
	cp 031h                         ; Call code in another bank
	jp z,call_code_in_bank          ;
	cp 032h                         ; Jump to code in another bank
	jp z,jump_to_code_in_bank       ;
	pop af
	exx
	ld hl,000fbh
	jp bios2

; FUNCTION: Banked BIOS entry point
;   Parameters
;      HL = Banked BIOS function address
;
bios2:
	di
	ld (bios2_saved_sp),sp
	ld sp,hdd1_alloc_vec            ; Setup stack for use with banked BIOS
	ld de,bios2_return
	push de                         ; Push return banked BIOS return address onto stack
	push hl                         ; Push address of banked BIOS routine onto stack
	exx
	push af
	ld a,(00003h)
	ld (iobyte),a                   ; Store current iobyte for use by banked bios
	ld a,(current_bank)
	ld (saved_bank),a               ; Store current bank for later
	xor a
	ld (current_bank),a             ; Set current bank to 0
	ld a,012h
	out (018h),a                    ; and change to to bank 0 (why don't we use set_bank?)
	ld a,(iobyte)
	ld (0272ah),a                   ; store current iobyte in bank 0
	ld a,(console_status_flag)
	or a                            ; If const bios call then
	jr nz,lf1cch                    ; skip
	ld a,(01257h)
	or a
	call z,0177ch
	ld a,014h
	ld (01256h),a
lf1cch:
	ld a,(lf066h)
	or a
	call nz,sub_f1e9h
	pop af
	ei
	ret                             ; Use return to jump to correct banked bios routine

; Return location from banked BIOS call
bios2_return:
	di
	ex af,af'
	xor a
	ld (console_status_flag),a      ; Clear const flag
	ld a,(saved_bank)
	call set_bank                   ; Restore original bank
	ld sp,(bios2_saved_sp)          ; Restore stack pointer
	ex af,af'
	ei
	ret

sub_f1e9h:
	ei
	ld a,(lf067h)
	or a
	ret nz
	ld a,(lf066h)
	bit 0,a
	call nz,08c1ah
	bit 1,a
	call nz,00b4eh
	ld a,(lf066h)
	bit 3,a
	call nz,sub_f248h
	bit 5,a
	call nz,02a83h
	ld a,(lf066h)
	bit 7,a
	call nz,sub_f218h
	ld a,(lf066h)
	or a
	jr nz,sub_f1e9h
	ret

sub_f218h:
	push bc
	push de
	push hl
	push ix
	push iy
	res 7,a
	bit 6,a
	jr nz,lf236h
	set 6,a
	ld (lf066h),a
	ld hl,paused_msg
	ld a,003h
	ld c,000h
	call display_string
	jr lf240h
lf236h:
	res 6,a
	ld (lf066h),a
	ld a,001h
	call 012efh
lf240h:
	pop iy
	pop ix
	pop hl
	pop de
	pop bc
	ret

sub_f248h:
	push bc
	push de
	push hl
	push ix
	push iy
	res 3,a
	ld (lf066h),a
	ld b,000h
	ld l,001h
	ld a,(02738h)
	inc a
	and 001h
	ld h,a
	xor a
	call 05200h
	ld a,(lf066h)
	pop iy
	pop ix
	pop hl
	pop de
	pop bc
	ret

; FUNCTION: Interrupt entry point
;
interrupt_handler:
	ld (interrupt_saved_sp),sp      ; Save SP...
	ld sp,0f8ach                    ; and setup interrupt stack
	ld (interrupt_number),a         ; Save interrupt number
	ld a,(int_saved_areg)           ; Restore original A register
	push af
	push bc
	push de
	push hl
	push ix
	push iy                         ; Save registers on stack
	ld a,(current_bank)             ; A = current memory bank
	ld (interrupt_saved_bank),a     ; save current memory bank
	ld de,interrupt_return
	push de                         ; push address to return to on stack
	ld a,(interrupt_number)         ; A = interrupt number
	ld e,a
	ld d,000h                       ; DE = interrupt number (offset)
	ld hl,interrupt_functions       ; HL = interrupt function table
	add hl,de                       ; HL = index to interrupt function / bank
	ld e,(hl)
	inc hl
	ld d,(hl)                       ; DE = address of interrupt handler
	inc hl
	ld a,(hl)                       ; A = bank number of interrupt handler
	ex de,hl
	call set_bank                   ; Set the correct bank
	jp (hl)                         ; Jump to handler

; Return location from unified interrupt handler
interrupt_return:
	ld a,(interrupt_saved_bank)
	call set_bank                   ; Switch back to previous memory bank
	pop iy
	pop ix
	pop hl
	pop de
	pop bc
	pop af                          ; Restore registers from stack
	ld sp,(interrupt_saved_sp)      ; Restore original stack
	ei
	ret


;
; FUNCTION: Executes code in another bank
;   Parameters
;      HL = address
;      A  = bank number
;
execute_banked_code:
	ld (execute_bank_addr),hl       ; Store address to execute
	ld (execute_bank_id),a          ; Store bank id to execute from
	ld a,(current_bank)
	push af                         ; Store current bank on stack
	ld a,(execute_bank_id)
	call set_bank                   ; Switch to bank we are executing code from
	ld hl,execute_banked_ret
	push hl                         ; Push return address onto stack
	ld hl,(execute_bank_addr)
	jp (hl)                         ; Jump to execute address

execute_banked_ret:
	pop af                          ; Pop original bank from stack
	call set_bank                   ; Switch back to original bank
	ret

;
; FUNCTION: Executes code in another bank w/nested stack
;   Parameters
;      HL = address
;      A  = bank number
;
execute_banked_code2:
	ld (saved_hl),hl                ; Save address
	pop hl                          ; Pop return address from stack
	ld (saved_sp),sp                ; Save original SP
	ld sp,(banking_sp)              ; Load SP with current banking SP
	push hl                         ; Push return adress onto current banking stack
	ld (temp_bank),a                ; Temporaily store target bank
	ld a,(current_bank)
	push af                         ; Push current bank onto banking stack
	ld a,(temp_bank)
	call set_bank                   ; Switch to target bank
	ld (banking_sp),sp              ; Save new banking SP
	ld sp,(saved_sp)                ; Restore original SP
	ld hl,execute_banked_ret2
	push hl                         ; Push execute_banked_ret2 onto stack as return address
	ld hl,(saved_hl)
	jp (hl)                         ; Jump to target address

execute_banked_ret2:
	ld (saved_sp),sp                ; Save current SP
	ld sp,(banking_sp)              ; Load the saved banking SP
	pop af                          ; Recover original bank
	pop hl                          ; Recover original return address
	ld (banking_sp),sp              ; Update banking SP
	ld sp,(saved_sp)                ; Restore original SP
	push hl                         ; Push return adress back on stack
	ld (temp_bank),a
	ld a,(current_bank)
	push af                         ; Push current bank onto stack
	ld a,(temp_bank)
	call set_bank                   ; Switch bank to original bank
	ld hl,lf4bfh
	jp (hl)                         ; Jump to cleanup code

; FUNCTION: Initialize stack used with execute_banked_code2
init_banking_sp:
	ld hl,bios2_saved_sp
	ld (banking_sp),hl
	ret

; FUNCTION: Select Memory bank
;   Parameters
;     A = memory bank to switch in (0-7)
set_bank:
	push hl
	and 007h
	ld (current_bank),a             ; Store new bank as the current bank
	ld hl,bank_mapping              ; HL = mapping table
	add a,a
	add a,l                         ; Multiple bank by 2 and add to table address
	ld l,a
	jr nc,lf336h                    ; If no carry, skip increment
	inc hl                          ; Add 1 to hl
lf336h:
	ld a,(hl)                       ; A = bank group (0,1)
	out (028h),a                    ; Switch bank group
	inc hl
	ld a,(hl)                       ; A = bank (12,22,42,82)
	out (018h),a                    ; Switch bank
	pop hl
	ret

; Bank mapping table
;  Each entry is two bytes
;     Byte 1 = bank group
;     Byte 2 = memory bank
bank_mapping:
	defb 000h
	defb 012h
	defb 000h
	defb 022h
	defb 000h
	defb 042h
	defb 000h
	defb 082h
	defb 001h
	defb 012h
	defb 001h
	defb 022h
	defb 001h
	defb 042h
	defb 001h
	defb 082h

; FUNCTION: Read iobyte value
;   Returns
;     A = current value of the iobyte
;
read_iobyte:
	push bc
	ld a,(saved_bank)
	call set_bank                   ; Select saved memory bank
	ld a,(00003h)                   ; Load iobyte into A
	ld b,a                          ; B = iobyte
	ld a,000h
	call set_bank                   ; Switch back to system bank (0)
	ld a,b                          ; A = iobyte
	pop bc
	ret

; FUNCTION: Update iobyte value
;   Parameters
;     A = new iobyte value
;
write_iobyte:
	push bc
	ld b,a                          ; B = iobyte
	ld a,(saved_bank)
	call set_bank                   ; Select saved memory bank
	ld a,b
	ld (00003h),a                   ; Update io byte
	ld a,000h
	call set_bank                   ; Switch back to system bank (0)
	pop bc
	ret

; FUNCTION: Read dskbyte value
;   Returns
;     A = current value of the dskbyte
;
read_dskbyte:
	push bc
	ld a,(saved_bank)
	call set_bank                   ; Select saved memory bank
	ld a,(00004h)                   ; Load dskbyte into A
	ld b,a                          ; B = dskbyte
	ld a,000h
	call set_bank                   ; Switch back to system bank (0)
	ld a,b                          ; A = dskbyte
	pop bc
	ret

; FUNCTION: Update dskbyte value
;   Parameters
;     A = new dskbyte value
;
write_dskbyte:
	push bc
	ld b,a                          ; B = dskbyte
	ld a,(saved_bank)
	call set_bank                   ; Select saved memory bank
	ld a,b
	ld (00004h),a                   ; Update dskbyte
	ld a,000h
	call set_bank                   ; Switch back to system bank (0)
	pop bc
	ret

; FUNCTION: Setup for a banked memory copy
;   Parameters
;     B = Destination bank
;     C = Source bank
;
setup_banked_copy:
	ld (source_bank),bc             ; Store source and destination banks
	ld a,0ffh
	ld (banked_copy_flag),a         ; Set banked copy flag (used in copy_memblock)
	ret

; FUNCTION: Copies a block of memory
;   Parameters
;     BC = Number of bytes to copy
;     HL = Source address
;     DE = Destination address
;
copy_memblock:
	ld a,b                          ; Load A with top half of BC
	or c
	ret z                           ; return if BC == 0
	ld a,(banked_copy_flag)         ; A = FF (banked copy), A = 0 (non banked copy)
	or a
	jp z,non_banked_copy            ; Jump if doing a non banked copy
	xor a                           ; Clear A
	ld (banked_copy_flag),a         ; Reset to non banked copy for future calls
	ld a,(current_bank)
	ld (restore_bank),a             ; Save current memory bank
	ld (bytes_remaining),bc         ; Save original BC (total bytes) value
	ld (source_pointer),hl          ; Save original HL (src address) value
	ld (destination_pointer),de     ; Save original DE (dest address) value
lf3c4h:
	ld hl,(bytes_remaining)         ; HL = byte count
	ld de,00080h                    ; DE = 128 (size of copy buffer)
	or a                            ; Clear carry flag
	sbc hl,de                       ; Subtract 128 from byte count
	jr c,lf3dfh                     ; Jump if HL (byte count) is less then 128
	ld a,l                          ; A = bottom half of HL
	or h
	jr z,lf3dfh                     ; Jump if HL (byte count) is 0
	ld (bytes_remaining),hl         ; Store updated byte count (remaining bytes)
	ld bc,00080h
	ld (buffer_size),bc             ; Copy 128 bytes this loop iteration
	jr lf3e8h
lf3dfh:
	add hl,de                       ; Add 128 back to byte count (undo previous subtraction)
	ld (buffer_size),hl             ; Store byte count to transfer this loop iternation
	ld a,0ffh
	ld (last_block_flag),a          ; Mark as last loop iteration
lf3e8h:
	ld a,(source_bank)              ; A = src bank
	call set_bank                   ; Select source bank
	ld bc,(buffer_size)             ; BC = Number of bytes (128 or less)
	ld hl,(source_pointer)          ; HL = Source address
	ld de,memcopy_buffer            ; DE = Temporary copy buffer
	ldir                            ; Copy next block to buffer
	ld (source_pointer),hl          ; Save updated src address pointer
	ld a,(destination_bank)         ; A = dest bank
	call set_bank                   ; Select destination bank
	ld de,(destination_pointer)     ; DE = Destination address
	ld bc,(buffer_size)             ; BC = Number of bytes (128 or less)
	ld hl,memcopy_buffer            ; HL = Temporary copy buffer
	ldir                            ; Copy buffer to destination address
	ld (destination_pointer),de     ; Saved updated dest address pointer
	ld a,(last_block_flag)          ; A = Last block marker
	or a
	jp z,lf3c4h                     ; If A == 0 copy next 128 byte block, else we are done
	xor a
	ld (last_block_flag),a          ; Clear end of loop mark
	ld a,(restore_bank)             ; A = Original bank before copy
	call set_bank                   ; Select original bank
	ret
non_banked_copy:                    ; Perform non banked copy
	ldir
	ret

int_saved_areg:
	defb 000h

interrupt_number:
	defb 000h

source_bank:
	defb 000h

destination_bank:
	defb 000h

banked_copy_flag:
	defb 000h

temp_bank:
	defb 000h

saved_hl:
	defw 00000h

execute_bank_addr:
	defw 00000h

execute_bank_id:
	defb 000h

saved_sp:
	defw 00000h

console_status_flag:
	defb 000h

	defb 000h

interrupt_saved_bank:
	defb 000h

paused_msg:
	defb " SYSTEM IS PAUSED! PRESS CTRL-STOP TO CONTINUE", 0

	ds 40

bios2_saved_sp:
	defw 00000h

interrupt_saved_sp:
	defw 00000h

banking_sp:
	defw 0f490h

launch_ccp:
	ld a,001h
	call set_bank                   ; Switch to main user bank
	ld a,0c3h
	ld (00000h),a                   ;
	ld (00005h),a                   ; Set JMP instruction for BIOS and BDOS
	ld hl,warm_boot_vector          ;
	ld (00001h),hl                  ; Set BIOS entry point
	ld hl,0e206h                    ;
	ld (00006h),hl                  ; Set BDOS entry point
	ld a,(00004h)                   ;
	ld c,a                          ; C = dskbyte (active drive)
	jp 0da00h                       ; Jump to CCP

whitelisted_bank1:
	defb 0ffh

whitelisted_bank2:
	defb 0ffh

call_code_in_bank:
	pop af
	call validate_bank_addr
	jp execute_banked_code2

lf4bfh:
	pop af
	ld c,a
	ld a,(current_bank)
	ld b,a
	call setup_banked_copy
	ld de,00000h
	ld hl,00000h
	ld bc,00008h
	call copy_memblock
	ret

; FUNCTION: Validates address and bank for CALL/JUMP to code in different bank
;   Parameters
;     DE = address
;     A  = bank
;
validate_bank_addr:
	ld b,a
	ld hl,0efffh
	or a
	sbc hl,de
	jp c,lf4f0h                     ; If address is greater then 0xefff, fail state
	ld a,(whitelisted_bank1)
	cp b
	jr z,lf50bh                     ; bank == whitlisted bank #1, success state
	ld a,(whitelisted_bank2)
	cp b
	jr z,lf50bh                     ; bank == whitlisted bank #2, success state
	ld a,001h
	cp b
	jr z,lf50bh                     ; If bank == 1, success state
lf4f0h:                             ; Fail
	xor a
	call set_bank                   ; Switch to system bank
	ld hl,00ae1h                    ; " ILLEGAL CALLX OR JUMPX OPERATION! PRESS ANY KEY TO ABORT"
	ld a,00ah
	ld c,000h
	call display_string             ; Display error message
	call 0166ah
	call 01269h                     ; Wait for key press (conin)
	xor a
	call 012efh
	jp 00062h                       ; Warm Boot
lf50bh:                             ; Success
	push bc                         ; Save B (target bank) on stack
	push de                         ; Save DE (address) on stack
	ld a,(current_bank)
	ld c,a                          ; C = current bank
	call setup_banked_copy          ; Banked copy from current -> target bank
	ld de,00000h
	ld hl,00000h
	ld bc,00008h
	call copy_memblock
	pop hl                          ; HL = address (DE)
	pop af                          ; A = bank
	ret

jump_to_code_in_bank:
	pop af
	call validate_bank_addr
	call set_bank
	jp (hl)

	ld a,(lf57bh)
	or a
	jr z,lf533h
	ld a,0ffh
lf533h:
	ret

reset_msg:
	defb " PRESS RESET BUTTON", 0

	ld a,(09814h)
	or a
	jr z,lf560h
	ld a,(09840h)
	or a
	jr z,lf560h
	ld hl,reset_msg
	ld a,003h
	ld c,000h
	call display_string
	di
	halt
lf560h:
	ld a,0e0h
	call 018eah
	xor a
	call 018eah
	call 018eah
	ld a,003h
	out (017h),a
	xor a
	out (020h),a
	out (04dh),a
	xor a
	out (01ch),a
	jp 00000h

lf57bh:
	defb 000h

interrupt_functions:
	defw 026e3h
	defb 000h
	defw 026e3h
	defb 000h
	defw 026e3h
	defb 000h
	defw 026e3h
	defb 000h
	defw 025c9h
	defb 000h
	defw 026e3h
	defb 000h
	defw 026e3h
	defb 000h
	defw 026e3h
	defb 000h
	defw 026e3h
	defb 000h
	defw 026e3h
	defb 000h
	defw 01110h
	defb 000h
	defw 026e3h
	defb 000h
	defw 026e3h
	defb 000h
	defw 04af0h
	defb 000h
	defw 026e3h
	defb 000h
	defw 026e3h
	defb 000h
	defw 0260fh
	defb 000h
	defw 02646h
	defb 000h

	ret
	ret

install_bdos_hook:
	ld hl,(0e207h)
	ld (saved_bdos_handler),hl
	ld hl,lf5c5h
	ld (0e207h),hl
	ret

saved_bdos_handler:
	defw 00000h

bdos_hook_saved_sp:
	defw 00000h

lf5c5h:
	di
	ld (bdos_hook_saved_sp),sp
	ld sp,00000h
	push af
	push bc
	push de
	push hl
	ld a,(current_bank)
	ld (saved_bank),a
	xor a
	ld (current_bank),a
	ld a,012h
	out (018h),a
	ei
	jp 0280ah

bdos_hook_return:
	di
	ld a,(saved_bank)
	call set_bank
	pop hl
	pop de
	pop bc
	pop af
	ld sp,(bdos_hook_saved_sp)
	ei
	ld hl,(saved_bdos_handler)
	jp (hl)

	ds 34

	defb 080h

	ds 5

; Drive mapping table
;   Allows mapping drive letters to a DPH structure
drive_mapping:
	defw 00000h                     ; A Drive
	defw 00000h                     ; B Drive
	defw 00000h                     ; C Drive
	defw 00000h                     ; D Drive
	defw 00000h                     ; E Drive
	defw 00000h                     ; F Drive
	defw 00000h                     ; G Drive
	defw 00000h                     ; H Drive
	defw 00000h                     ; I Drive
	defw 00000h                     ; J Drive
	defw 00000h                     ; K Drive
	defw 00000h                     ; L Drive
	defw 00000h                     ; M Drive
	defw 00000h                     ; N Drive
	defw 00000h                     ; O Drive
	defw 00000h                     ; P Drive

lfloppy_functions:
	defw floppy_home                ; home function
	defw floppy_write               ; write function
	defw floppy_read                ; read function
	defw floppy_select              ; select function
	defw 00000h                     ; init/assign function
	defw 00000h                     ; unit 0

lfloppy_dph:
	defw 00000h
	defw 00000h
	defw 00000h
	defw 00000h
	defw floppy_sector_buffer
	defw lfloppy_dd_dpb
	defw lfloppy_chksum_vec
	defw lfloppy_alloc_vec

rfloppy_functions:
	defw floppy_home                ; home function
	defw floppy_write               ; write function
	defw floppy_read                ; read function
	defw floppy_select              ; select function
	defw 00000h                     ; init/assign function
	defw 00100h                     ; Unit 1

rfloppy_dph:
	defw 00000h
	defw 00000h
	defw 00000h
	defw 00000h
	defw floppy_sector_buffer
	defw rfloppy_dd_dpb
	defw rfloppy_chksum_vec
	defw rfloppy_alloc_vec

lfloppy_dd_dpb:
	defw 00050h                     ; 80 sectors per track
	defb 004h                       ; block shift of 4
	defb 00fh                       ; block mask of 16 (2k block size)
	defb 001h                       ; extent mask of 1
	defw 000bdh                     ; DSM of 189
	defw 0007fh                     ; DRM of 127
	defb 0c0h                       ; AL0 = 0xc0
	defb 000h                       ; AL1 = 0x00
	defw 00020h                     ; checksum vector size of 32
	defw 00002h                     ; 2 reserved tracks

lfloppy_qd_dpb:
	defw 00050h                     ; 80 sectors per track
	defb 004h                       ; block shift of 4
	defb 00fh                       ; block mask of 16 (2k block size)
	defb 000h                       ; extent mask of 0
	defw 00185h                     ; DSM of 389
	defw 000ffh                     ; DRM of 255
	defb 0f0h                       ; AL0 = 0xf0
	defb 000h                       ; AL1 = 0x00
	defw 00040h                     ; checksum vector size of 64
	defw 00002h                     ; 2 reserved tracks

rfloppy_dd_dpb:
	defw 00050h                     ; 80 sectors per track
	defb 004h                       ; block shift of 4
	defb 00fh                       ; block mask of 16 (2k block size)
	defb 001h                       ; extent mask of 1
	defw 000bdh                     ; DSM of 189
	defw 0007fh                     ; DRM of 127
	defb 0c0h                       ; AL0 = 0xc0
	defb 000h                       ; AL1 = 0x00
	defw 00020h                     ; checksum vector size of 32
	defw 00002h                     ; 2 reserved tracks

nec765_dd_param_tbl:
	defb 010h                       ; BLKSIZE/128
	defb 050h                       ; HSTBLK * HSTSPT
	defb 002h                       ; Sector Shift Factor
	defb 003h                       ; Sector Mask
	defb 00ah                       ; # Sectors/Track
	defb 00fh                       ; Disk Gap Factor
	defb 002h                       ; NEC 765 Sector Factor
	defw 001ffh                     ; DMA Byte Count Factor
	defb 004h                       ; Sector Translate Factor
	defb 000h                       ; Long Disk Flag
	defb 028h                       ; Disk Track Count (40)

rfloppy_qd_dpb:
	defw 00050h                     ; 80 sectors per track
	defb 004h                       ; block shift of 4
	defb 00fh                       ; block mask of 16 (2k block size)
	defb 000h                       ; extent mask of 0
	defw 00185h                     ; DSM of 389
	defw 000ffh                     ; DRM of 255
	defb 0f0h                       ; AL0 = 0xf0
	defb 000h                       ; AL1 = 0x00
	defw 00040h                     ; checksum vector size of 64
	defw 00002h                     ; 2 reserved tracks

nec765_qd_param_tbl:
	defb 010h                       ; BLKSIZE/128
	defb 050h                       ; HSTBLK * HSTSPT
	defb 002h                       ; Sector Shift Factor
	defb 003h                       ; Sector Mask
	defb 00ah                       ; # Sectors/Track
	defb 00fh                       ; Disk Gap Factor
	defb 002h                       ; NEC 765 Sector Factor
	defw 001ffh                     ; DMA Byte Count Factor
	defb 004h                       ; Sector Translate Factor
	defb 000h                       ; Long Disk Flag
	defb 050h                       ; Disk Track Count (80)

hdd1_functions:
	defw hdd_home                   ; home function
	defw hdd_write                  ; write function
	defw hdd_read                   ; read function
	defw hdd_select                 ; select function
	defw hdd_init                   ; init/assign function
	defw 00000h                     ; Unit 0

hdd1_dph:
	defw 00000h
	defw 00000h
	defw 00000h
	defw 00000h
	defw hdd_sector_buffer
	defw hdd_dpb
	defw mem_disk_init              ; This should be NULL, checksum vectors are not used for fixed disks
	defw hdd1_alloc_vec

hdd2_functions:
	defw hdd_home                   ; home function
	defw hdd_write                  ; write function
	defw hdd_read                   ; read function
	defw hdd_select                 ; select function
	defw 00000h                     ; init/assign function
	defw 00100h                     ; Unit 1

hdd2_dph:
	defw 00000h
	defw 00000h
	defw 00000h
	defw 00000h
	defw hdd_sector_buffer
	defw hdd_dpb
	defw mem_disk_init              ; This should be NULL, checksum vectors are not used for fixed disks
	defw hdd2_alloc_vec

hdd_dpb:
	defw 00040h                     ; sectors per track 64
	defb 004h                       ; block shift of 4
	defb 00fh                       ; block mask of 15 (2k block size)
	defb 000h                       ; extent mask of 0
	defw 00987h                     ; DSM of 2439
	defw 003ffh                     ; DRM of 1023
	defb 0ffh                       ; AL0 = 0xff
	defb 0ffh                       ; AL1 = 0xff
	defw 00000h                     ; checksum vector size of 0
	defw 00002h                     ; 2 reserved tracks

; FUNCTION: Initialize mem disk
mem_disk_init:
	ld a,(02735h)                   ;
	or a                            ;
	ret z                           ; Return if already initialized
	xor a
	ld (09b65h),a
	ld a,002h
	call set_bank                   ; Select bank 2
	ld bc,00800h                    ; BC = count
	ld hl,00000h                    ; HL = destination address
lf726h:
	ld a,0e5h                       ; A = value to copy
	ld (hl),a                       ; Copy A to destination buffer
	inc hl                          ; Increment HL pointer
	dec bc                          ; Decrement Count
	ld a,c
	or b
	jp nz,lf726h                    ; While BC != 0
	ld a,000h
	call set_bank                   ; Select bank 0
	ret

mem_disk_functions:
	defw mem_disk_home              ; home function
	defw mem_disk_write             ; write function
	defw mem_disk_read              ; read function
	defw mem_disk_select            ; select function
	defw mem_disk_init              ; init/assign function
	defw 00000h                     ; Unit 0

mem_disk_dph:
	defw 00000h
	defw 00000h
	defw 00000h
	defw 00000h
	defw mem_sector_buffer
	defw mem_disk_dpb
	defw 00000h
	defw mem_disk_alloc_vec

mem_disk_dpb:
	defw 00040h                     ; sectors per track 64
	defb 003h                       ; block shift of 3
	defb 007h                       ; block mask of 7 (1k block size)
	defb 000h                       ; extent mask of 0
	defw 00067h                     ; DSM of 103
	defw 0001fh                     ; DRM of 31
	defb 080h                       ; AL0 = 0x80
	defb 000h                       ; AL1 = 0x00
	defw 00000h                     ; checksum vector size of 0
	defw 00000h                     ; 0 reserved tracks

mem_disk_alloc_vec:
	ds 36

bdos_hook1:
	ld a,(0e50eh)
	or a
	push af
	xor a
	ld (0e50eh),a
	pop af
	jp z,0e4e0h
	jp 0e501h

bdos_hook2:
	ld a,(0e50eh)
	or a
	jr z,lf79eh
	ld a,001h
	ret
lf79eh:
	call 0125bh
	and 001h
	ret

; Hooks BDOS Function 13 (RESET ALL DISKS)
bdos_func13_hook:
	ld a,00dh
	cp c
	jr nz,lf7c6h                    ; If not function 13 continue normal operation
	ld (bdos_func13_saved_sp),sp    ; save current SP
	ld sp,bdos_func13_stack         ; Set up temporary stack
	push bc
	push de
	ld c,051h
	ld e,000h
	call qxfunc                     ; Call XBIOS function 0x51 with E = 0
	ld c,051h
	ld e,001h
	call qxfunc                     ; Call XBIOS function 0x51 with E = 1
	pop de
	pop bc
	ld sp,(bdos_func13_saved_sp)    ; Restore original stack
lf7c6h:
	jp 00000h                       ; This jump address gets patched when hook is install at boot

bdos_func13_saved_sp:
	ds 10

bdos_func13_stack:
	ds 9

memcopy_buffer:
	ds 36

	defb 038h
	defb 019h
	defb 022h
	defb 0aah
	defb 038h
	defb 0edh
	defb 05bh
	defb 0c9h
	defb 038h
	defb 0edh
	defb 053h
	defb 0aeh
	defb 038h
	defb 0edh
	defb 052h
	defb 022h
	defb 0cfh
	defb 038h
	defb 03ah
	defb 0adh
	defb 038h
	defb 03dh
	defb 0cch
	defb 010h
	defb 02dh
	defb 028h
	defb 00ah
	defb 032h
	defb 0adh
	defb 038h
	defb 03ah
	defb 0b1h
	defb 038h
	defb 03ch
	defb 032h
	defb 0b1h
	defb 038h
	defb 0dbh
	defb 038h
	defb 0e6h
	defb 020h
	defb 028h
	defb 0fah
	defb 021h
	defb 0a8h
	defb 038h
	defb 0c3h
	defb 0dah
