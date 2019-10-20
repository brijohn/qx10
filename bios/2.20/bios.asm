; z80dasm 1.1.5
; command line: z80dasm -g 0xf000 -l -S ./symbols.lst -b ./bios.blk ./bios.sys

	org	0f000h

bios2_vector:    equ 0x1662
interrupt_vector:equ 0x1698
print_string:    equ 0x3366
floppy_select:   equ 0xb3dd
floppy_home:     equ 0xb430
floppy_read:     equ 0xb442
floppy_write:    equ 0xb45c
hdd_init:        equ 0xba93
hdd_select:      equ 0xbaaf
hdd_home:        equ 0xbb10
hdd_read:        equ 0xbb21
hdd_write:       equ 0xbb33
mem_disk_select: equ 0xbfa1
mem_disk_home:   equ 0xbfa2
mem_disk_read:   equ 0xbfaa
mem_disk_write:  equ 0xbfb0

bios_vector:
	jp boot
lf003h:
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
	jp qxfunc

empty_bios:
	ret
	nop
	nop

interrupt_vec_master:
	call interrupt_handler
	defb 000h
	call interrupt_handler
	defb 003h
	call interrupt_handler
	defb 006h
	call interrupt_handler
	defb 009h
	call interrupt_handler
	defb 00ch
	call interrupt_handler
	defb 00fh
	call interrupt_handler
	defb 012h
	call interrupt_handler
	defb 015h
interrupt_vec_slave:
	call interrupt_handler
	defb 018h
	call interrupt_handler
	defb 01bh
	call interrupt_handler
	defb 01eh
	call interrupt_handler
	defb 021h
	call interrupt_handler
	defb 024h
	call interrupt_handler
	defb 027h
	call interrupt_handler
	defb 02ah
	call interrupt_handler
	defb 02dh

;
; BIOS: Cold Boot Entry
;
;
boot:
	exx
	ld de,00000h
	jp bios2 

;
; BIOS: Warm Boot Entry
;
;
wboot:
	exx
	ld de,00003h
	jp bios2

;
; BIOS: Console Status
;   Returns
;     A = 0  - No character ready
;     A = FF - Character is available
;          
const:
	ld a,(00003h)
	and 002h
	jp nz,lf0c7h
lf0b6h:
	ei
	nop
	ld a,(lf3d3h)
	bit 0,a
	call nz,sub_f1d8h
	bit 1,a
	jr nz,lf0b6h
	jp lf577h
lf0c7h:
	exx
	ld de,00006h
	jp bios2

conin:
	exx
	ld de,00009h
	jp bios2

;
; BIOS: Console Output
;   Parameters
;      C = Character to output
;
conout:
	di
	ex af,af'
	ld a,(00003h)
	and 002h
	jr nz,lf111h
	ld a,0ffh
	ld (lf4efh),a
	ld (stack_c7),sp
	ld sp,stack_c7
	ld a,(current_bank)
	ld (lf3d2h),a
	xor a
	call selbank
	ld a,014h
	ld (02fech),a
	ex af,af'
	push af
lf0fbh:
	ei
	nop
	ld a,(lf3d3h)
	bit 0,a
	call nz,sub_f1d8h
	bit 1,a
	jr nz,lf0fbh
	pop af
	ld hl,bios2_return
	push hl
	jp 01c44h
lf111h:
	ex af,af'
	exx
	ld de,0000ch
	jp bios2

;
; BIOS: List Output
;   Parameters
;     C = Character to send to printer
;
list:
	exx
	ld de,0000fh
	jp bios2

;
; BIOS: Punch Output
;   Parameters
;      C = Character to output
;
punch:
	exx
	ld de,00012h
	jp bios2

;
; BIOS: Reader Input
;   Returns
;      A = Character
;
reader:
	exx
	ld de,00015h
	jp bios2

;
; BIOS: Home Selected Disk
;
;
home:
	exx
	ld de,00018h
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
	ld de,0001bh
	jp bios2

;
; BIOS: Set Track Number
;   Parameters
;      BC = track number
;
settrk:
	exx
	ld de,0001eh
	jp bios2

;
; BIOS: Set Sector Number
;   Parameters
;      BC = sector number
;
setsec:
	exx
	ld de,00021h
	jp bios2

;
; BIOS: Set DMA Address
;   Parameters
;      BC = DMA address
;
setdma:
	exx
	ld de,00024h
	jp bios2

;
; BIOS: Read Sector
;   Returns
;      A = 0 - Success
;      A = 1 - Failure
;
read:
	exx
	ld de,00027h
	jp bios2

;
; BIOS: Write Sector
;   Returns
;      A = 0 - Success
;      A = 1 - Failure
;
write:
	exx
	ld de,0002ah
	jp bios2

;
; BIOS: List Status
;   Returns
;      A = 0  - Not Ready
;      A = FF - Ready
;
listst:
	exx
	ld de,0002dh
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
	ld de,00030h
	jp bios2

;
; BIOS: QX-10 XBIOS entry point
;   Parameters
;      C = XBIOS function number
;
qxfunc:
	di
	ex af,af'
	ld a,c
	cp 031h
	jp c,lf189h
	cp 033h
	jp nc,lf189h
	ld a,(current_bank)
	ld (lf3d2h),a
	xor a
	call selbank
	ex af,af'
	ei
	jp 01e31h
lf189h:
	ex af,af'
	exx
	ld de,00033h
	jp bios2

; FUNCTION: Banked BIOS entry point
;   Parameters
;      DE = Banked BIOS vector offset
;
bios2:
	di
	ex af,af'
	ld a,0ffh
	ld (lf4efh),a
	ld (stack_c7),sp
	ld sp,stack_c7                  ; Setup stack for use with banked BIOS
	ld hl,bios2_return
	push hl                         ; push return Banked BIOS return address onto new stack
	ld hl,bios2_vector              ; HL = base address of banked BIOS JMP vector
	add hl,de                       ; Add vector offset to base
	push hl                         ; Push address of banked bios routine onto stack
	ld a,(current_bank)
	ld (lf3d2h),a                   ; Store current bank for later
	xor a
	call selbank                    ; Select System memory bank (0)
	exx
	ex af,af'
	push af
lf1b5h:
	ei
	nop
	ld a,(lf3d3h)
	bit 0,a
	call nz,09d02h
	bit 1,a
	jr nz,lf1b5h
	pop af
	ret                             ; Use return to jump to banked bios routine

; Return location from banked BIOS call
bios2_return:
	di
	ex af,af'
	ld a,(lf3d2h)
	call selbank                    ; Switch back to previous memory bank
	xor a
	ld (lf4efh),a
	ld sp,(stack_c7)                ; Restore Stack Pointer
	ex af,af'
	ei
	ret

sub_f1d8h:
	di
	ld a,0ffh
	ld (lf4efh),a
	ld (stack_c7),sp
	ld sp,stack_c7
	push hl
	push de
	push bc
	ld a,(current_bank)
	ld (lf3d2h),a
	xor a
	call selbank
	ei
	nop
	call 09d02h
	di
	ld a,(lf3d2h)
	call selbank
	pop bc
	pop de
	pop hl
	xor a
	ld (lf4efh),a
	ld sp,(stack_c7)
	ei
	nop
	ret

; FUNCTION: Interrupt entry point
;
interrupt_handler:
	di
	ld (lf467h),hl                  ; Store original HL register value
	pop hl                          ; HL = return address
	ld (lf46fh),hl                  ; Store return address
	ld hl,(lf467h)                  ; Restore original HL register value
	ld (stack_ed),sp
	ld sp,stack_ed                  ; Setup stack to use with interrupt routine
	push af
	push bc
	push de
	push hl                         ; Save registers on stack
	ld a,(current_bank)             ; A = current memory bank
	ld (lf471h),a                   ; save current memory bank
	xor a
	call selbank                    ; Switch to System bank (0)
	ld de,interrupt_return          ;
	push de                         ; push new return address on stack
	ld hl,(lf46fh)                  ; HL = return address (vector offset)
	ld a,(hl)                       ; Read interrupt vector offset
	ld hl,interrupt_vector          ; HL = interrupt vector base
	ld e,a                          ;
	ld d,000h                       ; DE = interrupt vector offset
	add hl,de                       ; Add base + offset
	jp (hl)                         ; Jump to interrupt

; Return location from unified interrupt handler
interrupt_return:
	ld a,(lf471h)
	call selbank                    ; Switch back to previous memory bank
	pop hl
	pop de
	pop bc
	pop af                          ; Restore registers from stack
	ld sp,(stack_ed)                ; Restore original stack
	ei
	nop
	nop
	ret


; FUNCTION: Select Memory bank
;   Parameters
;     A = memory bank to switch in
selbank:
	and 003h              ;
	ld (current_bank),a   ; Store new bank as the current bank

	cp 000h               ;
	jr nz,lf25bh          ; If A == 0, Load 0x10 into A
	ld a,010h             ;
	jr lf26dh             ;

lf25bh:
	cp 001h               ;
	jr nz,lf263h          ; If A == 1, Load 0x20 into A
	ld a,020h             ;
	jr lf26dh             ;

lf263h:
	cp 002h               ;
	jr nz,lf26bh          ; If A == 2, Load 0x40 into A
	ld a,040h             ;
	jr lf26dh             ;

lf26bh:
	ld a,080h             ; Else Load 0x80 into A

lf26dh:
	or 002h               ;
	out (018h),a          ; Write A to Bank switch IO register
	ret                   ;


; FUNCTION: Read iobyte value
;   Returns
;     A = current value of the iobyte
;
read_iobyte:
	push bc
	ld a,(lf3d2h)         ; 
	call selbank          ; Select Main memory bank
	ld a,(00003h)         ; Load iobyte into A 
	ld b,a                ; B = iobyte
	ld a,000h             ;
	call selbank          ; Switch back to System bank (0)
	ld a,b                ; A = iobyte
	pop bc
	ret

; FUNCTION: Update iobyte value
;   Parameters
;     A = new iobyte value
;
write_iobyte:
	push bc
	ld b,a                ; B = iobyte
	ld a,(lf3d2h)         ;
	call selbank          ; Select Main memory bank
	ld a,b                ;
	ld (00003h),a         ; Update iobyte
	ld a,000h             ;
	call selbank          ; Switch back to System bank (0)
	pop bc
	ret

; FUNCTION: Read dskbyte value
;   Returns
;     A = current value of the dskbyte
;
read_dskbyte:
	push bc
	ld a,(lf3d2h)
	call selbank                    ; Select Main memory bank
	ld a,(00004h)                   ; Load dskbyte into A
	ld b,a                          ; B = dskbyte
	ld a,000h
	call selbank                    ; Switch back to System bank (0)
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
	ld a,(lf3d2h)
	call selbank                    ; Select Main memory bank
	ld a,b
	ld (00004h),a                   ; Update dskbyte
	ld a,000h
	call selbank                    ; Switch back to System bank (0)
	pop bc
	ret

; FUNCTION: Print register values
;
print_registers:
	ld (lf3d5h),hl                  ; Save current HL register
	pop hl                          ; Pop return value (PC) into HL
	ld (lf3d7h),hl                  ; Store PC value
	push hl                         ; Push return value back on stack
	ld hl,(lf3d5h)                  ; Restore HL register
	push hl                         ;
	push de                         ;
	push bc                         ;
	push af                         ; Save all registers on stack
	push hl                         ; Push HL on stack
	push de                         ; Push DE on stack
	push bc                         ; Push BC on stack
	push af                         ; Push AF on stack
	pop bc                          ; Pop AF into BC
	ld hl,af_value_str
	call word_to_ascii              ; Convert AF to ascii and store at HL
	pop bc                          ; Pop BC into BC
	ld hl,bc_value_str
	call word_to_ascii              ; Convert BC to ascii and store at HL
	pop bc                          ; Pop DE into BC
	ld hl,de_value_str
	call word_to_ascii              ; Convert DE to ascii and store at HL
	pop bc                          ; Pop HL into BC
	ld hl,hl_value_str
	call word_to_ascii              ; Convert HL to ascii and store at HL
	ld bc,(lf3d7h)                  ; Load BC with return value (PC)
	ld hl,pc_value_str
	call word_to_ascii              ; Convert PC to ascii and store at HL
	ld a,(current_bank)
	ld (lf475h),a                   ; Save current memory bank
	xor a
	call selbank                    ; Switch to System memory bank
	ld hl,register_string           ; Load HL with ptr to register display string
	call print_string               ; Call print string function
	ld a,(lf475h)
	call selbank                    ; Select previous memory bank
	pop af
	pop bc
	pop de
	pop hl                          ; Restore all registers from stack
	ret


; FUNCTION: Converts a 16bit int to hex string
;   Parameters
;     BC = 16 bit value to convert
;     HL = Destination address to store result
;
word_to_ascii:
	ld a,b
	call byte_to_ascii              ; Convert high byte;
	ld a,c
	call byte_to_ascii              ; Convert low byte
	ret

; FUNCTION: Converts a 8bit int to hex string
;   Parameters
;     A  = 8 bit value to convert
;     HL = Destination address to store result
;
byte_to_ascii:
	ld b,a                          ; Save A in the B register
	rra                             ;
	rra                             ; We handle the high nibble first, so rotate
	rra                             ; value 4 bits to the right
	rra                             ;
lf320h:
	and 00fh                        ; Mask of low nibble for converting to ascii character
	cp 00ah                         ;
	jp c,lf32bh                     ; If A < 10 Add 0x30 Else add 0x37
	add a,037h                      ; Converts nibble to a value between A-F ascii
	jr lf32dh                       ;
lf32bh:
	add a,030h                      ; Converts nibble to value between 0-9 ascii
lf32dh:
	ld (hl),a                       ; Store current nibble at HL 
	ld a,(byte_to_ascii_done)       ; 
	or a                            ;
	jr nz,lf33dh                    ; Exit loop if done flag is non zero
	ld a,0ffh                       ;
	ld (byte_to_ascii_done),a       ; Store FF to indicate we are finished 
	ld a,b                          ; Restore A from B to handle low nibble on next pass 
	inc hl                          ; Increment pointer to destionation buffer
	jr lf320h                       ; loop to handle low nibble
lf33dh:
	inc hl                          ; Increment pointer to destionation buffer
	ld a,000h                       ;
	ld (byte_to_ascii_done),a       ; Reset done flag to 0
	ret

sub_f344h:
	ld (lf472h),bc
	ld a,0ffh
	ld (lf474h),a
	ret

sub_f34eh:
	ld a,b
	or c
	ret z                           ; return if BC == 0
	ld a,(lf474h)
	or a
	jp z,lf3cfh
	xor a
	ld (lf474h),a
	ld a,(current_bank)
	ld (lf3dbh),a
	ld (lf465h),bc
	ld (lf461h),hl
	ld (lf463h),de
lf36dh:
	ld hl,(lf465h)
	ld de,00080h
	or a
	sbc hl,de
	jr c,lf388h
	ld a,l
	or h
	jr z,lf388h
	ld (lf465h),hl
	ld bc,00080h
	ld (lf3d9h),bc
	jr lf391h
lf388h:
	add hl,de
	ld (lf3d9h),hl
	ld a,0ffh
	ld (lf3dch),a
lf391h:
	ld a,(lf472h)
	call selbank
	ld bc,(lf3d9h)
	ld hl,(lf461h)
	ld de,lf3ddh
	ldir
	ld (lf461h),hl
	ld a,(lf473h)
	call selbank
	ld de,(lf463h)
	ld bc,(lf3d9h)
	ld hl,lf3ddh
	ldir
	ld (lf463h),de
	ld a,(lf3dch)
	or a
	jp z,lf36dh
	xor a
	ld (lf3dch),a
	ld a,(lf3dbh)
	call selbank
	ret
lf3cfh:
	ldir
	ret

lf3d2h:
	defb 001h
lf3d3h:
	defb 000h
	defb 000h
lf3d5h:
	defb 000h
	defb 000h
lf3d7h:
	defb 000h
	defb 000h
lf3d9h:
	defb 000h
	defb 000h
lf3dbh:
	defb 000h
lf3dch:
	defb 000h
lf3ddh:
	defs 080h
current_bank:
	defb 000h
	defb 000h
	defb 000h
	defb 000h
lf461h:
	defb 000h
	defb 000h
lf463h:
	defb 000h
	defb 000h
lf465h:
	defb 000h
	defb 000h
lf467h:
	defb 000h
	defb 000h
	defb 000h
	defb 000h
	defb 000h
	defb 000h
	defb 000h
	defb 000h
lf46fh:
	defb 000h
	defb 000h
lf471h:
	defb 000h
lf472h:
	defb 000h
lf473h:
	defb 000h
lf474h:
	defb 000h
lf475h:
	defb 000h
byte_to_ascii_done:
	defb 000h

register_string:
    defb "\r\n AF="
af_value_str:
	defb "     BC="
bc_value_str:
	defb "     DE="
de_value_str:
	defb "     HL="
hl_value_str:
	defb "     PC="
pc_value_str:
	defb "     ", 000h

	defs 024h                       ;
stack_c7:                           ; Stack used when making banked bios calls
	defw 00000h                     ;

	defs 024h                       ;
stack_ed:                           ; Stack used during interrupt handling
	defw 00000h                     ;

lf4efh:
	defb 000h

launch_ccp:
	ld a,001h
	call selbank                    ; Switch to main bank
	ld a,0c3h
	ld (00000h),a                   ;
	ld (00005h),a                   ; Set JMP instruction for BIOS and BDOS
	ld hl,lf003h                    ;
	ld (00001h),hl                  ; Set BIOS entry point
	ld hl,0e206h                    ;
	ld (00006h),hl                  ; Set BDOS entry point
	ld a,(00004h)                   ;
	ld c,a                          ; C = dskbyte (active drive)
	jp 0da00h                       ; Jump to CCP

sub_f510h:
	ld a,(0e50eh)
	or a
	push af
	xor a
	ld (0e50eh),a
	pop af
	jp z,0e4e0h
	jp 0e501h

sub_f520h:
	ld a,(0e50eh)
	or a
	jr z,lf529h
	ld a,001h
	ret
lf529h:
	call 019c8h
	and 001h
	ret

sub_f52fh:
	pop de
	pop bc
	ld a,(lf573h)
	or a
	jp nz,lf540h
	pop hl
	ld (lf574h),hl
	ld hl,lf54dh
	push hl
lf540h:
	xor a
	ld (lf573h),a
	push de
	ld a,b
	ld (lf3d2h),a
	call selbank
	ret

lf54dh:
	ld hl,(lf574h)
	push hl
	ld a,(lf576h)
	ld b,a
	ld a,(lf3d2h)
	ld c,a
	call sub_f344h
	ld de,00000h
	ld hl,00000h
	ld bc,00008h
	call sub_f34eh
	ld a,(lf576h)
	ld (lf3d2h),a
	call selbank
	xor a
	ret

lf573h:
	defb 000h
lf574h:
	defb 000h
	defb 000h
lf576h:
	defb 000h

lf577h:
	ld a,(lf582h)
	or a
	jr z,lf57fh
	ld a,0ffh
lf57fh:
	ret
	ret
	ret

lf582h:
	defb 000h

; Drive mapping table
;   Allows mapping drive letters to a DPH structure
drive_mapping:
	defw 00000h                     ; A drive
	defw 00000h                     ; B drive
	defw 00000h                     ; C drive
	defw 00000h                     ; D drive
	defw 00000h                     ; E drive
	defw 00000h                     ; F drive
	defw 00000h                     ; G drive
	defw 00000h                     ; H drive
	defw 00000h                     ; I drive
	defw 00000h                     ; J drive
	defw 00000h                     ; K drive
	defw 00000h                     ; L drive
	defw 00000h                     ; M drive
	defw 00000h                     ; N drive
	defw 00000h                     ; O drive
	defw 00000h                     ; P drive

lfloppy_functions:
	defw floppy_home                ; home function
	defw floppy_write               ; write function
	defw floppy_read                ; read function
	defw floppy_select              ; select function
	defw 00000h                     ; init/assign function
	defw 00000h                     ; Unit 0

lfloppy_dph:
	defw 00000h
	defw 00000h
	defw 00000h
	defw 00000h
	defw floppy_sector_buffer
	defw lfloppy_dpb
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
	defw rfloppy_dpb
	defw rfloppy_chksum_vec
	defw rfloppy_alloc_vec

lfloppy_dpb:
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

rfloppy_dpb:
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

	defb 010h
	defb 050h
	defb 002h
	defb 003h
	defb 00ah
	defb 00fh
	defb 002h
	defb 0ffh
	defb 001h
	defb 004h
	defb 000h
	defb 028h

floppy_sector_buffer:
	defs 080h

lfloppy_chksum_vec:
	defs 020h

rfloppy_chksum_vec:
	defs 020h

lfloppy_alloc_vec:
	defs 018h

rfloppy_alloc_vec:
	defs 018h

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
	defw 0f8f1h                     ; This should be NULL, checksum vec not used for fixed disks
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
	defw 0fa22h                     ; This should be NULL, checksum vec not used for fixed disks
	defw hdd2_alloc_vec

	defb 0ffh
	defb 0ffh
	defb 088h
	defb 0bah

hdd_dpb:
	defw 00040h                     ; sectors per track 64
	defb 004h                       ; block shift f 4
	defb 00fh                       ; block mask of 16 (2k block size)
	defb 000h                       ; extent mask of 0
	defw 00987h                     ; DSM of 2439
	defw 003ffh                     ; DRM of 1023
	defb 0ffh                       ; AL0 = 0xff
	defb 0ffh                       ; AL1 = 0xff
	defw 00000h                     ; checksum vector size of 0
	defw 00002h                     ; 2 reserved tracks

hdd_sector_buffer:
	defs 080h

hdd1_alloc_vec:
	defs 0131h

hdd2_alloc_vec:
	defs 0131h

; FUNCTION: Initialize mem disk
mem_disk_init:
	ld a,(02c73h)                   ;
	or a                            ;
	ret z                           ; Return if already initialized

	xor a
	ld (0c050h),a
	ld a,002h
	call selbank                    ; Select user bank 1 (2)
	ld bc,00400h                    ; BC = count
	ld hl,00000h                    ; HL = destination address
lfa36h:
	ld a,0e5h                       ; A = value to copy
	ld (hl),a                       ; Copy A to destination buffer
	inc hl                          ; Increment HL pointer
	dec bc                          ; Decrement Count
	ld a,c
	or b
	jp nz,lfa36h                    ; While BC != 0
	ld a,000h
	call selbank                    ; Select System Bank (0)
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
	defw 00080h                     ; sectors per track 128 
	defb 003h                       ; block shift of 3
	defb 007h                       ; block mask of 7 (1k block size)
	defb 000h                       ; extent mask of 0
	defw 0006fh                     ; DSM of 111
	defw 0001fh                     ; DRM of 31
	defb 080h                       ; AL0 = 0x80
	defb 000h                       ; AL1 = 0x00
	defw 00000h                     ; checksum vector size of 0
	defw 00000h                     ; 0 reserved tracks

mem_disk_alloc_vec:
	defs 010h

mem_sector_buffer:
	defs 080h

cseg_end:
	defb "THIS IS THE END OF CSEG"
	defs 075h
