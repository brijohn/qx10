; SCI0 YM2149 three-voice sound driver for the Epson QX-16
; derived from the nosnd.asm framework driver (see below);
; assembles with NASM (see http://sourceforge.net/projects/nasm/):
;    nasm ym2149.asm -o QX16YM.drv -f bin
;
; Copyright (c) 2026 by
;    Brian Johnson

; Copyright (c) 2000, 2002, 2003 by
;    Ravi Iyengar [ravi.i@softhome.net]
;    Andy Hefner
;
; This library is free software; you can redistribute it and/or
; modify it under the terms of the GNU Lesser General Public
; License as published by the Free Software Foundation; either
; version 2.1 of the License, or (at your option) any later version.
;
; This library is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
; Lesser General Public License for more details.
;
; You should have received a copy of the GNU Lesser General Public
; License along with this library; if not, write to the Free Software
; Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA


[BITS 16]
[CPU 8086]

; Drivers are flatform binaries that get loaded at the start of
; a segment. When a driver function needs to be executed, the
; interpreter does a far call to offset 0. The first thing must
; be a jump to a DriverInterface function because the interpreter
; expects certain data starting at offset 3, and there isn't
; space to fit in anything else.

jmp near DriverInterface

; identifiers for a Sierra sound driver
db 0                   ; uncertain
dd 0x87654321          ; Sierra driver id
db 1                   ; sound driver id (0=display, 4=keyboard)

; a string identifying the driver
db 9, 'qx16ymdrv'

; a string with a description of the device
db 31, 'QX-16 YM2149 3-Voice Sound Card'



;--------------------------------------------------------------------------
; misc macros and defines

; device information returned by GetDeviceInfo
%define  INFO_PATCH  0xFFFF  ; patch resource number (0xFFFF means none)
%define  INFO_POLY   3       ; maximum polyphony

; the play flag for this device (used in the sound header)
%define  PLAY_FLAG   0x10

; playstate constants
%define  STOPPED     0
%define  PLAYING     1
%define  SEEKING     2

; offsets in the sound info structure
%define  SND_RESPTR  8       ; heap pointer to far pointer to resource data
%define  SND_UNK     10      ; zeroed to fix a CB fadeout bug
%define  SND_POS     12      ; current play offset in sound resource
%define  SND_STATE   16      ; 1 = valid, 3 = invalid   (possibly others)
%define  SND_SIGNAL  22      ; the Sound object's signal property
%define  SND_VOLUME  24      ; global sound volume

; YM2149 defines
%define YM_CLOCK_HZ       1996800       ; exactly half the 3.9936 MHz system clock
%define YM_ADDR_PORT      0xC0          ; register select
%define YM_DATA_PORT      0xC1          ; register data


;--------------------------------------------------------------------------
; data area
; Sierra's drivers put all their data space in the beginning, though
;    there's no reason why it has to be that way.

ptrparam:      dw 0          ; saves the original si parameter to DriverInterface
playstate:     db 0          ; 0 = not playing sound, 1 = playing sound, 2 = seeking sound
fadeticks:     db 0          ; number of ticks to next volume decrement, 0 = not fading
fadevolume:    db 0          ; the volume setting during fades
playflags:     dw 0          ; specifies whether or not each channel is used by this device
waitcount:     dw 0          ; number of ticks left before next event
sndresptr:     dw 0          ; pointer to sound resource
looppoint:     dw 0          ; sound loop position
cumcue:        dw 0          ; the cumulative cue
status:        db 0          ; saves the last status for running status mode, holds the current status
pssndreset:    db 0          ; boolean describing whether PauseSound should reset the sound
seekto:        dw 0          ; the end point for SeekSound
seekcue:       dw 0          ; the desired sound cue at the end of SeekSound

; YM2149 data
mastervol63:       db 60             ; framework scale, 0..60
mixer_shadow:      db 0x3F           ; OR in configured R7 upper bits at init
next_voice:        db 0

chan_to_voice:     times 16 db 0xFF  ; SCI channel -> YM voice, FF=unmapped
chan_volume:       times 16 db 96    ; MIDI CC7 value; PCjr-compatible default
chan_bend_q:       times 16 db 0     ; signed quarter-semitone bend

voice_channel:     times 3 db 0xFF   ; YM voice -> SCI channel
voice_note:        times 3 db 0xFF   ; active MIDI note, FF=off
voice_velocity:    times 3 db 0
voice_level:       times 3 db 0      ; last level written, useful for suppression

voice_env_state:   times 3 db 0      ; 0 off, 1 attack, 2 sustain, 3 release
voice_env_index:   times 3 db 0
voice_env_count:   times 3 db 0
voice_env_attn:    times 3 db 0

%include "ym2149_tables.inc"

;--------------------------------------------------------------------------
; export area
; the interpreter interacts with the driver through these functions


; Export Lookup Table
; used by DriverInterface to call exported functions by number
; Exports must be even numbers because offsets are 2 bytes each.
;    Later interpreters used odd numbers for export functions as
;    well and multiplied by 2 to get the offset in this table.

ExportTable:
   Export0:    dw GetDeviceInfo
   Export2:    dw InitDevice
   Export4:    dw ShutdownDevice
   Export6:    dw LoadSound
   Export8:    dw DoSoundEvents
   Export10:   dw SetVolume
   Export12:   dw FadeOut
   Export14:   dw StopSound
   Export16:   dw PauseSound
   Export18:   dw SeekSound


; DriverInterface
; Saves registers and calls export
; Entry: bp = export number
;        ds = heap segment
;        si = heap pointer where applicable
; Exit: ax, cx = return values where applicable
;       data at ds:si modified where applicable

DriverInterface:
   pushf
   push dx
   push bx
   push bp
   push si
   push di
   push es
   push ds
   mov [cs:ptrparam], si
   call near word [cs:ExportTable+bp]
   pop ds
   pop es
   pop di
   pop si
   pop bp
   pop bx
   pop dx
   popf
   retf


; GetDeviceInfo
; Called at startup to determine max poly and which patch
;    resource to load.
; Entry: nothing
; Exit: ax = patch number (0xFFFF if no patch)
;       cx = maximum polyphony

GetDeviceInfo:
   mov ax, INFO_PATCH
   mov cx, INFO_POLY
   retn


; InitDevice
; Called to load the patch if applicable and initialize the device
; Entry: ds:si points to patch resource structure
; Exit: cs:ax points to the area of the driver segment which can be overwritten
;       cx = 0

; The interpreter wants to be able to use portions of the sound driver's
; memory that won't be used by the driver. InitDevice returns a pointer
; through ax that tells the interpreter where it can begin overwriting things
; as necessary. Polite drivers should put InitDevice and GetDeviceInfo at the
; end, and allow the interpreter to overwrite these functions since they'll
; only be used once anyway. If you choose to do this, unlist destroyed
; exports from the export lookup table. I don't think that doing so is
; strictly necessary, but Sierra's drivers do it.

InitDevice:
   ; no patch resource is requested (INFO_PATCH = 0xFFFF), so the patch
   ; pointer at [si+8] is not dereferenced

   mov ax, temp_area
   call YM_Init
   jz .device_found
   mov ax, 0xFFFF
   .device_found:
   xor cx, cx
   retn


; ShutdownDevice
; Called to close the device when the interpreter exits. There
;    is no guarantee that StopSound will have been called on a
;    currently playing sound.
; Entry: ds:si points to sound resource structure
; Exit: nothing

ShutdownDevice:
   call YM_SilenceAll
   retn


; LoadSound
; Called before a sound starts playing so the driver has a chance
;    to load the header and perform initialization work.
; Entry: ds:si points to sound resource structure
; Exit: ax = 3 on unrecognized header byte, 1 on success

LoadSound:
   call YM_SilenceAll
   call YM_ResetState
   mov word [cs:playflags], 0x8000 ; channel 15 (the control channel) should always be enabled

   mov bx, [si+SND_RESPTR]
   mov es, [bx+2]
   mov di, [bx]              ; es:di points to sound data

   xor dx, dx                ; dx will be added to di to compensate for missing channel 15 info
   mov cx, 16
   mov al, byte [es:di]      ; check for the presence of a PCM sample
   inc di
   cmp al, 0
   je load_header
   cmp al, 2
   je fifteen_chan

   mov ax, 3                 ; unplayable / invalid resource
   mov word [si+SND_STATE], ax
   retn

   fifteen_chan:
   dec cx                     ; if there is a PCM sample, the header only has info for 15 channels
   mov dx, 2                  ; compensates for missing channel 15 info

   load_header:
   xor dh, dh
   mov bx, 1

   load_header_loop:
   mov al, byte [es:di]      ; al = initial number of voices on this channel
   inc di
   mov ah, byte [es:di]      ; ah = play flag for this channel
   inc di
   test ah, PLAY_FLAG        ; check for playflag
   jz continue_load
   or word [cs:playflags], bx ; enable channel

   cmp dh, 15
   je continue_load
   mov al, [cs:next_voice]
   cmp al, 3
   jae continue_load
   push bx
   xor bh, bh
   mov bl, dh
   mov [cs:chan_to_voice+bx], al
   mov bl, al
   mov [cs:voice_channel+bx], dh
   inc byte [cs:next_voice]
   pop bx

   continue_load:
   inc dh
   shl bx, 1
   loop load_header_loop
   xor dh, dh
   add di, dx                 ; dx = 2 if there was only init data for 15 channels

   call getwaitcount

   mov ax, 1
   mov word [si+SND_STATE], ax  ; success loading sound
   mov word [si+SND_POS], di    ; set the position to the start of sound data
   mov word [si+SND_SIGNAL], 0  ; set the signal to 0
   mov word [cs:cumcue], 127    ; initialize the cumulative cue
   mov word [cs:looppoint], 33  ; initialize the loop point to the top
   mov byte [cs:pssndreset], 0  ; PauseSound does not reset by default
   mov byte [cs:fadeticks], 0   ; there is no fade in progress
   mov byte [cs:playstate], PLAYING ; we're playing this sound now

   mov cx, word [si+SND_VOLUME]
   shl cx, 1                 ; we use a range of 0-63 for internal global volume
   shl cx, 1                 ; (two 1-bit shifts: 8086 has no shift-by-immediate)
   mov [cs:mastervol63], cl

   retn


; DoSoundEvents
; Called each MIDI tick (60 times per second) to actually play the
;    sound resource
; Entry: ds:si points to sound resource structure
; Exit: nothing

StatusCallTable:             ; call table for handling status messages
   dw StopNote
   dw PlayNote
   dw KeyPressure
   dw ControlChange
   dw PatchChange
   dw ChanPressure
   dw PitchWheel

ParamCount: db 2, 2, 2, 2, 1, 1, 2 ; number of parameters used by each status

DoSoundEvents:
   mov bx, [si+SND_RESPTR]
   mov es, [bx+2]
   mov di, [bx]              ; es:di points to sound resource
   mov word [cs:sndresptr], di
   add di, word [si+SND_POS] ; get the current sound resource position

   call fader
   cmp byte [cs:playstate], STOPPED
   jne ds_running
   retn                      ; the sound isn't playing anymore, so quit
   ds_running:
   cmp byte [cs:playstate], PLAYING
   jne do_frame
   call YM_TickEnvelopes
   do_frame:                 ; the loop to do all events in this frame (all events with delta time = 0)

   cmp word [cs:waitcount], 0 ; check if there's a new event
   je next_event
   dec word [cs:waitcount]
   jmp end_frame

   next_event:
   xor cx, cx
   mov cl, byte [es:di]
   inc di
   test cl, 0x80             ; check for running status mode
   jnz check_status
   mov cl, byte [cs:status]  ; repeat the last status
   dec di                    ; rewind di for re-reading the last byte as a parameter

   check_status:
   mov dl, cl                ; dl = full status byte (status and channel)
   mov byte [cs:status], cl
   mov al, cl
   shr al, 1                 ; al = status (four 1-bit shifts: 8086 has no
   shr al, 1                 ;  shift-by-immediate; cl holds the status byte)
   shr al, 1
   shr al, 1
   and cl, 0x0F              ; cl = channel

   cmp al, 0x0F
   je sys_message            ; check for a system message before we check the channel

   mov bx, 1
   shl bx, cl
   test word [cs:playflags], bx ; test to see if this channel is enabled
   jnz do_status

   mov bl, al                ; al is still the status
   sub bl, 8
   xor bh, bh
   mov bl, [cs:ParamCount+bx]
   add di, bx
   call getwaitcount
   jmp do_frame              ; this channel is to be ignored, so skip this status

   do_status:
   mov bl, al                ; al is still the status
   sub bl, 8
   xor bh, bh
   shl bx, 1
   call word [cs:StatusCallTable+bx] ; call the handler for this particular status
   call getwaitcount
   jmp do_frame

   sys_message:
   cmp dl, 0xFC              ; end of track?
   je end_of_track

   ; other system messages: consume their parameters and carry on
   cmp dl, 0xF0              ; system exclusive: skip up to and including 0xF7
   jne not_sysex
   skip_sysex:
   mov al, byte [es:di]
   inc di
   cmp al, 0xF7
   jne skip_sysex
   jmp sys_done

   not_sysex:
   cmp dl, 0xF2              ; song position: two parameters
   jne not_songpos
   inc di
   inc di
   jmp sys_done

   not_songpos:
   cmp dl, 0xF1              ; MTC quarter frame: one parameter
   je sys_one_param
   cmp dl, 0xF3              ; song select: one parameter
   jne sys_done              ; everything else has no parameters
   sys_one_param:
   inc di

   sys_done:
   call getwaitcount
   jmp do_frame

   end_of_track:
   mov word [si+SND_SIGNAL], 0xFFFF ; the sound is done - set the signal appropriately
   xor bx, bx
   mov [cs:waitcount], bx
   mov bx, word [si+SND_RESPTR]
   mov di, word [bx]
   add di, word [cs:looppoint] ; set es:di to appropriate loop point
   call getwaitcount

   end_frame:
   sub di, word [cs:sndresptr]
   mov word [si+SND_POS], di ; update the sound position
   retn


; SetVolume
; Called when the user changes the global sound volume (Ctrl-V in the game)
; Entry: ds:si points to sound resource structure
; Exit: nothing

SetVolume:
   mov cx, [si+SND_VOLUME]   ; cx = volume level (0-15)
   shl cx, 1                 ; we use a range of 0-63 for internal global volume
   shl cx, 1                 ; (two 1-bit shifts: 8086 has no shift-by-immediate)
   mov [cs:mastervol63], cl
   call YM_UpdateAllLevels
   retn


; FadeOut
; Called to slowly fade and stop the currently playing sound
; Entry: ds:si points to sound resource structure
; Exit: nothing

FadeOut:
   mov cx, [si+SND_VOLUME]   ; cx = volume level (0-15)
   shl cx, 1                 ; we use a range of 0-63 for internal global volume
   shl cx, 1                 ; (two 1-bit shifts: 8086 has no shift-by-immediate)
   test cx, cx
   jz f_stop                 ; just stop the sound now if the volume starts at 0

   mov [cs:fadevolume], cl
   mov byte [cs:fadeticks], 5
   retn

   f_stop:
   mov word [si+SND_SIGNAL], 0xFFFF ; the sound is done - set the signal appropriately
   call YM_SilenceAll
   mov byte [cs:playstate], STOPPED
   retn


; StopSound
; Stops playback by turning off sound output. Nothing needs to be done to
;   prevent further MIDI events from occurring because the interpreter will
;   simply stop calling DoSoundEvents.
; Entry: ds:si points to sound resource structure
; Exit: the sound's signal property is set to -1

StopSound:
   call YM_SilenceAll
   mov word [si+SND_SIGNAL], 0xFFFF
   mov byte [cs:playstate], STOPPED
   retn


; PauseSound
; Pauses playback by turning off sound output. Nothing needs to be done to
;   prevent further MIDI events from occurring because the interpreter will
;   simply stop calling DoSoundEvents until playback resumes. If CC4C has been
;   set, the sound position should be reset. Otherwise it should be left alone.
; Entry: ds:si points to sound resource structure
; Exit: nothing

PauseSound:
   call YM_SilenceAll

   cmp byte [cs:pssndreset], 0
   je exitpausesound

   mov ax, word [cs:looppoint] ; reset sound position to loop point
   mov word [si+SND_POS], ax

   mov bx, [si+SND_RESPTR]
   mov es, [bx+2]
   mov di, [bx]              ; es:di points to sound resource
   add di, ax                ; move forward to the loop position
   call getwaitcount         ; get a new waitcount for when the sound resumes

   exitpausesound:
   retn


; SeekSound
; Called when a sound needs to be quickly set to a certain point (e.g. on
;    restore, when one sound interrupts another, and so on)
; Entry: ds:si points to sound resource structure
; Exit: nothing

SeekSound:
   mov ax, word [si+SND_POS] ; this is where we need to seek to
   mov word [cs:seekto], ax
   mov ax, word [si+SND_SIGNAL] ; this is the what the cue should be
   mov word [cs:seekcue], ax
   call LoadSound
   mov byte [cs:playstate], SEEKING
   cmp ax, 1
   je do_seek
   retn

   do_seek:
   call DoSoundEvents
   mov bx, word [si+SND_POS]
   cmp bx, word [cs:seekto]
   jb do_seek                ; make sure we're at the right sound position
   mov bx, word [si+SND_SIGNAL]
   cmp bx, word [cs:seekcue]
   jne do_seek               ; make sure we're at the right cue position

   mov byte [cs:playstate], PLAYING
   retn



;--------------------------------------------------------------------------
; status functions

; on entry for each of these functions:
;   al = status
;   cl = channel
;   dl = full status byte (status and channel)
;   es:di points to parameters for the status
; on exit:
;   es:di points to the delta time until the next sound element


KeyPressure:
   add di, 2
   ret

PitchWheel:
   mov al, byte [es:di+1]
   and al, 0x7F
   xor bh, bh
   xor ah, ah
   shl ax, 1
   shl ax, 1
   shl ax, 1
   shl ax, 1
   shl ax, 1
   shl ax, 1
   shl ax, 1
   mov bl, byte [es:di]
   and bl, 0x7F
   add ax, bx
   add di, 2
   sub ax, 0x2000
   cwd
   mov bx, 171
   idiv bx
   mov bl, cl
   mov [cs:chan_bend_q+bx], al
   call YM_UpdateChannelPitch
   ret


StopNote:
   cmp byte [cs:playstate], PLAYING
   je stop_note

   add di, 2                 ; we're just seeking, don't play anything
   ret

   stop_note:
   mov bh, byte [es:di]      ; bh = note number
   mov bl, byte [es:di+1]    ; bl = velocity
   add di, 2

   stop_note_hw:             ; also entered from PlayNote for velocity 0
   call YM_NoteOff
   ret


PlayNote:
   cmp byte [cs:playstate], PLAYING
   je play_note

   add di, 2                 ; we're just seeking, don't play anything
   ret

   play_note:
   mov bh, byte [es:di]      ; bh = note number
   mov bl, byte [es:di+1]    ; bl = velocity
   add di, 2
   test bl, bl
   jz stop_note_hw           ; note on with velocity 0 is a note off
   call YM_NoteOn
   ret


ControlChange:
   mov bh, byte [es:di]      ; bh = control number
   mov bl, byte [es:di+1]    ; bl = control value
   add di, 2
   cmp bh, 0x60
   jne not_CC60h

   xor bh, bh
   add bx, word [cs:cumcue]
   mov word [si+SND_SIGNAL], bx ; set the new signal
   mov word [cs:cumcue], bx  ; update our cumulative cue variable
   ret

   not_CC60h:
   cmp bh, 0x4C
   jne not_CC4Ch

   mov byte [cs:pssndreset], bl ; set the PauseSound reset control value
   ret

   not_CC4Ch:                ; there are other special controls, but we don't care right now
   mov ch, bl
   mov bl, cl
   cmp bh, 0x07
   jne not_CC07h
   xor bh, bh
   mov [cs:chan_volume+bx], ch
   mov bl, [cs:chan_to_voice+bx]
   call YM_UpdateVoiceLevel
   ret
   not_CC07h:
   cmp bh, 0x78
   jne not_CC78h
   xor bh, bh
   mov bl, [cs:chan_to_voice+bx]
   cmp bl, 2
   ja not_CC7Bh
   mov byte [cs:voice_note+bx], 0xFF
   call YM_DisableVoice
   ret
   not_CC78h:
   cmp bh, 0x7B
   jne not_CC7Bh
   xor bh, bh
   mov bl, [cs:chan_to_voice+bx]
   cmp bl, 2
   ja not_CC7Bh
   mov dl, [cs:voice_env_attn+bx]
   mov [cs:voice_env_count+bx], dl   ; count = base attenuation while in state 3
   mov byte [cs:voice_env_index+bx], 0
   mov byte [cs:voice_env_state+bx], 3
   ret
   not_CC7Bh:
   ret


PatchChange:
   mov bl, byte [es:di]      ; bl = patch
   inc di
   cmp cl, 15
   jne normal_patch_change

   cmp bl, 127
   je set_loop_point

   xor bh, bh
   mov word [si+SND_SIGNAL], bx ; this is a cue - set the signal property
   ret

   set_loop_point:           ; set the sound loop point
   push di
   sub di, word [cs:sndresptr]
;   sub di, 2
   mov word [cs:looppoint], di
   pop di
   ret

   normal_patch_change:      ; this is a simple patch change
   ret


ChanPressure:
   add di, 1
   ret



;--------------------------------------------------------------------------
; misc functions


; getwaitcount
; retrieves the next delta time from the sound resource
; entry: es:di points to the current delta time value
; exit: [cs:waitcount] set, es:di points to the sound element following the delta time

getwaitcount:
   push ax
   push dx
   xor ax, ax
   xor dx, dx

   get_delta_time_loop:
   mov dl, byte [es:di]
   cmp dl, 0xF8
   jne add_dt

   mov dl, 0xF0              ; delta time extension

   add_dt:
   add ax, dx
   inc di
   cmp dl, 0xF0
   je get_delta_time_loop

   mov word [cs:waitcount], ax ; set waitcount
   pop dx
   pop ax
   ret


; fader
; checks for a fade in progress and acts accordingly
; entry: es:di points to the current position in the sound resource
; exit:

fader:
   cmp byte [cs:fadeticks], 0 ; check to see if there's a fade in progress
   je exit_fader

   dec byte [cs:fadeticks]
   cmp byte [cs:fadeticks], 0 ; check if we need to decrease the volume yet
   jne exit_fader

   dec byte [cs:fadevolume]
   cmp byte [cs:fadevolume], 0 ; just stop the sound if we're done fading
   je f_stopsnd

   mov byte [cs:fadeticks], 5
   push cx
   xor cx, cx
   mov cl, byte [cs:fadevolume]
   mov [cs:mastervol63], cl
   call YM_UpdateAllLevels
   pop cx
   jmp exit_fader

   f_stopsnd:
   mov byte [cs:playstate], STOPPED
   push si
   mov si, [cs:ptrparam]
   mov word [si+SND_SIGNAL], 0xFFFF ; the sound is done - set the signal appropriately
   mov word [si+SND_UNK], 0  ; fixes fadeout bugs in CB
   call YM_SilenceAll
   pop si

   exit_fader:
   ret

; YM2149 functions

; Entry: None
; Exit: ZF=0 on failure, ZF=1 on success
YM_Init:
    push ax
    push dx

    mov al, 2
    mov dx, YM_ADDR_PORT
    out dx, al
    mov dx, YM_DATA_PORT
    mov al, 0x5A
    out dx, al
    xor ax, ax
    in al, dx
    cmp al, 0x5A
    jne detect_failed
    call YM_SilenceAll
    mov ax, 0x3F07
    call YM_WriteReg
    call YM_ResetState

    xor ax, ax
    detect_failed:
    pop dx
    pop ax
    ret

; Entry: BL=voice
; Exit: AL=level
YM_ComputeLevel:
    push bx
    push cx
    xor bh, bh
    mov ch, [cs:voice_env_attn+bx]
    mov al, [cs:mastervol63]
    shr al, 1
    shr al, 1
    mov cl, [cs:voice_velocity+bx]
    shr cl, 1
    shr cl, 1
    shr cl, 1
    shr cl, 1
    shr cl, 1
    add al, cl
    mov bl, [cs:voice_channel+bx]
    mov cl, [cs:chan_volume+bx]
    shr cl, 1
    shr cl, 1
    shr cl, 1
    add al, cl
    sub al, 18
    jc .silent
    sub al, ch
    jnc .exit
    .silent:
    xor al, al
    .exit:
    pop cx
    pop bx
    ret

; Entry: CL=channel, DH=note
; Exit: AX=period
YM_LookupPeriod:
    push bx
    push dx
    xor bh, bh
    mov bl, cl
    mov al, [cs:chan_bend_q+bx]
    cbw
    mov dl, dh
    xor dh, dh
    shl dx, 1
    shl dx, 1
    add ax, dx
    test ax, ax
    jns .not_low
    xor ax, ax
    .not_low:
    cmp ax, 511
    jbe .in_range
    mov ax, 511
    .in_range:
    shl ax, 1
    mov bx, ax
    mov ax, [cs:ym_period_qtable+bx]
    pop dx
    pop bx
    ret

; Entry: None
; Exit: None
YM_ResetState:
    pushf
    push ax
    push cx
    push di
    push es
    push cs
    pop es
    cld

    mov di, chan_to_voice       ; 16 x FFh
    mov cx, 16
    mov al, 0xFF
    rep stosb
    mov di, chan_volume         ; 16 x 96
    mov cx, 16
    mov al, 96
    rep stosb
    mov di, chan_bend_q         ; 16 x 0
    mov cx, 16
    xor al, al
    rep stosb
    mov di, voice_channel       ; voice_channel + voice_note: 6 x FFh
    mov cx, 6
    mov al, 0xFF
    rep stosb
    mov di, voice_velocity      ; voice_velocity + voice_level: 6 x 0
    mov cx, 18
    xor al, al
    rep stosb
    mov byte [cs:next_voice], 0

    pop es
    pop di
    pop cx
    pop ax
    popf
    ret

; Entry: AL = YM register 0..13, AH = value
; Exit: None

YM_WriteReg:
    push ax
    push dx

    cmp al, 0x07
    jne write_reg
    mov byte [cs:mixer_shadow], ah
    write_reg:
    mov dx, YM_ADDR_PORT
    out dx, al

    mov dx, YM_DATA_PORT
    mov al, ah
    out dx, al

    pop dx
    pop ax
    ret

; Entry: AL = YM register 0..13
; Exit:  AL = register contents
YM_ReadReg:
    push dx

    mov dx, YM_ADDR_PORT
    out dx, al
    mov dx, YM_DATA_PORT
    in al, dx

    pop dx
    ret

; Entry: None
; Exit: None
YM_SilenceAll:
    push ax

    mov ax, 0x0008
    call YM_WriteReg
    inc ax
    call YM_WriteReg
    inc ax
    call YM_WriteReg
    mov ah, [cs:mixer_shadow]
    mov al, 0x07
    or ah, al
    call YM_WriteReg
    mov byte [cs:voice_note], 0xFF
    mov byte [cs:voice_note + 1], 0xFF
    mov byte [cs:voice_note + 2], 0xFF

    pop ax
    ret

; Entry: BL=voice 0..2, AX=period
; Exit: None
YM_SetPeriod:
    cmp bl, 0x02
    ja .invalid_voice
    push ax
    push bx
    and ax, 0xFFF
    shl bl, 1
    push ax
    mov ah, al
    mov al, bl
    call YM_WriteReg
    pop ax
    inc bl
    mov al, bl
    call YM_WriteReg
    pop bx
    pop ax
    .invalid_voice:
    ret

; Entry: BL=voice 0..2, AL=volume 0..15
; Exit: None
YM_SetLevel:
    cmp bl, 0x02
    ja .invalid_voice
    push ax
    push bx
    and al, 0x0F
    xor bh, bh
    mov [cs:voice_level+bx], al
    add bl, 0x08
    mov ah, al
    mov al, bl
    call YM_WriteReg
    pop bx
    pop ax
    .invalid_voice:
    ret

; Entry: BL=voice 0..2
; Exit: None
YM_EnableVoice:
    cmp bl, 0x02
    ja .invalid_voice
    push ax
    push cx
    mov al, 7
    mov ah, 1
    mov cl, bl
    shl ah, cl
    not ah
    and ah, [cs:mixer_shadow]
    call YM_WriteReg
    pop cx
    pop ax
    .invalid_voice:
    ret

; Entry: BL=voice 0..2
; Exit: None
YM_DisableVoice:
    cmp bl, 0x02
    ja .invalid_voice
    push ax
    push cx
    mov al, 7
    mov ah, 1
    mov cl, bl
    shl ah, cl
    or ah, [cs:mixer_shadow]
    call YM_WriteReg
    pop cx
    pop ax
    .invalid_voice:
    ret

; Entry: CL=channel, BH=note, BL=velocity
; Ext: None
YM_NoteOn:
    push ax
    push bx
    push cx
    push dx

    mov dx, bx
    and dx, 0x7F7F
    mov bl, cl
    xor bh, bh
    mov bl, [cs:chan_to_voice+bx]
    cmp bl, 2
    ja .exit
    cmp dh, 1
    jbe .exit
    mov byte [cs:voice_env_state+bx], 1
    mov byte [cs:voice_env_attn+bx], 0
    mov byte [cs:voice_env_index+bx], 0
    mov byte [cs:voice_env_count+bx], ENV_ATTACK_TICKS
    mov byte [cs:voice_note+bx], dh
    mov byte [cs:voice_velocity+bx], dl
    call YM_DisableVoice
    call YM_LookupPeriod
    call YM_SetPeriod
    call YM_ComputeLevel
    call YM_SetLevel
    call YM_EnableVoice
    .exit:
    pop dx
    pop cx
    pop bx
    pop ax
    ret

; Entry: CL=channel, BH=note
; Ext: None
YM_NoteOff:
    push bx
    push dx
    mov dh, bh
    and dh, 0x7F
    mov bl, cl
    xor bh, bh
    mov bl, [cs:chan_to_voice+bx]
    cmp bl, 2
    ja .exit
    cmp dh, 1
    jbe .exit
    mov dl, [cs:voice_note+bx]
    cmp dh, dl
    jne .exit
    mov dl, [cs:voice_env_attn+bx]
    mov [cs:voice_env_count+bx], dl   ; count = base attenuation while in state 3
    mov byte [cs:voice_env_index+bx], 0
    mov byte [cs:voice_env_state+bx], 3
    .exit:
    pop dx
    pop bx
    ret

; Entry: CL=channel
; Ext: None
YM_UpdateChannelPitch:
    push ax
    push bx
    push dx
    mov bl, cl
    xor bh, bh
    mov bl, [cs:chan_to_voice+bx]
    cmp bl, 2
    ja .exit
    cmp byte [cs:voice_note+bx], 0xFF
    je .exit
    mov dh, [cs:voice_note+bx]
    call YM_LookupPeriod
    call YM_SetPeriod
    .exit:
    pop dx
    pop bx
    pop ax
    ret

; Entry: BL=voice
; Ext: None
YM_UpdateVoiceLevel:
    push ax
    push bx
    cmp bl, 0x02
    ja .invalid_voice
    xor bh, bh
    cmp byte [cs:voice_note+bx], 0xFF
    je .invalid_voice
    call YM_ComputeLevel
    call YM_SetLevel
    .invalid_voice:
    pop bx
    pop ax
    ret

; Entry: None
; Ext: None
YM_UpdateAllLevels:
    push bx
    push cx
    xor bx, bx
    mov cx, 3
    .next_voice:
    call YM_UpdateVoiceLevel
    inc bl
    loop .next_voice
    pop cx
    pop bx
    ret

EnvStateTable:
   dw YM_EnvIdle
   dw YM_EnvAttack
   dw YM_EnvSustain
   dw YM_EnvRelease


; Entry: none
; Exit: none
YM_TickEnvelopes:
   push ax
   push bx
   push dx
   xor bx, bx
   .next_voice:
   cmp byte [cs:voice_note+bx], 0xFF
   je .continue_loop
   xor dh, dh
   mov dl, [cs:voice_env_state+bx]
   and dl, 3
   mov bp, dx
   shl bp, 1
   call word [cs:EnvStateTable+bp]
   .continue_loop:
   inc bl
   cmp bl, 3
   jb .next_voice
   pop dx
   pop bx
   pop ax
   ret

; Entry: BX=voice
; Exit: None
YM_EnvIdle:
   ret

; Entry: BX=voice
; Exit: None
YM_EnvAttack:
   dec byte [cs:voice_env_count+bx]
   jnz .done
   mov byte [cs:voice_env_state+bx], 2
   mov byte [cs:voice_env_count+bx], ENV_SUSTAIN_TICKS
   .done:
   ret

; Entry: BX=voice
; Exit: None
YM_EnvSustain:
   dec byte [cs:voice_env_count+bx]
   jnz .done
   mov byte [cs:voice_env_count+bx], ENV_SUSTAIN_TICKS
   cmp byte [cs:voice_env_attn+bx], 60
   jae .done
   inc byte [cs:voice_env_attn+bx]
   call YM_UpdateVoiceLevel
   .done:
   ret

; Entry: BX=voice
; Exit: None
YM_EnvRelease:
   xor dh, dh
   mov dl, [cs:voice_env_index+bx]
   inc byte [cs:voice_env_index+bx]
   mov bp, dx
   mov al, [cs:env_release+bp]
   cmp al, 127
   je .note_finished
   add al, [cs:voice_env_count+bx]
   mov [cs:voice_env_attn+bx], al
   call YM_UpdateVoiceLevel
   ret
   .note_finished:
   mov byte [cs:voice_note+bx], 0xFF
   mov byte [cs:voice_env_state+bx], 0
   call YM_DisableVoice
   ret
;--------------------------------------------------------------------------
; data / functions that will only be used before or during initialization
temp_area:
