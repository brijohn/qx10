; z80dasm 1.1.5
; command line: z80dasm -g 0x1600 -l -a -z -S ./symbols.lst -b ./bios2.blk -t bios2.sys

	org	01600h
bios_vector:	equ 0xf000
empty_bios:	equ 0xf05d
interrupt_vec_master:	equ 0xf060
interrupt_vec_slave:	equ 0xf080
boot:	equ 0xf0a0
wboot:	equ 0xf0a7
const:	equ 0xf0ae
conin:	equ 0xf0ce
conout:	equ 0xf0d5
list:	equ 0xf119
punch:	equ 0xf120
reader:	equ 0xf127
home:	equ 0xf12e
seldsk:	equ 0xf135
settrk:	equ 0xf13c
setsec:	equ 0xf143
setdma:	equ 0xf14a
read:	equ 0xf151
write:	equ 0xf158
listst:	equ 0xf15f
sectrn:	equ 0xf166
qxfunc:	equ 0xf16d
read_iobyte:	equ 0xf272
write_iobyte:	equ 0xf285
write_dskbyte:	equ 0xf2ab
setup_banked_copy:	equ 0xf344
copy_memblock:	equ 0xf34e
copy_buffer:	equ 0xf3dd
launch_ccp:	equ 0xf4f0
sub_f510h:	equ 0xf510
sub_f520h:	equ 0xf520
banked_execute_code:	equ 0xf52f
bank_jump_or_call:	equ 0xf573
call_return_bank:	equ 0xf576
console_return:	equ 0xf577
drive_mapping:	equ 0xf583
lfloppy_dph:	equ 0xf5af
rfloppy_dph:	equ 0xf5cb
rfloppy_dpb:	equ 0xf5ea
nec765_param_table:	equ 0xf5f9
mem_disk_init:	equ 0xfa22
mem_disk_dph:	equ 0xfa52

	jp bios2_boot		;1600	c3 59 1c 	. Y . 
l1603h:
	jp boot		;1603	c3 a0 f0 	. . . 
	jp wboot		;1606	c3 a7 f0 	. . . 
	jp const		;1609	c3 ae f0 	. . . 
	jp conin		;160c	c3 ce f0 	. . . 
	jp conout		;160f	c3 d5 f0 	. . . 
	jp list		;1612	c3 19 f1 	. . . 
	jp punch		;1615	c3 20 f1 	.   . 
	jp reader		;1618	c3 27 f1 	. ' . 
	jp home		;161b	c3 2e f1 	. . . 
	jp seldsk		;161e	c3 35 f1 	. 5 . 
	jp settrk		;1621	c3 3c f1 	. < . 
	jp setsec		;1624	c3 43 f1 	. C . 
	jp setdma		;1627	c3 4a f1 	. J . 
	jp read		;162a	c3 51 f1 	. Q . 
	jp write		;162d	c3 58 f1 	. X . 
	jp listst		;1630	c3 5f f1 	. _ . 
	jp sectrn		;1633	c3 66 f1 	. f . 
	jp empty_bios		;1636	c3 5d f0 	. ] . 
	jp empty_bios		;1639	c3 5d f0 	. ] . 
	jp empty_bios		;163c	c3 5d f0 	. ] . 
	jp empty_bios		;163f	c3 5d f0 	. ] . 
	jp empty_bios		;1642	c3 5d f0 	. ] . 
	jp empty_bios		;1645	c3 5d f0 	. ] . 
	jp empty_bios		;1648	c3 5d f0 	. ] . 
	jp empty_bios		;164b	c3 5d f0 	. ] . 
	jp empty_bios		;164e	c3 5d f0 	. ] . 
	jp empty_bios		;1651	c3 5d f0 	. ] . 
	jp empty_bios		;1654	c3 5d f0 	. ] . 
	jp empty_bios		;1657	c3 5d f0 	. ] . 
	jp empty_bios		;165a	c3 5d f0 	. ] . 
	jp qxfunc		;165d	c3 6d f1 	. m . 
bios_vector_length:
	defw 0005dh		;1660	5d 00 	] . 
bios2_vector:
	jp bios2_boot		;1662	c3 59 1c 	. Y . 
	jp bios2_wboot		;1665	c3 76 1d 	. v . 
	jp bios2_const		;1668	c3 c8 19 	. . . 
	jp bios2_conin		;166b	c3 d6 19 	. . . 
	jp bios2_conout		;166e	c3 e4 19 	. . . 
	jp bios2_list		;1671	c3 14 1a 	. . . 
	jp bios2_punch		;1674	c3 f2 19 	. . . 
	jp bios2_reader		;1677	c3 04 1a 	. . . 
	jp bios2_home		;167a	c3 81 1a 	. . . 
	jp bios2_seldsk		;167d	c3 43 1a 	. C . 
	jp bios2_settrk		;1680	c3 99 1a 	. . . 
	jp bios2_setsec		;1683	c3 9e 1a 	. . . 
	jp bios2_setdma		;1686	c3 a6 1a 	. . . 
	jp bios2_read		;1689	c3 ab 1a 	. . . 
	jp bios2_write		;168c	c3 c5 1a 	. . . 
	jp bios2_listst		;168f	c3 24 1a 	. $ . 
	jp bios2_sectrn		;1692	c3 a3 1a 	. . . 
	jp bios2_qxfunc		;1695	c3 31 1e 	. 1 . 
interrupt_vector:
	jp default_int_handler		;1698	c3 e7 18 	. . . 
	jp default_int_handler		;169b	c3 e7 18 	. . . 
	jp default_int_handler		;169e	c3 e7 18 	. . . 
	jp default_int_handler		;16a1	c3 e7 18 	. . . 
	jp sio_int_handler		;16a4	c3 04 17 	. . . 
	jp default_int_handler		;16a7	c3 e7 18 	. . . 
	jp default_int_handler		;16aa	c3 e7 18 	. . . 
	jp default_int_handler		;16ad	c3 e7 18 	. . . 
	jp default_int_handler		;16b0	c3 e7 18 	. . . 
	jp default_int_handler		;16b3	c3 e7 18 	. . . 
	jp clock_int_handler		;16b6	c3 c4 2e 	. . . 
	jp default_int_handler		;16b9	c3 e7 18 	. . . 
	jp default_int_handler		;16bc	c3 e7 18 	. . . 
	jp default_int_handler		;16bf	c3 e7 18 	. . . 
	jp default_int_handler		;16c2	c3 e7 18 	. . . 
	jp default_int_handler		;16c5	c3 e7 18 	. . . 
keyboard_int_handler:
	jp keyboard_bios_handler		;16c8	c3 2d 17 	. - . 
serial_int_handler:
	jp serial_bios_handler		;16cb	c3 4a 17 	. J . 
l16ceh:
	jp default_int_handler		;16ce	c3 e7 18 	. . . 
	jp default_int_handler		;16d1	c3 e7 18 	. . . 
	jp default_int_handler		;16d4	c3 e7 18 	. . . 
	jp default_int_handler		;16d7	c3 e7 18 	. . . 
	jp sio_int_handler		;16da	c3 04 17 	. . . 
	jp default_int_handler		;16dd	c3 e7 18 	. . . 
	jp default_int_handler		;16e0	c3 e7 18 	. . . 
	jp default_int_handler		;16e3	c3 e7 18 	. . . 
	jp default_int_handler		;16e6	c3 e7 18 	. . . 
	jp default_int_handler		;16e9	c3 e7 18 	. . . 
	jp clock_int_handler		;16ec	c3 c4 2e 	. . . 
	jp default_int_handler		;16ef	c3 e7 18 	. . . 
	jp default_int_handler		;16f2	c3 e7 18 	. . . 
	jp default_int_handler		;16f5	c3 e7 18 	. . . 
	jp default_int_handler		;16f8	c3 e7 18 	. . . 
	jp default_int_handler		;16fb	c3 e7 18 	. . . 
	jp keyboard_bios_handler		;16fe	c3 2d 17 	. - . 
	jp serial_bios_handler		;1701	c3 4a 17 	. J . 
sio_int_handler:
	in a,(012h)		;1704	db 12 	. . 
	ld (l17bah),a		;1706	32 ba 17 	2 . . 
	bit 0,a		;1709	cb 47 	. G 
	jr nz,l1723h		;170b	20 16 	  . 
	in a,(013h)		;170d	db 13 	. . 
	ld (l17bch),a		;170f	32 bc 17 	2 . . 
	bit 0,a		;1712	cb 47 	. G 
	jr nz,l1728h		;1714	20 12 	  . 
l1716h:
	ld a,010h		;1716	3e 10 	> . 
	out (013h),a		;1718	d3 13 	. . 
	out (013h),a		;171a	d3 13 	. . 
	ld a,020h		;171c	3e 20 	>   
	out (008h),a		;171e	d3 08 	. . 
	out (00ch),a		;1720	d3 0c 	. . 
	ret			;1722	c9 	. 
l1723h:
	call keyboard_int_handler		;1723	cd c8 16 	. . . 
	jr sio_int_handler		;1726	18 dc 	. . 
l1728h:
	call serial_int_handler		;1728	cd cb 16 	. . . 
	jr sio_int_handler		;172b	18 d7 	. . 
keyboard_bios_handler:
	in a,(010h)		;172d	db 10 	. . 
	call sub_a07ch		;172f	cd 7c a0 	. | . 
	or a			;1732	b7 	. 
	call nz,sub_a03bh		;1733	c4 3b a0 	. ; . 
	ld a,(l17bah)		;1736	3a ba 17 	: . . 
	bit 2,a		;1739	cb 57 	. W 
	jr nz,l1741h		;173b	20 04 	  . 
	ld a,028h		;173d	3e 28 	> ( 
	out (012h),a		;173f	d3 12 	. . 
l1741h:
	ld a,030h		;1741	3e 30 	> 0 
	out (012h),a		;1743	d3 12 	. . 
	ld a,038h		;1745	3e 38 	> 8 
	out (012h),a		;1747	d3 12 	. . 
	ret			;1749	c9 	. 
serial_bios_handler:
	ld a,(sys_page_sio_int)		;174a	3a 78 2c 	: x , 
	or a			;174d	b7 	. 
	jr z,l1769h		;174e	28 19 	( . 
	in a,(011h)		;1750	db 11 	. . 
	call sub_176dh		;1752	cd 6d 17 	. m . 
	ld a,(l17bch)		;1755	3a bc 17 	: . . 
	bit 2,a		;1758	cb 57 	. W 
	jr nz,l1760h		;175a	20 04 	  . 
	ld a,028h		;175c	3e 28 	> ( 
	out (013h),a		;175e	d3 13 	. . 
l1760h:
	ld a,030h		;1760	3e 30 	> 0 
	out (013h),a		;1762	d3 13 	. . 
	ld a,038h		;1764	3e 38 	> 8 
	out (013h),a		;1766	d3 13 	. . 
	ret			;1768	c9 	. 
l1769h:
	pop hl			;1769	e1 	. 
	jp l1716h		;176a	c3 16 17 	. . . 
sub_176dh:
	push af			;176d	f5 	. 
	ld hl,(l18beh)		;176e	2a be 18 	* . . 
	bit 0,h		;1771	cb 44 	. D 
	jr nz,l178bh		;1773	20 16 	  . 
	inc hl			;1775	23 	# 
	ld (l18beh),hl		;1776	22 be 18 	" . . 
	ld hl,l17beh		;1779	21 be 17 	! . . 
	ld a,(l18c0h)		;177c	3a c0 18 	: . . 
	ld d,000h		;177f	16 00 	. . 
	ld e,a			;1781	5f 	_ 
	add hl,de			;1782	19 	. 
	inc a			;1783	3c 	< 
	ld (l18c0h),a		;1784	32 c0 18 	2 . . 
	pop af			;1787	f1 	. 
	ld (hl),a			;1788	77 	w 
	xor a			;1789	af 	. 
	ret			;178a	c9 	. 
l178bh:
	pop af			;178b	f1 	. 
	ld a,0ffh		;178c	3e ff 	> . 
	ret			;178e	c9 	. 
sub_178fh:
	ld hl,interrupt_vec_master		;178f	21 60 f0 	! ` . 
	ld a,014h		;1792	3e 14 	> . 
	or l			;1794	b5 	. 
	out (008h),a		;1795	d3 08 	. . 
	ld a,h			;1797	7c 	| 
	out (009h),a		;1798	d3 09 	. . 
	ld a,080h		;179a	3e 80 	> . 
	out (009h),a		;179c	d3 09 	. . 
	ld hl,interrupt_vec_slave		;179e	21 80 f0 	! . . 
	ld a,014h		;17a1	3e 14 	> . 
	or l			;17a3	b5 	. 
	out (00ch),a		;17a4	d3 0c 	. . 
	ld a,h			;17a6	7c 	| 
	out (00dh),a		;17a7	d3 0d 	. . 
	ld a,007h		;17a9	3e 07 	> . 
	out (00dh),a		;17ab	d3 0d 	. . 
	ret			;17ad	c9 	. 
sub_17aeh:
	ld a,(l18e5h)		;17ae	3a e5 18 	: . . 
	out (009h),a		;17b1	d3 09 	. . 
	ret			;17b3	c9 	. 
sub_17b4h:
	ld a,(l18e6h)		;17b4	3a e6 18 	: . . 
	out (00dh),a		;17b7	d3 0d 	. . 
	ret			;17b9	c9 	. 
l17bah:
	defb 000h		;17ba	00 	. 
	defb 000h		;17bb	00 	. 
l17bch:
	defb 000h		;17bc	00 	. 
	defb 000h		;17bd	00 	. 
l17beh:
	defb 000h		;17be	00 	. 
	defb 000h		;17bf	00 	. 
	defb 000h		;17c0	00 	. 
	defb 000h		;17c1	00 	. 
	defb 000h		;17c2	00 	. 
	defb 000h		;17c3	00 	. 
	defb 000h		;17c4	00 	. 
	defb 000h		;17c5	00 	. 
	defb 000h		;17c6	00 	. 
	defb 000h		;17c7	00 	. 
	defb 000h		;17c8	00 	. 
	defb 000h		;17c9	00 	. 
	defb 000h		;17ca	00 	. 
	defb 000h		;17cb	00 	. 
	defb 000h		;17cc	00 	. 
	defb 000h		;17cd	00 	. 
	defb 000h		;17ce	00 	. 
	defb 000h		;17cf	00 	. 
	defb 000h		;17d0	00 	. 
	defb 000h		;17d1	00 	. 
	defb 000h		;17d2	00 	. 
	defb 000h		;17d3	00 	. 
	defb 000h		;17d4	00 	. 
	defb 000h		;17d5	00 	. 
	defb 000h		;17d6	00 	. 
	defb 000h		;17d7	00 	. 
	defb 000h		;17d8	00 	. 
	defb 000h		;17d9	00 	. 
	defb 000h		;17da	00 	. 
	defb 000h		;17db	00 	. 
	defb 000h		;17dc	00 	. 
	defb 000h		;17dd	00 	. 
	defb 000h		;17de	00 	. 
	defb 000h		;17df	00 	. 
	defb 000h		;17e0	00 	. 
	defb 000h		;17e1	00 	. 
	defb 000h		;17e2	00 	. 
	defb 000h		;17e3	00 	. 
	defb 000h		;17e4	00 	. 
	defb 000h		;17e5	00 	. 
	defb 000h		;17e6	00 	. 
	defb 000h		;17e7	00 	. 
	defb 000h		;17e8	00 	. 
	defb 000h		;17e9	00 	. 
	defb 000h		;17ea	00 	. 
	defb 000h		;17eb	00 	. 
	defb 000h		;17ec	00 	. 
	defb 000h		;17ed	00 	. 
	defb 000h		;17ee	00 	. 
	defb 000h		;17ef	00 	. 
	defb 000h		;17f0	00 	. 
	defb 000h		;17f1	00 	. 
	defb 000h		;17f2	00 	. 
	defb 000h		;17f3	00 	. 
	defb 000h		;17f4	00 	. 
	defb 000h		;17f5	00 	. 
	defb 000h		;17f6	00 	. 
	defb 000h		;17f7	00 	. 
	defb 000h		;17f8	00 	. 
	defb 000h		;17f9	00 	. 
	defb 000h		;17fa	00 	. 
	defb 000h		;17fb	00 	. 
	defb 000h		;17fc	00 	. 
	defb 000h		;17fd	00 	. 
	defb 000h		;17fe	00 	. 
	defb 000h		;17ff	00 	. 
	defb 000h		;1800	00 	. 
	defb 000h		;1801	00 	. 
	defb 000h		;1802	00 	. 
	defb 000h		;1803	00 	. 
	defb 000h		;1804	00 	. 
	defb 000h		;1805	00 	. 
	defb 000h		;1806	00 	. 
	defb 000h		;1807	00 	. 
	defb 000h		;1808	00 	. 
	defb 000h		;1809	00 	. 
	defb 000h		;180a	00 	. 
	defb 000h		;180b	00 	. 
	defb 000h		;180c	00 	. 
	defb 000h		;180d	00 	. 
	defb 000h		;180e	00 	. 
	defb 000h		;180f	00 	. 
	defb 000h		;1810	00 	. 
	defb 000h		;1811	00 	. 
	defb 000h		;1812	00 	. 
	defb 000h		;1813	00 	. 
	defb 000h		;1814	00 	. 
	defb 000h		;1815	00 	. 
	defb 000h		;1816	00 	. 
	defb 000h		;1817	00 	. 
	defb 000h		;1818	00 	. 
	defb 000h		;1819	00 	. 
	defb 000h		;181a	00 	. 
	defb 000h		;181b	00 	. 
	defb 000h		;181c	00 	. 
	defb 000h		;181d	00 	. 
	defb 000h		;181e	00 	. 
	defb 000h		;181f	00 	. 
l1820h:
	defb 000h		;1820	00 	. 
	defb 000h		;1821	00 	. 
	defb 000h		;1822	00 	. 
	defb 000h		;1823	00 	. 
	defb 000h		;1824	00 	. 
	defb 000h		;1825	00 	. 
	defb 000h		;1826	00 	. 
	defb 000h		;1827	00 	. 
	defb 000h		;1828	00 	. 
	defb 000h		;1829	00 	. 
	defb 000h		;182a	00 	. 
	defb 000h		;182b	00 	. 
	defb 000h		;182c	00 	. 
	defb 000h		;182d	00 	. 
	defb 000h		;182e	00 	. 
	defb 000h		;182f	00 	. 
	defb 000h		;1830	00 	. 
	defb 000h		;1831	00 	. 
	defb 000h		;1832	00 	. 
	defb 000h		;1833	00 	. 
	defb 000h		;1834	00 	. 
	defb 000h		;1835	00 	. 
	defb 000h		;1836	00 	. 
	defb 000h		;1837	00 	. 
	defb 000h		;1838	00 	. 
	defb 000h		;1839	00 	. 
	defb 000h		;183a	00 	. 
	defb 000h		;183b	00 	. 
	defb 000h		;183c	00 	. 
	defb 000h		;183d	00 	. 
	defb 000h		;183e	00 	. 
	defb 000h		;183f	00 	. 
l1840h:
	defb 000h		;1840	00 	. 
	defb 000h		;1841	00 	. 
	defb 000h		;1842	00 	. 
	defb 000h		;1843	00 	. 
	defb 000h		;1844	00 	. 
	defb 000h		;1845	00 	. 
	defb 000h		;1846	00 	. 
	defb 000h		;1847	00 	. 
	defb 000h		;1848	00 	. 
	defb 000h		;1849	00 	. 
	defb 000h		;184a	00 	. 
	defb 000h		;184b	00 	. 
	defb 000h		;184c	00 	. 
	defb 000h		;184d	00 	. 
	defb 000h		;184e	00 	. 
	defb 000h		;184f	00 	. 
	defb 000h		;1850	00 	. 
	defb 000h		;1851	00 	. 
	defb 000h		;1852	00 	. 
	defb 000h		;1853	00 	. 
	defb 000h		;1854	00 	. 
	defb 000h		;1855	00 	. 
	defb 000h		;1856	00 	. 
	defb 000h		;1857	00 	. 
	defb 000h		;1858	00 	. 
	defb 000h		;1859	00 	. 
	defb 000h		;185a	00 	. 
	defb 000h		;185b	00 	. 
	defb 000h		;185c	00 	. 
	defb 000h		;185d	00 	. 
	defb 000h		;185e	00 	. 
	defb 000h		;185f	00 	. 
	defb 000h		;1860	00 	. 
	defb 000h		;1861	00 	. 
	defb 000h		;1862	00 	. 
	defb 000h		;1863	00 	. 
	defb 000h		;1864	00 	. 
	defb 000h		;1865	00 	. 
	defb 000h		;1866	00 	. 
	defb 000h		;1867	00 	. 
	defb 000h		;1868	00 	. 
	defb 000h		;1869	00 	. 
	defb 000h		;186a	00 	. 
	defb 000h		;186b	00 	. 
	defb 000h		;186c	00 	. 
	defb 000h		;186d	00 	. 
	defb 000h		;186e	00 	. 
	defb 000h		;186f	00 	. 
	defb 000h		;1870	00 	. 
	defb 000h		;1871	00 	. 
	defb 000h		;1872	00 	. 
	defb 000h		;1873	00 	. 
	defb 000h		;1874	00 	. 
	defb 000h		;1875	00 	. 
	defb 000h		;1876	00 	. 
	defb 000h		;1877	00 	. 
	defb 000h		;1878	00 	. 
	defb 000h		;1879	00 	. 
	defb 000h		;187a	00 	. 
	defb 000h		;187b	00 	. 
	defb 000h		;187c	00 	. 
	defb 000h		;187d	00 	. 
	defb 000h		;187e	00 	. 
	defb 000h		;187f	00 	. 
	defb 000h		;1880	00 	. 
	defb 000h		;1881	00 	. 
	defb 000h		;1882	00 	. 
	defb 000h		;1883	00 	. 
	defb 000h		;1884	00 	. 
	defb 000h		;1885	00 	. 
	defb 000h		;1886	00 	. 
	defb 000h		;1887	00 	. 
	defb 000h		;1888	00 	. 
	defb 000h		;1889	00 	. 
	defb 000h		;188a	00 	. 
	defb 000h		;188b	00 	. 
	defb 000h		;188c	00 	. 
	defb 000h		;188d	00 	. 
	defb 000h		;188e	00 	. 
	defb 000h		;188f	00 	. 
	defb 000h		;1890	00 	. 
	defb 000h		;1891	00 	. 
	defb 000h		;1892	00 	. 
	defb 000h		;1893	00 	. 
	defb 000h		;1894	00 	. 
	defb 000h		;1895	00 	. 
	defb 000h		;1896	00 	. 
	defb 000h		;1897	00 	. 
	defb 000h		;1898	00 	. 
	defb 000h		;1899	00 	. 
	defb 000h		;189a	00 	. 
	defb 000h		;189b	00 	. 
	defb 000h		;189c	00 	. 
	defb 000h		;189d	00 	. 
	defb 000h		;189e	00 	. 
	defb 000h		;189f	00 	. 
	defb 000h		;18a0	00 	. 
	defb 000h		;18a1	00 	. 
	defb 000h		;18a2	00 	. 
	defb 000h		;18a3	00 	. 
	defb 000h		;18a4	00 	. 
	defb 000h		;18a5	00 	. 
	defb 000h		;18a6	00 	. 
	defb 000h		;18a7	00 	. 
	defb 000h		;18a8	00 	. 
	defb 000h		;18a9	00 	. 
	defb 000h		;18aa	00 	. 
	defb 000h		;18ab	00 	. 
	defb 000h		;18ac	00 	. 
	defb 000h		;18ad	00 	. 
	defb 000h		;18ae	00 	. 
	defb 000h		;18af	00 	. 
	defb 000h		;18b0	00 	. 
	defb 000h		;18b1	00 	. 
	defb 000h		;18b2	00 	. 
	defb 000h		;18b3	00 	. 
	defb 000h		;18b4	00 	. 
	defb 000h		;18b5	00 	. 
	defb 000h		;18b6	00 	. 
	defb 000h		;18b7	00 	. 
	defb 000h		;18b8	00 	. 
	defb 000h		;18b9	00 	. 
	defb 000h		;18ba	00 	. 
	defb 000h		;18bb	00 	. 
	defb 000h		;18bc	00 	. 
	defb 000h		;18bd	00 	. 
l18beh:
	defb 000h		;18be	00 	. 
	defb 000h		;18bf	00 	. 
l18c0h:
	defb 000h		;18c0	00 	. 
l18c1h:
	defb 000h		;18c1	00 	. 
	defb 000h		;18c2	00 	. 
	defb 000h		;18c3	00 	. 
	defb 000h		;18c4	00 	. 
	defb 000h		;18c5	00 	. 
	defb 000h		;18c6	00 	. 
	defb 000h		;18c7	00 	. 
	defb 000h		;18c8	00 	. 
	defb 000h		;18c9	00 	. 
	defb 000h		;18ca	00 	. 
	defb 000h		;18cb	00 	. 
	defb 000h		;18cc	00 	. 
	defb 000h		;18cd	00 	. 
	defb 000h		;18ce	00 	. 
	defb 000h		;18cf	00 	. 
	defb 000h		;18d0	00 	. 
	defb 000h		;18d1	00 	. 
	defb 000h		;18d2	00 	. 
	defb 000h		;18d3	00 	. 
	defb 000h		;18d4	00 	. 
	defb 000h		;18d5	00 	. 
	defb 000h		;18d6	00 	. 
	defb 000h		;18d7	00 	. 
	defb 000h		;18d8	00 	. 
	defb 000h		;18d9	00 	. 
	defb 000h		;18da	00 	. 
	defb 000h		;18db	00 	. 
	defb 000h		;18dc	00 	. 
	defb 000h		;18dd	00 	. 
	defb 000h		;18de	00 	. 
	defb 000h		;18df	00 	. 
	defb 000h		;18e0	00 	. 
	defb 000h		;18e1	00 	. 
	defb 000h		;18e2	00 	. 
	defb 000h		;18e3	00 	. 
	defb 000h		;18e4	00 	. 
l18e5h:
	defb 06fh		;18e5	6f 	o 
l18e6h:
	defb 0fbh		;18e6	fb 	. 
default_int_handler:
	ld a,00ah		;18e7	3e 0a 	> . 
	out (008h),a		;18e9	d3 08 	. . 
	in a,(008h)		;18eb	db 08 	. . 
	ld (l19c2h),a		;18ed	32 c2 19 	2 . . 
	ld a,00bh		;18f0	3e 0b 	> . 
	out (008h),a		;18f2	d3 08 	. . 
	in a,(008h)		;18f4	db 08 	. . 
	ld (l19c3h),a		;18f6	32 c3 19 	2 . . 
	in a,(009h)		;18f9	db 09 	. . 
	ld (l19c4h),a		;18fb	32 c4 19 	2 . . 
	ld a,00ah		;18fe	3e 0a 	> . 
	out (00ch),a		;1900	d3 0c 	. . 
	in a,(00ch)		;1902	db 0c 	. . 
	ld (l19c5h),a		;1904	32 c5 19 	2 . . 
	ld a,00bh		;1907	3e 0b 	> . 
	out (00ch),a		;1909	d3 0c 	. . 
	in a,(00ch)		;190b	db 0c 	. . 
	ld (l19c6h),a		;190d	32 c6 19 	2 . . 
	in a,(00dh)		;1910	db 0d 	. . 
	ld (l19c7h),a		;1912	32 c7 19 	2 . . 
	ld de,l19c2h		;1915	11 c2 19 	. . . 
	ld hl,l19a3h		;1918	21 a3 19 	! . . 
	ld b,006h		;191b	06 06 	. . 
l191dh:
	push bc			;191d	c5 	. 
	ld a,(de)			;191e	1a 	. 
	call sub_193bh		;191f	cd 3b 19 	. ; . 
	call sub_1936h		;1922	cd 36 19 	. 6 . 
	pop bc			;1925	c1 	. 
	dec b			;1926	05 	. 
	jr nz,l191dh		;1927	20 f4 	  . 
	ld hl,l1963h		;1929	21 63 19 	! c . 
	call print_string		;192c	cd 66 33 	. f 3 
	ld hl,l19a2h		;192f	21 a2 19 	! . . 
	call print_string		;1932	cd 66 33 	. f 3 
	halt			;1935	76 	v 
sub_1936h:
	inc de			;1936	13 	. 
	inc hl			;1937	23 	# 
	inc hl			;1938	23 	# 
	inc hl			;1939	23 	# 
	ret			;193a	c9 	. 
sub_193bh:
	ld b,a			;193b	47 	G 
	rra			;193c	1f 	. 
	rra			;193d	1f 	. 
	rra			;193e	1f 	. 
	rra			;193f	1f 	. 
l1940h:
	and 00fh		;1940	e6 0f 	. . 
	cp 00ah		;1942	fe 0a 	. . 
	jr c,l194ah		;1944	38 04 	8 . 
	add a,037h		;1946	c6 37 	. 7 
	jr l194ch		;1948	18 02 	. . 
l194ah:
	add a,030h		;194a	c6 30 	. 0 
l194ch:
	ld (hl),a			;194c	77 	w 
	ld a,(l1962h)		;194d	3a 62 19 	: b . 
	or a			;1950	b7 	. 
	jr nz,l195ch		;1951	20 09 	  . 
	ld a,0ffh		;1953	3e ff 	> . 
	ld (l1962h),a		;1955	32 62 19 	2 b . 
	ld a,b			;1958	78 	x 
	inc hl			;1959	23 	# 
	jr l1940h		;195a	18 e4 	. . 
l195ch:
	inc hl			;195c	23 	# 
	xor a			;195d	af 	. 
	ld (l1962h),a		;195e	32 62 19 	2 b . 
	ret			;1961	c9 	. 
l1962h:
	defb 000h		;1962	00 	. 
l1963h:
	defb 007h		;1963	07 	. 
	defb 00dh		;1964	0d 	. 
	defb 00ah		;1965	0a 	. 
	defb 00ah		;1966	0a 	. 
	defb 00ah		;1967	0a 	. 
	defb 055h		;1968	55 	U 
	defb 06eh		;1969	6e 	n 
	defb 065h		;196a	65 	e 
	defb 078h		;196b	78 	x 
	defb 070h		;196c	70 	p 
	defb 065h		;196d	65 	e 
	defb 063h		;196e	63 	c 
	defb 074h		;196f	74 	t 
	defb 065h		;1970	65 	e 
	defb 064h		;1971	64 	d 
	defb 020h		;1972	20 	  
	defb 069h		;1973	69 	i 
	defb 06eh		;1974	6e 	n 
	defb 074h		;1975	74 	t 
	defb 065h		;1976	65 	e 
	defb 072h		;1977	72 	r 
	defb 072h		;1978	72 	r 
	defb 075h		;1979	75 	u 
	defb 070h		;197a	70 	p 
	defb 074h		;197b	74 	t 
	defb 020h		;197c	20 	  
	defb 021h		;197d	21 	! 
	defb 021h		;197e	21 	! 
	defb 021h		;197f	21 	! 
	defb 00dh		;1980	0d 	. 
	defb 00ah		;1981	0a 	. 
	defb 04dh		;1982	4d 	M 
	defb 049h		;1983	49 	I 
	defb 052h		;1984	52 	R 
	defb 052h		;1985	52 	R 
	defb 020h		;1986	20 	  
	defb 04dh		;1987	4d 	M 
	defb 049h		;1988	49 	I 
	defb 053h		;1989	53 	S 
	defb 052h		;198a	52 	R 
	defb 020h		;198b	20 	  
	defb 04dh		;198c	4d 	M 
	defb 04dh		;198d	4d 	M 
	defb 053h		;198e	53 	S 
	defb 04bh		;198f	4b 	K 
	defb 020h		;1990	20 	  
	defb 053h		;1991	53 	S 
	defb 049h		;1992	49 	I 
	defb 052h		;1993	52 	R 
	defb 052h		;1994	52 	R 
	defb 020h		;1995	20 	  
	defb 053h		;1996	53 	S 
	defb 049h		;1997	49 	I 
	defb 053h		;1998	53 	S 
	defb 052h		;1999	52 	R 
	defb 020h		;199a	20 	  
	defb 053h		;199b	53 	S 
	defb 04dh		;199c	4d 	M 
	defb 053h		;199d	53 	S 
	defb 04bh		;199e	4b 	K 
	defb 00dh		;199f	0d 	. 
	defb 00ah		;19a0	0a 	. 
	defb 000h		;19a1	00 	. 
l19a2h:
	defb 020h		;19a2	20 	  
l19a3h:
	defb 020h		;19a3	20 	  
	defb 020h		;19a4	20 	  
	defb 020h		;19a5	20 	  
	defb 020h		;19a6	20 	  
	defb 020h		;19a7	20 	  
	defb 020h		;19a8	20 	  
	defb 020h		;19a9	20 	  
	defb 020h		;19aa	20 	  
	defb 020h		;19ab	20 	  
	defb 020h		;19ac	20 	  
	defb 020h		;19ad	20 	  
	defb 020h		;19ae	20 	  
	defb 020h		;19af	20 	  
	defb 020h		;19b0	20 	  
	defb 020h		;19b1	20 	  
	defb 020h		;19b2	20 	  
	defb 020h		;19b3	20 	  
	defb 020h		;19b4	20 	  
	defb 020h		;19b5	20 	  
	defb 020h		;19b6	20 	  
	defb 020h		;19b7	20 	  
	defb 020h		;19b8	20 	  
	defb 020h		;19b9	20 	  
	defb 020h		;19ba	20 	  
	defb 020h		;19bb	20 	  
	defb 020h		;19bc	20 	  
	defb 020h		;19bd	20 	  
	defb 020h		;19be	20 	  
	defb 00dh		;19bf	0d 	. 
	defb 00ah		;19c0	0a 	. 
	defb 000h		;19c1	00 	. 
l19c2h:
	defb 000h		;19c2	00 	. 
l19c3h:
	defb 000h		;19c3	00 	. 
l19c4h:
	defb 000h		;19c4	00 	. 
l19c5h:
	defb 000h		;19c5	00 	. 
l19c6h:
	defb 000h		;19c6	00 	. 
l19c7h:
	defb 000h		;19c7	00 	. 
bios2_const:
	call read_iobyte		;19c8	cd 72 f2 	. r . 
	call sub_1a34h		;19cb	cd 34 1a 	. 4 . 
	defw console_return		;19ce	77 f5 	w . 
	defw console_return		;19d0	77 f5 	w . 
	defw l3319h		;19d2	19 33 	. 3 
	defw l2ff0h		;19d4	f0 2f 	. / 
bios2_conin:
	call read_iobyte		;19d6	cd 72 f2 	. r . 
	call sub_1a34h		;19d9	cd 34 1a 	. 4 . 
	defw l332ch		;19dc	2c 33 	, 3 
	defw l332ch		;19de	2c 33 	, 3 
	defw l3326h		;19e0	26 33 	& 3 
	defw l300ah		;19e2	0a 30 	. 0 
bios2_conout:
	call read_iobyte		;19e4	cd 72 f2 	. r . 
	call sub_1a34h		;19e7	cd 34 1a 	. 4 . 
	defw l1c44h		;19ea	44 1c 	D . 
	defw l1c44h		;19ec	44 1c 	D . 
	defw l3329h		;19ee	29 33 	) 3 
	defw l305dh		;19f0	5d 30 	] 0 
bios2_punch:
	call read_iobyte		;19f2	cd 72 f2 	. r . 
	rrca			;19f5	0f 	. 
	rrca			;19f6	0f 	. 
	rrca			;19f7	0f 	. 
	rrca			;19f8	0f 	. 
	call sub_1a34h		;19f9	cd 34 1a 	. 4 . 
	defw l1c44h		;19fc	44 1c 	D . 
	defw l1c44h		;19fe	44 1c 	D . 
	defw l305dh		;1a00	5d 30 	] 0 
	defw l305dh		;1a02	5d 30 	] 0 
bios2_reader:
	call read_iobyte		;1a04	cd 72 f2 	. r . 
	rrca			;1a07	0f 	. 
	rrca			;1a08	0f 	. 
	call sub_1a34h		;1a09	cd 34 1a 	. 4 . 
	defw l332ch		;1a0c	2c 33 	, 3 
	defw l332ch		;1a0e	2c 33 	, 3 
	defw l300ah		;1a10	0a 30 	. 0 
	defw l300ah		;1a12	0a 30 	. 0 
bios2_list:
	call read_iobyte		;1a14	cd 72 f2 	. r . 
	rlca			;1a17	07 	. 
	rlca			;1a18	07 	. 
	call sub_1a34h		;1a19	cd 34 1a 	. 4 . 
	defw l1c44h		;1a1c	44 1c 	D . 
	defw l1c44h		;1a1e	44 1c 	D . 
	defw l3171h		;1a20	71 31 	q 1 
	defw l305dh		;1a22	5d 30 	] 0 
bios2_listst:
	call read_iobyte		;1a24	cd 72 f2 	. r . 
	rlca			;1a27	07 	. 
	rlca			;1a28	07 	. 
	call sub_1a34h		;1a29	cd 34 1a 	. 4 . 
	defw l3054h		;1a2c	54 30 	T 0 
	defw console_return		;1a2e	77 f5 	w . 
	defw l31aeh		;1a30	ae 31 	. 1 
	defw l31aeh		;1a32	ae 31 	. 1 
sub_1a34h:
	and 003h		;1a34	e6 03 	. . 
	add a,a			;1a36	87 	. 
	pop hl			;1a37	e1 	. 
	add a,l			;1a38	85 	. 
	ld l,a			;1a39	6f 	o 
	jp nc,l1a3eh		;1a3a	d2 3e 1a 	. > . 
	inc h			;1a3d	24 	$ 
l1a3eh:
	ld a,(hl)			;1a3e	7e 	~ 
	inc hl			;1a3f	23 	# 
	ld h,(hl)			;1a40	66 	f 
	ld l,a			;1a41	6f 	o 
	jp (hl)			;1a42	e9 	. 
bios2_seldsk:
	ld a,c			;1a43	79 	y 
	ld (disk_number),a		;1a44	32 1f 1c 	2 . . 
	cp 010h		;1a47	fe 10 	. . 
	jp nc,l1b2eh		;1a49	d2 2e 1b 	. . . 
	ld l,a			;1a4c	6f 	o 
	ld h,000h		;1a4d	26 00 	& . 
	add hl,hl			;1a4f	29 	) 
	ld bc,drive_mapping		;1a50	01 83 f5 	. . . 
	add hl,bc			;1a53	09 	. 
	ld e,(hl)			;1a54	5e 	^ 
	inc hl			;1a55	23 	# 
	ld d,(hl)			;1a56	56 	V 
	ld a,d			;1a57	7a 	z 
	or a			;1a58	b7 	. 
	jp z,l1b0dh		;1a59	ca 0d 1b 	. . . 
	ld hl,mem_disk_dph		;1a5c	21 52 fa 	! R . 
	or a			;1a5f	b7 	. 
	sbc hl,de		;1a60	ed 52 	. R 
	jr nz,l1a6bh		;1a62	20 07 	  . 
	ld a,(sys_page_ram_disk)		;1a64	3a 73 2c 	: s , 
	or a			;1a67	b7 	. 
	jp z,l1b0dh		;1a68	ca 0d 1b 	. . . 
l1a6bh:
	ex de,hl			;1a6b	eb 	. 
	push hl			;1a6c	e5 	. 
	push hl			;1a6d	e5 	. 
	pop ix		;1a6e	dd e1 	. . 
	ld a,(ix-001h)		;1a70	dd 7e ff 	. ~ . 
	ld (disk_unit),a		;1a73	32 1e 1c 	2 . . 
	ld h,(ix-005h)		;1a76	dd 66 fb 	. f . 
	ld l,(ix-006h)		;1a79	dd 6e fa 	. n . 
	call sub_1c1dh		;1a7c	cd 1d 1c 	. . . 
	pop hl			;1a7f	e1 	. 
	ret			;1a80	c9 	. 
bios2_home:
	ld hl,(disk_number)		;1a81	2a 1f 1c 	* . . 
	ld h,000h		;1a84	26 00 	& . 
	add hl,hl			;1a86	29 	) 
	ld de,drive_mapping		;1a87	11 83 f5 	. . . 
	add hl,de			;1a8a	19 	. 
	ld a,(hl)			;1a8b	7e 	~ 
	inc hl			;1a8c	23 	# 
	ld h,(hl)			;1a8d	66 	f 
	ld l,a			;1a8e	6f 	o 
	push hl			;1a8f	e5 	. 
	pop ix		;1a90	dd e1 	. . 
	ld h,(ix-00bh)		;1a92	dd 66 f5 	. f . 
	ld l,(ix-00ch)		;1a95	dd 6e f4 	. n . 
	jp (hl)			;1a98	e9 	. 
bios2_settrk:
	ld (disk_track),bc		;1a99	ed 43 20 1c 	. C   . 
	ret			;1a9d	c9 	. 
bios2_setsec:
	ld (disk_sector),bc		;1a9e	ed 43 22 1c 	. C " . 
	ret			;1aa2	c9 	. 
bios2_sectrn:
	ld h,b			;1aa3	60 	` 
	ld l,c			;1aa4	69 	i 
	ret			;1aa5	c9 	. 
bios2_setdma:
	ld (disk_dma),bc		;1aa6	ed 43 24 1c 	. C $ . 
	ret			;1aaa	c9 	. 
bios2_read:
	ld hl,(disk_number)		;1aab	2a 1f 1c 	* . . 
	ld h,000h		;1aae	26 00 	& . 
	add hl,hl			;1ab0	29 	) 
	ld de,drive_mapping		;1ab1	11 83 f5 	. . . 
	add hl,de			;1ab4	19 	. 
	ld a,(hl)			;1ab5	7e 	~ 
	inc hl			;1ab6	23 	# 
	ld h,(hl)			;1ab7	66 	f 
	ld l,a			;1ab8	6f 	o 
	push hl			;1ab9	e5 	. 
	pop ix		;1aba	dd e1 	. . 
	ld h,(ix-007h)		;1abc	dd 66 f9 	. f . 
	ld l,(ix-008h)		;1abf	dd 6e f8 	. n . 
	jp l1adch		;1ac2	c3 dc 1a 	. . . 
bios2_write:
	ld hl,(disk_number)		;1ac5	2a 1f 1c 	* . . 
	ld h,000h		;1ac8	26 00 	& . 
	add hl,hl			;1aca	29 	) 
	ld de,drive_mapping		;1acb	11 83 f5 	. . . 
	add hl,de			;1ace	19 	. 
	ld a,(hl)			;1acf	7e 	~ 
	inc hl			;1ad0	23 	# 
	ld h,(hl)			;1ad1	66 	f 
	ld l,a			;1ad2	6f 	o 
	push hl			;1ad3	e5 	. 
	pop ix		;1ad4	dd e1 	. . 
	ld h,(ix-009h)		;1ad6	dd 66 f7 	. f . 
	ld l,(ix-00ah)		;1ad9	dd 6e f6 	. n . 
l1adch:
	ld a,(ix-001h)		;1adc	dd 7e ff 	. ~ . 
	ld (disk_unit),a		;1adf	32 1e 1c 	2 . . 
	push ix		;1ae2	dd e5 	. . 
	pop de			;1ae4	d1 	. 
	jp (hl)			;1ae5	e9 	. 
sub_1ae6h:
	call sub_1b49h		;1ae6	cd 49 1b 	. I . 
	ld hl,l1b9eh		;1ae9	21 9e 1b 	! . . 
	cp 005h		;1aec	fe 05 	. . 
	jr z,l1afah		;1aee	28 0a 	( . 
	ld hl,l1b87h		;1af0	21 87 1b 	! . . 
	cp 004h		;1af3	fe 04 	. . 
	jr z,l1afah		;1af5	28 03 	( . 
	ld hl,l1b92h		;1af7	21 92 1b 	! . . 
l1afah:
	call print_string		;1afa	cd 66 33 	. f 3 
	ld hl,l1bcfh		;1afd	21 cf 1b 	! . . 
	call sub_1b67h		;1b00	cd 67 1b 	. g . 
	cp 041h		;1b03	fe 41 	. A 
	ret nz			;1b05	c0 	. 
l1b06h:
	xor a			;1b06	af 	. 
	call write_dskbyte		;1b07	cd ab f2 	. . . 
	jp bios2_wboot		;1b0a	c3 76 1d 	. v . 
l1b0dh:
	ld a,(sys_page_err_diag)		;1b0d	3a 62 2c 	: b , 
	or a			;1b10	b7 	. 
	jr z,l1b2ah		;1b11	28 17 	( . 
	call sub_1b49h		;1b13	cd 49 1b 	. I . 
	ld hl,l1ba8h		;1b16	21 a8 1b 	! . . 
	call print_string		;1b19	cd 66 33 	. f 3 
	ld hl,l1bf8h		;1b1c	21 f8 1b 	! . . 
	call sub_1b67h		;1b1f	cd 67 1b 	. g . 
	cp 041h		;1b22	fe 41 	. A 
	jr z,l1b06h		;1b24	28 e0 	( . 
	cp 043h		;1b26	fe 43 	. C 
	jr nz,l1b0dh		;1b28	20 e3 	  . 
l1b2ah:
	ld hl,00000h		;1b2a	21 00 00 	! . . 
	ret			;1b2d	c9 	. 
l1b2eh:
	ld a,(sys_page_err_diag)		;1b2e	3a 62 2c 	: b , 
	or a			;1b31	b7 	. 
	jr z,l1b2ah		;1b32	28 f6 	( . 
	call sub_1b49h		;1b34	cd 49 1b 	. I . 
	ld hl,l1bb5h		;1b37	21 b5 1b 	! . . 
	call print_string		;1b3a	cd 66 33 	. f 3 
	ld hl,l1c10h		;1b3d	21 10 1c 	! . . 
	call sub_1b67h		;1b40	cd 67 1b 	. g . 
	cp 041h		;1b43	fe 41 	. A 
	jr z,l1b06h		;1b45	28 bf 	( . 
	jr l1b2eh		;1b47	18 e5 	. . 
sub_1b49h:
	push af			;1b49	f5 	. 
	ld a,(l1f98h)		;1b4a	3a 98 1f 	: . . 
	or a			;1b4d	b7 	. 
	jr z,l1b57h		;1b4e	28 07 	( . 
	xor a			;1b50	af 	. 
	ld (l1f98h),a		;1b51	32 98 1f 	2 . . 
	ld a,b			;1b54	78 	x 
	jr l1b5ah		;1b55	18 03 	. . 
l1b57h:
	ld a,(disk_number)		;1b57	3a 1f 1c 	: . . 
l1b5ah:
	add a,041h		;1b5a	c6 41 	. A 
	ld (l1b82h),a		;1b5c	32 82 1b 	2 . . 
	ld hl,l1b78h		;1b5f	21 78 1b 	! x . 
	call sub_3358h		;1b62	cd 58 33 	. X 3 
	pop af			;1b65	f1 	. 
	ret			;1b66	c9 	. 
sub_1b67h:
	call print_string		;1b67	cd 66 33 	. f 3 
	call sub_a020h		;1b6a	cd 20 a0 	.   . 
	call bios2_conin		;1b6d	cd d6 19 	. . . 
	push af			;1b70	f5 	. 
	call sub_3372h		;1b71	cd 72 33 	. r 3 
	pop af			;1b74	f1 	. 
	and 0dfh		;1b75	e6 df 	. . 
	ret			;1b77	c9 	. 
l1b78h:
	defb 007h		;1b78	07 	. 
	defb 01bh		;1b79	1b 	. 
	defb 06ah		;1b7a	6a 	j 
	defb 020h		;1b7b	20 	  
	defb 044h		;1b7c	44 	D 
	defb 072h		;1b7d	72 	r 
	defb 069h		;1b7e	69 	i 
	defb 076h		;1b7f	76 	v 
	defb 065h		;1b80	65 	e 
	defb 020h		;1b81	20 	  
l1b82h:
	defb 041h		;1b82	41 	A 
	defb 020h		;1b83	20 	  
	defb 02dh		;1b84	2d 	- 
	defb 020h		;1b85	20 	  
	defb 000h		;1b86	00 	. 
l1b87h:
	defb 053h		;1b87	53 	S 
	defb 065h		;1b88	65 	e 
	defb 065h		;1b89	65 	e 
	defb 06bh		;1b8a	6b 	k 
	defb 020h		;1b8b	20 	  
	defb 045h		;1b8c	45 	E 
	defb 072h		;1b8d	72 	r 
	defb 072h		;1b8e	72 	r 
	defb 06fh		;1b8f	6f 	o 
	defb 072h		;1b90	72 	r 
	defb 000h		;1b91	00 	. 
l1b92h:
	defb 052h		;1b92	52 	R 
	defb 064h		;1b93	64 	d 
	defb 02fh		;1b94	2f 	/ 
	defb 057h		;1b95	57 	W 
	defb 072h		;1b96	72 	r 
	defb 020h		;1b97	20 	  
	defb 045h		;1b98	45 	E 
	defb 072h		;1b99	72 	r 
	defb 072h		;1b9a	72 	r 
	defb 06fh		;1b9b	6f 	o 
	defb 072h		;1b9c	72 	r 
	defb 000h		;1b9d	00 	. 
l1b9eh:
	defb 04eh		;1b9e	4e 	N 
	defb 06fh		;1b9f	6f 	o 
	defb 074h		;1ba0	74 	t 
	defb 020h		;1ba1	20 	  
	defb 052h		;1ba2	52 	R 
	defb 065h		;1ba3	65 	e 
	defb 061h		;1ba4	61 	a 
	defb 064h		;1ba5	64 	d 
	defb 079h		;1ba6	79 	y 
	defb 000h		;1ba7	00 	. 
l1ba8h:
	defb 053h		;1ba8	53 	S 
	defb 065h		;1ba9	65 	e 
	defb 06ch		;1baa	6c 	l 
	defb 065h		;1bab	65 	e 
	defb 063h		;1bac	63 	c 
	defb 074h		;1bad	74 	t 
	defb 020h		;1bae	20 	  
	defb 045h		;1baf	45 	E 
	defb 072h		;1bb0	72 	r 
	defb 072h		;1bb1	72 	r 
	defb 06fh		;1bb2	6f 	o 
	defb 072h		;1bb3	72 	r 
	defb 000h		;1bb4	00 	. 
l1bb5h:
	defb 049h		;1bb5	49 	I 
	defb 06ch		;1bb6	6c 	l 
	defb 06ch		;1bb7	6c 	l 
	defb 065h		;1bb8	65 	e 
	defb 067h		;1bb9	67 	g 
	defb 061h		;1bba	61 	a 
	defb 06ch		;1bbb	6c 	l 
	defb 020h		;1bbc	20 	  
	defb 044h		;1bbd	44 	D 
	defb 072h		;1bbe	72 	r 
	defb 069h		;1bbf	69 	i 
	defb 076h		;1bc0	76 	v 
	defb 065h		;1bc1	65 	e 
	defb 020h		;1bc2	20 	  
	defb 044h		;1bc3	44 	D 
	defb 065h		;1bc4	65 	e 
	defb 073h		;1bc5	73 	s 
	defb 069h		;1bc6	69 	i 
	defb 067h		;1bc7	67 	g 
	defb 06eh		;1bc8	6e 	n 
	defb 061h		;1bc9	61 	a 
	defb 074h		;1bca	74 	t 
	defb 069h		;1bcb	69 	i 
	defb 06fh		;1bcc	6f 	o 
	defb 06eh		;1bcd	6e 	n 
	defb 000h		;1bce	00 	. 
l1bcfh:
	defb 03ah		;1bcf	3a 	: 
	defb 020h		;1bd0	20 	  
	defb 028h		;1bd1	28 	( 
	defb 052h		;1bd2	52 	R 
	defb 029h		;1bd3	29 	) 
	defb 065h		;1bd4	65 	e 
	defb 074h		;1bd5	74 	t 
	defb 072h		;1bd6	72 	r 
	defb 079h		;1bd7	79 	y 
	defb 02fh		;1bd8	2f 	/ 
	defb 028h		;1bd9	28 	( 
	defb 041h		;1bda	41 	A 
	defb 029h		;1bdb	29 	) 
	defb 062h		;1bdc	62 	b 
	defb 06fh		;1bdd	6f 	o 
	defb 072h		;1bde	72 	r 
	defb 074h		;1bdf	74 	t 
	defb 02fh		;1be0	2f 	/ 
	defb 028h		;1be1	28 	( 
	defb 043h		;1be2	43 	C 
	defb 029h		;1be3	29 	) 
	defb 06fh		;1be4	6f 	o 
	defb 06eh		;1be5	6e 	n 
	defb 074h		;1be6	74 	t 
	defb 069h		;1be7	69 	i 
	defb 06eh		;1be8	6e 	n 
	defb 075h		;1be9	75 	u 
	defb 065h		;1bea	65 	e 
	defb 02fh		;1beb	2f 	/ 
	defb 028h		;1bec	28 	( 
	defb 049h		;1bed	49 	I 
	defb 029h		;1bee	29 	) 
	defb 067h		;1bef	67 	g 
	defb 06eh		;1bf0	6e 	n 
	defb 06fh		;1bf1	6f 	o 
	defb 072h		;1bf2	72 	r 
	defb 065h		;1bf3	65 	e 
	defb 020h		;1bf4	20 	  
	defb 01bh		;1bf5	1b 	. 
	defb 06bh		;1bf6	6b 	k 
	defb 000h		;1bf7	00 	. 
l1bf8h:
	defb 03ah		;1bf8	3a 	: 
	defb 020h		;1bf9	20 	  
	defb 028h		;1bfa	28 	( 
	defb 041h		;1bfb	41 	A 
	defb 029h		;1bfc	29 	) 
	defb 062h		;1bfd	62 	b 
	defb 06fh		;1bfe	6f 	o 
	defb 072h		;1bff	72 	r 
l1c00h:
	defb 074h		;1c00	74 	t 
	defb 02fh		;1c01	2f 	/ 
l1c02h:
	defb 028h		;1c02	28 	( 
	defb 043h		;1c03	43 	C 
	defb 029h		;1c04	29 	) 
	defb 06fh		;1c05	6f 	o 
	defb 06eh		;1c06	6e 	n 
	defb 074h		;1c07	74 	t 
	defb 069h		;1c08	69 	i 
	defb 06eh		;1c09	6e 	n 
	defb 075h		;1c0a	75 	u 
	defb 065h		;1c0b	65 	e 
	defb 020h		;1c0c	20 	  
	defb 01bh		;1c0d	1b 	. 
	defb 06bh		;1c0e	6b 	k 
	defb 000h		;1c0f	00 	. 
l1c10h:
	defb 03ah		;1c10	3a 	: 
	defb 020h		;1c11	20 	  
	defb 028h		;1c12	28 	( 
	defb 041h		;1c13	41 	A 
	defb 029h		;1c14	29 	) 
	defb 062h		;1c15	62 	b 
	defb 06fh		;1c16	6f 	o 
	defb 072h		;1c17	72 	r 
	defb 074h		;1c18	74 	t 
	defb 020h		;1c19	20 	  
	defb 01bh		;1c1a	1b 	. 
	defb 06bh		;1c1b	6b 	k 
	defb 000h		;1c1c	00 	. 
sub_1c1dh:
	jp (hl)			;1c1d	e9 	. 
disk_unit:
	defb 000h		;1c1e	00 	. 
disk_number:
	defb 000h		;1c1f	00 	. 
disk_track:
	defw 00000h		;1c20	00 00 	. . 
disk_sector:
	defw 00000h		;1c22	00 00 	. . 
disk_dma:
	defw 00000h		;1c24	00 00 	. . 
l1c26h:
	defb 000h		;1c26	00 	. 
l1c27h:
	defb 000h		;1c27	00 	. 
	defb 001h		;1c28	01 	. 
	defb 000h		;1c29	00 	. 
	defb 00ch		;1c2a	0c 	. 
	defb 000h		;1c2b	00 	. 
	defb 000h		;1c2c	00 	. 
	defb 000h		;1c2d	00 	. 
	defb 000h		;1c2e	00 	. 
	defb 000h		;1c2f	00 	. 
	defb 000h		;1c30	00 	. 
	defb 000h		;1c31	00 	. 
	defb 000h		;1c32	00 	. 
	defb 000h		;1c33	00 	. 
	defb 000h		;1c34	00 	. 
	defb 000h		;1c35	00 	. 
	defb 000h		;1c36	00 	. 
	defb 000h		;1c37	00 	. 
	defb 000h		;1c38	00 	. 
	defb 000h		;1c39	00 	. 
	defb 000h		;1c3a	00 	. 
	defb 000h		;1c3b	00 	. 
	defb 000h		;1c3c	00 	. 
	defb 000h		;1c3d	00 	. 
	defb 000h		;1c3e	00 	. 
	defb 000h		;1c3f	00 	. 
	defb 000h		;1c40	00 	. 
	defb 000h		;1c41	00 	. 
	defb 000h		;1c42	00 	. 
	defb 000h		;1c43	00 	. 
l1c44h:
	nop			;1c44	00 	. 
	nop			;1c45	00 	. 
	nop			;1c46	00 	. 
sub_1c47h:
	nop			;1c47	00 	. 
	nop			;1c48	00 	. 
	nop			;1c49	00 	. 
sub_1c4ah:
	nop			;1c4a	00 	. 
	nop			;1c4b	00 	. 
	nop			;1c4c	00 	. 
sub_1c4dh:
	nop			;1c4d	00 	. 
	nop			;1c4e	00 	. 
	nop			;1c4f	00 	. 
sub_1c50h:
	nop			;1c50	00 	. 
	nop			;1c51	00 	. 
	nop			;1c52	00 	. 
sub_1c53h:
	nop			;1c53	00 	. 
	nop			;1c54	00 	. 
	nop			;1c55	00 	. 
sub_1c56h:
	nop			;1c56	00 	. 
	nop			;1c57	00 	. 
	nop			;1c58	00 	. 
bios2_boot:
	di			;1c59	f3 	. 
	ld sp,00000h		;1c5a	31 00 00 	1 . . 
	ld a,081h		;1c5d	3e 81 	> . 
	call write_iobyte		;1c5f	cd 85 f2 	. . . 
	xor a			;1c62	af 	. 
	call write_dskbyte		;1c63	cd ab f2 	. . . 
	ld a,00ah		;1c66	3e 0a 	> . 
	out (03dh),a		;1c68	d3 3d 	. = 
	ld a,02bh		;1c6a	3e 2b 	> + 
	out (03ch),a		;1c6c	d3 3c 	. < 
	ld a,00bh		;1c6e	3e 0b 	> . 
	out (03dh),a		;1c70	d3 3d 	. = 
	ld a,01ah		;1c72	3e 1a 	> . 
	out (03ch),a		;1c74	d3 3c 	. < 
	ld a,00ch		;1c76	3e 0c 	> . 
	out (03dh),a		;1c78	d3 3d 	. = 
	in a,(03ch)		;1c7a	db 3c 	. < 
	ld hl,00d00h		;1c7c	21 00 0d 	! . . 
	ld a,0b6h		;1c7f	3e b6 	> . 
	out (007h),a		;1c81	d3 07 	. . 
	ld a,h			;1c83	7c 	| 
	out (006h),a		;1c84	d3 06 	. . 
	ld a,l			;1c86	7d 	} 
	out (006h),a		;1c87	d3 06 	. . 
	ld a,018h		;1c89	3e 18 	> . 
	out (013h),a		;1c8b	d3 13 	. . 
	nop			;1c8d	00 	. 
	nop			;1c8e	00 	. 
	ld hl,l3162h		;1c8f	21 62 31 	! b 1 
	ld b,00bh		;1c92	06 0b 	. . 
	ld c,013h		;1c94	0e 13 	. . 
	otir		;1c96	ed b3 	. . 
	ld a,018h		;1c98	3e 18 	> . 
	out (012h),a		;1c9a	d3 12 	. . 
	nop			;1c9c	00 	. 
	nop			;1c9d	00 	. 
	ld hl,l1e27h		;1c9e	21 27 1e 	! ' . 
	ld b,00ah		;1ca1	06 0a 	. . 
	ld c,012h		;1ca3	0e 12 	. . 
	otir		;1ca5	ed b3 	. . 
	call sub_178fh		;1ca7	cd 8f 17 	. . . 
	call 0f580h		;1caa	cd 80 f5 	. . . 
	call sub_17aeh		;1cad	cd ae 17 	. . . 
	call sub_17b4h		;1cb0	cd b4 17 	. . . 
	call sub_1df5h		;1cb3	cd f5 1d 	. . . 
	call sub_1e08h		;1cb6	cd 08 1e 	. . . 
	call read_scan_code_tbl		;1cb9	cd 79 21 	. y ! 
	call read_custom_func_key_tbl		;1cbc	cd 6b 22 	. k " 
	call read_custom_font		;1cbf	cd c6 20 	. .   
	ld de,00100h		;1cc2	11 00 01 	. . . 
	ld bc,00300h		;1cc5	01 00 03 	. . . 
	ld hl,lb83eh		;1cc8	21 3e b8 	! > . 
	xor a			;1ccb	af 	. 
	call sub_b5bah		;1ccc	cd ba b5 	. . . 
	ld a,(lb8bdh)		;1ccf	3a bd b8 	: . . 
	cp 05ah		;1cd2	fe 5a 	. Z 
	jr nz,l1cf5h		;1cd4	20 1f 	  . 
	ld hl,lb854h		;1cd6	21 54 b8 	! T . 
	ld a,(hl)			;1cd9	7e 	~ 
	cp 032h		;1cda	fe 32 	. 2 
	jr nz,l1cf5h		;1cdc	20 17 	  . 
	inc hl			;1cde	23 	# 
	ld a,(hl)			;1cdf	7e 	~ 
	cp 032h		;1ce0	fe 32 	. 2 
	jr nz,l1cf5h		;1ce2	20 11 	  . 
	inc hl			;1ce4	23 	# 
	ld a,(hl)			;1ce5	7e 	~ 
	cp 030h		;1ce6	fe 30 	. 0 
	jr nz,l1cf5h		;1ce8	20 0b 	  . 
	ld hl,lb83eh		;1cea	21 3e b8 	! > . 
	ld de,sys_page_eyeball		;1ced	11 48 2c 	. H , 
	ld bc,00080h		;1cf0	01 80 00 	. . . 
	ldir		;1cf3	ed b0 	. . 
l1cf5h:
	ld b,000h		;1cf5	06 00 	. . 
	call set_viewport		;1cf7	cd d9 23 	. . # 
	ld hl,l2d8fh		;1cfa	21 8f 2d 	! . - 
	call print_string		;1cfd	cd 66 33 	. f 3 
	ld a,(sys_page_auto_boot)		;1d00	3a 6e 2c 	: n , 
	or a			;1d03	b7 	. 
	jr z,l1d28h		;1d04	28 22 	( " 
	ld bc,00100h		;1d06	01 00 01 	. . . 
	call setup_banked_copy		;1d09	cd 44 f3 	. D . 
	ld hl,sys_page_auto_len		;1d0c	21 a8 2c 	! . , 
	ld a,(sys_page_auto_len)		;1d0f	3a a8 2c 	: . , 
	or a			;1d12	b7 	. 
	jr z,l1d1ah		;1d13	28 05 	( . 
	ld c,a			;1d15	4f 	O 
	ld b,000h		;1d16	06 00 	. . 
	inc bc			;1d18	03 	. 
	add hl,bc			;1d19	09 	. 
l1d1ah:
	xor a			;1d1a	af 	. 
	ld (hl),a			;1d1b	77 	w 
	ld hl,sys_page_auto_len		;1d1c	21 a8 2c 	! . , 
	ld de,0da07h		;1d1f	11 07 da 	. . . 
	ld bc,0001ah		;1d22	01 1a 00 	. . . 
	call copy_memblock		;1d25	cd 4e f3 	. N . 
l1d28h:
	ld a,(sys_page_iobyte)		;1d28	3a 68 2c 	: h , 
	call write_iobyte		;1d2b	cd 85 f2 	. . . 
	ld b,005h		;1d2e	06 05 	. . 
	ld hl,lb83ch		;1d30	21 3c b8 	! < . 
	ld a,(sys_page_err_recovery)		;1d33	3a 61 2c 	: a , 
	or a			;1d36	b7 	. 
	jr nz,l1d3bh		;1d37	20 02 	  . 
	ld b,001h		;1d39	06 01 	. . 
l1d3bh:
	ld (hl),b			;1d3b	70 	p 
	call sub_3235h		;1d3c	cd 35 32 	. 5 2 
	call sub_30d4h		;1d3f	cd d4 30 	. . 0 
	ld a,(sys_page_sio_pro)		;1d42	3a 6a 2c 	: j , 
	or a			;1d45	b7 	. 
	jr z,l1d56h		;1d46	28 0e 	( . 
	cp 003h		;1d48	fe 03 	. . 
	jr nz,l1d56h		;1d4a	20 0a 	  . 
	ld a,011h		;1d4c	3e 11 	> . 
	ld (l316dh),a		;1d4e	32 6d 31 	2 m 1 
	ld a,013h		;1d51	3e 13 	> . 
	ld (l316eh),a		;1d53	32 6e 31 	2 n 1 
l1d56h:
	ld a,(sys_page_func_tbl)		;1d56	3a 72 2c 	: r , 
	call select_func_key_tbl		;1d59	cd 8a 21 	. . ! 
	ld a,001h		;1d5c	3e 01 	> . 
	ld (sys_page_ram_disk),a		;1d5e	32 73 2c 	2 s , 
	call sub_b283h		;1d61	cd 83 b2 	. . . 
	call sub_b2d1h		;1d64	cd d1 b2 	. . . 
	xor a			;1d67	af 	. 
	ld (sys_page_disk_format),a		;1d68	32 75 2c 	2 u , 
	call sub_b2fbh		;1d6b	cd fb b2 	. . . 
	call sub_1e14h		;1d6e	cd 14 1e 	. . . 
	ei			;1d71	fb 	. 
	nop			;1d72	00 	. 
	jp l1de7h		;1d73	c3 e7 1d 	. . . 
bios2_wboot:
	ld sp,00000h		;1d76	31 00 00 	1 . . 
	call flush_floppy_buffer		;1d79	cd b3 b5 	. . . 
	ld hl,0ffffh		;1d7c	21 ff ff 	! . . 
	ld (lba4eh),hl		;1d7f	22 4e ba 	" N . 
	ld a,0ffh		;1d82	3e ff 	> . 
	ld (l231dh),a		;1d84	32 1d 23 	2 . # 
	ld (l231eh),a		;1d87	32 1e 23 	2 . # 
	ld a,(l2d8eh)		;1d8a	3a 8e 2d 	: . - 
	or a			;1d8d	b7 	. 
	jr z,l1d9ch		;1d8e	28 0c 	( . 
	xor a			;1d90	af 	. 
	ld (l2d8eh),a		;1d91	32 8e 2d 	2 . - 
	ld a,001h		;1d94	3e 01 	> . 
	ld (sys_page_ram_disk),a		;1d96	32 73 2c 	2 s , 
	call mem_disk_init		;1d99	cd 22 fa 	. " . 
l1d9ch:
	xor a			;1d9c	af 	. 
	ld (lba44h),a		;1d9d	32 44 ba 	2 D . 
	ld (lba46h),a		;1da0	32 46 ba 	2 F . 
	ld a,08fh		;1da3	3e 8f 	> . 
	ld (l3da5h),a		;1da5	32 a5 3d 	2 . = 
	call sub_1c4ah		;1da8	cd 4a 1c 	. J . 
	ld c,01bh		;1dab	0e 1b 	. . 
	call l1c44h		;1dad	cd 44 1c 	. D . 
	ld c,058h		;1db0	0e 58 	. X 
	call l1c44h		;1db2	cd 44 1c 	. D . 
	ld c,045h		;1db5	0e 45 	. E 
	call l1c44h		;1db7	cd 44 1c 	. D . 
	call detach_mterm_int		;1dba	cd fc 24 	. . $ 
	call 0f581h		;1dbd	cd 81 f5 	. . . 
	call sub_1df5h		;1dc0	cd f5 1d 	. . . 
	ld hl,l1603h		;1dc3	21 03 16 	! . . 
	ld de,bios_vector		;1dc6	11 00 f0 	. . . 
	ld bc,(bios_vector_length)		;1dc9	ed 4b 60 16 	. K ` . 
	ldir		;1dcd	ed b0 	. . 
	ld a,000h		;1dcf	3e 00 	> . 
	ld (l3248h),a		;1dd1	32 48 32 	2 H 2 
	ld a,(l2282h)		;1dd4	3a 82 22 	: . " 
	or a			;1dd7	b7 	. 
	jr z,l1de7h		;1dd8	28 0d 	( . 
	call restore_scan_code_tbl		;1dda	cd 4a 21 	. J ! 
	call restore_sel_func_key_tbl		;1ddd	cd fe 21 	. . ! 
	call restore_func_key_tbl_ptr		;1de0	cd b4 21 	. . ! 
	xor a			;1de3	af 	. 
	ld (l2282h),a		;1de4	32 82 22 	2 . " 
l1de7h:
	ld bc,00080h		;1de7	01 80 00 	. . . 
	call bios2_setdma		;1dea	cd a6 1a 	. . . 
	ld a,000h		;1ded	3e 00 	> . 
	ld (0f4efh),a		;1def	32 ef f4 	2 . . 
	jp launch_ccp		;1df2	c3 f0 f4 	. . . 
sub_1df5h:
	ld bc,00100h		;1df5	01 00 01 	. . . 
	call setup_banked_copy		;1df8	cd 44 f3 	. D . 
	ld hl,00000h		;1dfb	21 00 00 	! . . 
	ld de,0da00h		;1dfe	11 00 da 	. . . 
	ld bc,00806h		;1e01	01 06 08 	. . . 
	call copy_memblock		;1e04	cd 4e f3 	. N . 
	ret			;1e07	c9 	. 
sub_1e08h:
	ld hl,00800h		;1e08	21 00 08 	! . . 
	ld de,0e200h		;1e0b	11 00 e2 	. . . 
	ld bc,00e00h		;1e0e	01 00 0e 	. . . 
	ldir		;1e11	ed b0 	. . 
	ret			;1e13	c9 	. 
sub_1e14h:
	ld hl,0e4d7h		;1e14	21 d7 e4 	! . . 
	ld de,sub_f510h		;1e17	11 10 f5 	. . . 
	ld (hl),e			;1e1a	73 	s 
	inc hl			;1e1b	23 	# 
	ld (hl),d			;1e1c	72 	r 
	ld hl,0e4dbh		;1e1d	21 db e4 	! . . 
	ld de,sub_f520h		;1e20	11 20 f5 	.   . 
	ld (hl),e			;1e23	73 	s 
	inc hl			;1e24	23 	# 
	ld (hl),d			;1e25	72 	r 
	ret			;1e26	c9 	. 
l1e27h:
	defb 014h		;1e27	14 	. 
	defb 037h		;1e28	37 	7 
	defb 003h		;1e29	03 	. 
	defb 0e1h		;1e2a	e1 	. 
	defb 005h		;1e2b	05 	. 
	defb 0eah		;1e2c	ea 	. 
	defb 002h		;1e2d	02 	. 
	defb 000h		;1e2e	00 	. 
	defb 001h		;1e2f	01 	. 
	defb 010h		;1e30	10 	. 
bios2_qxfunc:
	ex af,af'			;1e31	08 	. 
	ld a,(qxfunc_count)		;1e32	3a d9 1e 	: . . 
	cp c			;1e35	b9 	. 
	jp c,l1e4bh		;1e36	da 4b 1e 	. K . 
	ld a,c			;1e39	79 	y 
	add a,c			;1e3a	81 	. 
	exx			;1e3b	d9 	. 
	ld e,a			;1e3c	5f 	_ 
	ld d,000h		;1e3d	16 00 	. . 
	ld hl,qxfunc_vector		;1e3f	21 4d 1e 	! M . 
	add hl,de			;1e42	19 	. 
	ld a,(hl)			;1e43	7e 	~ 
	inc hl			;1e44	23 	# 
	ld h,(hl)			;1e45	66 	f 
	ld l,a			;1e46	6f 	o 
	push hl			;1e47	e5 	. 
	exx			;1e48	d9 	. 
	ex af,af'			;1e49	08 	. 
	ret			;1e4a	c9 	. 
l1e4bh:
	xor a			;1e4b	af 	. 
	ret			;1e4c	c9 	. 
qxfunc_vector:
	defw floppy_drive_function		;1e4d	da 1e 	. . 
	defw flush_floppy_buffer		;1e4f	b3 b5 	. . 
	defw disk_error_reporting		;1e51	7c 1f 	| . 
	defw get_drvtbl_address		;1e53	99 1f 	. . 
	defw set_foreign_disk_fmt		;1e55	9d 1f 	. . 
	defw get_sys_data_page		;1e57	b2 1f 	. . 
	defw update_sys_data_page		;1e59	c5 1f 	. . 
	defw put_sys_data_page		;1e5b	67 20 	g   
	defw get_time		;1e5d	76 20 	v   
	defw put_time		;1e5f	91 20 	.   
	defw qxfunc_notimpl		;1e61	05 25 	. % 
	defw qxfunc_notimpl		;1e63	05 25 	. % 
	defw qxfunc_notimpl		;1e65	05 25 	. % 
	defw load_font		;1e67	aa 20 	.   
	defw select_font		;1e69	bf 20 	.   
	defw read_custom_font		;1e6b	c6 20 	.   
	defw write_custom_font		;1e6d	d3 20 	.   
	defw save_font_number		;1e6f	fb 20 	.   
	defw restore_font_number		;1e71	02 21 	. ! 
	defw qxfunc_notimpl		;1e73	05 25 	. % 
	defw get_scan_code_tbl		;1e75	12 21 	. ! 
	defw put_scan_code_tbl		;1e77	25 21 	% ! 
	defw save_scan_code_tbl		;1e79	39 21 	9 ! 
	defw restore_scan_code_tbl		;1e7b	4a 21 	J ! 
	defw get_scan_character		;1e7d	5b 21 	[ ! 
	defw put_scan_character		;1e7f	60 21 	` ! 
	defw read_scan_code_tbl		;1e81	79 21 	y ! 
	defw write_scan_code_tbl		;1e83	86 21 	. ! 
	defw qxfunc_notimpl		;1e85	05 25 	. % 
	defw qxfunc_notimpl		;1e87	05 25 	. % 
	defw select_func_key_tbl		;1e89	8a 21 	. ! 
	defw save_func_key_tbl_ptr		;1e8b	a7 21 	. ! 
	defw restore_func_key_tbl_ptr		;1e8d	b4 21 	. ! 
	defw get_sel_func_key_tbl		;1e8f	c5 21 	. ! 
	defw put_sel_func_key_tbl		;1e91	d8 21 	. ! 
	defw save_sel_func_key_tbl		;1e93	ed 21 	. ! 
	defw restore_sel_func_key_tbl		;1e95	fe 21 	. ! 
	defw get_function_key		;1e97	10 22 	. " 
	defw put_function_key		;1e99	23 22 	# " 
	defw disable_system_key		;1e9b	54 22 	T " 
	defw enable_system_key		;1e9d	5a 22 	Z " 
	defw read_custom_func_key_tbl		;1e9f	6b 22 	k " 
	defw write_custom_func_key_tbl		;1ea1	78 22 	x " 
	defw enable_keyboard_reset_at_wboot		;1ea3	7c 22 	| " 
	defw perform_warm_boot		;1ea5	83 22 	. " 
	defw qxfunc_notimpl		;1ea7	05 25 	. % 
	defw request_memory_bank		;1ea9	96 22 	. " 
	defw release_memory_bank		;1eab	d3 22 	. " 
	defw move_block_to_bank		;1ead	1f 23 	. # 
	defw call_code_in_bank		;1eaf	72 23 	r # 
	defw jump_to_code_in_bank		;1eb1	b1 23 	. # 
	defw display_ram_disk_overwrite		;1eb3	b9 23 	. # 
	defw qxfunc_notimpl		;1eb5	05 25 	. % 
	defw qxfunc_notimpl		;1eb7	05 25 	. % 
	defw pixel_set_reset		;1eb9	ef 4c 	. L 
	defw set_viewport		;1ebb	d9 23 	. # 
	defw qxfunc_notimpl		;1ebd	05 25 	. % 
	defw qxfunc_notimpl		;1ebf	05 25 	. % 
	defw qxfunc_notimpl		;1ec1	05 25 	. % 
	defw qxfunc_notimpl		;1ec3	05 25 	. % 
	defw set_user_int_vector		;1ec5	53 24 	S $ 
	defw clear_user_int_vector		;1ec7	8a 24 	. $ 
	defw get_int_mask		;1ec9	94 24 	. $ 
	defw enable_int		;1ecb	9f 24 	. $ 
	defw disable_int		;1ecd	c0 24 	. $ 
	defw get_user_common_area		;1ecf	dd 24 	. $ 
	defw attach_mterm_int		;1ed1	e4 24 	. $ 
	defw detach_mterm_int		;1ed3	fc 24 	. $ 
	defw qxfunc_notimpl		;1ed5	05 25 	. % 
	defw qxfunc_notimpl		;1ed7	05 25 	. % 
qxfunc_count:
	defb 046h		;1ed9	46 	F 
floppy_drive_function:
	ld (l1f68h),a		;1eda	32 68 1f 	2 h . 
	ld bc,00006h		;1edd	01 06 00 	. . . 
	call sub_1f69h		;1ee0	cd 69 1f 	. i . 
	ld a,(l2c35h)		;1ee3	3a 35 2c 	: 5 , 
	cp 005h		;1ee6	fe 05 	. . 
	jr nc,l1f67h		;1ee8	30 7d 	0 } 
	cp 003h		;1eea	fe 03 	. . 
	jr nz,l1ef5h		;1eec	20 07 	  . 
	ld a,0feh		;1eee	3e fe 	> . 
	ld (l2c32h),a		;1ef0	32 32 2c 	2 2 , 
	jr l1f25h		;1ef3	18 30 	. 0 
l1ef5h:
	cp 001h		;1ef5	fe 01 	. . 
	jr nz,l1f00h		;1ef7	20 07 	  . 
	ld a,0ffh		;1ef9	3e ff 	> . 
	ld (l2c32h),a		;1efb	32 32 2c 	2 2 , 
	jr l1f25h		;1efe	18 25 	. % 
l1f00h:
	cp 000h		;1f00	fe 00 	. . 
	jr z,l1f25h		;1f02	28 21 	( ! 
	ld a,(0f3d2h)		;1f04	3a d2 f3 	: . . 
	ld c,a			;1f07	4f 	O 
	ld b,000h		;1f08	06 00 	. . 
	call setup_banked_copy		;1f0a	cd 44 f3 	. D . 
	ld de,lb83eh		;1f0d	11 3e b8 	. > . 
	ld hl,(l2c38h)		;1f10	2a 38 2c 	* 8 , 
	ld a,(l2c35h)		;1f13	3a 35 2c 	: 5 , 
	cp 004h		;1f16	fe 04 	. . 
	jr nz,l1f1fh		;1f18	20 05 	  . 
	ld bc,00100h		;1f1a	01 00 01 	. . . 
	jr l1f22h		;1f1d	18 03 	. . 
l1f1fh:
	ld bc,00200h		;1f1f	01 00 02 	. . . 
l1f22h:
	call copy_memblock		;1f22	cd 4e f3 	. N . 
l1f25h:
	ld bc,(l2c34h)		;1f25	ed 4b 34 2c 	. K 4 , 
	ld de,(l2c36h)		;1f29	ed 5b 36 2c 	. [ 6 , 
	ld hl,lb83eh		;1f2d	21 3e b8 	! > . 
	ld a,(l1f68h)		;1f30	3a 68 1f 	: h . 
	call sub_b5bah		;1f33	cd ba b5 	. . . 
	or a			;1f36	b7 	. 
	jp nz,l1f67h		;1f37	c2 67 1f 	. g . 
	ld a,(l2c32h)		;1f3a	3a 32 2c 	: 2 , 
	or a			;1f3d	b7 	. 
	jp z,l1f67h		;1f3e	ca 67 1f 	. g . 
	ld a,(0f3d2h)		;1f41	3a d2 f3 	: . . 
	ld b,a			;1f44	47 	G 
	ld c,000h		;1f45	0e 00 	. . 
	call setup_banked_copy		;1f47	cd 44 f3 	. D . 
	ld de,(l2c38h)		;1f4a	ed 5b 38 2c 	. [ 8 , 
	ld hl,lb83eh		;1f4e	21 3e b8 	! > . 
	ld a,(l2c32h)		;1f51	3a 32 2c 	: 2 , 
	cp 0ffh		;1f54	fe ff 	. . 
	jr z,l1f5dh		;1f56	28 05 	( . 
	ld bc,00100h		;1f58	01 00 01 	. . . 
	jr l1f60h		;1f5b	18 03 	. . 
l1f5dh:
	ld bc,00200h		;1f5d	01 00 02 	. . . 
l1f60h:
	call copy_memblock		;1f60	cd 4e f3 	. N . 
	xor a			;1f63	af 	. 
	ld (l2c32h),a		;1f64	32 32 2c 	2 2 , 
l1f67h:
	ret			;1f67	c9 	. 
l1f68h:
	defb 000h		;1f68	00 	. 
sub_1f69h:
	push bc			;1f69	c5 	. 
	ld a,(0f3d2h)		;1f6a	3a d2 f3 	: . . 
	ld c,a			;1f6d	4f 	O 
	ld b,000h		;1f6e	06 00 	. . 
	call setup_banked_copy		;1f70	cd 44 f3 	. D . 
	ld hl,l2c34h		;1f73	21 34 2c 	! 4 , 
	ex de,hl			;1f76	eb 	. 
	pop bc			;1f77	c1 	. 
	call copy_memblock		;1f78	cd 4e f3 	. N . 
	ret			;1f7b	c9 	. 
disk_error_reporting:
	cp 003h		;1f7c	fe 03 	. . 
	jr c,l1f95h		;1f7e	38 15 	8 . 
	cp 006h		;1f80	fe 06 	. . 
	jr nc,l1f95h		;1f82	30 11 	0 . 
	push af			;1f84	f5 	. 
	ld a,b			;1f85	78 	x 
	cp 010h		;1f86	fe 10 	. . 
	jr nc,l1f94h		;1f88	30 0a 	0 . 
	ld a,001h		;1f8a	3e 01 	> . 
	ld (l1f98h),a		;1f8c	32 98 1f 	2 . . 
	pop af			;1f8f	f1 	. 
	call sub_1ae6h		;1f90	cd e6 1a 	. . . 
	ret			;1f93	c9 	. 
l1f94h:
	pop af			;1f94	f1 	. 
l1f95h:
	ld a,0ffh		;1f95	3e ff 	> . 
	ret			;1f97	c9 	. 
l1f98h:
	defb 000h		;1f98	00 	. 
get_drvtbl_address:
	ld de,drive_mapping		;1f99	11 83 f5 	. . . 
	ret			;1f9c	c9 	. 
set_foreign_disk_fmt:
	push de			;1f9d	d5 	. 
	ld a,(0f3d2h)		;1f9e	3a d2 f3 	: . . 
	ld c,a			;1fa1	4f 	O 
	ld b,000h		;1fa2	06 00 	. . 
	call setup_banked_copy		;1fa4	cd 44 f3 	. D . 
	pop hl			;1fa7	e1 	. 
	ld de,rfloppy_dpb		;1fa8	11 ea f5 	. . . 
	ld bc,0001bh		;1fab	01 1b 00 	. . . 
	call copy_memblock		;1fae	cd 4e f3 	. N . 
	ret			;1fb1	c9 	. 
get_sys_data_page:
	ld a,(0f3d2h)		;1fb2	3a d2 f3 	: . . 
	ld b,a			;1fb5	47 	G 
	ld c,000h		;1fb6	0e 00 	. . 
	call setup_banked_copy		;1fb8	cd 44 f3 	. D . 
	ld hl,sys_page_eyeball		;1fbb	21 48 2c 	! H , 
	ld bc,00080h		;1fbe	01 80 00 	. . . 
	call copy_memblock		;1fc1	cd 4e f3 	. N . 
	ret			;1fc4	c9 	. 
update_sys_data_page:
	ld a,(sys_page_ram_disk)		;1fc5	3a 73 2c 	: s , 
	ld (l2d8dh),a		;1fc8	32 8d 2d 	2 . - 
	ld a,(0f3d2h)		;1fcb	3a d2 f3 	: . . 
	ld c,a			;1fce	4f 	O 
	ld b,000h		;1fcf	06 00 	. . 
	call setup_banked_copy		;1fd1	cd 44 f3 	. D . 
	ld hl,00019h		;1fd4	21 19 00 	! . . 
	add hl,de			;1fd7	19 	. 
	ld de,sys_page_err_recovery		;1fd8	11 61 2c 	. a , 
	ld bc,00067h		;1fdb	01 67 00 	. g . 
	call copy_memblock		;1fde	cd 4e f3 	. N . 
	ld a,(sys_page_func_tbl)		;1fe1	3a 72 2c 	: r , 
	call select_func_key_tbl		;1fe4	cd 8a 21 	. . ! 
	ld a,(l2d8dh)		;1fe7	3a 8d 2d 	: . - 
	ld b,a			;1fea	47 	G 
	ld a,(sys_page_ram_disk)		;1feb	3a 73 2c 	: s , 
	cp b			;1fee	b8 	. 
	jr z,l2027h		;1fef	28 36 	( 6 
	or a			;1ff1	b7 	. 
	jr z,l1ff9h		;1ff2	28 05 	( . 
	call mem_disk_init		;1ff4	cd 22 fa 	. " . 
	jr l2027h		;1ff7	18 2e 	. . 
l1ff9h:
	ld a,(lc050h)		;1ff9	3a 50 c0 	: P . 
	or a			;1ffc	b7 	. 
	jr z,l2027h		;1ffd	28 28 	( ( 
	ld hl,l2d4ah		;1fff	21 4a 2d 	! J - 
	call sub_3358h		;2002	cd 58 33 	. X 3 
	call sub_a020h		;2005	cd 20 a0 	.   . 
	call bios2_conin		;2008	cd d6 19 	. . . 
	push af			;200b	f5 	. 
	call sub_3372h		;200c	cd 72 33 	. r 3 
	pop af			;200f	f1 	. 
	and 0dfh		;2010	e6 df 	. . 
	cp 041h		;2012	fe 41 	. A 
	jp z,l2022h		;2014	ca 22 20 	. "   
	cp 043h		;2017	fe 43 	. C 
	jp nz,l1ff9h		;2019	c2 f9 1f 	. . . 
	xor a			;201c	af 	. 
	ld (lc050h),a		;201d	32 50 c0 	2 P . 
	jr l2027h		;2020	18 05 	. . 
l2022h:
	ld a,001h		;2022	3e 01 	> . 
	ld (sys_page_ram_disk),a		;2024	32 73 2c 	2 s , 
l2027h:
	call read_iobyte		;2027	cd 72 f2 	. r . 
	ld (sys_page_iobyte),a		;202a	32 68 2c 	2 h , 
	ld b,044h		;202d	06 44 	. D 
	ld hl,l3da4h		;202f	21 a4 3d 	! . = 
	ld a,(sys_page_cursor_blink)		;2032	3a 65 2c 	: e , 
	or a			;2035	b7 	. 
	jr nz,l203ah		;2036	20 02 	  . 
	ld b,064h		;2038	06 64 	. d 
l203ah:
	ld (hl),b			;203a	70 	p 
	call sub_1c4ah		;203b	cd 4a 1c 	. J . 
	ld b,005h		;203e	06 05 	. . 
sub_2040h:
	ld hl,lb83ch		;2040	21 3c b8 	! < . 
	ld a,(sys_page_err_recovery)		;2043	3a 61 2c 	: a , 
	or a			;2046	b7 	. 
	jr nz,l204bh		;2047	20 02 	  . 
	ld b,001h		;2049	06 01 	. . 
l204bh:
	ld (hl),b			;204b	70 	p 
	call sub_30d4h		;204c	cd d4 30 	. . 0 
	call sub_3235h		;204f	cd 35 32 	. 5 2 
	ld a,0ffh		;2052	3e ff 	> . 
	ld (l2fefh),a		;2054	32 ef 2f 	2 . / 
	ld a,(sys_page_clock)		;2057	3a 63 2c 	: c , 
	or a			;205a	b7 	. 
	jr nz,l2066h		;205b	20 09 	  . 
	ld hl,l2d48h		;205d	21 48 2d 	! H - 
	call sub_3358h		;2060	cd 58 33 	. X 3 
	call sub_3372h		;2063	cd 72 33 	. r 3 
l2066h:
	ret			;2066	c9 	. 
put_sys_data_page:
	ld de,00100h		;2067	11 00 01 	. . . 
	ld bc,00400h		;206a	01 00 04 	. . . 
	ld hl,sys_page_eyeball		;206d	21 48 2c 	! H , 
	xor a			;2070	af 	. 
	call sub_b5bah		;2071	cd ba b5 	. . . 
	xor a			;2074	af 	. 
	ret			;2075	c9 	. 
get_time:
	push de			;2076	d5 	. 
	ld hl,copy_buffer		;2077	21 dd f3 	! . . 
	call sub_2f99h		;207a	cd 99 2f 	. . / 
	ld a,(0f3d2h)		;207d	3a d2 f3 	: . . 
	ld b,a			;2080	47 	G 
	ld c,000h		;2081	0e 00 	. . 
	call setup_banked_copy		;2083	cd 44 f3 	. D . 
	pop de			;2086	d1 	. 
	ld hl,copy_buffer		;2087	21 dd f3 	! . . 
	ld bc,00007h		;208a	01 07 00 	. . . 
	call copy_memblock		;208d	cd 4e f3 	. N . 
	ret			;2090	c9 	. 
put_time:
	ld a,(0f3d2h)		;2091	3a d2 f3 	: . . 
	ld c,a			;2094	4f 	O 
	ld b,000h		;2095	06 00 	. . 
	call setup_banked_copy		;2097	cd 44 f3 	. D . 
	ld hl,copy_buffer		;209a	21 dd f3 	! . . 
	ex de,hl			;209d	eb 	. 
	ld bc,00007h		;209e	01 07 00 	. . . 
	call copy_memblock		;20a1	cd 4e f3 	. N . 
	ld hl,copy_buffer		;20a4	21 dd f3 	! . . 
	jp l2fa7h		;20a7	c3 a7 2f 	. . / 
load_font:
	ld a,(0f3d2h)		;20aa	3a d2 f3 	: . . 
	ld c,a			;20ad	4f 	O 
	ld b,000h		;20ae	06 00 	. . 
	call setup_banked_copy		;20b0	cd 44 f3 	. D . 
	ld hl,l8a51h		;20b3	21 51 8a 	! Q . 
	ex de,hl			;20b6	eb 	. 
	ld bc,(l2c2ch)		;20b7	ed 4b 2c 2c 	. K , , 
	call copy_memblock		;20bb	cd 4e f3 	. N . 
	ret			;20be	c9 	. 
select_font:
	ld (l508dh),a		;20bf	32 8d 50 	2 . P 
	call sub_43dah		;20c2	cd da 43 	. . C 
	ret			;20c5	c9 	. 
read_custom_font:
	xor a			;20c6	af 	. 
l20c7h:
	ld b,00ch		;20c7	06 0c 	. . 
	ld hl,l8a51h		;20c9	21 51 8a 	! Q . 
	ld de,00108h		;20cc	11 08 01 	. . . 
	call sub_20d7h		;20cf	cd d7 20 	. .   
	ret			;20d2	c9 	. 
write_custom_font:
	ld a,001h		;20d3	3e 01 	> . 
	jr l20c7h		;20d5	18 f0 	. . 
sub_20d7h:
	push bc			;20d7	c5 	. 
	or a			;20d8	b7 	. 
	jr z,l20e0h		;20d9	28 05 	( . 
	ld bc,00400h		;20db	01 00 04 	. . . 
	jr l20e3h		;20de	18 03 	. . 
l20e0h:
	ld bc,00300h		;20e0	01 00 03 	. . . 
l20e3h:
	xor a			;20e3	af 	. 
	call sub_b5bah		;20e4	cd ba b5 	. . . 
	or a			;20e7	b7 	. 
	ret nz			;20e8	c0 	. 
	inc h			;20e9	24 	$ 
	inc e			;20ea	1c 	. 
	ld (l2c2eh),bc		;20eb	ed 43 2e 2c 	. C . , 
	pop bc			;20ef	c1 	. 
	ld a,b			;20f0	78 	x 
	dec a			;20f1	3d 	= 
	push af			;20f2	f5 	. 
	ld bc,(l2c2eh)		;20f3	ed 4b 2e 2c 	. K . , 
	jr nz,l20e3h		;20f7	20 ea 	  . 
	pop bc			;20f9	c1 	. 
	ret			;20fa	c9 	. 
save_font_number:
	ld a,(l508dh)		;20fb	3a 8d 50 	: . P 
	ld (l2111h),a		;20fe	32 11 21 	2 . ! 
l2101h:
	ret			;2101	c9 	. 
restore_font_number:
	ld a,(l2111h)		;2102	3a 11 21 	: . ! 
	cp 0ffh		;2105	fe ff 	. . 
	ret z			;2107	c8 	. 
	ld (l508dh),a		;2108	32 8d 50 	2 . P 
	ld a,0ffh		;210b	3e ff 	> . 
	ld (l2111h),a		;210d	32 11 21 	2 . ! 
	ret			;2110	c9 	. 
l2111h:
	defb 0ffh		;2111	ff 	. 
get_scan_code_tbl:
	ld a,(0f3d2h)		;2112	3a d2 f3 	: . . 
	ld b,a			;2115	47 	G 
	ld c,000h		;2116	0e 00 	. . 
	call setup_banked_copy		;2118	cd 44 f3 	. D . 
	ld hl,la37fh		;211b	21 7f a3 	!  . 
	ld bc,00300h		;211e	01 00 03 	. . . 
l2121h:
	call copy_memblock		;2121	cd 4e f3 	. N . 
	ret			;2124	c9 	. 
put_scan_code_tbl:
	ld a,(0f3d2h)		;2125	3a d2 f3 	: . . 
	ld c,a			;2128	4f 	O 
	ld b,000h		;2129	06 00 	. . 
	call setup_banked_copy		;212b	cd 44 f3 	. D . 
	ex de,hl			;212e	eb 	. 
	ld de,la37fh		;212f	11 7f a3 	.  . 
	ld bc,00300h		;2132	01 00 03 	. . . 
	call copy_memblock		;2135	cd 4e f3 	. N . 
	ret			;2138	c9 	. 
save_scan_code_tbl:
	ld hl,la37fh		;2139	21 7f a3 	!  . 
	ld de,l251ch		;213c	11 1c 25 	. . % 
	ld bc,00300h		;213f	01 00 03 	. . . 
	ldir		;2142	ed b0 	. . 
	ld a,0ffh		;2144	3e ff 	> . 
	ld (l251ah),a		;2146	32 1a 25 	2 . % 
	ret			;2149	c9 	. 
restore_scan_code_tbl:
	ld a,(l251ah)		;214a	3a 1a 25 	: . % 
	or a			;214d	b7 	. 
	ret z			;214e	c8 	. 
	ld hl,l251ch		;214f	21 1c 25 	! . % 
	ld de,la37fh		;2152	11 7f a3 	.  . 
	ld bc,00300h		;2155	01 00 03 	. . . 
	ldir		;2158	ed b0 	. . 
	ret			;215a	c9 	. 
get_scan_character:
	call sub_2167h		;215b	cd 67 21 	. g ! 
	ld a,(hl)			;215e	7e 	~ 
	ret			;215f	c9 	. 
put_scan_character:
	push af			;2160	f5 	. 
	call sub_2167h		;2161	cd 67 21 	. g ! 
	pop af			;2164	f1 	. 
	ld (hl),a			;2165	77 	w 
	ret			;2166	c9 	. 
sub_2167h:
	push de			;2167	d5 	. 
	ld h,000h		;2168	26 00 	& . 
	ld l,d			;216a	6a 	j 
	add hl,hl			;216b	29 	) 
	ld de,l2c1ch		;216c	11 1c 2c 	. . , 
	add hl,de			;216f	19 	. 
	ld a,(hl)			;2170	7e 	~ 
	inc hl			;2171	23 	# 
	ld h,(hl)			;2172	66 	f 
	ld l,a			;2173	6f 	o 
	pop de			;2174	d1 	. 
	ld d,000h		;2175	16 00 	. . 
	add hl,de			;2177	19 	. 
	ret			;2178	c9 	. 
read_scan_code_tbl:
	xor a			;2179	af 	. 
l217ah:
	ld b,003h		;217a	06 03 	. . 
	ld hl,la37fh		;217c	21 7f a3 	!  . 
	ld de,00101h		;217f	11 01 01 	. . . 
	call sub_20d7h		;2182	cd d7 20 	. .   
	ret			;2185	c9 	. 
write_scan_code_tbl:
	ld a,001h		;2186	3e 01 	> . 
	jr l217ah		;2188	18 f0 	. . 
select_func_key_tbl:
	cp 003h		;218a	fe 03 	. . 
	ret nc			;218c	d0 	. 
	add a,a			;218d	87 	. 
	add a,a			;218e	87 	. 
	ld hl,l250ah		;218f	21 0a 25 	! . % 
	ld e,a			;2192	5f 	_ 
	ld d,000h		;2193	16 00 	. . 
	add hl,de			;2195	19 	. 
	ld e,(hl)			;2196	5e 	^ 
	inc hl			;2197	23 	# 
	ld d,(hl)			;2198	56 	V 
	inc hl			;2199	23 	# 
	ld (l2506h),de		;219a	ed 53 06 25 	. S . % 
	ld e,(hl)			;219e	5e 	^ 
	inc hl			;219f	23 	# 
	ld d,(hl)			;21a0	56 	V 
	ld (l2508h),de		;21a1	ed 53 08 25 	. S . % 
	xor a			;21a5	af 	. 
	ret			;21a6	c9 	. 
save_func_key_tbl_ptr:
	ld hl,(l2506h)		;21a7	2a 06 25 	* . % 
	ld (l2516h),hl		;21aa	22 16 25 	" . % 
	ld hl,(l2508h)		;21ad	2a 08 25 	* . % 
	ld (l2518h),hl		;21b0	22 18 25 	" . % 
	ret			;21b3	c9 	. 
restore_func_key_tbl_ptr:
	ld hl,(l2516h)		;21b4	2a 16 25 	* . % 
	ld a,h			;21b7	7c 	| 
	cp 0ffh		;21b8	fe ff 	. . 
	ret z			;21ba	c8 	. 
	ld (l2506h),hl		;21bb	22 06 25 	" . % 
	ld hl,(l2518h)		;21be	2a 18 25 	* . % 
	ld (l2508h),hl		;21c1	22 08 25 	" . % 
	ret			;21c4	c9 	. 
get_sel_func_key_tbl:
	ld a,(0f3d2h)		;21c5	3a d2 f3 	: . . 
	ld b,a			;21c8	47 	G 
	ld c,000h		;21c9	0e 00 	. . 
	call setup_banked_copy		;21cb	cd 44 f3 	. D . 
	ld hl,(l2506h)		;21ce	2a 06 25 	* . % 
	ld bc,00400h		;21d1	01 00 04 	. . . 
	call copy_memblock		;21d4	cd 4e f3 	. N . 
	ret			;21d7	c9 	. 
put_sel_func_key_tbl:
	ld a,(0f3d2h)		;21d8	3a d2 f3 	: . . 
	ld c,a			;21db	4f 	O 
	ld b,000h		;21dc	06 00 	. . 
	call setup_banked_copy		;21de	cd 44 f3 	. D . 
	ex de,hl			;21e1	eb 	. 
	ld de,(l2506h)		;21e2	ed 5b 06 25 	. [ . % 
	ld bc,00400h		;21e6	01 00 04 	. . . 
	call copy_memblock		;21e9	cd 4e f3 	. N . 
	ret			;21ec	c9 	. 
save_sel_func_key_tbl:
	ld hl,(l2506h)		;21ed	2a 06 25 	* . % 
	ld de,l281ch		;21f0	11 1c 28 	. . ( 
	ld bc,00400h		;21f3	01 00 04 	. . . 
	ldir		;21f6	ed b0 	. . 
	ld a,0ffh		;21f8	3e ff 	> . 
	ld (l251bh),a		;21fa	32 1b 25 	2 . % 
	ret			;21fd	c9 	. 
restore_sel_func_key_tbl:
	ld a,(l251bh)		;21fe	3a 1b 25 	: . % 
	or a			;2201	b7 	. 
	ret z			;2202	c8 	. 
	ld hl,l281ch		;2203	21 1c 28 	! . ( 
	ld de,(l2506h)		;2206	ed 5b 06 25 	. [ . % 
	ld bc,00400h		;220a	01 00 04 	. . . 
	ldir		;220d	ed b0 	. . 
	ret			;220f	c9 	. 
get_function_key:
	call sub_2237h		;2210	cd 37 22 	. 7 " 
	ld a,(0f3d2h)		;2213	3a d2 f3 	: . . 
	ld b,a			;2216	47 	G 
	ld c,000h		;2217	0e 00 	. . 
	call setup_banked_copy		;2219	cd 44 f3 	. D . 
l221ch:
	ld bc,00019h		;221c	01 19 00 	. . . 
	call copy_memblock		;221f	cd 4e f3 	. N . 
l2222h:
	ret			;2222	c9 	. 
put_function_key:
	call sub_2237h		;2223	cd 37 22 	. 7 " 
	ex de,hl			;2226	eb 	. 
	ld a,(0f3d2h)		;2227	3a d2 f3 	: . . 
	ld c,a			;222a	4f 	O 
	ld b,000h		;222b	06 00 	. . 
	call setup_banked_copy		;222d	cd 44 f3 	. D . 
	ld bc,00019h		;2230	01 19 00 	. . . 
	call copy_memblock		;2233	cd 4e f3 	. N . 
	ret			;2236	c9 	. 
sub_2237h:
	push de			;2237	d5 	. 
	add a,a			;2238	87 	. 
	add a,a			;2239	87 	. 
	ld e,a			;223a	5f 	_ 
	ld d,000h		;223b	16 00 	. . 
	ld hl,l2506h		;223d	21 06 25 	! . % 
	ld a,(hl)			;2240	7e 	~ 
l2241h:
	inc hl			;2241	23 	# 
	ld h,(hl)			;2242	66 	f 
	ld l,a			;2243	6f 	o 
	add hl,de			;2244	19 	. 
	inc hl			;2245	23 	# 
	inc hl			;2246	23 	# 
	ld e,(hl)			;2247	5e 	^ 
	inc hl			;2248	23 	# 
	ld d,(hl)			;2249	56 	V 
	ld hl,l2508h		;224a	21 08 25 	! . % 
	ld a,(hl)			;224d	7e 	~ 
	inc hl			;224e	23 	# 
	ld h,(hl)			;224f	66 	f 
	ld l,a			;2250	6f 	o 
	add hl,de			;2251	19 	. 
	pop de			;2252	d1 	. 
	ret			;2253	c9 	. 
disable_system_key:
	call sub_2260h		;2254	cd 60 22 	. ` " 
	set 7,(hl)		;2257	cb fe 	. . 
	ret			;2259	c9 	. 
enable_system_key:
	call sub_2260h		;225a	cd 60 22 	. ` " 
	res 7,(hl)		;225d	cb be 	. . 
	ret			;225f	c9 	. 
sub_2260h:
	add a,a			;2260	87 	. 
	add a,a			;2261	87 	. 
	ld e,a			;2262	5f 	_ 
	ld d,000h		;2263	16 00 	. . 
	ld hl,la244h		;2265	21 44 a2 	! D . 
	add hl,de			;2268	19 	. 
	inc hl			;2269	23 	# 
	ret			;226a	c9 	. 
read_custom_func_key_tbl:
	xor a			;226b	af 	. 
l226ch:
	ld b,004h		;226c	06 04 	. . 
	ld hl,lae83h		;226e	21 83 ae 	! . . 
	ld de,00104h		;2271	11 04 01 	. . . 
	call sub_20d7h		;2274	cd d7 20 	. .   
	ret			;2277	c9 	. 
write_custom_func_key_tbl:
	ld a,001h		;2278	3e 01 	> . 
	jr l226ch		;227a	18 f0 	. . 
enable_keyboard_reset_at_wboot:
	ld a,0ffh		;227c	3e ff 	> . 
	ld (l2282h),a		;227e	32 82 22 	2 . " 
	ret			;2281	c9 	. 
l2282h:
	defb 000h		;2282	00 	. 
perform_warm_boot:
	ld a,(l2282h)		;2283	3a 82 22 	: . " 
	or a			;2286	b7 	. 
	ret z			;2287	c8 	. 
l2288h:
	call restore_scan_code_tbl		;2288	cd 4a 21 	. J ! 
	call restore_sel_func_key_tbl		;228b	cd fe 21 	. . ! 
	call restore_func_key_tbl_ptr		;228e	cd b4 21 	. . ! 
	xor a			;2291	af 	. 
	ld (l2282h),a		;2292	32 82 22 	2 . " 
	ret			;2295	c9 	. 
request_memory_bank:
	ld (l22d2h),a		;2296	32 d2 22 	2 . " 
	cp 001h		;2299	fe 01 	. . 
	ret z			;229b	c8 	. 
	cp 002h		;229c	fe 02 	. . 
	jr c,l22cfh		;229e	38 2f 	8 / 
	cp 004h		;22a0	fe 04 	. . 
	jr nc,l22cfh		;22a2	30 2b 	0 + 
	ld a,(sys_page_ram_disk)		;22a4	3a 73 2c 	: s , 
	or a			;22a7	b7 	. 
	jp z,l22bdh		;22a8	ca bd 22 	. . " 
	ld a,(lc050h)		;22ab	3a 50 c0 	: P . 
	or a			;22ae	b7 	. 
	jr z,l22b4h		;22af	28 03 	( . 
	ld a,002h		;22b1	3e 02 	> . 
	ret			;22b3	c9 	. 
l22b4h:
	xor a			;22b4	af 	. 
	ld (sys_page_ram_disk),a		;22b5	32 73 2c 	2 s , 
	ld a,0ffh		;22b8	3e ff 	> . 
	ld (l2d8eh),a		;22ba	32 8e 2d 	2 . - 
l22bdh:
	ld a,(l22d2h)		;22bd	3a d2 22 	: . " 
	cp 002h		;22c0	fe 02 	. . 
	jp z,l22cah		;22c2	ca ca 22 	. . " 
	ld (l231eh),a		;22c5	32 1e 23 	2 . # 
	xor a			;22c8	af 	. 
	ret			;22c9	c9 	. 
l22cah:
	ld (l231dh),a		;22ca	32 1d 23 	2 . # 
	xor a			;22cd	af 	. 
	ret			;22ce	c9 	. 
l22cfh:
	ld a,001h		;22cf	3e 01 	> . 
	ret			;22d1	c9 	. 
l22d2h:
	defb 000h		;22d2	00 	. 
release_memory_bank:
	cp 002h		;22d3	fe 02 	. . 
	jp z,l22e1h		;22d5	ca e1 22 	. . " 
	cp 003h		;22d8	fe 03 	. . 
	ret nz			;22da	c0 	. 
	ld a,0ffh		;22db	3e ff 	> . 
	ld (l231eh),a		;22dd	32 1e 23 	2 . # 
	ret			;22e0	c9 	. 
l22e1h:
	ld a,0ffh		;22e1	3e ff 	> . 
	ld (l231dh),a		;22e3	32 1d 23 	2 . # 
	ret			;22e6	c9 	. 
l22e7h:
	defb 007h		;22e7	07 	. 
	defb 01bh		;22e8	1b 	. 
	defb 06ah		;22e9	6a 	j 
	defb 020h		;22ea	20 	  
	defb 052h		;22eb	52 	R 
	defb 041h		;22ec	41 	A 
	defb 04dh		;22ed	4d 	M 
	defb 020h		;22ee	20 	  
	defb 044h		;22ef	44 	D 
	defb 049h		;22f0	49 	I 
	defb 053h		;22f1	53 	S 
	defb 04bh		;22f2	4b 	K 
	defb 020h		;22f3	20 	  
	defb 044h		;22f4	44 	D 
	defb 041h		;22f5	41 	A 
	defb 054h		;22f6	54 	T 
	defb 041h		;22f7	41 	A 
	defb 020h		;22f8	20 	  
	defb 057h		;22f9	57 	W 
	defb 049h		;22fa	49 	I 
	defb 04ch		;22fb	4c 	L 
	defb 04ch		;22fc	4c 	L 
	defb 020h		;22fd	20 	  
	defb 042h		;22fe	42 	B 
	defb 045h		;22ff	45 	E 
	defb 020h		;2300	20 	  
	defb 04ch		;2301	4c 	L 
	defb 04fh		;2302	4f 	O 
	defb 053h		;2303	53 	S 
	defb 054h		;2304	54 	T 
	defb 021h		;2305	21 	! 
	defb 020h		;2306	20 	  
	defb 028h		;2307	28 	( 
	defb 041h		;2308	41 	A 
	defb 029h		;2309	29 	) 
	defb 062h		;230a	62 	b 
	defb 06fh		;230b	6f 	o 
	defb 072h		;230c	72 	r 
	defb 074h		;230d	74 	t 
	defb 02fh		;230e	2f 	/ 
	defb 028h		;230f	28 	( 
	defb 043h		;2310	43 	C 
	defb 029h		;2311	29 	) 
	defb 06fh		;2312	6f 	o 
	defb 06eh		;2313	6e 	n 
	defb 074h		;2314	74 	t 
	defb 069h		;2315	69 	i 
	defb 06eh		;2316	6e 	n 
	defb 075h		;2317	75 	u 
	defb 065h		;2318	65 	e 
	defb 03ah		;2319	3a 	: 
	defb 01bh		;231a	1b 	. 
	defb 06bh		;231b	6b 	k 
l231ch:
	defb 000h		;231c	00 	. 
l231dh:
	defb 0ffh		;231d	ff 	. 
l231eh:
	defb 0ffh		;231e	ff 	. 
move_block_to_bank:
	ld bc,00008h		;231f	01 08 00 	. . . 
	call sub_1f69h		;2322	cd 69 1f 	. i . 
	ld hl,(l2c38h)		;2325	2a 38 2c 	* 8 , 
	ld de,(l2c3ah)		;2328	ed 5b 3a 2c 	. [ : , 
	add hl,de			;232c	19 	. 
	ld de,bios_vector		;232d	11 00 f0 	. . . 
	or a			;2330	b7 	. 
	sbc hl,de		;2331	ed 52 	. R 
	jr nc,l2358h		;2333	30 23 	0 # 
	ld a,(l2c34h)		;2335	3a 34 2c 	: 4 , 
	or a			;2338	b7 	. 
	jp m,l2358h		;2339	fa 58 23 	. X # 
	cp 004h		;233c	fe 04 	. . 
	jp nc,l2358h		;233e	d2 58 23 	. X # 
	ld a,(l2c35h)		;2341	3a 35 2c 	: 5 , 
	cp 001h		;2344	fe 01 	. . 
	jp z,l235bh		;2346	ca 5b 23 	. [ # 
	ld b,a			;2349	47 	G 
	ld a,(l231dh)		;234a	3a 1d 23 	: . # 
	cp b			;234d	b8 	. 
	jp z,l235bh		;234e	ca 5b 23 	. [ # 
	ld a,(l231eh)		;2351	3a 1e 23 	: . # 
	cp b			;2354	b8 	. 
	jp z,l235bh		;2355	ca 5b 23 	. [ # 
l2358h:
	ld a,001h		;2358	3e 01 	> . 
	ret			;235a	c9 	. 
l235bh:
	ld bc,(l2c34h)		;235b	ed 4b 34 2c 	. K 4 , 
	call setup_banked_copy		;235f	cd 44 f3 	. D . 
	ld hl,(l2c36h)		;2362	2a 36 2c 	* 6 , 
	ld de,(l2c38h)		;2365	ed 5b 38 2c 	. [ 8 , 
	ld bc,(l2c3ah)		;2369	ed 4b 3a 2c 	. K : , 
	call copy_memblock		;236d	cd 4e f3 	. N . 
	xor a			;2370	af 	. 
	ret			;2371	c9 	. 
call_code_in_bank:
	ld hl,bios_vector		;2372	21 00 f0 	! . . 
	or a			;2375	b7 	. 
	sbc hl,de		;2376	ed 52 	. R 
	jp c,l238fh		;2378	da 8f 23 	. . # 
	ld a,(l231dh)		;237b	3a 1d 23 	: . # 
	cp b			;237e	b8 	. 
	jp z,l2396h		;237f	ca 96 23 	. . # 
	ld a,(l231eh)		;2382	3a 1e 23 	: . # 
	cp b			;2385	b8 	. 
	jp z,l2396h		;2386	ca 96 23 	. . # 
	ld a,001h		;2389	3e 01 	> . 
	cp b			;238b	b8 	. 
	jp z,l2396h		;238c	ca 96 23 	. . # 
l238fh:
	xor a			;238f	af 	. 
	ld (bank_jump_or_call),a		;2390	32 73 f5 	2 s . 
	ld a,001h		;2393	3e 01 	> . 
	ret			;2395	c9 	. 
l2396h:
	push bc			;2396	c5 	. 
	push de			;2397	d5 	. 
	ld a,(0f3d2h)		;2398	3a d2 f3 	: . . 
	ld (call_return_bank),a		;239b	32 76 f5 	2 v . 
	ld c,a			;239e	4f 	O 
	call setup_banked_copy		;239f	cd 44 f3 	. D . 
	ld de,00000h		;23a2	11 00 00 	. . . 
	ld hl,00000h		;23a5	21 00 00 	! . . 
	ld bc,00008h		;23a8	01 08 00 	. . . 
	call copy_memblock		;23ab	cd 4e f3 	. N . 
	jp banked_execute_code		;23ae	c3 2f f5 	. / . 
jump_to_code_in_bank:
	ld a,0ffh		;23b1	3e ff 	> . 
	ld (bank_jump_or_call),a		;23b3	32 73 f5 	2 s . 
	jp call_code_in_bank		;23b6	c3 72 23 	. r # 
display_ram_disk_overwrite:
	ld hl,l22e7h		;23b9	21 e7 22 	! . " 
	call sub_3358h		;23bc	cd 58 33 	. X 3 
	call sub_a020h		;23bf	cd 20 a0 	.   . 
	call bios2_conin		;23c2	cd d6 19 	. . . 
	push af			;23c5	f5 	. 
	call sub_3372h		;23c6	cd 72 33 	. r 3 
	pop af			;23c9	f1 	. 
	and 0dfh		;23ca	e6 df 	. . 
	cp 041h		;23cc	fe 41 	. A 
	jp z,bios2_wboot		;23ce	ca 76 1d 	. v . 
	cp 043h		;23d1	fe 43 	. C 
	jp nz,display_ram_disk_overwrite		;23d3	c2 b9 23 	. . # 
	jp l22b4h		;23d6	c3 b4 22 	. . " 
set_viewport:
	ld a,b			;23d9	78 	x 
	or a			;23da	b7 	. 
	jp z,l23f8h		;23db	ca f8 23 	. . # 
	cp 001h		;23de	fe 01 	. . 
	jp z,l240eh		;23e0	ca 0e 24 	. . $ 
	cp 002h		;23e3	fe 02 	. . 
	jp z,l241ah		;23e5	ca 1a 24 	. . $ 
	cp 003h		;23e8	fe 03 	. . 
	jp z,l2424h		;23ea	ca 24 24 	. $ $ 
	cp 004h		;23ed	fe 04 	. . 
	jp z,l2425h		;23ef	ca 25 24 	. % $ 
	cp 005h		;23f2	fe 05 	. . 
	jp z,l242bh		;23f4	ca 2b 24 	. + $ 
	ret			;23f7	c9 	. 
l23f8h:
	xor a			;23f8	af 	. 
	ld (sys_page_video_type),a		;23f9	32 76 2c 	2 v , 
	in a,(02ch)		;23fc	db 2c 	. , 
	and 001h		;23fe	e6 01 	. . 
	ld a,0ffh		;2400	3e ff 	> . 
	jr z,l2407h		;2402	28 03 	( . 
	ld (05063h),a		;2404	32 63 50 	2 c P 
l2407h:
	call sub_2431h		;2407	cd 31 24 	. 1 $ 
	call sub_1c47h		;240a	cd 47 1c 	. G . 
	ret			;240d	c9 	. 
l240eh:
	ld a,0ffh		;240e	3e ff 	> . 
	ld (sys_page_video_type),a		;2410	32 76 2c 	2 v , 
	call sub_2431h		;2413	cd 31 24 	. 1 $ 
	call sub_1c47h		;2416	cd 47 1c 	. G . 
	ret			;2419	c9 	. 
l241ah:
	ld a,(l2c33h)		;241a	3a 33 2c 	: 3 , 
	cp 000h		;241d	fe 00 	. . 
	ret z			;241f	c8 	. 
	cp 001h		;2420	fe 01 	. . 
	ret z			;2422	c8 	. 
	ret			;2423	c9 	. 
l2424h:
	ret			;2424	c9 	. 
l2425h:
	ld a,004h		;2425	3e 04 	> . 
	ld (l2c33h),a		;2427	32 33 2c 	2 3 , 
	ret			;242a	c9 	. 
l242bh:
	ld a,005h		;242b	3e 05 	> . 
	ld (l2c33h),a		;242d	32 33 2c 	2 3 , 
	ret			;2430	c9 	. 
sub_2431h:
	ld a,(sys_page_video_type)		;2431	3a 76 2c 	: v , 
	ld hl,05063h		;2434	21 63 50 	! c P 
	or (hl)			;2437	b6 	. 
	ld hl,l3e50h		;2438	21 50 3e 	! P > 
	ld a,001h		;243b	3e 01 	> . 
	ld (l2c33h),a		;243d	32 33 2c 	2 3 , 
	jr nz,l244ah		;2440	20 08 	  . 
	ld hl,l33cfh		;2442	21 cf 33 	! . 3 
	ld a,000h		;2445	3e 00 	> . 
	ld (l2c33h),a		;2447	32 33 2c 	2 3 , 
l244ah:
	ld de,l1c44h		;244a	11 44 1c 	. D . 
	ld bc,00015h		;244d	01 15 00 	. . . 
	ldir		;2450	ed b0 	. . 
	ret			;2452	c9 	. 
set_user_int_vector:
	cp 004h		;2453	fe 04 	. . 
	jr z,l2487h		;2455	28 30 	( 0 
	cp 007h		;2457	fe 07 	. . 
	jr z,l2487h		;2459	28 2c 	( , 
	cp 00ah		;245b	fe 0a 	. . 
	jr z,l2487h		;245d	28 28 	( ( 
	cp 00dh		;245f	fe 0d 	. . 
	jr z,l2487h		;2461	28 24 	( $ 
	di			;2463	f3 	. 
	ld c,a			;2464	4f 	O 
	add a,c			;2465	81 	. 
	add a,c			;2466	81 	. 
	ld c,a			;2467	4f 	O 
	ld b,000h		;2468	06 00 	. . 
	ld a,(l2493h)		;246a	3a 93 24 	: . $ 
	or a			;246d	b7 	. 
	jr z,l247ch		;246e	28 0c 	( . 
	xor a			;2470	af 	. 
	ld (l2493h),a		;2471	32 93 24 	2 . $ 
	ld hl,l16ceh		;2474	21 ce 16 	! . . 
	add hl,bc			;2477	09 	. 
	inc hl			;2478	23 	# 
	ld e,(hl)			;2479	5e 	^ 
	inc hl			;247a	23 	# 
	ld d,(hl)			;247b	56 	V 
l247ch:
	ld hl,interrupt_vector		;247c	21 98 16 	! . . 
	add hl,bc			;247f	09 	. 
	inc hl			;2480	23 	# 
	ld (hl),e			;2481	73 	s 
	inc hl			;2482	23 	# 
	ld (hl),d			;2483	72 	r 
	xor a			;2484	af 	. 
	ei			;2485	fb 	. 
	ret			;2486	c9 	. 
l2487h:
	ld a,0ffh		;2487	3e ff 	> . 
	ret			;2489	c9 	. 
clear_user_int_vector:
	push af			;248a	f5 	. 
	ld a,001h		;248b	3e 01 	> . 
	ld (l2493h),a		;248d	32 93 24 	2 . $ 
	pop af			;2490	f1 	. 
	jr set_user_int_vector		;2491	18 c0 	. . 
l2493h:
	defb 000h		;2493	00 	. 
get_int_mask:
	ld a,(l18e5h)		;2494	3a e5 18 	: . . 
	cpl			;2497	2f 	/ 
	ld e,a			;2498	5f 	_ 
	ld a,(l18e6h)		;2499	3a e6 18 	: . . 
	cpl			;249c	2f 	/ 
	ld d,a			;249d	57 	W 
	ret			;249e	c9 	. 
enable_int:
	ld a,e			;249f	7b 	{ 
	and 06fh		;24a0	e6 6f 	. o 
	ld b,a			;24a2	47 	G 
	ld a,(l18e5h)		;24a3	3a e5 18 	: . . 
	cpl			;24a6	2f 	/ 
	or b			;24a7	b0 	. 
	cpl			;24a8	2f 	/ 
	ld (l18e5h),a		;24a9	32 e5 18 	2 . . 
	call sub_17aeh		;24ac	cd ae 17 	. . . 
	ld a,d			;24af	7a 	z 
	and 0dbh		;24b0	e6 db 	. . 
	ld b,a			;24b2	47 	G 
	ld a,(l18e6h)		;24b3	3a e6 18 	: . . 
	cpl			;24b6	2f 	/ 
	or b			;24b7	b0 	. 
	cpl			;24b8	2f 	/ 
	ld (l18e6h),a		;24b9	32 e6 18 	2 . . 
	call sub_17b4h		;24bc	cd b4 17 	. . . 
	ret			;24bf	c9 	. 
disable_int:
	ld a,e			;24c0	7b 	{ 
	and 06fh		;24c1	e6 6f 	. o 
	ld b,a			;24c3	47 	G 
	ld a,(l18e5h)		;24c4	3a e5 18 	: . . 
	or b			;24c7	b0 	. 
	ld (l18e5h),a		;24c8	32 e5 18 	2 . . 
	call sub_17aeh		;24cb	cd ae 17 	. . . 
	ld a,d			;24ce	7a 	z 
	and 0dbh		;24cf	e6 db 	. . 
	ld b,a			;24d1	47 	G 
	ld a,(l18e6h)		;24d2	3a e6 18 	: . . 
	or b			;24d5	b0 	. 
	ld (l18e6h),a		;24d6	32 e6 18 	2 . . 
	call sub_17b4h		;24d9	cd b4 17 	. . . 
	ret			;24dc	c9 	. 
get_user_common_area:
	ld de,0fdb0h		;24dd	11 b0 fd 	. . . 
	ld hl,0ffb0h		;24e0	21 b0 ff 	! . . 
	ret			;24e3	c9 	. 
attach_mterm_int:
	di			;24e4	f3 	. 
	ld hl,serial_mterm_handler		;24e5	21 92 33 	! . 3 
	ld (serial_int_handler+1),hl		;24e8	22 cc 16 	" . . 
	ld hl,0fdb6h		;24eb	21 b6 fd 	! . . 
	ld (0fdb0h),hl		;24ee	22 b0 fd 	" . . 
	ld (0fdb2h),hl		;24f1	22 b2 fd 	" . . 
	ld hl,0ffafh		;24f4	21 af ff 	! . . 
	ld (0fdb4h),hl		;24f7	22 b4 fd 	" . . 
	ei			;24fa	fb 	. 
	ret			;24fb	c9 	. 
detach_mterm_int:
	di			;24fc	f3 	. 
	ld hl,serial_bios_handler		;24fd	21 4a 17 	! J . 
	ld (serial_int_handler+1),hl		;2500	22 cc 16 	" . . 
	ei			;2503	fb 	. 
	ret			;2504	c9 	. 
qxfunc_notimpl:
	ret			;2505	c9 	. 
l2506h:
	defw 0a67fh		;2506	7f a6 	 . 
l2508h:
	defw 0a70bh		;2508	0b a7 	. . 
l250ah:
	defb 07fh		;250a	7f 	 
	defb 0a6h		;250b	a6 	. 
	defb 00bh		;250c	0b 	. 
	defb 0a7h		;250d	a7 	. 
	defb 07fh		;250e	7f 	 
	defb 0aah		;250f	aa 	. 
	defb 00bh		;2510	0b 	. 
	defb 0abh		;2511	ab 	. 
	defb 083h		;2512	83 	. 
	defb 0aeh		;2513	ae 	. 
	defb 00fh		;2514	0f 	. 
	defb 0afh		;2515	af 	. 
l2516h:
	defw 0ffffh		;2516	ff ff 	. . 
l2518h:
	defw 0ffffh		;2518	ff ff 	. . 
l251ah:
	defb 000h		;251a	00 	. 
l251bh:
	defb 000h		;251b	00 	. 
l251ch:
	defb 000h		;251c	00 	. 
	defb 000h		;251d	00 	. 
	defb 000h		;251e	00 	. 
	defb 000h		;251f	00 	. 
	defb 000h		;2520	00 	. 
	defb 000h		;2521	00 	. 
	defb 000h		;2522	00 	. 
	defb 000h		;2523	00 	. 
	defb 000h		;2524	00 	. 
	defb 000h		;2525	00 	. 
	defb 000h		;2526	00 	. 
	defb 000h		;2527	00 	. 
	defb 000h		;2528	00 	. 
	defb 000h		;2529	00 	. 
	defb 000h		;252a	00 	. 
	defb 000h		;252b	00 	. 
	defb 000h		;252c	00 	. 
	defb 000h		;252d	00 	. 
	defb 000h		;252e	00 	. 
	defb 000h		;252f	00 	. 
	defb 000h		;2530	00 	. 
	defb 000h		;2531	00 	. 
	defb 000h		;2532	00 	. 
	defb 000h		;2533	00 	. 
	defb 000h		;2534	00 	. 
	defb 000h		;2535	00 	. 
	defb 000h		;2536	00 	. 
	defb 000h		;2537	00 	. 
	defb 000h		;2538	00 	. 
	defb 000h		;2539	00 	. 
	defb 000h		;253a	00 	. 
	defb 000h		;253b	00 	. 
	defb 000h		;253c	00 	. 
	defb 000h		;253d	00 	. 
	defb 000h		;253e	00 	. 
	defb 000h		;253f	00 	. 
	defb 000h		;2540	00 	. 
	defb 000h		;2541	00 	. 
	defb 000h		;2542	00 	. 
	defb 000h		;2543	00 	. 
	defb 000h		;2544	00 	. 
	defb 000h		;2545	00 	. 
	defb 000h		;2546	00 	. 
	defb 000h		;2547	00 	. 
	defb 000h		;2548	00 	. 
	defb 000h		;2549	00 	. 
	defb 000h		;254a	00 	. 
	defb 000h		;254b	00 	. 
	defb 000h		;254c	00 	. 
	defb 000h		;254d	00 	. 
	defb 000h		;254e	00 	. 
	defb 000h		;254f	00 	. 
	defb 000h		;2550	00 	. 
	defb 000h		;2551	00 	. 
	defb 000h		;2552	00 	. 
	defb 000h		;2553	00 	. 
	defb 000h		;2554	00 	. 
	defb 000h		;2555	00 	. 
	defb 000h		;2556	00 	. 
	defb 000h		;2557	00 	. 
l2558h:
	defb 000h		;2558	00 	. 
	defb 000h		;2559	00 	. 
	defb 000h		;255a	00 	. 
	defb 000h		;255b	00 	. 
	defb 000h		;255c	00 	. 
	defb 000h		;255d	00 	. 
	defb 000h		;255e	00 	. 
	defb 000h		;255f	00 	. 
	defb 000h		;2560	00 	. 
	defb 000h		;2561	00 	. 
	defb 000h		;2562	00 	. 
	defb 000h		;2563	00 	. 
	defb 000h		;2564	00 	. 
	defb 000h		;2565	00 	. 
	defb 000h		;2566	00 	. 
	defb 000h		;2567	00 	. 
	defb 000h		;2568	00 	. 
	defb 000h		;2569	00 	. 
	defb 000h		;256a	00 	. 
	defb 000h		;256b	00 	. 
	defb 000h		;256c	00 	. 
	defb 000h		;256d	00 	. 
	defb 000h		;256e	00 	. 
	defb 000h		;256f	00 	. 
	defb 000h		;2570	00 	. 
	defb 000h		;2571	00 	. 
	defb 000h		;2572	00 	. 
	defb 000h		;2573	00 	. 
	defb 000h		;2574	00 	. 
	defb 000h		;2575	00 	. 
	defb 000h		;2576	00 	. 
	defb 000h		;2577	00 	. 
	defb 000h		;2578	00 	. 
	defb 000h		;2579	00 	. 
	defb 000h		;257a	00 	. 
	defb 000h		;257b	00 	. 
	defb 000h		;257c	00 	. 
	defb 000h		;257d	00 	. 
	defb 000h		;257e	00 	. 
	defb 000h		;257f	00 	. 
	defb 000h		;2580	00 	. 
	defb 000h		;2581	00 	. 
	defb 000h		;2582	00 	. 
	defb 000h		;2583	00 	. 
	defb 000h		;2584	00 	. 
	defb 000h		;2585	00 	. 
	defb 000h		;2586	00 	. 
	defb 000h		;2587	00 	. 
	defb 000h		;2588	00 	. 
	defb 000h		;2589	00 	. 
	defb 000h		;258a	00 	. 
	defb 000h		;258b	00 	. 
	defb 000h		;258c	00 	. 
	defb 000h		;258d	00 	. 
	defb 000h		;258e	00 	. 
	defb 000h		;258f	00 	. 
	defb 000h		;2590	00 	. 
	defb 000h		;2591	00 	. 
	defb 000h		;2592	00 	. 
	defb 000h		;2593	00 	. 
	defb 000h		;2594	00 	. 
	defb 000h		;2595	00 	. 
	defb 000h		;2596	00 	. 
	defb 000h		;2597	00 	. 
	defb 000h		;2598	00 	. 
	defb 000h		;2599	00 	. 
	defb 000h		;259a	00 	. 
	defb 000h		;259b	00 	. 
	defb 000h		;259c	00 	. 
	defb 000h		;259d	00 	. 
	defb 000h		;259e	00 	. 
	defb 000h		;259f	00 	. 
	defb 000h		;25a0	00 	. 
	defb 000h		;25a1	00 	. 
	defb 000h		;25a2	00 	. 
	defb 000h		;25a3	00 	. 
	defb 000h		;25a4	00 	. 
	defb 000h		;25a5	00 	. 
	defb 000h		;25a6	00 	. 
	defb 000h		;25a7	00 	. 
	defb 000h		;25a8	00 	. 
	defb 000h		;25a9	00 	. 
	defb 000h		;25aa	00 	. 
	defb 000h		;25ab	00 	. 
	defb 000h		;25ac	00 	. 
	defb 000h		;25ad	00 	. 
	defb 000h		;25ae	00 	. 
	defb 000h		;25af	00 	. 
	defb 000h		;25b0	00 	. 
	defb 000h		;25b1	00 	. 
	defb 000h		;25b2	00 	. 
	defb 000h		;25b3	00 	. 
	defb 000h		;25b4	00 	. 
	defb 000h		;25b5	00 	. 
	defb 000h		;25b6	00 	. 
	defb 000h		;25b7	00 	. 
	defb 000h		;25b8	00 	. 
	defb 000h		;25b9	00 	. 
	defb 000h		;25ba	00 	. 
	defb 000h		;25bb	00 	. 
	defb 000h		;25bc	00 	. 
	defb 000h		;25bd	00 	. 
	defb 000h		;25be	00 	. 
	defb 000h		;25bf	00 	. 
	defb 000h		;25c0	00 	. 
	defb 000h		;25c1	00 	. 
	defb 000h		;25c2	00 	. 
	defb 000h		;25c3	00 	. 
	defb 000h		;25c4	00 	. 
	defb 000h		;25c5	00 	. 
	defb 000h		;25c6	00 	. 
	defb 000h		;25c7	00 	. 
	defb 000h		;25c8	00 	. 
	defb 000h		;25c9	00 	. 
	defb 000h		;25ca	00 	. 
	defb 000h		;25cb	00 	. 
	defb 000h		;25cc	00 	. 
	defb 000h		;25cd	00 	. 
	defb 000h		;25ce	00 	. 
	defb 000h		;25cf	00 	. 
	defb 000h		;25d0	00 	. 
	defb 000h		;25d1	00 	. 
	defb 000h		;25d2	00 	. 
	defb 000h		;25d3	00 	. 
	defb 000h		;25d4	00 	. 
	defb 000h		;25d5	00 	. 
	defb 000h		;25d6	00 	. 
	defb 000h		;25d7	00 	. 
	defb 000h		;25d8	00 	. 
	defb 000h		;25d9	00 	. 
	defb 000h		;25da	00 	. 
	defb 000h		;25db	00 	. 
	defb 000h		;25dc	00 	. 
	defb 000h		;25dd	00 	. 
	defb 000h		;25de	00 	. 
	defb 000h		;25df	00 	. 
	defb 000h		;25e0	00 	. 
	defb 000h		;25e1	00 	. 
	defb 000h		;25e2	00 	. 
	defb 000h		;25e3	00 	. 
	defb 000h		;25e4	00 	. 
	defb 000h		;25e5	00 	. 
	defb 000h		;25e6	00 	. 
	defb 000h		;25e7	00 	. 
	defb 000h		;25e8	00 	. 
	defb 000h		;25e9	00 	. 
	defb 000h		;25ea	00 	. 
	defb 000h		;25eb	00 	. 
	defb 000h		;25ec	00 	. 
	defb 000h		;25ed	00 	. 
	defb 000h		;25ee	00 	. 
	defb 000h		;25ef	00 	. 
	defb 000h		;25f0	00 	. 
	defb 000h		;25f1	00 	. 
	defb 000h		;25f2	00 	. 
	defb 000h		;25f3	00 	. 
	defb 000h		;25f4	00 	. 
	defb 000h		;25f5	00 	. 
	defb 000h		;25f6	00 	. 
	defb 000h		;25f7	00 	. 
	defb 000h		;25f8	00 	. 
	defb 000h		;25f9	00 	. 
	defb 000h		;25fa	00 	. 
	defb 000h		;25fb	00 	. 
	defb 000h		;25fc	00 	. 
	defb 000h		;25fd	00 	. 
	defb 000h		;25fe	00 	. 
	defb 000h		;25ff	00 	. 
	defb 000h		;2600	00 	. 
	defb 000h		;2601	00 	. 
	defb 000h		;2602	00 	. 
	defb 000h		;2603	00 	. 
	defb 000h		;2604	00 	. 
	defb 000h		;2605	00 	. 
	defb 000h		;2606	00 	. 
	defb 000h		;2607	00 	. 
	defb 000h		;2608	00 	. 
	defb 000h		;2609	00 	. 
	defb 000h		;260a	00 	. 
	defb 000h		;260b	00 	. 
	defb 000h		;260c	00 	. 
	defb 000h		;260d	00 	. 
	defb 000h		;260e	00 	. 
	defb 000h		;260f	00 	. 
	defb 000h		;2610	00 	. 
	defb 000h		;2611	00 	. 
	defb 000h		;2612	00 	. 
	defb 000h		;2613	00 	. 
	defb 000h		;2614	00 	. 
	defb 000h		;2615	00 	. 
	defb 000h		;2616	00 	. 
	defb 000h		;2617	00 	. 
	defb 000h		;2618	00 	. 
	defb 000h		;2619	00 	. 
	defb 000h		;261a	00 	. 
	defb 000h		;261b	00 	. 
	defb 000h		;261c	00 	. 
	defb 000h		;261d	00 	. 
	defb 000h		;261e	00 	. 
	defb 000h		;261f	00 	. 
	defb 000h		;2620	00 	. 
	defb 000h		;2621	00 	. 
	defb 000h		;2622	00 	. 
	defb 000h		;2623	00 	. 
	defb 000h		;2624	00 	. 
	defb 000h		;2625	00 	. 
	defb 000h		;2626	00 	. 
	defb 000h		;2627	00 	. 
	defb 000h		;2628	00 	. 
	defb 000h		;2629	00 	. 
	defb 000h		;262a	00 	. 
	defb 000h		;262b	00 	. 
	defb 000h		;262c	00 	. 
	defb 000h		;262d	00 	. 
	defb 000h		;262e	00 	. 
	defb 000h		;262f	00 	. 
	defb 000h		;2630	00 	. 
	defb 000h		;2631	00 	. 
	defb 000h		;2632	00 	. 
	defb 000h		;2633	00 	. 
	defb 000h		;2634	00 	. 
	defb 000h		;2635	00 	. 
	defb 000h		;2636	00 	. 
	defb 000h		;2637	00 	. 
	defb 000h		;2638	00 	. 
	defb 000h		;2639	00 	. 
	defb 000h		;263a	00 	. 
	defb 000h		;263b	00 	. 
	defb 000h		;263c	00 	. 
	defb 000h		;263d	00 	. 
	defb 000h		;263e	00 	. 
	defb 000h		;263f	00 	. 
	defb 000h		;2640	00 	. 
	defb 000h		;2641	00 	. 
	defb 000h		;2642	00 	. 
	defb 000h		;2643	00 	. 
	defb 000h		;2644	00 	. 
	defb 000h		;2645	00 	. 
	defb 000h		;2646	00 	. 
	defb 000h		;2647	00 	. 
	defb 000h		;2648	00 	. 
	defb 000h		;2649	00 	. 
	defb 000h		;264a	00 	. 
	defb 000h		;264b	00 	. 
	defb 000h		;264c	00 	. 
	defb 000h		;264d	00 	. 
	defb 000h		;264e	00 	. 
	defb 000h		;264f	00 	. 
	defb 000h		;2650	00 	. 
	defb 000h		;2651	00 	. 
	defb 000h		;2652	00 	. 
	defb 000h		;2653	00 	. 
	defb 000h		;2654	00 	. 
	defb 000h		;2655	00 	. 
	defb 000h		;2656	00 	. 
	defb 000h		;2657	00 	. 
	defb 000h		;2658	00 	. 
	defb 000h		;2659	00 	. 
	defb 000h		;265a	00 	. 
	defb 000h		;265b	00 	. 
	defb 000h		;265c	00 	. 
	defb 000h		;265d	00 	. 
	defb 000h		;265e	00 	. 
	defb 000h		;265f	00 	. 
	defb 000h		;2660	00 	. 
	defb 000h		;2661	00 	. 
	defb 000h		;2662	00 	. 
	defb 000h		;2663	00 	. 
	defb 000h		;2664	00 	. 
	defb 000h		;2665	00 	. 
	defb 000h		;2666	00 	. 
	defb 000h		;2667	00 	. 
	defb 000h		;2668	00 	. 
	defb 000h		;2669	00 	. 
	defb 000h		;266a	00 	. 
	defb 000h		;266b	00 	. 
	defb 000h		;266c	00 	. 
	defb 000h		;266d	00 	. 
	defb 000h		;266e	00 	. 
	defb 000h		;266f	00 	. 
	defb 000h		;2670	00 	. 
	defb 000h		;2671	00 	. 
	defb 000h		;2672	00 	. 
	defb 000h		;2673	00 	. 
	defb 000h		;2674	00 	. 
	defb 000h		;2675	00 	. 
	defb 000h		;2676	00 	. 
	defb 000h		;2677	00 	. 
	defb 000h		;2678	00 	. 
	defb 000h		;2679	00 	. 
	defb 000h		;267a	00 	. 
	defb 000h		;267b	00 	. 
	defb 000h		;267c	00 	. 
	defb 000h		;267d	00 	. 
	defb 000h		;267e	00 	. 
	defb 000h		;267f	00 	. 
	defb 000h		;2680	00 	. 
	defb 000h		;2681	00 	. 
	defb 000h		;2682	00 	. 
	defb 000h		;2683	00 	. 
	defb 000h		;2684	00 	. 
	defb 000h		;2685	00 	. 
	defb 000h		;2686	00 	. 
	defb 000h		;2687	00 	. 
	defb 000h		;2688	00 	. 
	defb 000h		;2689	00 	. 
	defb 000h		;268a	00 	. 
	defb 000h		;268b	00 	. 
	defb 000h		;268c	00 	. 
	defb 000h		;268d	00 	. 
	defb 000h		;268e	00 	. 
	defb 000h		;268f	00 	. 
	defb 000h		;2690	00 	. 
	defb 000h		;2691	00 	. 
	defb 000h		;2692	00 	. 
	defb 000h		;2693	00 	. 
	defb 000h		;2694	00 	. 
	defb 000h		;2695	00 	. 
	defb 000h		;2696	00 	. 
	defb 000h		;2697	00 	. 
	defb 000h		;2698	00 	. 
	defb 000h		;2699	00 	. 
	defb 000h		;269a	00 	. 
	defb 000h		;269b	00 	. 
	defb 000h		;269c	00 	. 
	defb 000h		;269d	00 	. 
	defb 000h		;269e	00 	. 
	defb 000h		;269f	00 	. 
	defb 000h		;26a0	00 	. 
	defb 000h		;26a1	00 	. 
	defb 000h		;26a2	00 	. 
	defb 000h		;26a3	00 	. 
	defb 000h		;26a4	00 	. 
	defb 000h		;26a5	00 	. 
	defb 000h		;26a6	00 	. 
	defb 000h		;26a7	00 	. 
	defb 000h		;26a8	00 	. 
	defb 000h		;26a9	00 	. 
	defb 000h		;26aa	00 	. 
	defb 000h		;26ab	00 	. 
	defb 000h		;26ac	00 	. 
	defb 000h		;26ad	00 	. 
	defb 000h		;26ae	00 	. 
	defb 000h		;26af	00 	. 
	defb 000h		;26b0	00 	. 
	defb 000h		;26b1	00 	. 
	defb 000h		;26b2	00 	. 
	defb 000h		;26b3	00 	. 
	defb 000h		;26b4	00 	. 
	defb 000h		;26b5	00 	. 
	defb 000h		;26b6	00 	. 
	defb 000h		;26b7	00 	. 
	defb 000h		;26b8	00 	. 
	defb 000h		;26b9	00 	. 
	defb 000h		;26ba	00 	. 
	defb 000h		;26bb	00 	. 
	defb 000h		;26bc	00 	. 
	defb 000h		;26bd	00 	. 
	defb 000h		;26be	00 	. 
	defb 000h		;26bf	00 	. 
	defb 000h		;26c0	00 	. 
	defb 000h		;26c1	00 	. 
	defb 000h		;26c2	00 	. 
	defb 000h		;26c3	00 	. 
	defb 000h		;26c4	00 	. 
	defb 000h		;26c5	00 	. 
	defb 000h		;26c6	00 	. 
	defb 000h		;26c7	00 	. 
	defb 000h		;26c8	00 	. 
	defb 000h		;26c9	00 	. 
	defb 000h		;26ca	00 	. 
	defb 000h		;26cb	00 	. 
	defb 000h		;26cc	00 	. 
	defb 000h		;26cd	00 	. 
	defb 000h		;26ce	00 	. 
	defb 000h		;26cf	00 	. 
	defb 000h		;26d0	00 	. 
	defb 000h		;26d1	00 	. 
	defb 000h		;26d2	00 	. 
	defb 000h		;26d3	00 	. 
	defb 000h		;26d4	00 	. 
	defb 000h		;26d5	00 	. 
	defb 000h		;26d6	00 	. 
	defb 000h		;26d7	00 	. 
	defb 000h		;26d8	00 	. 
	defb 000h		;26d9	00 	. 
	defb 000h		;26da	00 	. 
	defb 000h		;26db	00 	. 
	defb 000h		;26dc	00 	. 
	defb 000h		;26dd	00 	. 
	defb 000h		;26de	00 	. 
	defb 000h		;26df	00 	. 
	defb 000h		;26e0	00 	. 
	defb 000h		;26e1	00 	. 
	defb 000h		;26e2	00 	. 
	defb 000h		;26e3	00 	. 
	defb 000h		;26e4	00 	. 
	defb 000h		;26e5	00 	. 
	defb 000h		;26e6	00 	. 
	defb 000h		;26e7	00 	. 
	defb 000h		;26e8	00 	. 
	defb 000h		;26e9	00 	. 
	defb 000h		;26ea	00 	. 
	defb 000h		;26eb	00 	. 
	defb 000h		;26ec	00 	. 
	defb 000h		;26ed	00 	. 
	defb 000h		;26ee	00 	. 
	defb 000h		;26ef	00 	. 
	defb 000h		;26f0	00 	. 
	defb 000h		;26f1	00 	. 
	defb 000h		;26f2	00 	. 
	defb 000h		;26f3	00 	. 
	defb 000h		;26f4	00 	. 
	defb 000h		;26f5	00 	. 
	defb 000h		;26f6	00 	. 
	defb 000h		;26f7	00 	. 
	defb 000h		;26f8	00 	. 
	defb 000h		;26f9	00 	. 
	defb 000h		;26fa	00 	. 
	defb 000h		;26fb	00 	. 
	defb 000h		;26fc	00 	. 
	defb 000h		;26fd	00 	. 
	defb 000h		;26fe	00 	. 
	defb 000h		;26ff	00 	. 
	defb 000h		;2700	00 	. 
	defb 000h		;2701	00 	. 
	defb 000h		;2702	00 	. 
	defb 000h		;2703	00 	. 
	defb 000h		;2704	00 	. 
	defb 000h		;2705	00 	. 
	defb 000h		;2706	00 	. 
	defb 000h		;2707	00 	. 
	defb 000h		;2708	00 	. 
	defb 000h		;2709	00 	. 
	defb 000h		;270a	00 	. 
	defb 000h		;270b	00 	. 
	defb 000h		;270c	00 	. 
	defb 000h		;270d	00 	. 
	defb 000h		;270e	00 	. 
	defb 000h		;270f	00 	. 
	defb 000h		;2710	00 	. 
	defb 000h		;2711	00 	. 
	defb 000h		;2712	00 	. 
	defb 000h		;2713	00 	. 
	defb 000h		;2714	00 	. 
	defb 000h		;2715	00 	. 
	defb 000h		;2716	00 	. 
	defb 000h		;2717	00 	. 
	defb 000h		;2718	00 	. 
	defb 000h		;2719	00 	. 
	defb 000h		;271a	00 	. 
	defb 000h		;271b	00 	. 
	defb 000h		;271c	00 	. 
	defb 000h		;271d	00 	. 
	defb 000h		;271e	00 	. 
	defb 000h		;271f	00 	. 
	defb 000h		;2720	00 	. 
	defb 000h		;2721	00 	. 
	defb 000h		;2722	00 	. 
	defb 000h		;2723	00 	. 
	defb 000h		;2724	00 	. 
	defb 000h		;2725	00 	. 
	defb 000h		;2726	00 	. 
	defb 000h		;2727	00 	. 
	defb 000h		;2728	00 	. 
	defb 000h		;2729	00 	. 
	defb 000h		;272a	00 	. 
	defb 000h		;272b	00 	. 
	defb 000h		;272c	00 	. 
	defb 000h		;272d	00 	. 
	defb 000h		;272e	00 	. 
	defb 000h		;272f	00 	. 
	defb 000h		;2730	00 	. 
	defb 000h		;2731	00 	. 
	defb 000h		;2732	00 	. 
	defb 000h		;2733	00 	. 
	defb 000h		;2734	00 	. 
	defb 000h		;2735	00 	. 
	defb 000h		;2736	00 	. 
	defb 000h		;2737	00 	. 
	defb 000h		;2738	00 	. 
	defb 000h		;2739	00 	. 
	defb 000h		;273a	00 	. 
	defb 000h		;273b	00 	. 
	defb 000h		;273c	00 	. 
	defb 000h		;273d	00 	. 
	defb 000h		;273e	00 	. 
	defb 000h		;273f	00 	. 
	defb 000h		;2740	00 	. 
	defb 000h		;2741	00 	. 
	defb 000h		;2742	00 	. 
	defb 000h		;2743	00 	. 
	defb 000h		;2744	00 	. 
	defb 000h		;2745	00 	. 
	defb 000h		;2746	00 	. 
	defb 000h		;2747	00 	. 
	defb 000h		;2748	00 	. 
	defb 000h		;2749	00 	. 
	defb 000h		;274a	00 	. 
	defb 000h		;274b	00 	. 
	defb 000h		;274c	00 	. 
	defb 000h		;274d	00 	. 
	defb 000h		;274e	00 	. 
	defb 000h		;274f	00 	. 
	defb 000h		;2750	00 	. 
	defb 000h		;2751	00 	. 
	defb 000h		;2752	00 	. 
	defb 000h		;2753	00 	. 
	defb 000h		;2754	00 	. 
	defb 000h		;2755	00 	. 
	defb 000h		;2756	00 	. 
	defb 000h		;2757	00 	. 
	defb 000h		;2758	00 	. 
	defb 000h		;2759	00 	. 
	defb 000h		;275a	00 	. 
	defb 000h		;275b	00 	. 
	defb 000h		;275c	00 	. 
	defb 000h		;275d	00 	. 
	defb 000h		;275e	00 	. 
	defb 000h		;275f	00 	. 
	defb 000h		;2760	00 	. 
	defb 000h		;2761	00 	. 
	defb 000h		;2762	00 	. 
	defb 000h		;2763	00 	. 
	defb 000h		;2764	00 	. 
	defb 000h		;2765	00 	. 
	defb 000h		;2766	00 	. 
	defb 000h		;2767	00 	. 
	defb 000h		;2768	00 	. 
	defb 000h		;2769	00 	. 
	defb 000h		;276a	00 	. 
	defb 000h		;276b	00 	. 
	defb 000h		;276c	00 	. 
	defb 000h		;276d	00 	. 
	defb 000h		;276e	00 	. 
	defb 000h		;276f	00 	. 
	defb 000h		;2770	00 	. 
	defb 000h		;2771	00 	. 
	defb 000h		;2772	00 	. 
	defb 000h		;2773	00 	. 
	defb 000h		;2774	00 	. 
	defb 000h		;2775	00 	. 
	defb 000h		;2776	00 	. 
	defb 000h		;2777	00 	. 
	defb 000h		;2778	00 	. 
	defb 000h		;2779	00 	. 
	defb 000h		;277a	00 	. 
	defb 000h		;277b	00 	. 
	defb 000h		;277c	00 	. 
	defb 000h		;277d	00 	. 
	defb 000h		;277e	00 	. 
	defb 000h		;277f	00 	. 
	defb 000h		;2780	00 	. 
	defb 000h		;2781	00 	. 
	defb 000h		;2782	00 	. 
	defb 000h		;2783	00 	. 
	defb 000h		;2784	00 	. 
	defb 000h		;2785	00 	. 
	defb 000h		;2786	00 	. 
	defb 000h		;2787	00 	. 
	defb 000h		;2788	00 	. 
	defb 000h		;2789	00 	. 
	defb 000h		;278a	00 	. 
	defb 000h		;278b	00 	. 
	defb 000h		;278c	00 	. 
	defb 000h		;278d	00 	. 
	defb 000h		;278e	00 	. 
	defb 000h		;278f	00 	. 
	defb 000h		;2790	00 	. 
	defb 000h		;2791	00 	. 
	defb 000h		;2792	00 	. 
	defb 000h		;2793	00 	. 
	defb 000h		;2794	00 	. 
	defb 000h		;2795	00 	. 
	defb 000h		;2796	00 	. 
	defb 000h		;2797	00 	. 
	defb 000h		;2798	00 	. 
	defb 000h		;2799	00 	. 
	defb 000h		;279a	00 	. 
	defb 000h		;279b	00 	. 
	defb 000h		;279c	00 	. 
	defb 000h		;279d	00 	. 
	defb 000h		;279e	00 	. 
	defb 000h		;279f	00 	. 
	defb 000h		;27a0	00 	. 
	defb 000h		;27a1	00 	. 
	defb 000h		;27a2	00 	. 
	defb 000h		;27a3	00 	. 
	defb 000h		;27a4	00 	. 
	defb 000h		;27a5	00 	. 
	defb 000h		;27a6	00 	. 
	defb 000h		;27a7	00 	. 
	defb 000h		;27a8	00 	. 
	defb 000h		;27a9	00 	. 
	defb 000h		;27aa	00 	. 
	defb 000h		;27ab	00 	. 
	defb 000h		;27ac	00 	. 
	defb 000h		;27ad	00 	. 
	defb 000h		;27ae	00 	. 
	defb 000h		;27af	00 	. 
	defb 000h		;27b0	00 	. 
	defb 000h		;27b1	00 	. 
	defb 000h		;27b2	00 	. 
	defb 000h		;27b3	00 	. 
	defb 000h		;27b4	00 	. 
	defb 000h		;27b5	00 	. 
	defb 000h		;27b6	00 	. 
	defb 000h		;27b7	00 	. 
	defb 000h		;27b8	00 	. 
	defb 000h		;27b9	00 	. 
	defb 000h		;27ba	00 	. 
	defb 000h		;27bb	00 	. 
	defb 000h		;27bc	00 	. 
	defb 000h		;27bd	00 	. 
	defb 000h		;27be	00 	. 
	defb 000h		;27bf	00 	. 
	defb 000h		;27c0	00 	. 
	defb 000h		;27c1	00 	. 
	defb 000h		;27c2	00 	. 
	defb 000h		;27c3	00 	. 
	defb 000h		;27c4	00 	. 
	defb 000h		;27c5	00 	. 
	defb 000h		;27c6	00 	. 
	defb 000h		;27c7	00 	. 
	defb 000h		;27c8	00 	. 
	defb 000h		;27c9	00 	. 
	defb 000h		;27ca	00 	. 
	defb 000h		;27cb	00 	. 
	defb 000h		;27cc	00 	. 
	defb 000h		;27cd	00 	. 
	defb 000h		;27ce	00 	. 
	defb 000h		;27cf	00 	. 
	defb 000h		;27d0	00 	. 
	defb 000h		;27d1	00 	. 
	defb 000h		;27d2	00 	. 
	defb 000h		;27d3	00 	. 
	defb 000h		;27d4	00 	. 
	defb 000h		;27d5	00 	. 
	defb 000h		;27d6	00 	. 
	defb 000h		;27d7	00 	. 
	defb 000h		;27d8	00 	. 
	defb 000h		;27d9	00 	. 
	defb 000h		;27da	00 	. 
	defb 000h		;27db	00 	. 
	defb 000h		;27dc	00 	. 
	defb 000h		;27dd	00 	. 
	defb 000h		;27de	00 	. 
	defb 000h		;27df	00 	. 
	defb 000h		;27e0	00 	. 
	defb 000h		;27e1	00 	. 
	defb 000h		;27e2	00 	. 
	defb 000h		;27e3	00 	. 
	defb 000h		;27e4	00 	. 
	defb 000h		;27e5	00 	. 
	defb 000h		;27e6	00 	. 
	defb 000h		;27e7	00 	. 
	defb 000h		;27e8	00 	. 
	defb 000h		;27e9	00 	. 
	defb 000h		;27ea	00 	. 
	defb 000h		;27eb	00 	. 
	defb 000h		;27ec	00 	. 
	defb 000h		;27ed	00 	. 
	defb 000h		;27ee	00 	. 
	defb 000h		;27ef	00 	. 
	defb 000h		;27f0	00 	. 
	defb 000h		;27f1	00 	. 
	defb 000h		;27f2	00 	. 
	defb 000h		;27f3	00 	. 
	defb 000h		;27f4	00 	. 
	defb 000h		;27f5	00 	. 
	defb 000h		;27f6	00 	. 
	defb 000h		;27f7	00 	. 
	defb 000h		;27f8	00 	. 
	defb 000h		;27f9	00 	. 
	defb 000h		;27fa	00 	. 
	defb 000h		;27fb	00 	. 
	defb 000h		;27fc	00 	. 
	defb 000h		;27fd	00 	. 
	defb 000h		;27fe	00 	. 
	defb 000h		;27ff	00 	. 
	defb 000h		;2800	00 	. 
	defb 000h		;2801	00 	. 
	defb 000h		;2802	00 	. 
	defb 000h		;2803	00 	. 
	defb 000h		;2804	00 	. 
	defb 000h		;2805	00 	. 
	defb 000h		;2806	00 	. 
	defb 000h		;2807	00 	. 
	defb 000h		;2808	00 	. 
	defb 000h		;2809	00 	. 
	defb 000h		;280a	00 	. 
	defb 000h		;280b	00 	. 
	defb 000h		;280c	00 	. 
	defb 000h		;280d	00 	. 
	defb 000h		;280e	00 	. 
	defb 000h		;280f	00 	. 
	defb 000h		;2810	00 	. 
	defb 000h		;2811	00 	. 
	defb 000h		;2812	00 	. 
	defb 000h		;2813	00 	. 
	defb 000h		;2814	00 	. 
	defb 000h		;2815	00 	. 
	defb 000h		;2816	00 	. 
	defb 000h		;2817	00 	. 
	defb 000h		;2818	00 	. 
	defb 000h		;2819	00 	. 
	defb 000h		;281a	00 	. 
	defb 000h		;281b	00 	. 
l281ch:
	defb 000h		;281c	00 	. 
	defb 000h		;281d	00 	. 
	defb 000h		;281e	00 	. 
	defb 000h		;281f	00 	. 
	defb 000h		;2820	00 	. 
	defb 000h		;2821	00 	. 
	defb 000h		;2822	00 	. 
	defb 000h		;2823	00 	. 
	defb 000h		;2824	00 	. 
	defb 000h		;2825	00 	. 
	defb 000h		;2826	00 	. 
	defb 000h		;2827	00 	. 
	defb 000h		;2828	00 	. 
	defb 000h		;2829	00 	. 
	defb 000h		;282a	00 	. 
	defb 000h		;282b	00 	. 
	defb 000h		;282c	00 	. 
	defb 000h		;282d	00 	. 
	defb 000h		;282e	00 	. 
	defb 000h		;282f	00 	. 
	defb 000h		;2830	00 	. 
	defb 000h		;2831	00 	. 
	defb 000h		;2832	00 	. 
	defb 000h		;2833	00 	. 
	defb 000h		;2834	00 	. 
	defb 000h		;2835	00 	. 
	defb 000h		;2836	00 	. 
	defb 000h		;2837	00 	. 
	defb 000h		;2838	00 	. 
	defb 000h		;2839	00 	. 
	defb 000h		;283a	00 	. 
	defb 000h		;283b	00 	. 
	defb 000h		;283c	00 	. 
	defb 000h		;283d	00 	. 
	defb 000h		;283e	00 	. 
	defb 000h		;283f	00 	. 
	defb 000h		;2840	00 	. 
	defb 000h		;2841	00 	. 
	defb 000h		;2842	00 	. 
	defb 000h		;2843	00 	. 
	defb 000h		;2844	00 	. 
	defb 000h		;2845	00 	. 
	defb 000h		;2846	00 	. 
	defb 000h		;2847	00 	. 
	defb 000h		;2848	00 	. 
	defb 000h		;2849	00 	. 
	defb 000h		;284a	00 	. 
	defb 000h		;284b	00 	. 
	defb 000h		;284c	00 	. 
	defb 000h		;284d	00 	. 
	defb 000h		;284e	00 	. 
	defb 000h		;284f	00 	. 
	defb 000h		;2850	00 	. 
	defb 000h		;2851	00 	. 
	defb 000h		;2852	00 	. 
	defb 000h		;2853	00 	. 
	defb 000h		;2854	00 	. 
	defb 000h		;2855	00 	. 
	defb 000h		;2856	00 	. 
	defb 000h		;2857	00 	. 
	defb 000h		;2858	00 	. 
	defb 000h		;2859	00 	. 
	defb 000h		;285a	00 	. 
	defb 000h		;285b	00 	. 
	defb 000h		;285c	00 	. 
	defb 000h		;285d	00 	. 
	defb 000h		;285e	00 	. 
	defb 000h		;285f	00 	. 
	defb 000h		;2860	00 	. 
	defb 000h		;2861	00 	. 
	defb 000h		;2862	00 	. 
	defb 000h		;2863	00 	. 
	defb 000h		;2864	00 	. 
	defb 000h		;2865	00 	. 
	defb 000h		;2866	00 	. 
	defb 000h		;2867	00 	. 
	defb 000h		;2868	00 	. 
	defb 000h		;2869	00 	. 
	defb 000h		;286a	00 	. 
	defb 000h		;286b	00 	. 
	defb 000h		;286c	00 	. 
	defb 000h		;286d	00 	. 
	defb 000h		;286e	00 	. 
	defb 000h		;286f	00 	. 
	defb 000h		;2870	00 	. 
	defb 000h		;2871	00 	. 
	defb 000h		;2872	00 	. 
	defb 000h		;2873	00 	. 
	defb 000h		;2874	00 	. 
	defb 000h		;2875	00 	. 
	defb 000h		;2876	00 	. 
	defb 000h		;2877	00 	. 
	defb 000h		;2878	00 	. 
	defb 000h		;2879	00 	. 
	defb 000h		;287a	00 	. 
	defb 000h		;287b	00 	. 
	defb 000h		;287c	00 	. 
	defb 000h		;287d	00 	. 
	defb 000h		;287e	00 	. 
	defb 000h		;287f	00 	. 
	defb 000h		;2880	00 	. 
	defb 000h		;2881	00 	. 
	defb 000h		;2882	00 	. 
	defb 000h		;2883	00 	. 
	defb 000h		;2884	00 	. 
	defb 000h		;2885	00 	. 
	defb 000h		;2886	00 	. 
	defb 000h		;2887	00 	. 
	defb 000h		;2888	00 	. 
	defb 000h		;2889	00 	. 
	defb 000h		;288a	00 	. 
	defb 000h		;288b	00 	. 
	defb 000h		;288c	00 	. 
	defb 000h		;288d	00 	. 
	defb 000h		;288e	00 	. 
	defb 000h		;288f	00 	. 
	defb 000h		;2890	00 	. 
	defb 000h		;2891	00 	. 
	defb 000h		;2892	00 	. 
	defb 000h		;2893	00 	. 
	defb 000h		;2894	00 	. 
	defb 000h		;2895	00 	. 
	defb 000h		;2896	00 	. 
	defb 000h		;2897	00 	. 
	defb 000h		;2898	00 	. 
	defb 000h		;2899	00 	. 
	defb 000h		;289a	00 	. 
	defb 000h		;289b	00 	. 
	defb 000h		;289c	00 	. 
	defb 000h		;289d	00 	. 
	defb 000h		;289e	00 	. 
	defb 000h		;289f	00 	. 
	defb 000h		;28a0	00 	. 
	defb 000h		;28a1	00 	. 
	defb 000h		;28a2	00 	. 
	defb 000h		;28a3	00 	. 
	defb 000h		;28a4	00 	. 
	defb 000h		;28a5	00 	. 
	defb 000h		;28a6	00 	. 
	defb 000h		;28a7	00 	. 
	defb 000h		;28a8	00 	. 
	defb 000h		;28a9	00 	. 
	defb 000h		;28aa	00 	. 
	defb 000h		;28ab	00 	. 
	defb 000h		;28ac	00 	. 
	defb 000h		;28ad	00 	. 
	defb 000h		;28ae	00 	. 
	defb 000h		;28af	00 	. 
	defb 000h		;28b0	00 	. 
	defb 000h		;28b1	00 	. 
	defb 000h		;28b2	00 	. 
	defb 000h		;28b3	00 	. 
	defb 000h		;28b4	00 	. 
	defb 000h		;28b5	00 	. 
	defb 000h		;28b6	00 	. 
	defb 000h		;28b7	00 	. 
	defb 000h		;28b8	00 	. 
	defb 000h		;28b9	00 	. 
	defb 000h		;28ba	00 	. 
	defb 000h		;28bb	00 	. 
	defb 000h		;28bc	00 	. 
	defb 000h		;28bd	00 	. 
	defb 000h		;28be	00 	. 
	defb 000h		;28bf	00 	. 
	defb 000h		;28c0	00 	. 
	defb 000h		;28c1	00 	. 
	defb 000h		;28c2	00 	. 
	defb 000h		;28c3	00 	. 
	defb 000h		;28c4	00 	. 
	defb 000h		;28c5	00 	. 
	defb 000h		;28c6	00 	. 
	defb 000h		;28c7	00 	. 
	defb 000h		;28c8	00 	. 
	defb 000h		;28c9	00 	. 
	defb 000h		;28ca	00 	. 
	defb 000h		;28cb	00 	. 
	defb 000h		;28cc	00 	. 
	defb 000h		;28cd	00 	. 
	defb 000h		;28ce	00 	. 
	defb 000h		;28cf	00 	. 
	defb 000h		;28d0	00 	. 
	defb 000h		;28d1	00 	. 
	defb 000h		;28d2	00 	. 
	defb 000h		;28d3	00 	. 
	defb 000h		;28d4	00 	. 
	defb 000h		;28d5	00 	. 
	defb 000h		;28d6	00 	. 
	defb 000h		;28d7	00 	. 
	defb 000h		;28d8	00 	. 
	defb 000h		;28d9	00 	. 
	defb 000h		;28da	00 	. 
	defb 000h		;28db	00 	. 
	defb 000h		;28dc	00 	. 
	defb 000h		;28dd	00 	. 
	defb 000h		;28de	00 	. 
	defb 000h		;28df	00 	. 
	defb 000h		;28e0	00 	. 
	defb 000h		;28e1	00 	. 
	defb 000h		;28e2	00 	. 
	defb 000h		;28e3	00 	. 
	defb 000h		;28e4	00 	. 
	defb 000h		;28e5	00 	. 
	defb 000h		;28e6	00 	. 
	defb 000h		;28e7	00 	. 
	defb 000h		;28e8	00 	. 
	defb 000h		;28e9	00 	. 
	defb 000h		;28ea	00 	. 
	defb 000h		;28eb	00 	. 
	defb 000h		;28ec	00 	. 
	defb 000h		;28ed	00 	. 
	defb 000h		;28ee	00 	. 
	defb 000h		;28ef	00 	. 
	defb 000h		;28f0	00 	. 
	defb 000h		;28f1	00 	. 
	defb 000h		;28f2	00 	. 
	defb 000h		;28f3	00 	. 
	defb 000h		;28f4	00 	. 
	defb 000h		;28f5	00 	. 
	defb 000h		;28f6	00 	. 
	defb 000h		;28f7	00 	. 
	defb 000h		;28f8	00 	. 
	defb 000h		;28f9	00 	. 
	defb 000h		;28fa	00 	. 
	defb 000h		;28fb	00 	. 
	defb 000h		;28fc	00 	. 
	defb 000h		;28fd	00 	. 
	defb 000h		;28fe	00 	. 
	defb 000h		;28ff	00 	. 
	defb 000h		;2900	00 	. 
	defb 000h		;2901	00 	. 
	defb 000h		;2902	00 	. 
	defb 000h		;2903	00 	. 
	defb 000h		;2904	00 	. 
	defb 000h		;2905	00 	. 
	defb 000h		;2906	00 	. 
	defb 000h		;2907	00 	. 
	defb 000h		;2908	00 	. 
	defb 000h		;2909	00 	. 
	defb 000h		;290a	00 	. 
	defb 000h		;290b	00 	. 
	defb 000h		;290c	00 	. 
	defb 000h		;290d	00 	. 
	defb 000h		;290e	00 	. 
	defb 000h		;290f	00 	. 
	defb 000h		;2910	00 	. 
	defb 000h		;2911	00 	. 
	defb 000h		;2912	00 	. 
	defb 000h		;2913	00 	. 
	defb 000h		;2914	00 	. 
	defb 000h		;2915	00 	. 
	defb 000h		;2916	00 	. 
	defb 000h		;2917	00 	. 
	defb 000h		;2918	00 	. 
	defb 000h		;2919	00 	. 
	defb 000h		;291a	00 	. 
	defb 000h		;291b	00 	. 
	defb 000h		;291c	00 	. 
	defb 000h		;291d	00 	. 
	defb 000h		;291e	00 	. 
	defb 000h		;291f	00 	. 
	defb 000h		;2920	00 	. 
	defb 000h		;2921	00 	. 
	defb 000h		;2922	00 	. 
	defb 000h		;2923	00 	. 
	defb 000h		;2924	00 	. 
	defb 000h		;2925	00 	. 
	defb 000h		;2926	00 	. 
	defb 000h		;2927	00 	. 
	defb 000h		;2928	00 	. 
	defb 000h		;2929	00 	. 
	defb 000h		;292a	00 	. 
	defb 000h		;292b	00 	. 
	defb 000h		;292c	00 	. 
	defb 000h		;292d	00 	. 
	defb 000h		;292e	00 	. 
	defb 000h		;292f	00 	. 
	defb 000h		;2930	00 	. 
	defb 000h		;2931	00 	. 
	defb 000h		;2932	00 	. 
	defb 000h		;2933	00 	. 
	defb 000h		;2934	00 	. 
	defb 000h		;2935	00 	. 
	defb 000h		;2936	00 	. 
	defb 000h		;2937	00 	. 
	defb 000h		;2938	00 	. 
	defb 000h		;2939	00 	. 
	defb 000h		;293a	00 	. 
	defb 000h		;293b	00 	. 
	defb 000h		;293c	00 	. 
	defb 000h		;293d	00 	. 
	defb 000h		;293e	00 	. 
	defb 000h		;293f	00 	. 
	defb 000h		;2940	00 	. 
	defb 000h		;2941	00 	. 
	defb 000h		;2942	00 	. 
	defb 000h		;2943	00 	. 
	defb 000h		;2944	00 	. 
	defb 000h		;2945	00 	. 
	defb 000h		;2946	00 	. 
	defb 000h		;2947	00 	. 
	defb 000h		;2948	00 	. 
	defb 000h		;2949	00 	. 
	defb 000h		;294a	00 	. 
	defb 000h		;294b	00 	. 
	defb 000h		;294c	00 	. 
	defb 000h		;294d	00 	. 
	defb 000h		;294e	00 	. 
	defb 000h		;294f	00 	. 
	defb 000h		;2950	00 	. 
	defb 000h		;2951	00 	. 
	defb 000h		;2952	00 	. 
	defb 000h		;2953	00 	. 
	defb 000h		;2954	00 	. 
	defb 000h		;2955	00 	. 
	defb 000h		;2956	00 	. 
	defb 000h		;2957	00 	. 
	defb 000h		;2958	00 	. 
	defb 000h		;2959	00 	. 
	defb 000h		;295a	00 	. 
	defb 000h		;295b	00 	. 
	defb 000h		;295c	00 	. 
	defb 000h		;295d	00 	. 
	defb 000h		;295e	00 	. 
	defb 000h		;295f	00 	. 
	defb 000h		;2960	00 	. 
	defb 000h		;2961	00 	. 
	defb 000h		;2962	00 	. 
	defb 000h		;2963	00 	. 
	defb 000h		;2964	00 	. 
	defb 000h		;2965	00 	. 
	defb 000h		;2966	00 	. 
	defb 000h		;2967	00 	. 
	defb 000h		;2968	00 	. 
	defb 000h		;2969	00 	. 
	defb 000h		;296a	00 	. 
	defb 000h		;296b	00 	. 
	defb 000h		;296c	00 	. 
	defb 000h		;296d	00 	. 
	defb 000h		;296e	00 	. 
	defb 000h		;296f	00 	. 
	defb 000h		;2970	00 	. 
	defb 000h		;2971	00 	. 
	defb 000h		;2972	00 	. 
	defb 000h		;2973	00 	. 
	defb 000h		;2974	00 	. 
	defb 000h		;2975	00 	. 
	defb 000h		;2976	00 	. 
	defb 000h		;2977	00 	. 
	defb 000h		;2978	00 	. 
	defb 000h		;2979	00 	. 
	defb 000h		;297a	00 	. 
	defb 000h		;297b	00 	. 
	defb 000h		;297c	00 	. 
	defb 000h		;297d	00 	. 
	defb 000h		;297e	00 	. 
	defb 000h		;297f	00 	. 
	defb 000h		;2980	00 	. 
	defb 000h		;2981	00 	. 
	defb 000h		;2982	00 	. 
	defb 000h		;2983	00 	. 
	defb 000h		;2984	00 	. 
	defb 000h		;2985	00 	. 
	defb 000h		;2986	00 	. 
	defb 000h		;2987	00 	. 
	defb 000h		;2988	00 	. 
	defb 000h		;2989	00 	. 
	defb 000h		;298a	00 	. 
	defb 000h		;298b	00 	. 
	defb 000h		;298c	00 	. 
	defb 000h		;298d	00 	. 
	defb 000h		;298e	00 	. 
	defb 000h		;298f	00 	. 
	defb 000h		;2990	00 	. 
	defb 000h		;2991	00 	. 
	defb 000h		;2992	00 	. 
	defb 000h		;2993	00 	. 
	defb 000h		;2994	00 	. 
	defb 000h		;2995	00 	. 
	defb 000h		;2996	00 	. 
	defb 000h		;2997	00 	. 
	defb 000h		;2998	00 	. 
	defb 000h		;2999	00 	. 
	defb 000h		;299a	00 	. 
	defb 000h		;299b	00 	. 
	defb 000h		;299c	00 	. 
	defb 000h		;299d	00 	. 
	defb 000h		;299e	00 	. 
	defb 000h		;299f	00 	. 
	defb 000h		;29a0	00 	. 
	defb 000h		;29a1	00 	. 
	defb 000h		;29a2	00 	. 
	defb 000h		;29a3	00 	. 
	defb 000h		;29a4	00 	. 
	defb 000h		;29a5	00 	. 
	defb 000h		;29a6	00 	. 
	defb 000h		;29a7	00 	. 
	defb 000h		;29a8	00 	. 
	defb 000h		;29a9	00 	. 
	defb 000h		;29aa	00 	. 
	defb 000h		;29ab	00 	. 
	defb 000h		;29ac	00 	. 
	defb 000h		;29ad	00 	. 
	defb 000h		;29ae	00 	. 
	defb 000h		;29af	00 	. 
	defb 000h		;29b0	00 	. 
	defb 000h		;29b1	00 	. 
	defb 000h		;29b2	00 	. 
	defb 000h		;29b3	00 	. 
	defb 000h		;29b4	00 	. 
	defb 000h		;29b5	00 	. 
	defb 000h		;29b6	00 	. 
	defb 000h		;29b7	00 	. 
	defb 000h		;29b8	00 	. 
	defb 000h		;29b9	00 	. 
	defb 000h		;29ba	00 	. 
	defb 000h		;29bb	00 	. 
	defb 000h		;29bc	00 	. 
	defb 000h		;29bd	00 	. 
	defb 000h		;29be	00 	. 
	defb 000h		;29bf	00 	. 
	defb 000h		;29c0	00 	. 
	defb 000h		;29c1	00 	. 
	defb 000h		;29c2	00 	. 
	defb 000h		;29c3	00 	. 
	defb 000h		;29c4	00 	. 
	defb 000h		;29c5	00 	. 
	defb 000h		;29c6	00 	. 
	defb 000h		;29c7	00 	. 
	defb 000h		;29c8	00 	. 
	defb 000h		;29c9	00 	. 
	defb 000h		;29ca	00 	. 
	defb 000h		;29cb	00 	. 
	defb 000h		;29cc	00 	. 
	defb 000h		;29cd	00 	. 
	defb 000h		;29ce	00 	. 
	defb 000h		;29cf	00 	. 
	defb 000h		;29d0	00 	. 
	defb 000h		;29d1	00 	. 
	defb 000h		;29d2	00 	. 
	defb 000h		;29d3	00 	. 
	defb 000h		;29d4	00 	. 
	defb 000h		;29d5	00 	. 
	defb 000h		;29d6	00 	. 
	defb 000h		;29d7	00 	. 
	defb 000h		;29d8	00 	. 
	defb 000h		;29d9	00 	. 
	defb 000h		;29da	00 	. 
	defb 000h		;29db	00 	. 
	defb 000h		;29dc	00 	. 
	defb 000h		;29dd	00 	. 
	defb 000h		;29de	00 	. 
	defb 000h		;29df	00 	. 
	defb 000h		;29e0	00 	. 
	defb 000h		;29e1	00 	. 
	defb 000h		;29e2	00 	. 
	defb 000h		;29e3	00 	. 
	defb 000h		;29e4	00 	. 
	defb 000h		;29e5	00 	. 
	defb 000h		;29e6	00 	. 
	defb 000h		;29e7	00 	. 
	defb 000h		;29e8	00 	. 
	defb 000h		;29e9	00 	. 
	defb 000h		;29ea	00 	. 
	defb 000h		;29eb	00 	. 
	defb 000h		;29ec	00 	. 
	defb 000h		;29ed	00 	. 
	defb 000h		;29ee	00 	. 
	defb 000h		;29ef	00 	. 
	defb 000h		;29f0	00 	. 
	defb 000h		;29f1	00 	. 
	defb 000h		;29f2	00 	. 
	defb 000h		;29f3	00 	. 
	defb 000h		;29f4	00 	. 
	defb 000h		;29f5	00 	. 
	defb 000h		;29f6	00 	. 
	defb 000h		;29f7	00 	. 
	defb 000h		;29f8	00 	. 
	defb 000h		;29f9	00 	. 
	defb 000h		;29fa	00 	. 
	defb 000h		;29fb	00 	. 
	defb 000h		;29fc	00 	. 
	defb 000h		;29fd	00 	. 
	defb 000h		;29fe	00 	. 
	defb 000h		;29ff	00 	. 
	defb 000h		;2a00	00 	. 
	defb 000h		;2a01	00 	. 
	defb 000h		;2a02	00 	. 
	defb 000h		;2a03	00 	. 
	defb 000h		;2a04	00 	. 
	defb 000h		;2a05	00 	. 
	defb 000h		;2a06	00 	. 
	defb 000h		;2a07	00 	. 
	defb 000h		;2a08	00 	. 
	defb 000h		;2a09	00 	. 
	defb 000h		;2a0a	00 	. 
	defb 000h		;2a0b	00 	. 
	defb 000h		;2a0c	00 	. 
	defb 000h		;2a0d	00 	. 
	defb 000h		;2a0e	00 	. 
	defb 000h		;2a0f	00 	. 
	defb 000h		;2a10	00 	. 
	defb 000h		;2a11	00 	. 
	defb 000h		;2a12	00 	. 
	defb 000h		;2a13	00 	. 
l2a14h:
	defb 000h		;2a14	00 	. 
	defb 000h		;2a15	00 	. 
	defb 000h		;2a16	00 	. 
	defb 000h		;2a17	00 	. 
	defb 000h		;2a18	00 	. 
	defb 000h		;2a19	00 	. 
	defb 000h		;2a1a	00 	. 
	defb 000h		;2a1b	00 	. 
	defb 000h		;2a1c	00 	. 
	defb 000h		;2a1d	00 	. 
	defb 000h		;2a1e	00 	. 
	defb 000h		;2a1f	00 	. 
	defb 000h		;2a20	00 	. 
	defb 000h		;2a21	00 	. 
l2a22h:
	defb 000h		;2a22	00 	. 
	defb 000h		;2a23	00 	. 
	defb 000h		;2a24	00 	. 
	defb 000h		;2a25	00 	. 
l2a26h:
	defb 000h		;2a26	00 	. 
	defb 000h		;2a27	00 	. 
	defb 000h		;2a28	00 	. 
	defb 000h		;2a29	00 	. 
l2a2ah:
	defb 000h		;2a2a	00 	. 
	defb 000h		;2a2b	00 	. 
	defb 000h		;2a2c	00 	. 
	defb 000h		;2a2d	00 	. 
	defb 000h		;2a2e	00 	. 
	defb 000h		;2a2f	00 	. 
	defb 000h		;2a30	00 	. 
	defb 000h		;2a31	00 	. 
l2a32h:
	defb 000h		;2a32	00 	. 
	defb 000h		;2a33	00 	. 
	defb 000h		;2a34	00 	. 
	defb 000h		;2a35	00 	. 
l2a36h:
	defb 000h		;2a36	00 	. 
	defb 000h		;2a37	00 	. 
	defb 000h		;2a38	00 	. 
	defb 000h		;2a39	00 	. 
	defb 000h		;2a3a	00 	. 
	defb 000h		;2a3b	00 	. 
	defb 000h		;2a3c	00 	. 
	defb 000h		;2a3d	00 	. 
	defb 000h		;2a3e	00 	. 
	defb 000h		;2a3f	00 	. 
	defb 000h		;2a40	00 	. 
	defb 000h		;2a41	00 	. 
	defb 000h		;2a42	00 	. 
	defb 000h		;2a43	00 	. 
	defb 000h		;2a44	00 	. 
	defb 000h		;2a45	00 	. 
	defb 000h		;2a46	00 	. 
	defb 000h		;2a47	00 	. 
	defb 000h		;2a48	00 	. 
	defb 000h		;2a49	00 	. 
	defb 000h		;2a4a	00 	. 
	defb 000h		;2a4b	00 	. 
	defb 000h		;2a4c	00 	. 
	defb 000h		;2a4d	00 	. 
	defb 000h		;2a4e	00 	. 
	defb 000h		;2a4f	00 	. 
	defb 000h		;2a50	00 	. 
	defb 000h		;2a51	00 	. 
	defb 000h		;2a52	00 	. 
	defb 000h		;2a53	00 	. 
	defb 000h		;2a54	00 	. 
	defb 000h		;2a55	00 	. 
	defb 000h		;2a56	00 	. 
	defb 000h		;2a57	00 	. 
	defb 000h		;2a58	00 	. 
	defb 000h		;2a59	00 	. 
	defb 000h		;2a5a	00 	. 
	defb 000h		;2a5b	00 	. 
	defb 000h		;2a5c	00 	. 
	defb 000h		;2a5d	00 	. 
	defb 000h		;2a5e	00 	. 
	defb 000h		;2a5f	00 	. 
	defb 000h		;2a60	00 	. 
	defb 000h		;2a61	00 	. 
	defb 000h		;2a62	00 	. 
	defb 000h		;2a63	00 	. 
	defb 000h		;2a64	00 	. 
	defb 000h		;2a65	00 	. 
	defb 000h		;2a66	00 	. 
	defb 000h		;2a67	00 	. 
	defb 000h		;2a68	00 	. 
	defb 000h		;2a69	00 	. 
	defb 000h		;2a6a	00 	. 
	defb 000h		;2a6b	00 	. 
	defb 000h		;2a6c	00 	. 
	defb 000h		;2a6d	00 	. 
	defb 000h		;2a6e	00 	. 
	defb 000h		;2a6f	00 	. 
	defb 000h		;2a70	00 	. 
	defb 000h		;2a71	00 	. 
	defb 000h		;2a72	00 	. 
	defb 000h		;2a73	00 	. 
	defb 000h		;2a74	00 	. 
	defb 000h		;2a75	00 	. 
	defb 000h		;2a76	00 	. 
	defb 000h		;2a77	00 	. 
	defb 000h		;2a78	00 	. 
	defb 000h		;2a79	00 	. 
	defb 000h		;2a7a	00 	. 
	defb 000h		;2a7b	00 	. 
	defb 000h		;2a7c	00 	. 
	defb 000h		;2a7d	00 	. 
	defb 000h		;2a7e	00 	. 
l2a7fh:
	defb 000h		;2a7f	00 	. 
	defb 000h		;2a80	00 	. 
	defb 000h		;2a81	00 	. 
	defb 000h		;2a82	00 	. 
	defb 000h		;2a83	00 	. 
	defb 000h		;2a84	00 	. 
	defb 000h		;2a85	00 	. 
	defb 000h		;2a86	00 	. 
	defb 000h		;2a87	00 	. 
	defb 000h		;2a88	00 	. 
	defb 000h		;2a89	00 	. 
	defb 000h		;2a8a	00 	. 
	defb 000h		;2a8b	00 	. 
	defb 000h		;2a8c	00 	. 
	defb 000h		;2a8d	00 	. 
	defb 000h		;2a8e	00 	. 
	defb 000h		;2a8f	00 	. 
	defb 000h		;2a90	00 	. 
	defb 000h		;2a91	00 	. 
	defb 000h		;2a92	00 	. 
	defb 000h		;2a93	00 	. 
	defb 000h		;2a94	00 	. 
	defb 000h		;2a95	00 	. 
	defb 000h		;2a96	00 	. 
	defb 000h		;2a97	00 	. 
	defb 000h		;2a98	00 	. 
	defb 000h		;2a99	00 	. 
	defb 000h		;2a9a	00 	. 
	defb 000h		;2a9b	00 	. 
	defb 000h		;2a9c	00 	. 
	defb 000h		;2a9d	00 	. 
	defb 000h		;2a9e	00 	. 
	defb 000h		;2a9f	00 	. 
	defb 000h		;2aa0	00 	. 
	defb 000h		;2aa1	00 	. 
	defb 000h		;2aa2	00 	. 
	defb 000h		;2aa3	00 	. 
	defb 000h		;2aa4	00 	. 
	defb 000h		;2aa5	00 	. 
	defb 000h		;2aa6	00 	. 
	defb 000h		;2aa7	00 	. 
	defb 000h		;2aa8	00 	. 
	defb 000h		;2aa9	00 	. 
	defb 000h		;2aaa	00 	. 
	defb 000h		;2aab	00 	. 
	defb 000h		;2aac	00 	. 
	defb 000h		;2aad	00 	. 
	defb 000h		;2aae	00 	. 
	defb 000h		;2aaf	00 	. 
	defb 000h		;2ab0	00 	. 
	defb 000h		;2ab1	00 	. 
	defb 000h		;2ab2	00 	. 
	defb 000h		;2ab3	00 	. 
	defb 000h		;2ab4	00 	. 
	defb 000h		;2ab5	00 	. 
	defb 000h		;2ab6	00 	. 
	defb 000h		;2ab7	00 	. 
	defb 000h		;2ab8	00 	. 
	defb 000h		;2ab9	00 	. 
	defb 000h		;2aba	00 	. 
	defb 000h		;2abb	00 	. 
	defb 000h		;2abc	00 	. 
	defb 000h		;2abd	00 	. 
	defb 000h		;2abe	00 	. 
	defb 000h		;2abf	00 	. 
	defb 000h		;2ac0	00 	. 
	defb 000h		;2ac1	00 	. 
	defb 000h		;2ac2	00 	. 
	defb 000h		;2ac3	00 	. 
	defb 000h		;2ac4	00 	. 
	defb 000h		;2ac5	00 	. 
	defb 000h		;2ac6	00 	. 
	defb 000h		;2ac7	00 	. 
	defb 000h		;2ac8	00 	. 
	defb 000h		;2ac9	00 	. 
	defb 000h		;2aca	00 	. 
	defb 000h		;2acb	00 	. 
	defb 000h		;2acc	00 	. 
	defb 000h		;2acd	00 	. 
	defb 000h		;2ace	00 	. 
	defb 000h		;2acf	00 	. 
	defb 000h		;2ad0	00 	. 
	defb 000h		;2ad1	00 	. 
	defb 000h		;2ad2	00 	. 
	defb 000h		;2ad3	00 	. 
	defb 000h		;2ad4	00 	. 
	defb 000h		;2ad5	00 	. 
	defb 000h		;2ad6	00 	. 
	defb 000h		;2ad7	00 	. 
	defb 000h		;2ad8	00 	. 
	defb 000h		;2ad9	00 	. 
	defb 000h		;2ada	00 	. 
	defb 000h		;2adb	00 	. 
	defb 000h		;2adc	00 	. 
	defb 000h		;2add	00 	. 
	defb 000h		;2ade	00 	. 
	defb 000h		;2adf	00 	. 
	defb 000h		;2ae0	00 	. 
	defb 000h		;2ae1	00 	. 
	defb 000h		;2ae2	00 	. 
	defb 000h		;2ae3	00 	. 
	defb 000h		;2ae4	00 	. 
	defb 000h		;2ae5	00 	. 
	defb 000h		;2ae6	00 	. 
	defb 000h		;2ae7	00 	. 
	defb 000h		;2ae8	00 	. 
	defb 000h		;2ae9	00 	. 
	defb 000h		;2aea	00 	. 
	defb 000h		;2aeb	00 	. 
	defb 000h		;2aec	00 	. 
	defb 000h		;2aed	00 	. 
	defb 000h		;2aee	00 	. 
	defb 000h		;2aef	00 	. 
	defb 000h		;2af0	00 	. 
	defb 000h		;2af1	00 	. 
	defb 000h		;2af2	00 	. 
	defb 000h		;2af3	00 	. 
	defb 000h		;2af4	00 	. 
	defb 000h		;2af5	00 	. 
	defb 000h		;2af6	00 	. 
	defb 000h		;2af7	00 	. 
	defb 000h		;2af8	00 	. 
	defb 000h		;2af9	00 	. 
	defb 000h		;2afa	00 	. 
	defb 000h		;2afb	00 	. 
	defb 000h		;2afc	00 	. 
	defb 000h		;2afd	00 	. 
	defb 000h		;2afe	00 	. 
	defb 000h		;2aff	00 	. 
	defb 000h		;2b00	00 	. 
	defb 000h		;2b01	00 	. 
	defb 000h		;2b02	00 	. 
	defb 000h		;2b03	00 	. 
	defb 000h		;2b04	00 	. 
	defb 000h		;2b05	00 	. 
	defb 000h		;2b06	00 	. 
	defb 000h		;2b07	00 	. 
	defb 000h		;2b08	00 	. 
	defb 000h		;2b09	00 	. 
	defb 000h		;2b0a	00 	. 
	defb 000h		;2b0b	00 	. 
	defb 000h		;2b0c	00 	. 
	defb 000h		;2b0d	00 	. 
	defb 000h		;2b0e	00 	. 
	defb 000h		;2b0f	00 	. 
	defb 000h		;2b10	00 	. 
	defb 000h		;2b11	00 	. 
	defb 000h		;2b12	00 	. 
	defb 000h		;2b13	00 	. 
	defb 000h		;2b14	00 	. 
	defb 000h		;2b15	00 	. 
	defb 000h		;2b16	00 	. 
	defb 000h		;2b17	00 	. 
	defb 000h		;2b18	00 	. 
	defb 000h		;2b19	00 	. 
	defb 000h		;2b1a	00 	. 
	defb 000h		;2b1b	00 	. 
	defb 000h		;2b1c	00 	. 
	defb 000h		;2b1d	00 	. 
	defb 000h		;2b1e	00 	. 
	defb 000h		;2b1f	00 	. 
	defb 000h		;2b20	00 	. 
	defb 000h		;2b21	00 	. 
	defb 000h		;2b22	00 	. 
	defb 000h		;2b23	00 	. 
	defb 000h		;2b24	00 	. 
	defb 000h		;2b25	00 	. 
	defb 000h		;2b26	00 	. 
	defb 000h		;2b27	00 	. 
	defb 000h		;2b28	00 	. 
	defb 000h		;2b29	00 	. 
	defb 000h		;2b2a	00 	. 
	defb 000h		;2b2b	00 	. 
	defb 000h		;2b2c	00 	. 
	defb 000h		;2b2d	00 	. 
	defb 000h		;2b2e	00 	. 
	defb 000h		;2b2f	00 	. 
	defb 000h		;2b30	00 	. 
	defb 000h		;2b31	00 	. 
	defb 000h		;2b32	00 	. 
	defb 000h		;2b33	00 	. 
	defb 000h		;2b34	00 	. 
	defb 000h		;2b35	00 	. 
	defb 000h		;2b36	00 	. 
	defb 000h		;2b37	00 	. 
	defb 000h		;2b38	00 	. 
	defb 000h		;2b39	00 	. 
	defb 000h		;2b3a	00 	. 
	defb 000h		;2b3b	00 	. 
	defb 000h		;2b3c	00 	. 
	defb 000h		;2b3d	00 	. 
	defb 000h		;2b3e	00 	. 
	defb 000h		;2b3f	00 	. 
	defb 000h		;2b40	00 	. 
	defb 000h		;2b41	00 	. 
	defb 000h		;2b42	00 	. 
	defb 000h		;2b43	00 	. 
	defb 000h		;2b44	00 	. 
	defb 000h		;2b45	00 	. 
	defb 000h		;2b46	00 	. 
	defb 000h		;2b47	00 	. 
	defb 000h		;2b48	00 	. 
	defb 000h		;2b49	00 	. 
	defb 000h		;2b4a	00 	. 
	defb 000h		;2b4b	00 	. 
	defb 000h		;2b4c	00 	. 
	defb 000h		;2b4d	00 	. 
	defb 000h		;2b4e	00 	. 
	defb 000h		;2b4f	00 	. 
	defb 000h		;2b50	00 	. 
	defb 000h		;2b51	00 	. 
	defb 000h		;2b52	00 	. 
	defb 000h		;2b53	00 	. 
	defb 000h		;2b54	00 	. 
	defb 000h		;2b55	00 	. 
	defb 000h		;2b56	00 	. 
	defb 000h		;2b57	00 	. 
	defb 000h		;2b58	00 	. 
	defb 000h		;2b59	00 	. 
	defb 000h		;2b5a	00 	. 
	defb 000h		;2b5b	00 	. 
	defb 000h		;2b5c	00 	. 
	defb 000h		;2b5d	00 	. 
	defb 000h		;2b5e	00 	. 
	defb 000h		;2b5f	00 	. 
	defb 000h		;2b60	00 	. 
	defb 000h		;2b61	00 	. 
	defb 000h		;2b62	00 	. 
	defb 000h		;2b63	00 	. 
	defb 000h		;2b64	00 	. 
	defb 000h		;2b65	00 	. 
	defb 000h		;2b66	00 	. 
	defb 000h		;2b67	00 	. 
	defb 000h		;2b68	00 	. 
	defb 000h		;2b69	00 	. 
	defb 000h		;2b6a	00 	. 
	defb 000h		;2b6b	00 	. 
	defb 000h		;2b6c	00 	. 
	defb 000h		;2b6d	00 	. 
	defb 000h		;2b6e	00 	. 
	defb 000h		;2b6f	00 	. 
	defb 000h		;2b70	00 	. 
	defb 000h		;2b71	00 	. 
	defb 000h		;2b72	00 	. 
	defb 000h		;2b73	00 	. 
	defb 000h		;2b74	00 	. 
	defb 000h		;2b75	00 	. 
	defb 000h		;2b76	00 	. 
	defb 000h		;2b77	00 	. 
	defb 000h		;2b78	00 	. 
	defb 000h		;2b79	00 	. 
	defb 000h		;2b7a	00 	. 
	defb 000h		;2b7b	00 	. 
	defb 000h		;2b7c	00 	. 
	defb 000h		;2b7d	00 	. 
	defb 000h		;2b7e	00 	. 
	defb 000h		;2b7f	00 	. 
	defb 000h		;2b80	00 	. 
	defb 000h		;2b81	00 	. 
	defb 000h		;2b82	00 	. 
	defb 000h		;2b83	00 	. 
	defb 000h		;2b84	00 	. 
	defb 000h		;2b85	00 	. 
	defb 000h		;2b86	00 	. 
	defb 000h		;2b87	00 	. 
	defb 000h		;2b88	00 	. 
	defb 000h		;2b89	00 	. 
	defb 000h		;2b8a	00 	. 
	defb 000h		;2b8b	00 	. 
	defb 000h		;2b8c	00 	. 
	defb 000h		;2b8d	00 	. 
	defb 000h		;2b8e	00 	. 
	defb 000h		;2b8f	00 	. 
	defb 000h		;2b90	00 	. 
	defb 000h		;2b91	00 	. 
	defb 000h		;2b92	00 	. 
	defb 000h		;2b93	00 	. 
	defb 000h		;2b94	00 	. 
	defb 000h		;2b95	00 	. 
	defb 000h		;2b96	00 	. 
	defb 000h		;2b97	00 	. 
	defb 000h		;2b98	00 	. 
	defb 000h		;2b99	00 	. 
	defb 000h		;2b9a	00 	. 
	defb 000h		;2b9b	00 	. 
	defb 000h		;2b9c	00 	. 
	defb 000h		;2b9d	00 	. 
	defb 000h		;2b9e	00 	. 
	defb 000h		;2b9f	00 	. 
	defb 000h		;2ba0	00 	. 
	defb 000h		;2ba1	00 	. 
	defb 000h		;2ba2	00 	. 
	defb 000h		;2ba3	00 	. 
	defb 000h		;2ba4	00 	. 
	defb 000h		;2ba5	00 	. 
	defb 000h		;2ba6	00 	. 
	defb 000h		;2ba7	00 	. 
	defb 000h		;2ba8	00 	. 
	defb 000h		;2ba9	00 	. 
	defb 000h		;2baa	00 	. 
	defb 000h		;2bab	00 	. 
	defb 000h		;2bac	00 	. 
	defb 000h		;2bad	00 	. 
	defb 000h		;2bae	00 	. 
	defb 000h		;2baf	00 	. 
	defb 000h		;2bb0	00 	. 
	defb 000h		;2bb1	00 	. 
	defb 000h		;2bb2	00 	. 
	defb 000h		;2bb3	00 	. 
	defb 000h		;2bb4	00 	. 
	defb 000h		;2bb5	00 	. 
	defb 000h		;2bb6	00 	. 
	defb 000h		;2bb7	00 	. 
	defb 000h		;2bb8	00 	. 
	defb 000h		;2bb9	00 	. 
	defb 000h		;2bba	00 	. 
	defb 000h		;2bbb	00 	. 
	defb 000h		;2bbc	00 	. 
	defb 000h		;2bbd	00 	. 
	defb 000h		;2bbe	00 	. 
	defb 000h		;2bbf	00 	. 
	defb 000h		;2bc0	00 	. 
	defb 000h		;2bc1	00 	. 
	defb 000h		;2bc2	00 	. 
	defb 000h		;2bc3	00 	. 
	defb 000h		;2bc4	00 	. 
	defb 000h		;2bc5	00 	. 
	defb 000h		;2bc6	00 	. 
	defb 000h		;2bc7	00 	. 
	defb 000h		;2bc8	00 	. 
	defb 000h		;2bc9	00 	. 
	defb 000h		;2bca	00 	. 
	defb 000h		;2bcb	00 	. 
	defb 000h		;2bcc	00 	. 
	defb 000h		;2bcd	00 	. 
	defb 000h		;2bce	00 	. 
	defb 000h		;2bcf	00 	. 
	defb 000h		;2bd0	00 	. 
	defb 000h		;2bd1	00 	. 
	defb 000h		;2bd2	00 	. 
	defb 000h		;2bd3	00 	. 
	defb 000h		;2bd4	00 	. 
	defb 000h		;2bd5	00 	. 
	defb 000h		;2bd6	00 	. 
	defb 000h		;2bd7	00 	. 
	defb 000h		;2bd8	00 	. 
	defb 000h		;2bd9	00 	. 
	defb 000h		;2bda	00 	. 
	defb 000h		;2bdb	00 	. 
	defb 000h		;2bdc	00 	. 
	defb 000h		;2bdd	00 	. 
	defb 000h		;2bde	00 	. 
	defb 000h		;2bdf	00 	. 
	defb 000h		;2be0	00 	. 
	defb 000h		;2be1	00 	. 
	defb 000h		;2be2	00 	. 
	defb 000h		;2be3	00 	. 
	defb 000h		;2be4	00 	. 
	defb 000h		;2be5	00 	. 
	defb 000h		;2be6	00 	. 
	defb 000h		;2be7	00 	. 
	defb 000h		;2be8	00 	. 
	defb 000h		;2be9	00 	. 
	defb 000h		;2bea	00 	. 
	defb 000h		;2beb	00 	. 
	defb 000h		;2bec	00 	. 
	defb 000h		;2bed	00 	. 
	defb 000h		;2bee	00 	. 
	defb 000h		;2bef	00 	. 
	defb 000h		;2bf0	00 	. 
	defb 000h		;2bf1	00 	. 
	defb 000h		;2bf2	00 	. 
	defb 000h		;2bf3	00 	. 
	defb 000h		;2bf4	00 	. 
	defb 000h		;2bf5	00 	. 
	defb 000h		;2bf6	00 	. 
	defb 000h		;2bf7	00 	. 
	defb 000h		;2bf8	00 	. 
	defb 000h		;2bf9	00 	. 
	defb 000h		;2bfa	00 	. 
	defb 000h		;2bfb	00 	. 
	defb 000h		;2bfc	00 	. 
	defb 000h		;2bfd	00 	. 
	defb 000h		;2bfe	00 	. 
	defb 000h		;2bff	00 	. 
	defb 000h		;2c00	00 	. 
	defb 000h		;2c01	00 	. 
	defb 000h		;2c02	00 	. 
	defb 000h		;2c03	00 	. 
	defb 000h		;2c04	00 	. 
	defb 000h		;2c05	00 	. 
	defb 000h		;2c06	00 	. 
	defb 000h		;2c07	00 	. 
	defb 000h		;2c08	00 	. 
	defb 000h		;2c09	00 	. 
	defb 000h		;2c0a	00 	. 
	defb 000h		;2c0b	00 	. 
	defb 000h		;2c0c	00 	. 
	defb 000h		;2c0d	00 	. 
	defb 000h		;2c0e	00 	. 
	defb 000h		;2c0f	00 	. 
	defb 000h		;2c10	00 	. 
	defb 000h		;2c11	00 	. 
l2c12h:
	defb 000h		;2c12	00 	. 
	defb 000h		;2c13	00 	. 
	defb 000h		;2c14	00 	. 
	defb 000h		;2c15	00 	. 
	defb 000h		;2c16	00 	. 
	defb 000h		;2c17	00 	. 
	defb 000h		;2c18	00 	. 
	defb 000h		;2c19	00 	. 
	defb 000h		;2c1a	00 	. 
	defb 000h		;2c1b	00 	. 
l2c1ch:
	defb 07fh		;2c1c	7f 	 
	defb 0a3h		;2c1d	a3 	. 
	defb 0ffh		;2c1e	ff 	. 
	defb 0a3h		;2c1f	a3 	. 
	defb 07fh		;2c20	7f 	 
	defb 0a4h		;2c21	a4 	. 
	defb 0ffh		;2c22	ff 	. 
	defb 0a4h		;2c23	a4 	. 
	defb 07fh		;2c24	7f 	 
	defb 0a5h		;2c25	a5 	. 
	defb 0ffh		;2c26	ff 	. 
	defb 0a5h		;2c27	a5 	. 
	defb 07fh		;2c28	7f 	 
	defb 0a5h		;2c29	a5 	. 
	defb 0ffh		;2c2a	ff 	. 
	defb 0a5h		;2c2b	a5 	. 
l2c2ch:
	defw 00c00h		;2c2c	00 0c 	. . 
l2c2eh:
	defw 00000h		;2c2e	00 00 	. . 
	defw 00000h		;2c30	00 00 	. . 
l2c32h:
	defb 000h		;2c32	00 	. 
l2c33h:
	defb 000h		;2c33	00 	. 
l2c34h:
	defb 000h		;2c34	00 	. 
l2c35h:
	defb 000h		;2c35	00 	. 
l2c36h:
	defw 00000h		;2c36	00 00 	. . 
l2c38h:
	defw 00000h		;2c38	00 00 	. . 
l2c3ah:
	defb 000h		;2c3a	00 	. 
	defb 000h		;2c3b	00 	. 
	defb 000h		;2c3c	00 	. 
	defb 000h		;2c3d	00 	. 
	defb 000h		;2c3e	00 	. 
	defb 000h		;2c3f	00 	. 
	defb 000h		;2c40	00 	. 
	defb 000h		;2c41	00 	. 
	defb 000h		;2c42	00 	. 
	defb 000h		;2c43	00 	. 
	defb 000h		;2c44	00 	. 
	defb 000h		;2c45	00 	. 
	defb 000h		;2c46	00 	. 
	defb 000h		;2c47	00 	. 
sys_page_eyeball:
	defb 043h		;2c48	43 	C 
	defb 050h		;2c49	50 	P 
	defb 02fh		;2c4a	2f 	/ 
	defb 04dh		;2c4b	4d 	M 
	defb 02dh		;2c4c	2d 	- 
	defb 038h		;2c4d	38 	8 
	defb 030h		;2c4e	30 	0 
	defb 020h		;2c4f	20 	  
	defb 02dh		;2c50	2d 	- 
	defb 020h		;2c51	20 	  
	defb 045h		;2c52	45 	E 
	defb 050h		;2c53	50 	P 
	defb 053h		;2c54	53 	S 
	defb 04fh		;2c55	4f 	O 
	defb 04eh		;2c56	4e 	N 
	defb 020h		;2c57	20 	  
	defb 051h		;2c58	51 	Q 
	defb 058h		;2c59	58 	X 
	defb 02dh		;2c5a	2d 	- 
	defb 031h		;2c5b	31 	1 
	defb 030h		;2c5c	30 	0 
sys_page_release:
	defb 042h		;2c5d	42 	B 
sys_page_revision:
	defb 032h		;2c5e	32 	2 
	defb 032h		;2c5f	32 	2 
	defb 030h		;2c60	30 	0 
sys_page_err_recovery:
	defb 001h		;2c61	01 	. 
sys_page_err_diag:
	defb 001h		;2c62	01 	. 
sys_page_clock:
	defb 001h		;2c63	01 	. 
sys_page_crt_wrap:
	defb 001h		;2c64	01 	. 
sys_page_cursor_blink:
	defb 001h		;2c65	01 	. 
sys_page_keyboard:
	defb 002h		;2c66	02 	. 
sys_page_typamatic:
	defb 001h		;2c67	01 	. 
sys_page_iobyte:
	defb 081h		;2c68	81 	. 
sys_page_sio_baud:
	defb 008h		;2c69	08 	. 
sys_page_sio_pro:
	defb 000h		;2c6a	00 	. 
sys_page_sio_parity:
	defb 000h		;2c6b	00 	. 
sys_page_sio_stop:
	defb 000h		;2c6c	00 	. 
sys_page_sio_data:
	defb 003h		;2c6d	03 	. 
sys_page_auto_boot:
	defb 000h		;2c6e	00 	. 
sys_page_disp_mask:
	defb 000h		;2c6f	00 	. 
sys_page_sio_mask:
	defb 000h		;2c70	00 	. 
sys_page_shift_lock:
	defb 000h		;2c71	00 	. 
sys_page_func_tbl:
	defb 000h		;2c72	00 	. 
sys_page_ram_disk:
	defb 001h		;2c73	01 	. 
sys_page_printer:
	defb 003h		;2c74	03 	. 
sys_page_disk_format:
	defb 000h		;2c75	00 	. 
sys_page_video_type:
	defb 000h		;2c76	00 	. 
sys_page_par_mask:
	defb 000h		;2c77	00 	. 
sys_page_sio_int:
	defb 000h		;2c78	00 	. 
sys_page_single_sheet:
	defb 000h		;2c79	00 	. 
	defb 000h		;2c7a	00 	. 
	defb 000h		;2c7b	00 	. 
	defb 000h		;2c7c	00 	. 
	defb 000h		;2c7d	00 	. 
	defb 000h		;2c7e	00 	. 
	defb 000h		;2c7f	00 	. 
	defb 000h		;2c80	00 	. 
	defb 000h		;2c81	00 	. 
	defb 000h		;2c82	00 	. 
	defb 000h		;2c83	00 	. 
	defb 000h		;2c84	00 	. 
	defb 000h		;2c85	00 	. 
	defb 000h		;2c86	00 	. 
	defb 000h		;2c87	00 	. 
sys_page_drv_assign:
	defb 001h		;2c88	01 	. 
	defb 002h		;2c89	02 	. 
	defb 000h		;2c8a	00 	. 
	defb 000h		;2c8b	00 	. 
	defb 000h		;2c8c	00 	. 
	defb 000h		;2c8d	00 	. 
	defb 000h		;2c8e	00 	. 
	defb 000h		;2c8f	00 	. 
	defb 000h		;2c90	00 	. 
	defb 000h		;2c91	00 	. 
	defb 000h		;2c92	00 	. 
	defb 000h		;2c93	00 	. 
	defb 003h		;2c94	03 	. 
	defb 000h		;2c95	00 	. 
	defb 000h		;2c96	00 	. 
	defb 000h		;2c97	00 	. 
sys_page_cur_drv_assign:
	defb 000h		;2c98	00 	. 
	defb 000h		;2c99	00 	. 
	defb 000h		;2c9a	00 	. 
	defb 000h		;2c9b	00 	. 
	defb 000h		;2c9c	00 	. 
	defb 000h		;2c9d	00 	. 
	defb 000h		;2c9e	00 	. 
	defb 000h		;2c9f	00 	. 
	defb 000h		;2ca0	00 	. 
	defb 000h		;2ca1	00 	. 
	defb 000h		;2ca2	00 	. 
	defb 000h		;2ca3	00 	. 
	defb 000h		;2ca4	00 	. 
	defb 000h		;2ca5	00 	. 
	defb 000h		;2ca6	00 	. 
	defb 000h		;2ca7	00 	. 
sys_page_auto_len:
	defb 000h		;2ca8	00 	. 
sys_page_auto_string:
	defb 000h		;2ca9	00 	. 
	defb 000h		;2caa	00 	. 
	defb 000h		;2cab	00 	. 
	defb 000h		;2cac	00 	. 
	defb 000h		;2cad	00 	. 
	defb 000h		;2cae	00 	. 
	defb 000h		;2caf	00 	. 
	defb 000h		;2cb0	00 	. 
	defb 000h		;2cb1	00 	. 
	defb 000h		;2cb2	00 	. 
	defb 000h		;2cb3	00 	. 
	defb 000h		;2cb4	00 	. 
	defb 000h		;2cb5	00 	. 
	defb 000h		;2cb6	00 	. 
	defb 000h		;2cb7	00 	. 
	defb 000h		;2cb8	00 	. 
	defb 000h		;2cb9	00 	. 
	defb 000h		;2cba	00 	. 
	defb 000h		;2cbb	00 	. 
	defb 000h		;2cbc	00 	. 
	defb 000h		;2cbd	00 	. 
	defb 000h		;2cbe	00 	. 
	defb 000h		;2cbf	00 	. 
	defb 000h		;2cc0	00 	. 
	defb 000h		;2cc1	00 	. 
	defb 000h		;2cc2	00 	. 
	defb 000h		;2cc3	00 	. 
	defb 000h		;2cc4	00 	. 
	defb 000h		;2cc5	00 	. 
	defb 000h		;2cc6	00 	. 
sys_page_valid:
	defb 05ah		;2cc7	5a 	Z 
	defb 000h		;2cc8	00 	. 
	defb 000h		;2cc9	00 	. 
	defb 000h		;2cca	00 	. 
	defb 000h		;2ccb	00 	. 
	defb 000h		;2ccc	00 	. 
	defb 000h		;2ccd	00 	. 
	defb 000h		;2cce	00 	. 
	defb 000h		;2ccf	00 	. 
	defb 000h		;2cd0	00 	. 
	defb 000h		;2cd1	00 	. 
	defb 000h		;2cd2	00 	. 
	defb 000h		;2cd3	00 	. 
	defb 000h		;2cd4	00 	. 
	defb 000h		;2cd5	00 	. 
	defb 000h		;2cd6	00 	. 
	defb 000h		;2cd7	00 	. 
l2cd8h:
	defb 000h		;2cd8	00 	. 
	defb 000h		;2cd9	00 	. 
	defb 000h		;2cda	00 	. 
	defb 000h		;2cdb	00 	. 
	defb 000h		;2cdc	00 	. 
	defb 000h		;2cdd	00 	. 
	defb 000h		;2cde	00 	. 
	defb 000h		;2cdf	00 	. 
	defb 000h		;2ce0	00 	. 
	defb 000h		;2ce1	00 	. 
	defb 000h		;2ce2	00 	. 
	defb 000h		;2ce3	00 	. 
	defb 000h		;2ce4	00 	. 
	defb 000h		;2ce5	00 	. 
	defb 000h		;2ce6	00 	. 
	defb 000h		;2ce7	00 	. 
	defb 000h		;2ce8	00 	. 
	defb 000h		;2ce9	00 	. 
	defb 000h		;2cea	00 	. 
	defb 000h		;2ceb	00 	. 
	defb 000h		;2cec	00 	. 
	defb 000h		;2ced	00 	. 
	defb 000h		;2cee	00 	. 
	defb 000h		;2cef	00 	. 
	defb 000h		;2cf0	00 	. 
	defb 000h		;2cf1	00 	. 
	defb 000h		;2cf2	00 	. 
	defb 000h		;2cf3	00 	. 
	defb 000h		;2cf4	00 	. 
	defb 000h		;2cf5	00 	. 
	defb 000h		;2cf6	00 	. 
	defb 000h		;2cf7	00 	. 
	defb 000h		;2cf8	00 	. 
	defb 000h		;2cf9	00 	. 
	defb 000h		;2cfa	00 	. 
	defb 000h		;2cfb	00 	. 
	defb 000h		;2cfc	00 	. 
	defb 000h		;2cfd	00 	. 
	defb 000h		;2cfe	00 	. 
	defb 000h		;2cff	00 	. 
	defb 000h		;2d00	00 	. 
	defb 000h		;2d01	00 	. 
	defb 000h		;2d02	00 	. 
	defb 000h		;2d03	00 	. 
	defb 000h		;2d04	00 	. 
	defb 000h		;2d05	00 	. 
	defb 000h		;2d06	00 	. 
	defb 000h		;2d07	00 	. 
	defb 000h		;2d08	00 	. 
	defb 000h		;2d09	00 	. 
	defb 000h		;2d0a	00 	. 
	defb 000h		;2d0b	00 	. 
	defb 000h		;2d0c	00 	. 
	defb 000h		;2d0d	00 	. 
	defb 000h		;2d0e	00 	. 
	defb 000h		;2d0f	00 	. 
	defb 000h		;2d10	00 	. 
	defb 000h		;2d11	00 	. 
	defb 000h		;2d12	00 	. 
	defb 000h		;2d13	00 	. 
	defb 000h		;2d14	00 	. 
	defb 000h		;2d15	00 	. 
	defb 000h		;2d16	00 	. 
	defb 000h		;2d17	00 	. 
	defb 000h		;2d18	00 	. 
	defb 000h		;2d19	00 	. 
	defb 000h		;2d1a	00 	. 
	defb 000h		;2d1b	00 	. 
	defb 000h		;2d1c	00 	. 
	defb 000h		;2d1d	00 	. 
	defb 000h		;2d1e	00 	. 
	defb 000h		;2d1f	00 	. 
	defb 000h		;2d20	00 	. 
	defb 000h		;2d21	00 	. 
	defb 000h		;2d22	00 	. 
	defb 000h		;2d23	00 	. 
	defb 000h		;2d24	00 	. 
	defb 000h		;2d25	00 	. 
	defb 000h		;2d26	00 	. 
	defb 000h		;2d27	00 	. 
	defb 000h		;2d28	00 	. 
	defb 000h		;2d29	00 	. 
	defb 000h		;2d2a	00 	. 
	defb 000h		;2d2b	00 	. 
	defb 000h		;2d2c	00 	. 
	defb 000h		;2d2d	00 	. 
	defb 000h		;2d2e	00 	. 
	defb 000h		;2d2f	00 	. 
	defb 000h		;2d30	00 	. 
	defb 000h		;2d31	00 	. 
	defb 000h		;2d32	00 	. 
	defb 000h		;2d33	00 	. 
	defb 000h		;2d34	00 	. 
	defb 000h		;2d35	00 	. 
	defb 000h		;2d36	00 	. 
	defb 000h		;2d37	00 	. 
	defb 000h		;2d38	00 	. 
	defb 000h		;2d39	00 	. 
	defb 000h		;2d3a	00 	. 
	defb 000h		;2d3b	00 	. 
	defb 000h		;2d3c	00 	. 
	defb 000h		;2d3d	00 	. 
	defb 000h		;2d3e	00 	. 
	defb 000h		;2d3f	00 	. 
	defb 000h		;2d40	00 	. 
	defb 000h		;2d41	00 	. 
	defb 053h		;2d42	53 	S 
	defb 045h		;2d43	45 	E 
	defb 052h		;2d44	52 	R 
	defb 049h		;2d45	49 	I 
	defb 041h		;2d46	41 	A 
	defb 04ch		;2d47	4c 	L 
l2d48h:
	defb 020h		;2d48	20 	  
	defb 000h		;2d49	00 	. 
l2d4ah:
	defb 007h		;2d4a	07 	. 
	defb 01bh		;2d4b	1b 	. 
	defb 06ah		;2d4c	6a 	j 
	defb 020h		;2d4d	20 	  
	defb 052h		;2d4e	52 	R 
	defb 041h		;2d4f	41 	A 
	defb 04dh		;2d50	4d 	M 
	defb 020h		;2d51	20 	  
	defb 044h		;2d52	44 	D 
	defb 049h		;2d53	49 	I 
	defb 053h		;2d54	53 	S 
	defb 04bh		;2d55	4b 	K 
	defb 020h		;2d56	20 	  
	defb 044h		;2d57	44 	D 
	defb 041h		;2d58	41 	A 
	defb 054h		;2d59	54 	T 
	defb 041h		;2d5a	41 	A 
	defb 020h		;2d5b	20 	  
	defb 057h		;2d5c	57 	W 
	defb 049h		;2d5d	49 	I 
	defb 04ch		;2d5e	4c 	L 
	defb 04ch		;2d5f	4c 	L 
	defb 020h		;2d60	20 	  
	defb 042h		;2d61	42 	B 
	defb 045h		;2d62	45 	E 
	defb 020h		;2d63	20 	  
	defb 04ch		;2d64	4c 	L 
	defb 04fh		;2d65	4f 	O 
	defb 053h		;2d66	53 	S 
	defb 054h		;2d67	54 	T 
	defb 020h		;2d68	20 	  
	defb 049h		;2d69	49 	I 
	defb 046h		;2d6a	46 	F 
	defb 020h		;2d6b	20 	  
	defb 044h		;2d6c	44 	D 
	defb 049h		;2d6d	49 	I 
	defb 053h		;2d6e	53 	S 
	defb 041h		;2d6f	41 	A 
	defb 042h		;2d70	42 	B 
	defb 04ch		;2d71	4c 	L 
	defb 045h		;2d72	45 	E 
	defb 044h		;2d73	44 	D 
	defb 021h		;2d74	21 	! 
	defb 020h		;2d75	20 	  
	defb 028h		;2d76	28 	( 
	defb 041h		;2d77	41 	A 
	defb 029h		;2d78	29 	) 
	defb 062h		;2d79	62 	b 
	defb 06fh		;2d7a	6f 	o 
	defb 072h		;2d7b	72 	r 
	defb 074h		;2d7c	74 	t 
	defb 02ch		;2d7d	2c 	, 
	defb 020h		;2d7e	20 	  
	defb 028h		;2d7f	28 	( 
	defb 043h		;2d80	43 	C 
	defb 029h		;2d81	29 	) 
	defb 06fh		;2d82	6f 	o 
	defb 06eh		;2d83	6e 	n 
	defb 074h		;2d84	74 	t 
	defb 069h		;2d85	69 	i 
	defb 06eh		;2d86	6e 	n 
	defb 075h		;2d87	75 	u 
	defb 065h		;2d88	65 	e 
	defb 03ah		;2d89	3a 	: 
	defb 01bh		;2d8a	1b 	. 
	defb 06bh		;2d8b	6b 	k 
	defb 000h		;2d8c	00 	. 
l2d8dh:
	defb 000h		;2d8d	00 	. 
l2d8eh:
	defb 000h		;2d8e	00 	. 
l2d8fh:
	defb 009h		;2d8f	09 	. 
	defb 009h		;2d90	09 	. 
	defb 0e4h		;2d91	e4 	. 
	defb 0f8h		;2d92	f8 	. 
	defb 0f8h		;2d93	f8 	. 
	defb 0f8h		;2d94	f8 	. 
	defb 0f8h		;2d95	f8 	. 
	defb 0f8h		;2d96	f8 	. 
	defb 0f8h		;2d97	f8 	. 
	defb 0f8h		;2d98	f8 	. 
	defb 0f8h		;2d99	f8 	. 
	defb 0f8h		;2d9a	f8 	. 
	defb 0f8h		;2d9b	f8 	. 
	defb 0f8h		;2d9c	f8 	. 
	defb 0f8h		;2d9d	f8 	. 
	defb 0f8h		;2d9e	f8 	. 
	defb 0f8h		;2d9f	f8 	. 
	defb 0f8h		;2da0	f8 	. 
	defb 0f8h		;2da1	f8 	. 
	defb 0f8h		;2da2	f8 	. 
	defb 0f8h		;2da3	f8 	. 
	defb 0f8h		;2da4	f8 	. 
	defb 0f8h		;2da5	f8 	. 
	defb 0f8h		;2da6	f8 	. 
	defb 0f8h		;2da7	f8 	. 
	defb 0f8h		;2da8	f8 	. 
	defb 0f8h		;2da9	f8 	. 
	defb 0f8h		;2daa	f8 	. 
	defb 0f8h		;2dab	f8 	. 
	defb 0f8h		;2dac	f8 	. 
	defb 0f8h		;2dad	f8 	. 
	defb 0f8h		;2dae	f8 	. 
	defb 0f8h		;2daf	f8 	. 
	defb 0f8h		;2db0	f8 	. 
	defb 0f8h		;2db1	f8 	. 
	defb 0f8h		;2db2	f8 	. 
	defb 0f8h		;2db3	f8 	. 
	defb 0f8h		;2db4	f8 	. 
	defb 0f8h		;2db5	f8 	. 
	defb 0f8h		;2db6	f8 	. 
	defb 0f8h		;2db7	f8 	. 
	defb 0f8h		;2db8	f8 	. 
	defb 0f8h		;2db9	f8 	. 
	defb 0f8h		;2dba	f8 	. 
	defb 0f8h		;2dbb	f8 	. 
	defb 0f8h		;2dbc	f8 	. 
	defb 0f8h		;2dbd	f8 	. 
	defb 0f8h		;2dbe	f8 	. 
	defb 0f4h		;2dbf	f4 	. 
	defb 00dh		;2dc0	0d 	. 
	defb 00ah		;2dc1	0a 	. 
	defb 009h		;2dc2	09 	. 
	defb 009h		;2dc3	09 	. 
	defb 0f9h		;2dc4	f9 	. 
	defb 020h		;2dc5	20 	  
	defb 020h		;2dc6	20 	  
	defb 020h		;2dc7	20 	  
	defb 020h		;2dc8	20 	  
	defb 020h		;2dc9	20 	  
	defb 020h		;2dca	20 	  
	defb 043h		;2dcb	43 	C 
	defb 050h		;2dcc	50 	P 
	defb 02fh		;2dcd	2f 	/ 
	defb 04dh		;2dce	4d 	M 
	defb 02dh		;2dcf	2d 	- 
	defb 038h		;2dd0	38 	8 
	defb 030h		;2dd1	30 	0 
	defb 020h		;2dd2	20 	  
	defb 020h		;2dd3	20 	  
	defb 052h		;2dd4	52 	R 
	defb 032h		;2dd5	32 	2 
	defb 02eh		;2dd6	2e 	. 
	defb 032h		;2dd7	32 	2 
	defb 020h		;2dd8	20 	  
	defb 046h		;2dd9	46 	F 
	defb 04fh		;2dda	4f 	O 
	defb 052h		;2ddb	52 	R 
	defb 020h		;2ddc	20 	  
	defb 054h		;2ddd	54 	T 
	defb 048h		;2dde	48 	H 
	defb 045h		;2ddf	45 	E 
	defb 020h		;2de0	20 	  
	defb 045h		;2de1	45 	E 
	defb 050h		;2de2	50 	P 
	defb 053h		;2de3	53 	S 
	defb 04fh		;2de4	4f 	O 
	defb 04eh		;2de5	4e 	N 
	defb 020h		;2de6	20 	  
	defb 051h		;2de7	51 	Q 
	defb 058h		;2de8	58 	X 
	defb 02dh		;2de9	2d 	- 
	defb 031h		;2dea	31 	1 
	defb 030h		;2deb	30 	0 
	defb 020h		;2dec	20 	  
	defb 020h		;2ded	20 	  
	defb 020h		;2dee	20 	  
	defb 020h		;2def	20 	  
	defb 020h		;2df0	20 	  
	defb 020h		;2df1	20 	  
	defb 0f9h		;2df2	f9 	. 
	defb 00dh		;2df3	0d 	. 
	defb 00ah		;2df4	0a 	. 
	defb 009h		;2df5	09 	. 
	defb 009h		;2df6	09 	. 
	defb 0f9h		;2df7	f9 	. 
	defb 020h		;2df8	20 	  
	defb 020h		;2df9	20 	  
	defb 020h		;2dfa	20 	  
	defb 020h		;2dfb	20 	  
	defb 043h		;2dfc	43 	C 
	defb 04fh		;2dfd	4f 	O 
	defb 050h		;2dfe	50 	P 
	defb 059h		;2dff	59 	Y 
	defb 052h		;2e00	52 	R 
	defb 049h		;2e01	49 	I 
	defb 047h		;2e02	47 	G 
	defb 048h		;2e03	48 	H 
	defb 054h		;2e04	54 	T 
	defb 020h		;2e05	20 	  
	defb 0d0h		;2e06	d0 	. 
	defb 020h		;2e07	20 	  
	defb 031h		;2e08	31 	1 
	defb 039h		;2e09	39 	9 
	defb 038h		;2e0a	38 	8 
	defb 033h		;2e0b	33 	3 
	defb 02ch		;2e0c	2c 	, 
	defb 020h		;2e0d	20 	  
	defb 045h		;2e0e	45 	E 
	defb 050h		;2e0f	50 	P 
	defb 053h		;2e10	53 	S 
	defb 04fh		;2e11	4f 	O 
	defb 04eh		;2e12	4e 	N 
	defb 020h		;2e13	20 	  
	defb 041h		;2e14	41 	A 
	defb 04dh		;2e15	4d 	M 
	defb 045h		;2e16	45 	E 
	defb 052h		;2e17	52 	R 
	defb 049h		;2e18	49 	I 
	defb 043h		;2e19	43 	C 
	defb 041h		;2e1a	41 	A 
	defb 02ch		;2e1b	2c 	, 
	defb 020h		;2e1c	20 	  
	defb 049h		;2e1d	49 	I 
	defb 04eh		;2e1e	4e 	N 
	defb 043h		;2e1f	43 	C 
	defb 02eh		;2e20	2e 	. 
	defb 020h		;2e21	20 	  
	defb 020h		;2e22	20 	  
	defb 020h		;2e23	20 	  
	defb 020h		;2e24	20 	  
	defb 0f9h		;2e25	f9 	. 
	defb 00dh		;2e26	0d 	. 
	defb 00ah		;2e27	0a 	. 
	defb 009h		;2e28	09 	. 
	defb 009h		;2e29	09 	. 
	defb 0f9h		;2e2a	f9 	. 
	defb 020h		;2e2b	20 	  
	defb 020h		;2e2c	20 	  
	defb 020h		;2e2d	20 	  
	defb 020h		;2e2e	20 	  
	defb 020h		;2e2f	20 	  
	defb 020h		;2e30	20 	  
l2e31h:
	defb 020h		;2e31	20 	  
	defb 020h		;2e32	20 	  
	defb 020h		;2e33	20 	  
	defb 020h		;2e34	20 	  
	defb 020h		;2e35	20 	  
	defb 020h		;2e36	20 	  
	defb 020h		;2e37	20 	  
	defb 041h		;2e38	41 	A 
	defb 04ch		;2e39	4c 	L 
	defb 04ch		;2e3a	4c 	L 
	defb 020h		;2e3b	20 	  
	defb 052h		;2e3c	52 	R 
	defb 049h		;2e3d	49 	I 
	defb 047h		;2e3e	47 	G 
	defb 048h		;2e3f	48 	H 
	defb 054h		;2e40	54 	T 
	defb 053h		;2e41	53 	S 
	defb 020h		;2e42	20 	  
	defb 052h		;2e43	52 	R 
	defb 045h		;2e44	45 	E 
	defb 053h		;2e45	53 	S 
	defb 045h		;2e46	45 	E 
	defb 052h		;2e47	52 	R 
	defb 056h		;2e48	56 	V 
	defb 045h		;2e49	45 	E 
	defb 044h		;2e4a	44 	D 
	defb 020h		;2e4b	20 	  
	defb 020h		;2e4c	20 	  
	defb 020h		;2e4d	20 	  
	defb 020h		;2e4e	20 	  
	defb 020h		;2e4f	20 	  
	defb 020h		;2e50	20 	  
	defb 020h		;2e51	20 	  
	defb 020h		;2e52	20 	  
	defb 020h		;2e53	20 	  
	defb 020h		;2e54	20 	  
	defb 020h		;2e55	20 	  
	defb 020h		;2e56	20 	  
	defb 020h		;2e57	20 	  
	defb 0f9h		;2e58	f9 	. 
	defb 00dh		;2e59	0d 	. 
	defb 00ah		;2e5a	0a 	. 
	defb 009h		;2e5b	09 	. 
	defb 009h		;2e5c	09 	. 
	defb 0f9h		;2e5d	f9 	. 
	defb 020h		;2e5e	20 	  
	defb 020h		;2e5f	20 	  
	defb 020h		;2e60	20 	  
	defb 020h		;2e61	20 	  
	defb 020h		;2e62	20 	  
	defb 020h		;2e63	20 	  
	defb 020h		;2e64	20 	  
	defb 020h		;2e65	20 	  
	defb 020h		;2e66	20 	  
	defb 020h		;2e67	20 	  
	defb 020h		;2e68	20 	  
	defb 020h		;2e69	20 	  
	defb 032h		;2e6a	32 	2 
	defb 035h		;2e6b	35 	5 
	defb 036h		;2e6c	36 	6 
	defb 04bh		;2e6d	4b 	K 
	defb 020h		;2e6e	20 	  
	defb 02dh		;2e6f	2d 	- 
	defb 020h		;2e70	20 	  
	defb 056h		;2e71	56 	V 
	defb 045h		;2e72	45 	E 
	defb 052h		;2e73	52 	R 
	defb 053h		;2e74	53 	S 
	defb 049h		;2e75	49 	I 
	defb 04fh		;2e76	4f 	O 
	defb 04eh		;2e77	4e 	N 
	defb 020h		;2e78	20 	  
	defb 042h		;2e79	42 	B 
	defb 032h		;2e7a	32 	2 
	defb 02eh		;2e7b	2e 	. 
	defb 032h		;2e7c	32 	2 
	defb 030h		;2e7d	30 	0 
	defb 020h		;2e7e	20 	  
	defb 020h		;2e7f	20 	  
	defb 020h		;2e80	20 	  
	defb 020h		;2e81	20 	  
	defb 020h		;2e82	20 	  
	defb 020h		;2e83	20 	  
	defb 020h		;2e84	20 	  
	defb 020h		;2e85	20 	  
	defb 020h		;2e86	20 	  
	defb 020h		;2e87	20 	  
	defb 020h		;2e88	20 	  
	defb 020h		;2e89	20 	  
	defb 020h		;2e8a	20 	  
	defb 0f9h		;2e8b	f9 	. 
	defb 00dh		;2e8c	0d 	. 
	defb 00ah		;2e8d	0a 	. 
	defb 009h		;2e8e	09 	. 
	defb 009h		;2e8f	09 	. 
	defb 0e5h		;2e90	e5 	. 
	defb 0f8h		;2e91	f8 	. 
	defb 0f8h		;2e92	f8 	. 
	defb 0f8h		;2e93	f8 	. 
	defb 0f8h		;2e94	f8 	. 
	defb 0f8h		;2e95	f8 	. 
	defb 0f8h		;2e96	f8 	. 
	defb 0f8h		;2e97	f8 	. 
	defb 0f8h		;2e98	f8 	. 
	defb 0f8h		;2e99	f8 	. 
	defb 0f8h		;2e9a	f8 	. 
	defb 0f8h		;2e9b	f8 	. 
	defb 0f8h		;2e9c	f8 	. 
	defb 0f8h		;2e9d	f8 	. 
	defb 0f8h		;2e9e	f8 	. 
	defb 0f8h		;2e9f	f8 	. 
	defb 0f8h		;2ea0	f8 	. 
	defb 0f8h		;2ea1	f8 	. 
	defb 0f8h		;2ea2	f8 	. 
	defb 0f8h		;2ea3	f8 	. 
	defb 0f8h		;2ea4	f8 	. 
	defb 0f8h		;2ea5	f8 	. 
	defb 0f8h		;2ea6	f8 	. 
	defb 0f8h		;2ea7	f8 	. 
	defb 0f8h		;2ea8	f8 	. 
	defb 0f8h		;2ea9	f8 	. 
	defb 0f8h		;2eaa	f8 	. 
	defb 0f8h		;2eab	f8 	. 
	defb 0f8h		;2eac	f8 	. 
	defb 0f8h		;2ead	f8 	. 
	defb 0f8h		;2eae	f8 	. 
	defb 0f8h		;2eaf	f8 	. 
	defb 0f8h		;2eb0	f8 	. 
	defb 0f8h		;2eb1	f8 	. 
	defb 0f8h		;2eb2	f8 	. 
	defb 0f8h		;2eb3	f8 	. 
	defb 0f8h		;2eb4	f8 	. 
	defb 0f8h		;2eb5	f8 	. 
	defb 0f8h		;2eb6	f8 	. 
	defb 0f8h		;2eb7	f8 	. 
	defb 0f8h		;2eb8	f8 	. 
	defb 0f8h		;2eb9	f8 	. 
	defb 0f8h		;2eba	f8 	. 
	defb 0f8h		;2ebb	f8 	. 
	defb 0f8h		;2ebc	f8 	. 
	defb 0f8h		;2ebd	f8 	. 
	defb 0f5h		;2ebe	f5 	. 
	defb 00dh		;2ebf	0d 	. 
	defb 00ah		;2ec0	0a 	. 
	defb 00ah		;2ec1	0a 	. 
	defb 00ah		;2ec2	0a 	. 
	defb 000h		;2ec3	00 	. 
clock_int_handler:
	ld a,(l2feeh)		;2ec4	3a ee 2f 	: . / 
	dec a			;2ec7	3d 	= 
	jr z,l2ed6h		;2ec8	28 0c 	( . 
	ld (l2feeh),a		;2eca	32 ee 2f 	2 . / 
	ld a,(l2fefh)		;2ecd	3a ef 2f 	: . / 
	cp 0ffh		;2ed0	fe ff 	. . 
	jr z,l2ee4h		;2ed2	28 10 	( . 
	jr nz,l2ef0h		;2ed4	20 1a 	  . 
l2ed6h:
	ld a,03ch		;2ed6	3e 3c 	> < 
	ld (l2feeh),a		;2ed8	32 ee 2f 	2 . / 
	ld a,(l2fech)		;2edb	3a ec 2f 	: . / 
	dec a			;2ede	3d 	= 
	jr z,l2ee9h		;2edf	28 08 	( . 
	ld (l2fech),a		;2ee1	32 ec 2f 	2 . / 
l2ee4h:
	call sub_2efdh		;2ee4	cd fd 2e 	. . . 
	jr l2ef0h		;2ee7	18 07 	. . 
l2ee9h:
	ld (l2fedh),a		;2ee9	32 ed 2f 	2 . / 
	ld a,00ch		;2eec	3e 0c 	> . 
	out (039h),a		;2eee	d3 39 	. 9 
l2ef0h:
	ld a,00ch		;2ef0	3e 0c 	> . 
	out (03dh),a		;2ef2	d3 3d 	. = 
	in a,(03ch)		;2ef4	db 3c 	. < 
	ld a,020h		;2ef6	3e 20 	>   
	out (008h),a		;2ef8	d3 08 	. . 
	out (00ch),a		;2efa	d3 0c 	. . 
	ret			;2efc	c9 	. 
sub_2efdh:
	ld a,(sys_page_clock)		;2efd	3a 63 2c 	: c , 
	or a			;2f00	b7 	. 
	ret z			;2f01	c8 	. 
	ld a,0ffh		;2f02	3e ff 	> . 
	ld (l2fefh),a		;2f04	32 ef 2f 	2 . / 
	ld a,(l2febh)		;2f07	3a eb 2f 	: . / 
	or a			;2f0a	b7 	. 
	ret nz			;2f0b	c0 	. 
	ld a,(l2c33h)		;2f0c	3a 33 2c 	: 3 , 
	or a			;2f0f	b7 	. 
	ret nz			;2f10	c0 	. 
	ld a,(0f3d4h)		;2f11	3a d4 f3 	: . . 
	or a			;2f14	b7 	. 
	ret nz			;2f15	c0 	. 
	call sub_2f83h		;2f16	cd 83 2f 	. . / 
	ld a,(l2fefh)		;2f19	3a ef 2f 	: . / 
	ld c,a			;2f1c	4f 	O 
	ld a,(l2fdah)		;2f1d	3a da 2f 	: . / 
	cp c			;2f20	b9 	. 
	ret z			;2f21	c8 	. 
	ld (l2fefh),a		;2f22	32 ef 2f 	2 . / 
	ld hl,l3d91h+1		;2f25	21 92 3d 	! . = 
	ld de,l2fe5h		;2f28	11 e5 2f 	. . / 
	ld bc,00600h		;2f2b	01 00 06 	. . . 
l2f2eh:
	ld a,(hl)			;2f2e	7e 	~ 
	ld (de),a			;2f2f	12 	. 
	ld (hl),c			;2f30	71 	q 
	inc hl			;2f31	23 	# 
	inc de			;2f32	13 	. 
	djnz l2f2eh		;2f33	10 f9 	. . 
	call sub_1c50h		;2f35	cd 50 1c 	. P . 
	ld (l2fe3h),hl		;2f38	22 e3 2f 	" . / 
	call sub_1c4dh		;2f3b	cd 4d 1c 	. M . 
	ld hl,l1840h		;2f3e	21 40 18 	! @ . 
	call sub_1c53h		;2f41	cd 53 1c 	. S . 
	ld hl,l2fd0h		;2f44	21 d0 2f 	! . / 
	ld de,l2fd6h		;2f47	11 d6 2f 	. . / 
	ld b,005h		;2f4a	06 05 	. . 
l2f4ch:
	call sub_2f66h		;2f4c	cd 66 2f 	. f / 
	djnz l2f4ch		;2f4f	10 fb 	. . 
	ld hl,l2fe5h		;2f51	21 e5 2f 	! . / 
	ld de,l3d91h+1		;2f54	11 92 3d 	. . = 
	ld bc,00006h		;2f57	01 06 00 	. . . 
	ldir		;2f5a	ed b0 	. . 
	ld hl,(l2fe3h)		;2f5c	2a e3 2f 	* . / 
	call sub_1c53h		;2f5f	cd 53 1c 	. S . 
	call sub_1c4ah		;2f62	cd 4a 1c 	. J . 
	ret			;2f65	c9 	. 
sub_2f66h:
	ld a,(de)			;2f66	1a 	. 
	srl a		;2f67	cb 3f 	. ? 
	srl a		;2f69	cb 3f 	. ? 
	srl a		;2f6b	cb 3f 	. ? 
	srl a		;2f6d	cb 3f 	. ? 
	call sub_2f7dh		;2f6f	cd 7d 2f 	. } / 
	ld a,(de)			;2f72	1a 	. 
	and 00fh		;2f73	e6 0f 	. . 
	call sub_2f7dh		;2f75	cd 7d 2f 	. } / 
	inc de			;2f78	13 	. 
	ld c,(hl)			;2f79	4e 	N 
	inc hl			;2f7a	23 	# 
	jr l2f80h		;2f7b	18 03 	. . 
sub_2f7dh:
	or 030h		;2f7d	f6 30 	. 0 
	ld c,a			;2f7f	4f 	O 
l2f80h:
	jp l1c44h		;2f80	c3 44 1c 	. D . 
sub_2f83h:
	call sub_2fc5h		;2f83	cd c5 2f 	. . / 
	ld hl,l2fd5h		;2f86	21 d5 2f 	! . / 
	ld de,l2fdch		;2f89	11 dc 2f 	. . / 
	ld b,007h		;2f8c	06 07 	. . 
l2f8eh:
	ld a,(de)			;2f8e	1a 	. 
	out (03dh),a		;2f8f	d3 3d 	. = 
	in a,(03ch)		;2f91	db 3c 	. < 
	ld (hl),a			;2f93	77 	w 
	inc hl			;2f94	23 	# 
	inc de			;2f95	13 	. 
	djnz l2f8eh		;2f96	10 f6 	. . 
	ret			;2f98	c9 	. 
sub_2f99h:
	push hl			;2f99	e5 	. 
	call sub_2f83h		;2f9a	cd 83 2f 	. . / 
	ld hl,l2fd5h		;2f9d	21 d5 2f 	! . / 
	pop de			;2fa0	d1 	. 
	ld bc,00007h		;2fa1	01 07 00 	. . . 
	ldir		;2fa4	ed b0 	. . 
	ret			;2fa6	c9 	. 
l2fa7h:
	ld de,l2fd5h		;2fa7	11 d5 2f 	. . / 
	ld bc,00007h		;2faa	01 07 00 	. . . 
	ldir		;2fad	ed b0 	. . 
	call sub_2fc5h		;2faf	cd c5 2f 	. . / 
	ld hl,l2fd5h		;2fb2	21 d5 2f 	! . / 
	ld de,l2fdch		;2fb5	11 dc 2f 	. . / 
	ld b,007h		;2fb8	06 07 	. . 
l2fbah:
	ld a,(de)			;2fba	1a 	. 
	out (03dh),a		;2fbb	d3 3d 	. = 
	ld a,(hl)			;2fbd	7e 	~ 
	out (03ch),a		;2fbe	d3 3c 	. < 
	inc hl			;2fc0	23 	# 
	inc de			;2fc1	13 	. 
	djnz l2fbah		;2fc2	10 f6 	. . 
	ret			;2fc4	c9 	. 
sub_2fc5h:
	ld a,00ah		;2fc5	3e 0a 	> . 
	out (03dh),a		;2fc7	d3 3d 	. = 
	in a,(03ch)		;2fc9	db 3c 	. < 
	bit 7,a		;2fcb	cb 7f 	.  
	jr nz,sub_2fc5h		;2fcd	20 f6 	  . 
	ret			;2fcf	c9 	. 
l2fd0h:
	defb 02fh		;2fd0	2f 	/ 
	defb 02fh		;2fd1	2f 	/ 
	defb 020h		;2fd2	20 	  
	defb 03ah		;2fd3	3a 	: 
	defb 020h		;2fd4	20 	  
l2fd5h:
	defb 001h		;2fd5	01 	. 
l2fd6h:
	defb 003h		;2fd6	03 	. 
	defb 028h		;2fd7	28 	( 
	defb 083h		;2fd8	83 	. 
	defb 020h		;2fd9	20 	  
l2fdah:
	defb 000h		;2fda	00 	. 
	defb 000h		;2fdb	00 	. 
l2fdch:
	defb 006h		;2fdc	06 	. 
	defb 008h		;2fdd	08 	. 
	defb 007h		;2fde	07 	. 
	defb 009h		;2fdf	09 	. 
	defb 004h		;2fe0	04 	. 
	defb 002h		;2fe1	02 	. 
	defb 000h		;2fe2	00 	. 
l2fe3h:
	defw 00000h		;2fe3	00 00 	. . 
l2fe5h:
	defb 000h		;2fe5	00 	. 
	defb 000h		;2fe6	00 	. 
	defb 000h		;2fe7	00 	. 
	defb 000h		;2fe8	00 	. 
	defb 000h		;2fe9	00 	. 
	defb 000h		;2fea	00 	. 
l2febh:
	defb 000h		;2feb	00 	. 
l2fech:
	defb 014h		;2fec	14 	. 
l2fedh:
	defb 0ffh		;2fed	ff 	. 
l2feeh:
	defb 03ch		;2fee	3c 	< 
l2fefh:
	defb 0ffh		;2fef	ff 	. 
l2ff0h:
	ld a,(sys_page_sio_int)		;2ff0	3a 78 2c 	: x , 
	or a			;2ff3	b7 	. 
	jr nz,l2fffh		;2ff4	20 09 	  . 
	in a,(013h)		;2ff6	db 13 	. . 
	and 001h		;2ff8	e6 01 	. . 
	ret z			;2ffa	c8 	. 
	ld a,0ffh		;2ffb	3e ff 	> . 
	or a			;2ffd	b7 	. 
	ret			;2ffe	c9 	. 
l2fffh:
	ld hl,(l18beh)		;2fff	2a be 18 	* . . 
	ld a,l			;3002	7d 	} 
	or h			;3003	b4 	. 
	jr z,l3009h		;3004	28 03 	( . 
	ld a,0ffh		;3006	3e ff 	> . 
	or a			;3008	b7 	. 
l3009h:
	ret			;3009	c9 	. 
l300ah:
	call l2ff0h		;300a	cd f0 2f 	. . / 
	jr z,l300ah		;300d	28 fb 	( . 
	ld a,(sys_page_sio_int)		;300f	3a 78 2c 	: x , 
	or a			;3012	b7 	. 
	jr nz,l3019h		;3013	20 04 	  . 
	in a,(011h)		;3015	db 11 	. . 
	jr l3031h		;3017	18 18 	. . 
l3019h:
	di			;3019	f3 	. 
	ld hl,(l18beh)		;301a	2a be 18 	* . . 
	dec hl			;301d	2b 	+ 
	ld (l18beh),hl		;301e	22 be 18 	" . . 
	ld d,000h		;3021	16 00 	. . 
	ld a,(l18c1h)		;3023	3a c1 18 	: . . 
	ld e,a			;3026	5f 	_ 
	ld hl,l17beh		;3027	21 be 17 	! . . 
	add hl,de			;302a	19 	. 
	inc a			;302b	3c 	< 
	ld (l18c1h),a		;302c	32 c1 18 	2 . . 
	ld a,(hl)			;302f	7e 	~ 
	ei			;3030	fb 	. 
l3031h:
	ld c,a			;3031	4f 	O 
	ld a,(sys_page_sio_mask)		;3032	3a 70 2c 	: p , 
	or a			;3035	b7 	. 
	ld a,c			;3036	79 	y 
	jr z,l303bh		;3037	28 02 	( . 
	and 07fh		;3039	e6 7f 	.  
l303bh:
	ld c,a			;303b	4f 	O 
	ld a,(l316dh)		;303c	3a 6d 31 	: m 1 
	cp c			;303f	b9 	. 
	jr nz,l3047h		;3040	20 05 	  . 
	xor a			;3042	af 	. 
	ld (l316fh),a		;3043	32 6f 31 	2 o 1 
	ret			;3046	c9 	. 
l3047h:
	ld a,(l316eh)		;3047	3a 6e 31 	: n 1 
	cp c			;304a	b9 	. 
	ld a,c			;304b	79 	y 
	ret nz			;304c	c0 	. 
	ld a,0ffh		;304d	3e ff 	> . 
	ld (l316fh),a		;304f	32 6f 31 	2 o 1 
	xor a			;3052	af 	. 
	ret			;3053	c9 	. 
l3054h:
	in a,(013h)		;3054	db 13 	. . 
	and 004h		;3056	e6 04 	. . 
	ret z			;3058	c8 	. 
	ld a,0ffh		;3059	3e ff 	> . 
	or a			;305b	b7 	. 
	ret			;305c	c9 	. 
l305dh:
	call l3054h		;305d	cd 54 30 	. T 0 
	jr z,l305dh		;3060	28 fb 	( . 
	ld a,(sys_page_sio_mask)		;3062	3a 70 2c 	: p , 
	or a			;3065	b7 	. 
	ld a,c			;3066	79 	y 
	jr z,l306bh		;3067	28 02 	( . 
	and 07fh		;3069	e6 7f 	.  
l306bh:
	ld c,a			;306b	4f 	O 
	ld a,(sys_page_sio_pro)		;306c	3a 6a 2c 	: j , 
	or a			;306f	b7 	. 
	jr z,l30d0h		;3070	28 5e 	( ^ 
	cp 001h		;3072	fe 01 	. . 
	jr z,l30ach		;3074	28 36 	( 6 
	cp 002h		;3076	fe 02 	. . 
	jr nz,l3086h		;3078	20 0c 	  . 
l307ah:
	ld a,010h		;307a	3e 10 	> . 
	out (013h),a		;307c	d3 13 	. . 
	in a,(013h)		;307e	db 13 	. . 
	bit 5,a		;3080	cb 6f 	. o 
	jr z,l307ah		;3082	28 f6 	( . 
	jr l30d0h		;3084	18 4a 	. J 
l3086h:
	cp 003h		;3086	fe 03 	. . 
	jr nz,l30d0h		;3088	20 46 	  F 
l308ah:
	ld a,(l316fh)		;308a	3a 6f 31 	: o 1 
	or a			;308d	b7 	. 
	jr z,l3097h		;308e	28 07 	( . 
	push bc			;3090	c5 	. 
	call l300ah		;3091	cd 0a 30 	. . 0 
	pop bc			;3094	c1 	. 
	jr l308ah		;3095	18 f3 	. . 
l3097h:
	call l2ff0h		;3097	cd f0 2f 	. . / 
	jr z,l30d0h		;309a	28 34 	( 4 
	in a,(011h)		;309c	db 11 	. . 
	ld b,a			;309e	47 	G 
	ld a,(l316eh)		;309f	3a 6e 31 	: n 1 
	cp b			;30a2	b8 	. 
	jr nz,l30d0h		;30a3	20 2b 	  + 
	ld a,0ffh		;30a5	3e ff 	> . 
	ld (l316fh),a		;30a7	32 6f 31 	2 o 1 
	jr l308ah		;30aa	18 de 	. . 
l30ach:
	ld hl,l3170h		;30ac	21 70 31 	! p 1 
	inc (hl)			;30af	34 	4 
	ld d,080h		;30b0	16 80 	. . 
	ld a,c			;30b2	79 	y 
	cp 01bh		;30b3	fe 1b 	. . 
	jr nz,l30b9h		;30b5	20 02 	  . 
	ld d,07bh		;30b7	16 7b 	. { 
l30b9h:
	ld a,d			;30b9	7a 	z 
	cp (hl)			;30ba	be 	. 
	jr nc,l30d0h		;30bb	30 13 	0 . 
	ld a,003h		;30bd	3e 03 	> . 
	out (011h),a		;30bf	d3 11 	. . 
	xor a			;30c1	af 	. 
	ld (l316fh),a		;30c2	32 6f 31 	2 o 1 
l30c5h:
	push bc			;30c5	c5 	. 
	call l300ah		;30c6	cd 0a 30 	. . 0 
	pop bc			;30c9	c1 	. 
	and 07fh		;30ca	e6 7f 	.  
	cp 006h		;30cc	fe 06 	. . 
	jr nz,l30c5h		;30ce	20 f5 	  . 
l30d0h:
	ld a,c			;30d0	79 	y 
	out (011h),a		;30d1	d3 11 	. . 
	ret			;30d3	c9 	. 
sub_30d4h:
	ld hl,l3142h		;30d4	21 42 31 	! B 1 
	ld b,000h		;30d7	06 00 	. . 
	ld a,(sys_page_sio_baud)		;30d9	3a 69 2c 	: i , 
	add a,a			;30dc	87 	. 
	ld c,a			;30dd	4f 	O 
	add hl,bc			;30de	09 	. 
	ld a,(sys_page_sio_stop)		;30df	3a 6c 2c 	: l , 
	inc a			;30e2	3c 	< 
	sla a		;30e3	cb 27 	. ' 
	sla a		;30e5	cb 27 	. ' 
	ld b,a			;30e7	47 	G 
	ld a,(sys_page_sio_parity)		;30e8	3a 6b 2c 	: k , 
	cp 002h		;30eb	fe 02 	. . 
	jr nz,l30f0h		;30ed	20 01 	  . 
	inc a			;30ef	3c 	< 
l30f0h:
	or b			;30f0	b0 	. 
	ld b,a			;30f1	47 	G 
	ld a,(l3163h)		;30f2	3a 63 31 	: c 1 
	and 0f0h		;30f5	e6 f0 	. . 
	or b			;30f7	b0 	. 
	ld (l3163h),a		;30f8	32 63 31 	2 c 1 
	ld a,(sys_page_sio_data)		;30fb	3a 6d 2c 	: m , 
	rrc a		;30fe	cb 0f 	. . 
	rrc a		;3100	cb 0f 	. . 
	ld b,a			;3102	47 	G 
	rrc a		;3103	cb 0f 	. . 
	ld c,a			;3105	4f 	O 
	ld a,(l3165h)		;3106	3a 65 31 	: e 1 
	and 03fh		;3109	e6 3f 	. ? 
	or b			;310b	b0 	. 
	ld (l3165h),a		;310c	32 65 31 	2 e 1 
	ld a,(l3167h)		;310f	3a 67 31 	: g 1 
	and 09fh		;3112	e6 9f 	. . 
	or c			;3114	b1 	. 
	ld (l3167h),a		;3115	32 67 31 	2 g 1 
	ld a,(sys_page_sio_int)		;3118	3a 78 2c 	: x , 
	or a			;311b	b7 	. 
	jr z,l3122h		;311c	28 04 	( . 
	ld a,011h		;311e	3e 11 	> . 
	jr l3124h		;3120	18 02 	. . 
l3122h:
	ld a,000h		;3122	3e 00 	> . 
l3124h:
	ld (l316ch),a		;3124	32 6c 31 	2 l 1 
	ld a,0b6h		;3127	3e b6 	> . 
	out (007h),a		;3129	d3 07 	. . 
	ld a,(hl)			;312b	7e 	~ 
	out (006h),a		;312c	d3 06 	. . 
	inc hl			;312e	23 	# 
	ld a,(hl)			;312f	7e 	~ 
	out (006h),a		;3130	d3 06 	. . 
	ld a,018h		;3132	3e 18 	> . 
	out (013h),a		;3134	d3 13 	. . 
	nop			;3136	00 	. 
	nop			;3137	00 	. 
	ld hl,l3162h		;3138	21 62 31 	! b 1 
	ld b,00bh		;313b	06 0b 	. . 
	ld c,013h		;313d	0e 13 	. . 
	otir		;313f	ed b3 	. . 
	ret			;3141	c9 	. 
l3142h:
	defb 000h		;3142	00 	. 
	defb 000h		;3143	00 	. 
	defb 0c4h		;3144	c4 	. 
	defb 009h		;3145	09 	. 
	defb 083h		;3146	83 	. 
	defb 006h		;3147	06 	. 
	defb 06fh		;3148	6f 	o 
	defb 004h		;3149	04 	. 
	defb 09ch		;314a	9c 	. 
	defb 003h		;314b	03 	. 
	defb 040h		;314c	40 	@ 
	defb 003h		;314d	03 	. 
	defb 0a0h		;314e	a0 	. 
	defb 001h		;314f	01 	. 
	defb 0d0h		;3150	d0 	. 
	defb 000h		;3151	00 	. 
	defb 068h		;3152	68 	h 
	defb 000h		;3153	00 	. 
	defb 045h		;3154	45 	E 
	defb 000h		;3155	00 	. 
	defb 034h		;3156	34 	4 
	defb 000h		;3157	00 	. 
	defb 023h		;3158	23 	# 
	defb 000h		;3159	00 	. 
	defb 01ah		;315a	1a 	. 
	defb 000h		;315b	00 	. 
	defb 011h		;315c	11 	. 
	defb 000h		;315d	00 	. 
	defb 00dh		;315e	0d 	. 
	defb 000h		;315f	00 	. 
	defb 007h		;3160	07 	. 
	defb 000h		;3161	00 	. 
l3162h:
	defb 014h		;3162	14 	. 
l3163h:
	defb 044h		;3163	44 	D 
	defb 003h		;3164	03 	. 
l3165h:
	defb 0c1h		;3165	c1 	. 
	defb 005h		;3166	05 	. 
l3167h:
	defb 0eah		;3167	ea 	. 
	defb 002h		;3168	02 	. 
	defb 000h		;3169	00 	. 
	defb 010h		;316a	10 	. 
	defb 001h		;316b	01 	. 
l316ch:
	defb 011h		;316c	11 	. 
l316dh:
	defb 000h		;316d	00 	. 
l316eh:
	defb 000h		;316e	00 	. 
l316fh:
	defb 000h		;316f	00 	. 
l3170h:
	defb 000h		;3170	00 	. 
l3171h:
	ld a,(l3248h)		;3171	3a 48 32 	: H 2 
	or a			;3174	b7 	. 
	ret nz			;3175	c0 	. 
	push bc			;3176	c5 	. 
	call l31aeh		;3177	cd ae 31 	. . 1 
	inc a			;317a	3c 	< 
	ld a,c			;317b	79 	y 
	pop bc			;317c	c1 	. 
	jp z,l318fh		;317d	ca 8f 31 	. . 1 
	inc a			;3180	3c 	< 
	jr z,l3171h		;3181	28 ee 	( . 
	dec a			;3183	3d 	= 
	ret z			;3184	c8 	. 
	push bc			;3185	c5 	. 
	call sub_31e2h		;3186	cd e2 31 	. . 1 
	call l31aeh		;3189	cd ae 31 	. . 1 
	pop bc			;318c	c1 	. 
	jr l3171h		;318d	18 e2 	. . 
l318fh:
	ld a,(0f3d4h)		;318f	3a d4 f3 	: . . 
	or a			;3192	b7 	. 
	jr nz,l31a3h		;3193	20 0e 	  . 
	jr nz,l31a3h		;3195	20 0c 	  . 
	ld a,(sys_page_par_mask)		;3197	3a 77 2c 	: w , 
	or a			;319a	b7 	. 
	ld a,c			;319b	79 	y 
	jr z,l31a4h		;319c	28 06 	( . 
	jr z,l31a4h		;319e	28 04 	( . 
	and 07fh		;31a0	e6 7f 	.  
	ld c,a			;31a2	4f 	O 
l31a3h:
	ld a,c			;31a3	79 	y 
l31a4h:
	out (014h),a		;31a4	d3 14 	. . 
	xor a			;31a6	af 	. 
	out (017h),a		;31a7	d3 17 	. . 
	inc a			;31a9	3c 	< 
	out (017h),a		;31aa	d3 17 	. . 
	ld a,c			;31ac	79 	y 
	ret			;31ad	c9 	. 
l31aeh:
	ld a,(sys_page_printer)		;31ae	3a 74 2c 	: t , 
	or a			;31b1	b7 	. 
	jp nz,l31b7h		;31b2	c2 b7 31 	. . 1 
	ld c,a			;31b5	4f 	O 
	ret			;31b6	c9 	. 
l31b7h:
	in a,(015h)		;31b7	db 15 	. . 
	and 078h		;31b9	e6 78 	. x 
	ld hl,(l32d1h)		;31bb	2a d1 32 	* . 2 
	cp (hl)			;31be	be 	. 
	jr nz,l31c4h		;31bf	20 03 	  . 
	ld a,0ffh		;31c1	3e ff 	> . 
	ret			;31c3	c9 	. 
l31c4h:
	ld de,l32c9h		;31c4	11 c9 32 	. . 2 
	ld b,004h		;31c7	06 04 	. . 
	ld c,a			;31c9	4f 	O 
	ld a,(sys_page_single_sheet)		;31ca	3a 79 2c 	: y , 
	or a			;31cd	b7 	. 
	ld a,c			;31ce	79 	y 
	jr z,l31d3h		;31cf	28 02 	( . 
	ld b,003h		;31d1	06 03 	. . 
l31d3h:
	inc hl			;31d3	23 	# 
	cp (hl)			;31d4	be 	. 
	jr z,l31dfh		;31d5	28 08 	( . 
	inc de			;31d7	13 	. 
	inc de			;31d8	13 	. 
	djnz l31d3h		;31d9	10 f8 	. . 
	xor a			;31db	af 	. 
	ld c,0ffh		;31dc	0e ff 	. . 
	ret			;31de	c9 	. 
l31dfh:
	ld c,a			;31df	4f 	O 
	xor a			;31e0	af 	. 
	ret			;31e1	c9 	. 
sub_31e2h:
	ex de,hl			;31e2	eb 	. 
	ld a,(hl)			;31e3	7e 	~ 
	inc hl			;31e4	23 	# 
	ld h,(hl)			;31e5	66 	f 
	ld l,a			;31e6	6f 	o 
l31e7h:
	ld a,(0f3d4h)		;31e7	3a d4 f3 	: . . 
	ld (l3249h),a		;31ea	32 49 32 	2 I 2 
	ld a,0ffh		;31ed	3e ff 	> . 
	ld (0f3d4h),a		;31ef	32 d4 f3 	2 . . 
	push hl			;31f2	e5 	. 
	ld hl,l324ah		;31f3	21 4a 32 	! J 2 
	call sub_3358h		;31f6	cd 58 33 	. X 3 
	pop hl			;31f9	e1 	. 
	push hl			;31fa	e5 	. 
	call print_string		;31fb	cd 66 33 	. f 3 
	ld hl,l3257h		;31fe	21 57 32 	! W 2 
	call print_string		;3201	cd 66 33 	. f 3 
	call sub_a020h		;3204	cd 20 a0 	.   . 
	call bios2_conin		;3207	cd d6 19 	. . . 
	push af			;320a	f5 	. 
	call sub_3372h		;320b	cd 72 33 	. r 3 
	ld a,(l3249h)		;320e	3a 49 32 	: I 2 
	ld (0f3d4h),a		;3211	32 d4 f3 	2 . . 
	pop af			;3214	f1 	. 
	and 0dfh		;3215	e6 df 	. . 
	pop hl			;3217	e1 	. 
	cp 052h		;3218	fe 52 	. R 
	ret z			;321a	c8 	. 
	cp 049h		;321b	fe 49 	. I 
	jr z,l322dh		;321d	28 0e 	( . 
	cp 041h		;321f	fe 41 	. A 
	jr nz,l31e7h		;3221	20 c4 	  . 
	sub a			;3223	97 	. 
	ld (0e50dh),a		;3224	32 0d e5 	2 . . 
	ld (0f3d4h),a		;3227	32 d4 f3 	2 . . 
	jp bios2_wboot		;322a	c3 76 1d 	. v . 
l322dh:
	ld (l3248h),a		;322d	32 48 32 	2 H 2 
	sub a			;3230	97 	. 
	ld (0e50dh),a		;3231	32 0d e5 	2 . . 
	ret			;3234	c9 	. 
sub_3235h:
	ld a,(sys_page_printer)		;3235	3a 74 2c 	: t , 
	ld e,a			;3238	5f 	_ 
	add a,e			;3239	83 	. 
	add a,e			;323a	83 	. 
	add a,e			;323b	83 	. 
	add a,e			;323c	83 	. 
	ld e,a			;323d	5f 	_ 
	ld d,000h		;323e	16 00 	. . 
	ld hl,l32d3h		;3240	21 d3 32 	! . 2 
	add hl,de			;3243	19 	. 
	ld (l32d1h),hl		;3244	22 d1 32 	" . 2 
	ret			;3247	c9 	. 
l3248h:
	defb 000h		;3248	00 	. 
l3249h:
	defb 000h		;3249	00 	. 
l324ah:
	defb 007h		;324a	07 	. 
	defb 01bh		;324b	1b 	. 
	defb 06ah		;324c	6a 	j 
	defb 020h		;324d	20 	  
	defb 050h		;324e	50 	P 
	defb 072h		;324f	72 	r 
	defb 069h		;3250	69 	i 
	defb 06eh		;3251	6e 	n 
	defb 074h		;3252	74 	t 
	defb 065h		;3253	65 	e 
	defb 072h		;3254	72 	r 
	defb 020h		;3255	20 	  
l3256h:
	defb 000h		;3256	00 	. 
l3257h:
	defb 020h		;3257	20 	  
	defb 02dh		;3258	2d 	- 
	defb 020h		;3259	20 	  
	defb 028h		;325a	28 	( 
	defb 052h		;325b	52 	R 
	defb 029h		;325c	29 	) 
	defb 065h		;325d	65 	e 
	defb 074h		;325e	74 	t 
	defb 072h		;325f	72 	r 
	defb 079h		;3260	79 	y 
	defb 02fh		;3261	2f 	/ 
	defb 028h		;3262	28 	( 
	defb 041h		;3263	41 	A 
	defb 029h		;3264	29 	) 
	defb 062h		;3265	62 	b 
	defb 06fh		;3266	6f 	o 
	defb 072h		;3267	72 	r 
	defb 074h		;3268	74 	t 
	defb 02fh		;3269	2f 	/ 
	defb 028h		;326a	28 	( 
	defb 049h		;326b	49 	I 
	defb 029h		;326c	29 	) 
	defb 067h		;326d	67 	g 
	defb 06eh		;326e	6e 	n 
	defb 06fh		;326f	6f 	o 
	defb 072h		;3270	72 	r 
	defb 065h		;3271	65 	e 
	defb 020h		;3272	20 	  
	defb 06fh		;3273	6f 	o 
	defb 075h		;3274	75 	u 
	defb 074h		;3275	74 	t 
	defb 070h		;3276	70 	p 
	defb 075h		;3277	75 	u 
	defb 074h		;3278	74 	t 
	defb 020h		;3279	20 	  
	defb 075h		;327a	75 	u 
	defb 06eh		;327b	6e 	n 
	defb 074h		;327c	74 	t 
	defb 069h		;327d	69 	i 
	defb 06ch		;327e	6c 	l 
	defb 020h		;327f	20 	  
	defb 077h		;3280	77 	w 
	defb 061h		;3281	61 	a 
	defb 072h		;3282	72 	r 
	defb 06dh		;3283	6d 	m 
	defb 062h		;3284	62 	b 
	defb 06fh		;3285	6f 	o 
	defb 06fh		;3286	6f 	o 
	defb 074h		;3287	74 	t 
	defb 02eh		;3288	2e 	. 
	defb 020h		;3289	20 	  
	defb 020h		;328a	20 	  
	defb 020h		;328b	20 	  
	defb 020h		;328c	20 	  
	defb 020h		;328d	20 	  
	defb 01bh		;328e	1b 	. 
	defb 06bh		;328f	6b 	k 
	defb 000h		;3290	00 	. 
	defb 04eh		;3291	4e 	N 
	defb 06fh		;3292	6f 	o 
	defb 074h		;3293	74 	t 
	defb 020h		;3294	20 	  
	defb 043h		;3295	43 	C 
	defb 06fh		;3296	6f 	o 
	defb 06eh		;3297	6e 	n 
	defb 06eh		;3298	6e 	n 
	defb 065h		;3299	65 	e 
	defb 063h		;329a	63 	c 
	defb 074h		;329b	74 	t 
	defb 065h		;329c	65 	e 
	defb 064h		;329d	64 	d 
	defb 000h		;329e	00 	. 
	defb 050h		;329f	50 	P 
	defb 06fh		;32a0	6f 	o 
	defb 077h		;32a1	77 	w 
	defb 065h		;32a2	65 	e 
	defb 072h		;32a3	72 	r 
	defb 020h		;32a4	20 	  
	defb 04fh		;32a5	4f 	O 
	defb 066h		;32a6	66 	f 
	defb 066h		;32a7	66 	f 
	defb 020h		;32a8	20 	  
	defb 020h		;32a9	20 	  
	defb 020h		;32aa	20 	  
	defb 020h		;32ab	20 	  
	defb 000h		;32ac	00 	. 
	defb 04fh		;32ad	4f 	O 
	defb 066h		;32ae	66 	f 
	defb 066h		;32af	66 	f 
	defb 06ch		;32b0	6c 	l 
	defb 069h		;32b1	69 	i 
	defb 06eh		;32b2	6e 	n 
	defb 065h		;32b3	65 	e 
	defb 020h		;32b4	20 	  
	defb 020h		;32b5	20 	  
	defb 020h		;32b6	20 	  
	defb 020h		;32b7	20 	  
	defb 020h		;32b8	20 	  
	defb 020h		;32b9	20 	  
	defb 000h		;32ba	00 	. 
	defb 050h		;32bb	50 	P 
	defb 061h		;32bc	61 	a 
	defb 070h		;32bd	70 	p 
	defb 065h		;32be	65 	e 
	defb 072h		;32bf	72 	r 
	defb 020h		;32c0	20 	  
	defb 04fh		;32c1	4f 	O 
	defb 075h		;32c2	75 	u 
	defb 074h		;32c3	74 	t 
	defb 020h		;32c4	20 	  
	defb 020h		;32c5	20 	  
	defb 020h		;32c6	20 	  
	defb 020h		;32c7	20 	  
	defb 000h		;32c8	00 	. 
l32c9h:
	defb 091h		;32c9	91 	. 
	defb 032h		;32ca	32 	2 
	defb 09fh		;32cb	9f 	. 
	defb 032h		;32cc	32 	2 
	defb 0adh		;32cd	ad 	. 
	defb 032h		;32ce	32 	2 
	defb 0bbh		;32cf	bb 	. 
	defb 032h		;32d0	32 	2 
l32d1h:
	defb 000h		;32d1	00 	. 
	defb 000h		;32d2	00 	. 
l32d3h:
	defb 000h		;32d3	00 	. 
	defb 000h		;32d4	00 	. 
	defb 000h		;32d5	00 	. 
	defb 000h		;32d6	00 	. 
	defb 000h		;32d7	00 	. 
	defb 048h		;32d8	48 	H 
	defb 000h		;32d9	00 	. 
	defb 000h		;32da	00 	. 
	defb 000h		;32db	00 	. 
	defb 000h		;32dc	00 	. 
	defb 048h		;32dd	48 	H 
	defb 078h		;32de	78 	x 
	defb 078h		;32df	78 	x 
	defb 060h		;32e0	60 	` 
	defb 060h		;32e1	60 	` 
	defb 048h		;32e2	48 	H 
	defb 078h		;32e3	78 	x 
	defb 038h		;32e4	38 	8 
	defb 060h		;32e5	60 	` 
	defb 070h		;32e6	70 	p 
	defb 048h		;32e7	48 	H 
	defb 078h		;32e8	78 	x 
	defb 038h		;32e9	38 	8 
	defb 060h		;32ea	60 	` 
	defb 070h		;32eb	70 	p 
	defb 048h		;32ec	48 	H 
	defb 078h		;32ed	78 	x 
	defb 038h		;32ee	38 	8 
	defb 060h		;32ef	60 	` 
	defb 070h		;32f0	70 	p 
	defb 048h		;32f1	48 	H 
	defb 078h		;32f2	78 	x 
	defb 038h		;32f3	38 	8 
	defb 060h		;32f4	60 	` 
	defb 070h		;32f5	70 	p 
	defb 048h		;32f6	48 	H 
	defb 078h		;32f7	78 	x 
	defb 010h		;32f8	10 	. 
	defb 060h		;32f9	60 	` 
	defb 070h		;32fa	70 	p 
	defb 048h		;32fb	48 	H 
	defb 078h		;32fc	78 	x 
	defb 038h		;32fd	38 	8 
	defb 060h		;32fe	60 	` 
	defb 070h		;32ff	70 	p 
	defb 048h		;3300	48 	H 
	defb 078h		;3301	78 	x 
	defb 038h		;3302	38 	8 
	defb 060h		;3303	60 	` 
	defb 070h		;3304	70 	p 
	defb 048h		;3305	48 	H 
	defb 078h		;3306	78 	x 
	defb 040h		;3307	40 	@ 
	defb 060h		;3308	60 	` 
	defb 070h		;3309	70 	p 
	defb 048h		;330a	48 	H 
	defb 078h		;330b	78 	x 
	defb 040h		;330c	40 	@ 
	defb 060h		;330d	60 	` 
	defb 070h		;330e	70 	p 
	defb 048h		;330f	48 	H 
	defb 078h		;3310	78 	x 
	defb 040h		;3311	40 	@ 
	defb 060h		;3312	60 	` 
	defb 070h		;3313	70 	p 
	defb 048h		;3314	48 	H 
	defb 078h		;3315	78 	x 
	defb 000h		;3316	00 	. 
	defb 000h		;3317	00 	. 
	defb 000h		;3318	00 	. 
l3319h:
	call read_iobyte		;3319	cd 72 f2 	. r . 
	and 00ch		;331c	e6 0c 	. . 
	cp 008h		;331e	fe 08 	. . 
	jp nc,l2ff0h		;3320	d2 f0 2f 	. . / 
	jp console_return		;3323	c3 77 f5 	. w . 
l3326h:
	jp bios2_reader		;3326	c3 04 1a 	. . . 
l3329h:
	jp bios2_list		;3329	c3 14 1a 	. . . 
l332ch:
	ld a,(0f3d3h)		;332c	3a d3 f3 	: . . 
	bit 0,a		;332f	cb 47 	. G 
	call nz,sub_9d02h		;3331	c4 02 9d 	. . . 
	call console_return		;3334	cd 77 f5 	. w . 
	jr z,l332ch		;3337	28 f3 	( . 
	di			;3339	f3 	. 
	ld a,(0f582h)		;333a	3a 82 f5 	: . . 
	dec a			;333d	3d 	= 
	ld (0f582h),a		;333e	32 82 f5 	2 . . 
	ld d,000h		;3341	16 00 	. . 
	ld a,(la2fdh)		;3343	3a fd a2 	: . . 
	ld hl,la2ffh		;3346	21 ff a2 	! . . 
	ld e,a			;3349	5f 	_ 
	add hl,de			;334a	19 	. 
	inc a			;334b	3c 	< 
	cp 080h		;334c	fe 80 	. . 
	jr nz,l3352h		;334e	20 02 	  . 
	ld a,000h		;3350	3e 00 	> . 
l3352h:
	ld (la2fdh),a		;3352	32 fd a2 	2 . . 
	ld a,(hl)			;3355	7e 	~ 
	ei			;3356	fb 	. 
	ret			;3357	c9 	. 
sub_3358h:
	push hl			;3358	e5 	. 
	call sub_1c50h		;3359	cd 50 1c 	. P . 
	ld (l3390h),hl		;335c	22 90 33 	" . 3 
	ld hl,l3384h		;335f	21 84 33 	! . 3 
	call print_string		;3362	cd 66 33 	. f 3 
	pop hl			;3365	e1 	. 
print_string:
	ld a,(hl)			;3366	7e 	~ 
	inc hl			;3367	23 	# 
	or a			;3368	b7 	. 
	ret z			;3369	c8 	. 
	ld c,a			;336a	4f 	O 
	push hl			;336b	e5 	. 
	call bios2_conout		;336c	cd e4 19 	. . . 
	pop hl			;336f	e1 	. 
	jr print_string		;3370	18 f4 	. . 
sub_3372h:
	ld hl,l3389h		;3372	21 89 33 	! . 3 
	call print_string		;3375	cd 66 33 	. f 3 
	ld hl,(l3390h)		;3378	2a 90 33 	* . 3 
	call sub_1c53h		;337b	cd 53 1c 	. S . 
	ld a,0ffh		;337e	3e ff 	> . 
	ld (l2fefh),a		;3380	32 ef 2f 	2 . / 
	ret			;3383	c9 	. 
l3384h:
	defb 01bh		;3384	1b 	. 
	defb 03dh		;3385	3d 	= 
	defb 038h		;3386	38 	8 
	defb 020h		;3387	20 	  
	defb 000h		;3388	00 	. 
l3389h:
	defb 01bh		;3389	1b 	. 
	defb 03dh		;338a	3d 	= 
	defb 038h		;338b	38 	8 
	defb 020h		;338c	20 	  
	defb 01bh		;338d	1b 	. 
	defb 054h		;338e	54 	T 
	defb 000h		;338f	00 	. 
l3390h:
	defb 000h		;3390	00 	. 
	defb 000h		;3391	00 	. 
serial_mterm_handler:
	ld a,000h		;3392	3e 00 	> . 
	out (013h),a		;3394	d3 13 	. . 
	in a,(013h)		;3396	db 13 	. . 
	bit 0,a		;3398	cb 47 	. G 
	jp z,l33c4h		;339a	ca c4 33 	. . 3 
	in a,(011h)		;339d	db 11 	. . 
	push af			;339f	f5 	. 
	ld a,030h		;33a0	3e 30 	> 0 
	out (013h),a		;33a2	d3 13 	. . 
	pop af			;33a4	f1 	. 
	ld b,a			;33a5	47 	G 
	ld hl,(0fdb0h)		;33a6	2a b0 fd 	* . . 
	ld de,(0fdb4h)		;33a9	ed 5b b4 fd 	. [ . . 
	call sub_33c9h		;33ad	cd c9 33 	. . 3 
	inc hl			;33b0	23 	# 
	jr c,l33b6h		;33b1	38 03 	8 . 
	ld hl,0fdb6h		;33b3	21 b6 fd 	! . . 
l33b6h:
	ld de,(0fdb2h)		;33b6	ed 5b b2 fd 	. [ . . 
	call sub_33c9h		;33ba	cd c9 33 	. . 3 
	jp z,l33c4h		;33bd	ca c4 33 	. . 3 
	ld (0fdb0h),hl		;33c0	22 b0 fd 	" . . 
	ld (hl),b			;33c3	70 	p 
l33c4h:
	ld a,038h		;33c4	3e 38 	> 8 
	out (013h),a		;33c6	d3 13 	. . 
	ret			;33c8	c9 	. 
sub_33c9h:
	ld a,h			;33c9	7c 	| 
	sub d			;33ca	92 	. 
	ret nz			;33cb	c0 	. 
	ld a,l			;33cc	7d 	} 
	sub e			;33cd	93 	. 
	ret			;33ce	c9 	. 
l33cfh:
	jp l3450h		;33cf	c3 50 34 	. P 4 
	jp l33e4h		;33d2	c3 e4 33 	. . 3 
	jp l359ch		;33d5	c3 9c 35 	. . 5 
	jp l358eh		;33d8	c3 8e 35 	. . 5 
	jp l3c3ch		;33db	c3 3c 3c 	. < < 
	jp l3c64h		;33de	c3 64 3c 	. d < 
	jp l3bcdh		;33e1	c3 cd 3b 	. . ; 
l33e4h:
	ld a,0ffh		;33e4	3e ff 	> . 
	ld (l2febh),a		;33e6	32 eb 2f 	2 . / 
	call sub_3423h		;33e9	cd 23 34 	. # 4 
	ld hl,00000h		;33ec	21 00 00 	! . . 
	call sub_3ca7h		;33ef	cd a7 3c 	. . < 
	ld bc,007d0h		;33f2	01 d0 07 	. . . 
	ld de,00420h		;33f5	11 20 04 	.   . 
	call sub_3abch		;33f8	cd bc 3a 	. . : 
	ld a,00dh		;33fb	3e 0d 	> . 
	call sub_3cc7h		;33fd	cd c7 3c 	. . < 
	call sub_3a41h		;3400	cd 41 3a 	. A : 
	ld b,044h		;3403	06 44 	. D 
	ld hl,l3da4h		;3405	21 a4 3d 	! . = 
	ld a,(sys_page_cursor_blink)		;3408	3a 65 2c 	: e , 
	or a			;340b	b7 	. 
	jr nz,l3410h		;340c	20 02 	  . 
	ld b,064h		;340e	06 64 	. d 
l3410h:
	ld (hl),b			;3410	70 	p 
	xor a			;3411	af 	. 
	ld (l3da6h),a		;3412	32 a6 3d 	2 . = 
	call l359ch		;3415	cd 9c 35 	. . 5 
	xor a			;3418	af 	. 
	ld (l2febh),a		;3419	32 eb 2f 	2 . / 
	ret			;341c	c9 	. 
	ret			;341d	c9 	. 
	ret			;341e	c9 	. 
	ret			;341f	c9 	. 
	nop			;3420	00 	. 
	nop			;3421	00 	. 
	nop			;3422	00 	. 
sub_3423h:
	ld a,06fh		;3423	3e 6f 	> o 
	call sub_3cc7h		;3425	cd c7 3c 	. . < 
	ld hl,l3d1bh		;3428	21 1b 3d 	! . = 
	call sub_3cadh		;342b	cd ad 3c 	. . < 
	ld hl,l3d26h		;342e	21 26 3d 	! & = 
	call sub_3cadh		;3431	cd ad 3c 	. . < 
	ld hl,l3d2ch		;3434	21 2c 3d 	! , = 
	call sub_3cadh		;3437	cd ad 3c 	. . < 
	xor a			;343a	af 	. 
	out (03ah),a		;343b	d3 3a 	. : 
	ld hl,l3d30h		;343d	21 30 3d 	! 0 = 
	call sub_3cadh		;3440	cd ad 3c 	. . < 
	ld hl,l3d34h		;3443	21 34 3d 	! 4 = 
	call sub_3cadh		;3446	cd ad 3c 	. . < 
	ld hl,l3d3bh		;3449	21 3b 3d 	! ; = 
	call sub_3cadh		;344c	cd ad 3c 	. . < 
	ret			;344f	c9 	. 
l3450h:
	push bc			;3450	c5 	. 
	push de			;3451	d5 	. 
	push hl			;3452	e5 	. 
	ld a,0ffh		;3453	3e ff 	> . 
	ld (l2febh),a		;3455	32 eb 2f 	2 . / 
l3458h:
	ld a,(l3d94h)		;3458	3a 94 3d 	: . = 
	or a			;345b	b7 	. 
	jp nz,l35b7h		;345c	c2 b7 35 	. . 5 
	ld a,(l3d93h)		;345f	3a 93 3d 	: . = 
	or a			;3462	b7 	. 
	jr z,l3469h		;3463	28 04 	( . 
	ld hl,(l3d95h)		;3465	2a 95 3d 	* . = 
	jp (hl)			;3468	e9 	. 
l3469h:
	ld a,c			;3469	79 	y 
	or a			;346a	b7 	. 
	jr z,l347eh		;346b	28 11 	( . 
	cp 020h		;346d	fe 20 	.   
	jp c,l35c9h		;346f	da c9 35 	. . 5 
	ld a,(sys_page_disp_mask)		;3472	3a 6f 2c 	: o , 
	or a			;3475	b7 	. 
	jr z,l347ah		;3476	28 02 	( . 
	res 7,c		;3478	cb b9 	. . 
l347ah:
	ld a,c			;347a	79 	y 
	call sub_3486h		;347b	cd 86 34 	. . 4 
l347eh:
	xor a			;347e	af 	. 
	ld (l2febh),a		;347f	32 eb 2f 	2 . / 
	pop hl			;3482	e1 	. 
	pop de			;3483	d1 	. 
	pop bc			;3484	c1 	. 
	ret			;3485	c9 	. 
sub_3486h:
	ld (03d47h),a		;3486	32 47 3d 	2 G = 
	call sub_3905h		;3489	cd 05 39 	. . 9 
	jr nz,l349dh		;348c	20 0f 	  . 
	ld a,(l3d91h+1)		;348e	3a 92 3d 	: . = 
l3491h:
	ld (l3d48h),a		;3491	32 48 3d 	2 H = 
	ld hl,l3d45h		;3494	21 45 3d 	! E = 
	call sub_3cadh		;3497	cd ad 3c 	. . < 
	jp l34cah		;349a	c3 ca 34 	. . 4 
l349dh:
	call sub_3badh		;349d	cd ad 3b 	. . ; 
	and 033h		;34a0	e6 33 	. 3 
	jr nz,l34b1h		;34a2	20 0d 	  . 
	call sub_3c67h		;34a4	cd 67 3c 	. g < 
	ld a,d			;34a7	7a 	z 
	and 0c8h		;34a8	e6 c8 	. . 
	ld d,a			;34aa	57 	W 
	ld a,(l3d91h+1)		;34ab	3a 92 3d 	: . = 
	or d			;34ae	b2 	. 
	jr l3491h		;34af	18 e0 	. . 
l34b1h:
	call sub_3b6eh		;34b1	cd 6e 3b 	. n ; 
	ld a,(l3d91h+1)		;34b4	3a 92 3d 	: . = 
	or d			;34b7	b2 	. 
	ld (l3d48h),a		;34b8	32 48 3d 	2 H = 
	ld hl,l3d45h		;34bb	21 45 3d 	! E = 
	call sub_3cadh		;34be	cd ad 3c 	. . < 
	call l34cah		;34c1	cd ca 34 	. . 4 
	call sub_37f0h		;34c4	cd f0 37 	. . 7 
	jp l38eeh		;34c7	c3 ee 38 	. . 8 
l34cah:
	ld hl,l3d8fh		;34ca	21 8f 3d 	! . = 
	inc (hl)			;34cd	34 	4 
	ld a,(hl)			;34ce	7e 	~ 
	dec hl			;34cf	2b 	+ 
	cp (hl)			;34d0	be 	. 
	ret nz			;34d1	c0 	. 
	inc hl			;34d2	23 	# 
	ld a,(sys_page_crt_wrap)		;34d3	3a 64 2c 	: d , 
	or a			;34d6	b7 	. 
	jr nz,l34ddh		;34d7	20 04 	  . 
	dec (hl)			;34d9	35 	5 
l34dah:
	jp sub_3c67h		;34da	c3 67 3c 	. g < 
l34ddh:
	xor a			;34dd	af 	. 
	ld (hl),a			;34de	77 	w 
	inc hl			;34df	23 	# 
	inc (hl)			;34e0	34 	4 
	ld a,(hl)			;34e1	7e 	~ 
	inc hl			;34e2	23 	# 
	cp (hl)			;34e3	be 	. 
	jr nz,l34dah		;34e4	20 f4 	  . 
	dec hl			;34e6	2b 	+ 
	dec (hl)			;34e7	35 	5 
l34e8h:
	ld a,(l3d8eh)		;34e8	3a 8e 3d 	: . = 
	dec a			;34eb	3d 	= 
	ld l,a			;34ec	6f 	o 
	ld a,(l3d91h)		;34ed	3a 91 3d 	: . = 
	dec a			;34f0	3d 	= 
	ld h,a			;34f1	67 	g 
	push hl			;34f2	e5 	. 
	call sub_3c6ah		;34f3	cd 6a 3c 	. j < 
	call sub_3b9dh		;34f6	cd 9d 3b 	. . ; 
	or 004h		;34f9	f6 04 	. . 
	ld d,a			;34fb	57 	W 
	ld e,020h		;34fc	1e 20 	.   
	ld bc,00050h		;34fe	01 50 00 	. P . 
	pop hl			;3501	e1 	. 
	inc l			;3502	2c 	, 
	call sub_3c6ah		;3503	cd 6a 3c 	. j < 
	call sub_3abch		;3506	cd bc 3a 	. . : 
	call sub_3553h		;3509	cd 53 35 	. S 5 
	call sub_3905h		;350c	cd 05 39 	. . 9 
	jr z,l3522h		;350f	28 11 	( . 
	ld hl,(l3d8fh)		;3511	2a 8f 3d 	* . = 
	push hl			;3514	e5 	. 
	ld hl,00000h		;3515	21 00 00 	! . . 
	ld (l3d8fh),hl		;3518	22 8f 3d 	" . = 
	call sub_37f0h		;351b	cd f0 37 	. . 7 
	pop hl			;351e	e1 	. 
	ld (l3d8fh),hl		;351f	22 8f 3d 	" . = 
l3522h:
	ld a,(l3d9ah)		;3522	3a 9a 3d 	: . = 
	inc a			;3525	3c 	< 
	ld (l3d9ah),a		;3526	32 9a 3d 	2 . = 
	cp 018h		;3529	fe 18 	. . 
	call z,sub_38feh		;352b	cc fe 38 	. . 8 
	jp sub_3c67h		;352e	c3 67 3c 	. g < 
sub_3531h:
	push af			;3531	f5 	. 
	ld hl,00000h		;3532	21 00 00 	! . . 
	ld (l3d7fh),hl		;3535	22 7f 3d 	"  = 
	ld hl,00780h		;3538	21 80 07 	! . . 
	ld (l3d83h),hl		;353b	22 83 3d 	" . = 
	xor a			;353e	af 	. 
	ld (l3d86h),a		;353f	32 86 3d 	2 . = 
	ld a,018h		;3542	3e 18 	> . 
	ld (l3d82h),a		;3544	32 82 3d 	2 . = 
	ld a,04ch		;3547	3e 4c 	> L 
	call sub_3cc7h		;3549	cd c7 3c 	. . < 
	ld a,002h		;354c	3e 02 	> . 
	call sub_3ccdh		;354e	cd cd 3c 	. . < 
	pop af			;3551	f1 	. 
	ret			;3552	c9 	. 
sub_3553h:
	ld hl,(l3d7fh)		;3553	2a 7f 3d 	*  = 
	ld de,00050h		;3556	11 50 00 	. P . 
	add hl,de			;3559	19 	. 
	ld (l3d7fh),hl		;355a	22 7f 3d 	"  = 
	ld de,(l3d9bh)		;355d	ed 5b 9b 3d 	. [ . = 
	ld (l3d83h),de		;3561	ed 53 83 3d 	. S . = 
	sbc hl,de		;3565	ed 52 	. R 
	ld (l3d9fh),hl		;3567	22 9f 3d 	" . = 
	ld a,(l3d82h)		;356a	3a 82 3d 	: . = 
	dec a			;356d	3d 	= 
	call z,sub_3531h		;356e	cc 31 35 	. 1 5 
	jr z,l357dh		;3571	28 0a 	( . 
	ld (l3d82h),a		;3573	32 82 3d 	2 . = 
	ld a,(l3d86h)		;3576	3a 86 3d 	: . = 
	inc a			;3579	3c 	< 
	ld (l3d86h),a		;357a	32 86 3d 	2 . = 
l357dh:
	in a,(038h)		;357d	db 38 	. 8 
	and 020h		;357f	e6 20 	.   
	jr z,l357dh		;3581	28 fa 	( . 
	ld hl,l3d7dh		;3583	21 7d 3d 	! } = 
	jp sub_3cadh		;3586	c3 ad 3c 	. . < 
l3589h:
	ld a,0ffh		;3589	3e ff 	> . 
	ld (l3da6h),a		;358b	32 a6 3d 	2 . = 
l358eh:
	ld a,04bh		;358e	3e 4b 	> K 
	call sub_3cc7h		;3590	cd c7 3c 	. . < 
	ld a,00fh		;3593	3e 0f 	> . 
	jp sub_3ccdh		;3595	c3 cd 3c 	. . < 
l3598h:
	xor a			;3598	af 	. 
	ld (l3da6h),a		;3599	32 a6 3d 	2 . = 
l359ch:
	ld a,(l3da6h)		;359c	3a a6 3d 	: . = 
	or a			;359f	b7 	. 
	ret nz			;35a0	c0 	. 
	ld a,04bh		;35a1	3e 4b 	> K 
	call sub_3cc7h		;35a3	cd c7 3c 	. . < 
	ld a,(l3da5h)		;35a6	3a a5 3d 	: . = 
	call sub_3ccdh		;35a9	cd cd 3c 	. . < 
	ld a,(l3da4h)		;35ac	3a a4 3d 	: . = 
	call sub_3ccdh		;35af	cd cd 3c 	. . < 
	ld a,049h		;35b2	3e 49 	> I 
	jp sub_3ccdh		;35b4	c3 cd 3c 	. . < 
l35b7h:
	xor a			;35b7	af 	. 
	ld (l3d94h),a		;35b8	32 94 3d 	2 . = 
	ld a,c			;35bb	79 	y 
	ld hl,l3660h		;35bc	21 60 36 	! ` 6 
	ld b,01ch		;35bf	06 1c 	. . 
	jr l35ceh		;35c1	18 0b 	. . 
	ld a,0ffh		;35c3	3e ff 	> . 
	ld (l3d94h),a		;35c5	32 94 3d 	2 . = 
	ret			;35c8	c9 	. 
l35c9h:
	ld hl,l3638h		;35c9	21 38 36 	! 8 6 
	ld b,014h		;35cc	06 14 	. . 
l35ceh:
	cp (hl)			;35ce	be 	. 
	jr z,l35d8h		;35cf	28 07 	( . 
	inc hl			;35d1	23 	# 
	inc hl			;35d2	23 	# 
	djnz l35ceh		;35d3	10 f9 	. . 
	jp l347eh		;35d5	c3 7e 34 	. ~ 4 
l35d8h:
	inc hl			;35d8	23 	# 
	ld a,(hl)			;35d9	7e 	~ 
	ld d,000h		;35da	16 00 	. . 
	add a,a			;35dc	87 	. 
	ld hl,l35eeh		;35dd	21 ee 35 	! . 5 
	ld e,a			;35e0	5f 	_ 
	add hl,de			;35e1	19 	. 
	ld e,(hl)			;35e2	5e 	^ 
	inc hl			;35e3	23 	# 
	ld d,(hl)			;35e4	56 	V 
	ld hl,l347eh		;35e5	21 7e 34 	! ~ 4 
	push hl			;35e8	e5 	. 
	push de			;35e9	d5 	. 
	ld hl,(l3d8fh)		;35ea	2a 8f 3d 	* . = 
	ret			;35ed	c9 	. 
l35eeh:
	defb 041h		;35ee	41 	A 
	defb 03ah		;35ef	3a 	: 
	defb 07ch		;35f0	7c 	| 
	defb 037h		;35f1	37 	7 
	defb 083h		;35f2	83 	. 
	defb 037h		;35f3	37 	7 
	defb 06ah		;35f4	6a 	j 
	defb 03ah		;35f5	3a 	: 
	defb 08bh		;35f6	8b 	. 
	defb 039h		;35f7	39 	9 
	defb 00bh		;35f8	0b 	. 
	defb 039h		;35f9	39 	9 
	defb 011h		;35fa	11 	. 
	defb 039h		;35fb	39 	9 
	defb 017h		;35fc	17 	. 
	defb 039h		;35fd	39 	9 
	defb 05eh		;35fe	5e 	^ 
	defb 039h		;35ff	39 	9 
	defb 0cbh		;3600	cb 	. 
	defb 036h		;3601	36 	6 
	defb 0f5h		;3602	f5 	. 
	defb 0a1h		;3603	a1 	. 
	defb 015h		;3604	15 	. 
	defb 03ah		;3605	3a 	: 
	defb 0ffh		;3606	ff 	. 
	defb 039h		;3607	39 	9 
	defb 02eh		;3608	2e 	. 
	defb 03ah		;3609	3a 	: 
	defb 0f2h		;360a	f2 	. 
	defb 039h		;360b	39 	9 
	defb 00eh		;360c	0e 	. 
	defb 03ah		;360d	3a 	: 
	defb 0c3h		;360e	c3 	. 
	defb 035h		;360f	35 	5 
	defb 061h		;3610	61 	a 
	defb 03ch		;3611	3c 	< 
	defb 07eh		;3612	7e 	~ 
	defb 034h		;3613	34 	4 
	defb 08ah		;3614	8a 	. 
	defb 037h		;3615	37 	7 
	defb 091h		;3616	91 	. 
	defb 037h		;3617	37 	7 
	defb 077h		;3618	77 	w 
	defb 037h		;3619	37 	7 
	defb 071h		;361a	71 	q 
	defb 037h		;361b	37 	7 
	defb 098h		;361c	98 	. 
	defb 037h		;361d	37 	7 
	defb 09fh		;361e	9f 	. 
	defb 037h		;361f	37 	7 
	defb 093h		;3620	93 	. 
	defb 039h		;3621	39 	9 
	defb 0bfh		;3622	bf 	. 
	defb 039h		;3623	39 	9 
	defb 0ebh		;3624	eb 	. 
	defb 0a1h		;3625	a1 	. 
	defb 0f0h		;3626	f0 	. 
	defb 0a1h		;3627	a1 	. 
	defb 05eh		;3628	5e 	^ 
	defb 03ah		;3629	3a 	: 
l362ah:
	defb 065h		;362a	65 	e 
	defb 03ah		;362b	3a 	: 
	defb 086h		;362c	86 	. 
	defb 039h		;362d	39 	9 
	defb 03ch		;362e	3c 	< 
	defb 03ah		;362f	3a 	: 
	defb 040h		;3630	40 	@ 
	defb 03ch		;3631	3c 	< 
	defb 0c8h		;3632	c8 	. 
	defb 03bh		;3633	3b 	; 
	defb 098h		;3634	98 	. 
	defb 036h		;3635	36 	6 
	defb 0c2h		;3636	c2 	. 
	defb 036h		;3637	36 	6 
l3638h:
	defb 007h		;3638	07 	. 
	defb 00ah		;3639	0a 	. 
	defb 008h		;363a	08 	. 
	defb 00bh		;363b	0b 	. 
	defb 009h		;363c	09 	. 
	defb 019h		;363d	19 	. 
	defb 00ah		;363e	0a 	. 
	defb 00ch		;363f	0c 	. 
	defb 00bh		;3640	0b 	. 
	defb 00dh		;3641	0d 	. 
	defb 00ch		;3642	0c 	. 
	defb 00eh		;3643	0e 	. 
	defb 00dh		;3644	0d 	. 
	defb 00fh		;3645	0f 	. 
	defb 01ah		;3646	1a 	. 
	defb 000h		;3647	00 	. 
	defb 01bh		;3648	1b 	. 
	defb 010h		;3649	10 	. 
	defb 01eh		;364a	1e 	. 
	defb 011h		;364b	11 	. 
	defb 000h		;364c	00 	. 
	defb 000h		;364d	00 	. 
	defb 000h		;364e	00 	. 
	defb 000h		;364f	00 	. 
	defb 000h		;3650	00 	. 
	defb 000h		;3651	00 	. 
	defb 000h		;3652	00 	. 
	defb 000h		;3653	00 	. 
	defb 000h		;3654	00 	. 
	defb 000h		;3655	00 	. 
	defb 000h		;3656	00 	. 
	defb 000h		;3657	00 	. 
	defb 000h		;3658	00 	. 
	defb 000h		;3659	00 	. 
	defb 000h		;365a	00 	. 
	defb 000h		;365b	00 	. 
	defb 000h		;365c	00 	. 
	defb 000h		;365d	00 	. 
	defb 000h		;365e	00 	. 
	defb 000h		;365f	00 	. 
l3660h:
	defb 02bh		;3660	2b 	+ 
	defb 020h		;3661	20 	  
	defb 06ah		;3662	6a 	j 
	defb 001h		;3663	01 	. 
	defb 06bh		;3664	6b 	k 
	defb 002h		;3665	02 	. 
	defb 059h		;3666	59 	Y 
	defb 003h		;3667	03 	. 
	defb 054h		;3668	54 	T 
	defb 004h		;3669	04 	. 
	defb 045h		;366a	45 	E 
	defb 005h		;366b	05 	. 
	defb 049h		;366c	49 	I 
	defb 01ah		;366d	1a 	. 
	defb 052h		;366e	52 	R 
	defb 006h		;366f	06 	. 
	defb 051h		;3670	51 	Q 
	defb 007h		;3671	07 	. 
	defb 057h		;3672	57 	W 
	defb 008h		;3673	08 	. 
	defb 03dh		;3674	3d 	= 
	defb 009h		;3675	09 	. 
	defb 05eh		;3676	5e 	^ 
	defb 013h		;3677	13 	. 
	defb 071h		;3678	71 	q 
	defb 014h		;3679	14 	. 
	defb 029h		;367a	29 	) 
	defb 015h		;367b	15 	. 
	defb 028h		;367c	28 	( 
	defb 016h		;367d	16 	. 
	defb 022h		;367e	22 	" 
	defb 01ch		;367f	1c 	. 
	defb 023h		;3680	23 	# 
	defb 01bh		;3681	1b 	. 
	defb 02ah		;3682	2a 	* 
	defb 01dh		;3683	1d 	. 
	defb 079h		;3684	79 	y 
	defb 01eh		;3685	1e 	. 
	defb 074h		;3686	74 	t 
	defb 01fh		;3687	1f 	. 
	defb 05fh		;3688	5f 	_ 
	defb 017h		;3689	17 	. 
	defb 03fh		;368a	3f 	? 
	defb 021h		;368b	21 	! 
	defb 06ch		;368c	6c 	l 
	defb 022h		;368d	22 	" 
	defb 06dh		;368e	6d 	m 
	defb 022h		;368f	22 	" 
	defb 050h		;3690	50 	P 
	defb 024h		;3691	24 	$ 
	defb 058h		;3692	58 	X 
	defb 023h		;3693	23 	# 
	defb 000h		;3694	00 	. 
	defb 000h		;3695	00 	. 
	defb 000h		;3696	00 	. 
	defb 000h		;3697	00 	. 
	ld a,0ffh		;3698	3e ff 	> . 
	ld (l3d93h),a		;369a	32 93 3d 	2 . = 
	ld hl,l36a4h		;369d	21 a4 36 	! . 6 
	ld (l3d95h),hl		;36a0	22 95 3d 	" . = 
	ret			;36a3	c9 	. 
l36a4h:
	xor a			;36a4	af 	. 
	ld (l3d93h),a		;36a5	32 93 3d 	2 . = 
	ld a,c			;36a8	79 	y 
	cp 036h		;36a9	fe 36 	. 6 
	jp z,l3733h		;36ab	ca 33 37 	. 3 7 
	cp 037h		;36ae	fe 37 	. 7 
	jp z,l3752h		;36b0	ca 52 37 	. R 7 
	ld hl,l347eh		;36b3	21 7e 34 	! ~ 4 
	push hl			;36b6	e5 	. 
	cp 045h		;36b7	fe 45 	. E 
	jp z,l3598h		;36b9	ca 98 35 	. . 5 
	cp 046h		;36bc	fe 46 	. F 
	jp z,l3589h		;36be	ca 89 35 	. . 5 
	ret			;36c1	c9 	. 
	ld a,(0f3d3h)		;36c2	3a d3 f3 	: . . 
	or 001h		;36c5	f6 01 	. . 
	ld (0f3d3h),a		;36c7	32 d3 f3 	2 . . 
	ret			;36ca	c9 	. 
	ld a,0ffh		;36cb	3e ff 	> . 
	ld (l3d93h),a		;36cd	32 93 3d 	2 . = 
	ld hl,l36d7h		;36d0	21 d7 36 	! . 6 
	ld (l3d95h),hl		;36d3	22 95 3d 	" . = 
	ret			;36d6	c9 	. 
l36d7h:
	ld a,c			;36d7	79 	y 
	sub 020h		;36d8	d6 20 	.   
	cp 019h		;36da	fe 19 	. . 
	jr nc,l36e1h		;36dc	30 03 	0 . 
	ld (l3d97h),a		;36de	32 97 3d 	2 . = 
l36e1h:
	ld hl,l36eah		;36e1	21 ea 36 	! . 6 
	ld (l3d95h),hl		;36e4	22 95 3d 	" . = 
	jp l347eh		;36e7	c3 7e 34 	. ~ 4 
l36eah:
	ld a,c			;36ea	79 	y 
	sub 020h		;36eb	d6 20 	.   
	cp 050h		;36ed	fe 50 	. P 
	jr nc,l36f4h		;36ef	30 03 	0 . 
	ld (l3d8fh),a		;36f1	32 8f 3d 	2 . = 
l36f4h:
	xor a			;36f4	af 	. 
	ld (l3d93h),a		;36f5	32 93 3d 	2 . = 
	ld a,(l3d97h)		;36f8	3a 97 3d 	: . = 
	ld (l3d90h),a		;36fb	32 90 3d 	2 . = 
	call sub_3c67h		;36fe	cd 67 3c 	. g < 
	jp l347eh		;3701	c3 7e 34 	. ~ 4 
	ld a,0ffh		;3704	3e ff 	> . 
	ld (l3d93h),a		;3706	32 93 3d 	2 . = 
	ld hl,l3710h		;3709	21 10 37 	! . 7 
	ld (l3d95h),hl		;370c	22 95 3d 	" . = 
	ret			;370f	c9 	. 
l3710h:
	ld a,c			;3710	79 	y 
	cp 030h		;3711	fe 30 	. 0 
	jr z,l3724h		;3713	28 0f 	( . 
	ld a,08fh		;3715	3e 8f 	> . 
	ld (l3da5h),a		;3717	32 a5 3d 	2 . = 
	xor a			;371a	af 	. 
	ld (l3d93h),a		;371b	32 93 3d 	2 . = 
	call l3598h		;371e	cd 98 35 	. . 5 
	jp l347eh		;3721	c3 7e 34 	. ~ 4 
l3724h:
	xor a			;3724	af 	. 
	ld (l3d93h),a		;3725	32 93 3d 	2 . = 
	ld a,00fh		;3728	3e 0f 	> . 
	ld (l3da5h),a		;372a	32 a5 3d 	2 . = 
	call l3589h		;372d	cd 89 35 	. . 5 
	jp l347eh		;3730	c3 7e 34 	. ~ 4 
l3733h:
	ld a,0ffh		;3733	3e ff 	> . 
	ld (l3d93h),a		;3735	32 93 3d 	2 . = 
	ld hl,l3741h		;3738	21 41 37 	! A 7 
	ld (l3d95h),hl		;373b	22 95 3d 	" . = 
	jp l347eh		;373e	c3 7e 34 	. ~ 4 
l3741h:
	xor a			;3741	af 	. 
	ld (l3d93h),a		;3742	32 93 3d 	2 . = 
	ld a,c			;3745	79 	y 
	and 00fh		;3746	e6 0f 	. . 
	jp z,l347eh		;3748	ca 7e 34 	. ~ 4 
	dec a			;374b	3d 	= 
	call sub_a2e9h		;374c	cd e9 a2 	. . . 
	jp l347eh		;374f	c3 7e 34 	. ~ 4 
l3752h:
	ld a,0ffh		;3752	3e ff 	> . 
	ld (l3d93h),a		;3754	32 93 3d 	2 . = 
	ld hl,l3760h		;3757	21 60 37 	! ` 7 
	ld (l3d95h),hl		;375a	22 95 3d 	" . = 
	jp l347eh		;375d	c3 7e 34 	. ~ 4 
l3760h:
	xor a			;3760	af 	. 
	ld (l3d93h),a		;3761	32 93 3d 	2 . = 
	ld a,c			;3764	79 	y 
	and 00fh		;3765	e6 0f 	. . 
	jp z,l347eh		;3767	ca 7e 34 	. ~ 4 
	dec a			;376a	3d 	= 
	call sub_a2f2h		;376b	cd f2 a2 	. . . 
	jp l347eh		;376e	c3 7e 34 	. ~ 4 
	ld a,004h		;3771	3e 04 	> . 
	ld (l3d91h+1),a		;3773	32 92 3d 	2 . = 
	ret			;3776	c9 	. 
	xor a			;3777	af 	. 
	ld (l3d91h+1),a		;3778	32 92 3d 	2 . = 
	ret			;377b	c9 	. 
	call sub_37a6h		;377c	cd a6 37 	. . 7 
	ld bc,00011h		;377f	01 11 00 	. . . 
	rst 38h			;3782	ff 	. 
	call sub_37a6h		;3783	cd a6 37 	. . 7 
	ld bc,00002h		;3786	01 02 00 	. . . 
	rst 30h			;3789	f7 	. 
	call sub_37a6h		;378a	cd a6 37 	. . 7 
	nop			;378d	00 	. 
	inc bc			;378e	03 	. 
	add a,b			;378f	80 	. 
	add a,b			;3790	80 	. 
	call sub_37a6h		;3791	cd a6 37 	. . 7 
	nop			;3794	00 	. 
	ld (de),a			;3795	12 	. 
	nop			;3796	00 	. 
	nop			;3797	00 	. 
	call sub_37a6h		;3798	cd a6 37 	. . 7 
	nop			;379b	00 	. 
	ld bc,04040h		;379c	01 40 40 	. @ @ 
	call sub_37a6h		;379f	cd a6 37 	. . 7 
	nop			;37a2	00 	. 
	ld (de),a			;37a3	12 	. 
	nop			;37a4	00 	. 
	nop			;37a5	00 	. 
sub_37a6h:
	call sub_3c67h		;37a6	cd 67 3c 	. g < 
	call sub_3badh		;37a9	cd ad 3b 	. . ; 
	push af			;37ac	f5 	. 
	and 033h		;37ad	e6 33 	. 3 
	call z,sub_38f4h		;37af	cc f4 38 	. . 8 
	call sub_3b6eh		;37b2	cd 6e 3b 	. n ; 
	pop bc			;37b5	c1 	. 
	pop hl			;37b6	e1 	. 
	ld a,b			;37b7	78 	x 
	and 033h		;37b8	e6 33 	. 3 
	cp 011h		;37ba	fe 11 	. . 
	ld a,(hl)			;37bc	7e 	~ 
	inc hl			;37bd	23 	# 
	jr nz,l37c7h		;37be	20 07 	  . 
	or a			;37c0	b7 	. 
	jr nz,l37c7h		;37c1	20 04 	  . 
	ld a,(hl)			;37c3	7e 	~ 
	or b			;37c4	b0 	. 
	jr l37c8h		;37c5	18 01 	. . 
l37c7h:
	ld a,(hl)			;37c7	7e 	~ 
l37c8h:
	ld e,a			;37c8	5f 	_ 
	inc hl			;37c9	23 	# 
	ld a,d			;37ca	7a 	z 
	or (hl)			;37cb	b6 	. 
	inc hl			;37cc	23 	# 
	and (hl)			;37cd	a6 	. 
	ld b,a			;37ce	47 	G 
	ld a,(l3d91h+1)		;37cf	3a 92 3d 	: . = 
	or b			;37d2	b0 	. 
	or e			;37d3	b3 	. 
	ld h,a			;37d4	67 	g 
	ld l,020h		;37d5	2e 20 	.   
	ld (03d47h),hl		;37d7	22 47 3d 	" G = 
	ld hl,l3d45h		;37da	21 45 3d 	! E = 
	call sub_3cadh		;37dd	cd ad 3c 	. . < 
	ld a,(sys_page_crt_wrap)		;37e0	3a 64 2c 	: d , 
	push af			;37e3	f5 	. 
	ld a,001h		;37e4	3e 01 	> . 
	ld (sys_page_crt_wrap),a		;37e6	32 64 2c 	2 d , 
	call l34cah		;37e9	cd ca 34 	. . 4 
	pop af			;37ec	f1 	. 
	ld (sys_page_crt_wrap),a		;37ed	32 64 2c 	2 d , 
sub_37f0h:
	call sub_3c67h		;37f0	cd 67 3c 	. g < 
	call sub_3905h		;37f3	cd 05 39 	. . 9 
	ret z			;37f6	c8 	. 
	call sub_3b6eh		;37f7	cd 6e 3b 	. n ; 
	ld a,d			;37fa	7a 	z 
	ld b,a			;37fb	47 	G 
	xor 0c8h		;37fc	ee c8 	. . 
	ld c,a			;37fe	4f 	O 
	call sub_3c67h		;37ff	cd 67 3c 	. g < 
	call sub_3badh		;3802	cd ad 3b 	. . ; 
	call sub_3c67h		;3805	cd 67 3c 	. g < 
	ld a,d			;3808	7a 	z 
	and c			;3809	a1 	. 
	ld c,a			;380a	4f 	O 
	ld a,d			;380b	7a 	z 
	cpl			;380c	2f 	/ 
	and b			;380d	a0 	. 
	ld b,a			;380e	47 	G 
	or c			;380f	b1 	. 
	jr z,l3848h		;3810	28 36 	( 6 
	call l358eh		;3812	cd 8e 35 	. . 5 
	ld hl,(l3d42h)		;3815	2a 42 3d 	* B = 
	ld a,(l3da3h)		;3818	3a a3 3d 	: . = 
	or a			;381b	b7 	. 
	ex de,hl			;381c	eb 	. 
	jr nz,l383dh		;381d	20 1e 	  . 
	ld hl,(l3d9dh)		;381f	2a 9d 3d 	* . = 
	sbc hl,de		;3822	ed 52 	. R 
	ret z			;3824	c8 	. 
	jr c,l384bh		;3825	38 24 	8 $ 
	call sub_3851h		;3827	cd 51 38 	. Q 8 
	jr z,l3842h		;382a	28 16 	( . 
	ld a,(l3d86h)		;382c	3a 86 3d 	: . = 
	or a			;382f	b7 	. 
	jr z,l3842h		;3830	28 10 	( . 
	ld de,(l3d9bh)		;3832	ed 5b 9b 3d 	. [ . = 
	ld (l3d42h),de		;3836	ed 53 42 3d 	. S B = 
	call sub_3caah		;383a	cd aa 3c 	. . < 
l383dh:
	ld hl,(l3d9fh)		;383d	2a 9f 3d 	* . = 
	sbc hl,de		;3840	ed 52 	. R 
l3842h:
	call nz,sub_3851h		;3842	c4 51 38 	. Q 8 
	call l359ch		;3845	cd 9c 35 	. . 5 
l3848h:
	jp sub_3c67h		;3848	c3 67 3c 	. g < 
l384bh:
	ld de,00050h		;384b	11 50 00 	. P . 
	add hl,de			;384e	19 	. 
	jr l3842h		;384f	18 f1 	. . 
sub_3851h:
	ld (03d8ch),hl		;3851	22 8c 3d 	" . = 
l3854h:
	push hl			;3854	e5 	. 
	call sub_3badh		;3855	cd ad 3b 	. . ; 
	pop hl			;3858	e1 	. 
	and c			;3859	a1 	. 
	jr nz,l3862h		;385a	20 06 	  . 
	ld a,d			;385c	7a 	z 
	and b			;385d	a0 	. 
	xor b			;385e	a8 	. 
	jp z,l389dh		;385f	ca 9d 38 	. . 8 
l3862h:
	ld a,d			;3862	7a 	z 
	and 033h		;3863	e6 33 	. 3 
	jr nz,l3872h		;3865	20 0b 	  . 
l3867h:
	dec hl			;3867	2b 	+ 
	ld a,l			;3868	7d 	} 
	or h			;3869	b4 	. 
	jr nz,l3854h		;386a	20 e8 	  . 
	ld de,00000h		;386c	11 00 00 	. . . 
	jp l389dh		;386f	c3 9d 38 	. . 8 
l3872h:
	ld e,a			;3872	5f 	_ 
	rra			;3873	1f 	. 
	rra			;3874	1f 	. 
	or e			;3875	b3 	. 
	and 007h		;3876	e6 07 	. . 
	ld de,l3895h		;3878	11 95 38 	. . 8 
	add a,e			;387b	83 	. 
	ld e,a			;387c	5f 	_ 
	ld a,d			;387d	7a 	z 
	adc a,000h		;387e	ce 00 	. . 
	ld d,a			;3880	57 	W 
	ld a,(de)			;3881	1a 	. 
	ld d,a			;3882	57 	W 
	ld a,b			;3883	78 	x 
	or c			;3884	b1 	. 
	and d			;3885	a2 	. 
	jr z,l3867h		;3886	28 df 	( . 
	ld a,d			;3888	7a 	z 
	and 020h		;3889	e6 20 	.   
	jr z,l388eh		;388b	28 01 	( . 
	dec hl			;388d	2b 	+ 
l388eh:
	call l389dh		;388e	cd 9d 38 	. . 8 
	ret z			;3891	c8 	. 
	jp sub_3851h		;3892	c3 51 38 	. Q 8 
l3895h:
	nop			;3895	00 	. 
	ld b,b			;3896	40 	@ 
	ex af,af'			;3897	08 	. 
	add a,b			;3898	80 	. 
	nop			;3899	00 	. 
	jr z,-54		;389a	28 c8 	( . 
	adc a,b			;389c	88 	. 
l389dh:
	ld a,d			;389d	7a 	z 
	and 0c8h		;389e	e6 c8 	. . 
	cpl			;38a0	2f 	/ 
	ld d,a			;38a1	57 	W 
	push de			;38a2	d5 	. 
	ex de,hl			;38a3	eb 	. 
	ld hl,(03d8ch)		;38a4	2a 8c 3d 	* . = 
	sbc hl,de		;38a7	ed 52 	. R 
	dec hl			;38a9	2b 	+ 
	ld (l3d4dh),hl		;38aa	22 4d 3d 	" M = 
	pop de			;38ad	d1 	. 
	jr z,l38beh		;38ae	28 0e 	( . 
	ld e,03bh		;38b0	1e 3b 	. ; 
	ld a,b			;38b2	78 	x 
	or a			;38b3	b7 	. 
	call nz,sub_38deh		;38b4	c4 de 38 	. . 8 
	ld e,03ah		;38b7	1e 3a 	. : 
	ld a,c			;38b9	79 	y 
	or a			;38ba	b7 	. 
	call nz,sub_38deh		;38bb	c4 de 38 	. . 8 
l38beh:
	ld a,b			;38be	78 	x 
	and d			;38bf	a2 	. 
	ld b,a			;38c0	47 	G 
	ld a,c			;38c1	79 	y 
	and d			;38c2	a2 	. 
	ld c,a			;38c3	4f 	O 
	or b			;38c4	b0 	. 
	ret z			;38c5	c8 	. 
	ld de,(l3d4dh)		;38c6	ed 5b 4d 3d 	. [ M = 
	nop			;38ca	00 	. 
	inc de			;38cb	13 	. 
	ld hl,(l3d42h)		;38cc	2a 42 3d 	* B = 
	add hl,de			;38cf	19 	. 
	ld (l3d42h),hl		;38d0	22 42 3d 	" B = 
	call sub_3caah		;38d3	cd aa 3c 	. . < 
	ld hl,(03d8ch)		;38d6	2a 8c 3d 	* . = 
	sbc hl,de		;38d9	ed 52 	. R 
	xor a			;38db	af 	. 
	inc a			;38dc	3c 	< 
	ret			;38dd	c9 	. 
sub_38deh:
	ld (l3d51h),a		;38de	32 51 3d 	2 Q = 
	ld a,e			;38e1	7b 	{ 
	ld (l3d50h),a		;38e2	32 50 3d 	2 P = 
	call sub_3caah		;38e5	cd aa 3c 	. . < 
	ld hl,l3d4ah		;38e8	21 4a 3d 	! J = 
	jp sub_3cadh		;38eb	c3 ad 3c 	. . < 
l38eeh:
	ld hl,(l3d98h)		;38ee	2a 98 3d 	* . = 
	dec hl			;38f1	2b 	+ 
	jr l3901h		;38f2	18 0d 	. . 
sub_38f4h:
	xor a			;38f4	af 	. 
	ld (l3d9ah),a		;38f5	32 9a 3d 	2 . = 
	ld hl,(l3d98h)		;38f8	2a 98 3d 	* . = 
	inc hl			;38fb	23 	# 
	jr l3901h		;38fc	18 03 	. . 
sub_38feh:
	ld hl,00000h		;38fe	21 00 00 	! . . 
l3901h:
	ld (l3d98h),hl		;3901	22 98 3d 	" . = 
	ret			;3904	c9 	. 
sub_3905h:
	ld hl,(l3d98h)		;3905	2a 98 3d 	* . = 
	ld a,l			;3908	7d 	} 
	or h			;3909	b4 	. 
	ret			;390a	c9 	. 
	ld a,(l3d90h)		;390b	3a 90 3d 	: . = 
	jp l3b09h		;390e	c3 09 3b 	. . ; 
	ld a,(l3d90h)		;3911	3a 90 3d 	: . = 
	jp l3aceh		;3914	c3 ce 3a 	. . : 
	call sub_3945h		;3917	cd 45 39 	. E 9 
	jr z,l391eh		;391a	28 02 	( . 
	lddr		;391c	ed b8 	. . 
l391eh:
	inc hl			;391e	23 	# 
	ld (hl),020h		;391f	36 20 	6   
	inc hl			;3921	23 	# 
	ld (hl),004h		;3922	36 04 	6 . 
	call sub_3caah		;3924	cd aa 3c 	. . < 
	call sub_3b57h		;3927	cd 57 3b 	. W ; 
	ld hl,(l3d8fh)		;392a	2a 8f 3d 	* . = 
	push hl			;392d	e5 	. 
	inc h			;392e	24 	$ 
	ld l,000h		;392f	2e 00 	. . 
	ld a,(l3d91h)		;3931	3a 91 3d 	: . = 
	cp h			;3934	bc 	. 
	jp z,l393eh		;3935	ca 3e 39 	. > 9 
	ld (l3d8fh),hl		;3938	22 8f 3d 	" . = 
	call sub_37f0h		;393b	cd f0 37 	. . 7 
l393eh:
	pop hl			;393e	e1 	. 
	ld (l3d8fh),hl		;393f	22 8f 3d 	" . = 
	jp sub_37f0h		;3942	c3 f0 37 	. . 7 
sub_3945h:
	ld a,(l3d90h)		;3945	3a 90 3d 	: . = 
	ld b,a			;3948	47 	G 
	call sub_3b34h		;3949	cd 34 3b 	. 4 ; 
	ld hl,l3d8eh		;394c	21 8e 3d 	! . = 
	ld a,(hl)			;394f	7e 	~ 
	inc hl			;3950	23 	# 
	sub (hl)			;3951	96 	. 
	dec a			;3952	3d 	= 
	rla			;3953	17 	. 
	ld c,a			;3954	4f 	O 
	ld b,000h		;3955	06 00 	. . 
	ld hl,l3e4dh		;3957	21 4d 3e 	! M > 
	ld de,l3e4fh		;395a	11 4f 3e 	. O > 
	ret			;395d	c9 	. 
	call sub_3945h		;395e	cd 45 39 	. E 9 
	jr z,l396eh		;3961	28 0b 	( . 
	sbc hl,bc		;3963	ed 42 	. B 
	ex de,hl			;3965	eb 	. 
	sbc hl,bc		;3966	ed 42 	. B 
	inc de			;3968	13 	. 
	inc hl			;3969	23 	# 
	ldir		;396a	ed b0 	. . 
	ex de,hl			;396c	eb 	. 
	dec hl			;396d	2b 	+ 
l396eh:
	ld a,(hl)			;396e	7e 	~ 
	ld d,a			;396f	57 	W 
	call sub_3ba0h		;3970	cd a0 3b 	. . ; 
	inc hl			;3973	23 	# 
	ld (hl),020h		;3974	36 20 	6   
	inc hl			;3976	23 	# 
	or 004h		;3977	f6 04 	. . 
	ld (hl),a			;3979	77 	w 
	call sub_3caah		;397a	cd aa 3c 	. . < 
	call sub_3b57h		;397d	cd 57 3b 	. W ; 
	call sub_3c67h		;3980	cd 67 3c 	. g < 
	jp sub_37f0h		;3983	c3 f0 37 	. . 7 
	ld a,0ffh		;3986	3e ff 	> . 
	ld (l3da7h),a		;3988	32 a7 3d 	2 . = 
	call sub_3a82h		;398b	cd 82 3a 	. . : 
	xor a			;398e	af 	. 
	ld (l3da7h),a		;398f	32 a7 3d 	2 . = 
	ret			;3992	c9 	. 
	ld a,(l3d8fh)		;3993	3a 8f 3d 	: . = 
	srl a		;3996	cb 3f 	. ? 
	srl a		;3998	cb 3f 	. ? 
	srl a		;399a	cb 3f 	. ? 
	ld e,a			;399c	5f 	_ 
	ld d,000h		;399d	16 00 	. . 
	ld hl,l39b5h		;399f	21 b5 39 	! . 9 
	add hl,de			;39a2	19 	. 
	ld a,(hl)			;39a3	7e 	~ 
	ld (l3d8fh),a		;39a4	32 8f 3d 	2 . = 
	cp 0ffh		;39a7	fe ff 	. . 
	jr nz,l39b1h		;39a9	20 06 	  . 
	call sub_3a0eh		;39ab	cd 0e 3a 	. . : 
	call sub_39ffh		;39ae	cd ff 39 	. . 9 
l39b1h:
	call sub_3c67h		;39b1	cd 67 3c 	. g < 
	ret			;39b4	c9 	. 
l39b5h:
	ex af,af'			;39b5	08 	. 
	djnz l39d0h		;39b6	10 18 	. . 
	jr nz,42		;39b8	20 28 	  ( 
	jr nc,58		;39ba	30 38 	0 8 
	ld b,b			;39bc	40 	@ 
	ld c,b			;39bd	48 	H 
	rst 38h			;39be	ff 	. 
	ld a,(l3d8fh)		;39bf	3a 8f 3d 	: . = 
	or a			;39c2	b7 	. 
	jr z,l39cdh		;39c3	28 08 	( . 
	sub 001h		;39c5	d6 01 	. . 
	srl a		;39c7	cb 3f 	. ? 
	srl a		;39c9	cb 3f 	. ? 
	srl a		;39cb	cb 3f 	. ? 
l39cdh:
	ld e,a			;39cd	5f 	_ 
	ld d,000h		;39ce	16 00 	. . 
l39d0h:
	ld hl,l39e8h		;39d0	21 e8 39 	! . 9 
	add hl,de			;39d3	19 	. 
	ld a,(hl)			;39d4	7e 	~ 
	ld (l3d8fh),a		;39d5	32 8f 3d 	2 . = 
	cp 0ffh		;39d8	fe ff 	. . 
	jr nz,l39e4h		;39da	20 08 	  . 
	ld a,04fh		;39dc	3e 4f 	> O 
	ld (l3d8fh),a		;39de	32 8f 3d 	2 . = 
	call sub_3a2eh		;39e1	cd 2e 3a 	. . : 
l39e4h:
	call sub_3c67h		;39e4	cd 67 3c 	. g < 
	ret			;39e7	c9 	. 
l39e8h:
	rst 38h			;39e8	ff 	. 
	ex af,af'			;39e9	08 	. 
	djnz l3a04h		;39ea	10 18 	. . 
	jr nz,42		;39ec	20 28 	  ( 
	jr nc,l3a26h		;39ee	30 36 	0 6 
	ld b,b			;39f0	40 	@ 
	ld c,b			;39f1	48 	H 
	ld hl,l3d8fh		;39f2	21 8f 3d 	! . = 
	inc (hl)			;39f5	34 	4 
	ld a,(hl)			;39f6	7e 	~ 
	dec hl			;39f7	2b 	+ 
	cp (hl)			;39f8	be 	. 
	jp c,sub_3c67h		;39f9	da 67 3c 	. g < 
	call sub_3a0eh		;39fc	cd 0e 3a 	. . : 
sub_39ffh:
	ld hl,l3d90h		;39ff	21 90 3d 	! . = 
	inc (hl)			;3a02	34 	4 
	ld a,(hl)			;3a03	7e 	~ 
l3a04h:
	inc hl			;3a04	23 	# 
	cp (hl)			;3a05	be 	. 
	jp nz,sub_3c67h		;3a06	c2 67 3c 	. g < 
	dec hl			;3a09	2b 	+ 
	dec (hl)			;3a0a	35 	5 
	jp l34e8h		;3a0b	c3 e8 34 	. . 4 
sub_3a0eh:
	xor a			;3a0e	af 	. 
	ld (l3d8fh),a		;3a0f	32 8f 3d 	2 . = 
	jp sub_3c67h		;3a12	c3 67 3c 	. g < 
	ld hl,l3d8fh		;3a15	21 8f 3d 	! . = 
	dec (hl)			;3a18	35 	5 
	jp p,sub_3c67h		;3a19	f2 67 3c 	. g < 
	dec hl			;3a1c	2b 	+ 
	ld a,(hl)			;3a1d	7e 	~ 
	inc hl			;3a1e	23 	# 
	dec a			;3a1f	3d 	= 
	ld (hl),a			;3a20	77 	w 
	inc hl			;3a21	23 	# 
	dec (hl)			;3a22	35 	5 
	jp p,sub_3c67h		;3a23	f2 67 3c 	. g < 
l3a26h:
	inc hl			;3a26	23 	# 
	ld a,(hl)			;3a27	7e 	~ 
	dec a			;3a28	3d 	= 
	dec hl			;3a29	2b 	+ 
l3a2ah:
	ld (hl),a			;3a2a	77 	w 
l3a2bh:
	jp sub_3c67h		;3a2b	c3 67 3c 	. g < 
sub_3a2eh:
	ld hl,l3d90h		;3a2e	21 90 3d 	! . = 
	dec (hl)			;3a31	35 	5 
	jp p,sub_3c67h		;3a32	f2 67 3c 	. g < 
	inc hl			;3a35	23 	# 
	ld a,(hl)			;3a36	7e 	~ 
	dec a			;3a37	3d 	= 
	dec hl			;3a38	2b 	+ 
	ld (hl),a			;3a39	77 	w 
	jr l3a2bh		;3a3a	18 ef 	. . 
	ld a,004h		;3a3c	3e 04 	> . 
	ld (l3d91h+1),a		;3a3e	32 92 3d 	2 . = 
sub_3a41h:
	call sub_3531h		;3a41	cd 31 35 	. 1 5 
	call l357dh		;3a44	cd 7d 35 	. } 5 
	ld hl,(l3d9bh)		;3a47	2a 9b 3d 	* . = 
	ld bc,(l3da1h)		;3a4a	ed 4b a1 3d 	. K . = 
	ld de,00420h		;3a4e	11 20 04 	.   . 
	call sub_3aaeh		;3a51	cd ae 3a 	. . : 
	call sub_3c61h		;3a54	cd 61 3c 	. a < 
	xor a			;3a57	af 	. 
	ld (l3da7h),a		;3a58	32 a7 3d 	2 . = 
	jp sub_38feh		;3a5b	c3 fe 38 	. . 8 
	ld a,0ffh		;3a5e	3e ff 	> . 
	ld (l3da7h),a		;3a60	32 a7 3d 	2 . = 
	jr sub_3a41h		;3a63	18 dc 	. . 
	ld a,0ffh		;3a65	3e ff 	> . 
	ld (l3da7h),a		;3a67	32 a7 3d 	2 . = 
	ld hl,l3d91h		;3a6a	21 91 3d 	! . = 
	ld a,(hl)			;3a6d	7e 	~ 
	dec hl			;3a6e	2b 	+ 
	sub (hl)			;3a6f	96 	. 
	dec a			;3a70	3d 	= 
	jr z,sub_3a82h		;3a71	28 0f 	( . 
	ld b,a			;3a73	47 	G 
	ld c,(hl)			;3a74	4e 	N 
l3a75h:
	inc c			;3a75	0c 	. 
	push bc			;3a76	c5 	. 
	ld a,(l3d91h+1)		;3a77	3a 92 3d 	: . = 
	ld d,a			;3a7a	57 	W 
	ld a,c			;3a7b	79 	y 
	call sub_3a9ch		;3a7c	cd 9c 3a 	. . : 
	pop bc			;3a7f	c1 	. 
	djnz l3a75h		;3a80	10 f3 	. . 
sub_3a82h:
	ld hl,l3d8eh		;3a82	21 8e 3d 	! . = 
	ld a,(hl)			;3a85	7e 	~ 
	inc hl			;3a86	23 	# 
	sub (hl)			;3a87	96 	. 
	ld c,a			;3a88	4f 	O 
	ld b,000h		;3a89	06 00 	. . 
	ld e,020h		;3a8b	1e 20 	.   
	ld a,(l3d91h+1)		;3a8d	3a 92 3d 	: . = 
	ld d,a			;3a90	57 	W 
	call sub_3c67h		;3a91	cd 67 3c 	. g < 
	call sub_3abch		;3a94	cd bc 3a 	. . : 
	jp sub_37f0h		;3a97	c3 f0 37 	. . 7 
sub_3a9ah:
	ld d,004h		;3a9a	16 04 	. . 
sub_3a9ch:
	ld h,a			;3a9c	67 	g 
	ld l,000h		;3a9d	2e 00 	. . 
	call sub_3c6ah		;3a9f	cd 6a 3c 	. j < 
	ld bc,(l3d8eh)		;3aa2	ed 4b 8e 3d 	. K . = 
	ld b,000h		;3aa6	06 00 	. . 
	ld hl,(l3d42h)		;3aa8	2a 42 3d 	* B = 
	jp sub_3aaeh		;3aab	c3 ae 3a 	. . : 
sub_3aaeh:
	ld e,020h		;3aae	1e 20 	.   
	ld a,(l3da7h)		;3ab0	3a a7 3d 	: . = 
	cp 0ffh		;3ab3	fe ff 	. . 
	jr nz,l3ab9h		;3ab5	20 02 	  . 
	ld e,000h		;3ab7	1e 00 	. . 
l3ab9h:
	call sub_3ca7h		;3ab9	cd a7 3c 	. . < 
sub_3abch:
	dec bc			;3abc	0b 	. 
	ld (l3d66h),bc		;3abd	ed 43 66 3d 	. C f = 
	ld (03d6ah),de		;3ac1	ed 53 6a 3d 	. S j = 
	ld hl,l3d63h		;3ac5	21 63 3d 	! c = 
	call sub_3cadh		;3ac8	cd ad 3c 	. . < 
	jp sub_3c67h		;3acb	c3 67 3c 	. g < 
l3aceh:
	or a			;3ace	b7 	. 
	jp z,l34e8h		;3acf	ca e8 34 	. . 4 
	push af			;3ad2	f5 	. 
	call l358eh		;3ad3	cd 8e 35 	. . 5 
	pop af			;3ad6	f1 	. 
	ld b,a			;3ad7	47 	G 
	ld a,017h		;3ad8	3e 17 	> . 
	sub b			;3ada	90 	. 
	jr z,l3aech		;3adb	28 0f 	( . 
	ld c,a			;3add	4f 	O 
l3adeh:
	inc b			;3ade	04 	. 
	call sub_3b34h		;3adf	cd 34 3b 	. 4 ; 
	dec h			;3ae2	25 	% 
	call sub_3c6ah		;3ae3	cd 6a 3c 	. j < 
	call sub_3b57h		;3ae6	cd 57 3b 	. W ; 
	dec c			;3ae9	0d 	. 
	jr nz,l3adeh		;3aea	20 f2 	  . 
l3aech:
	ld a,017h		;3aec	3e 17 	> . 
	call sub_3a9ah		;3aee	cd 9a 3a 	. . : 
	ld hl,(l3d8fh)		;3af1	2a 8f 3d 	* . = 
	ld l,000h		;3af4	2e 00 	. . 
	push hl			;3af6	e5 	. 
	ld h,017h		;3af7	26 17 	& . 
	ld (l3d8fh),hl		;3af9	22 8f 3d 	" . = 
	call sub_37f0h		;3afc	cd f0 37 	. . 7 
	pop hl			;3aff	e1 	. 
	ld (l3d8fh),hl		;3b00	22 8f 3d 	" . = 
	call l359ch		;3b03	cd 9c 35 	. . 5 
	jp sub_37f0h		;3b06	c3 f0 37 	. . 7 
l3b09h:
	push af			;3b09	f5 	. 
	call l358eh		;3b0a	cd 8e 35 	. . 5 
	pop af			;3b0d	f1 	. 
	push af			;3b0e	f5 	. 
	ld b,a			;3b0f	47 	G 
	ld a,017h		;3b10	3e 17 	> . 
	sub b			;3b12	90 	. 
	jr z,l3b26h		;3b13	28 11 	( . 
	ld c,a			;3b15	4f 	O 
	ld b,016h		;3b16	06 16 	. . 
l3b18h:
	call sub_3b34h		;3b18	cd 34 3b 	. 4 ; 
	inc h			;3b1b	24 	$ 
	call sub_3c6ah		;3b1c	cd 6a 3c 	. j < 
	call sub_3b57h		;3b1f	cd 57 3b 	. W ; 
	dec b			;3b22	05 	. 
	dec c			;3b23	0d 	. 
	jr nz,l3b18h		;3b24	20 f2 	  . 
l3b26h:
	pop af			;3b26	f1 	. 
	call sub_3a9ah		;3b27	cd 9a 3a 	. . : 
	xor a			;3b2a	af 	. 
	ld (l3d8fh),a		;3b2b	32 8f 3d 	2 . = 
	call l359ch		;3b2e	cd 9c 35 	. . 5 
	jp sub_37f0h		;3b31	c3 f0 37 	. . 7 
sub_3b34h:
	ld h,b			;3b34	60 	` 
	ld l,000h		;3b35	2e 00 	. . 
	push hl			;3b37	e5 	. 
	call sub_3c6ah		;3b38	cd 6a 3c 	. j < 
	call sub_3b40h		;3b3b	cd 40 3b 	. @ ; 
	pop hl			;3b3e	e1 	. 
	ret			;3b3f	c9 	. 
sub_3b40h:
	push hl			;3b40	e5 	. 
	push bc			;3b41	c5 	. 
	ld hl,l3d6dh		;3b42	21 6d 3d 	! m = 
	call sub_3cadh		;3b45	cd ad 3c 	. . < 
	ld hl,l3db0h		;3b48	21 b0 3d 	! . = 
	ld b,0a0h		;3b4b	06 a0 	. . 
l3b4dh:
	call sub_3cddh		;3b4d	cd dd 3c 	. . < 
	ld (hl),a			;3b50	77 	w 
	inc hl			;3b51	23 	# 
	djnz l3b4dh		;3b52	10 f9 	. . 
	pop bc			;3b54	c1 	. 
	pop hl			;3b55	e1 	. 
	ret			;3b56	c9 	. 
sub_3b57h:
	push hl			;3b57	e5 	. 
	push bc			;3b58	c5 	. 
	ld hl,l3d75h		;3b59	21 75 3d 	! u = 
	call sub_3cadh		;3b5c	cd ad 3c 	. . < 
	ld hl,l3db0h		;3b5f	21 b0 3d 	! . = 
	ld b,0a0h		;3b62	06 a0 	. . 
l3b64h:
	ld a,(hl)			;3b64	7e 	~ 
	call sub_3ccdh		;3b65	cd cd 3c 	. . < 
	inc hl			;3b68	23 	# 
	djnz l3b64h		;3b69	10 f9 	. . 
	pop bc			;3b6b	c1 	. 
	pop hl			;3b6c	e1 	. 
	ret			;3b6d	c9 	. 
sub_3b6eh:
	call sub_3c67h		;3b6e	cd 67 3c 	. g < 
	ld hl,(l3d42h)		;3b71	2a 42 3d 	* B = 
	push hl			;3b74	e5 	. 
	push hl			;3b75	e5 	. 
	ld de,(l3d7fh)		;3b76	ed 5b 7f 3d 	. [  = 
	xor a			;3b7a	af 	. 
	sbc hl,de		;3b7b	ed 52 	. R 
	pop hl			;3b7d	e1 	. 
	jr z,l3b98h		;3b7e	28 18 	( . 
	push hl			;3b80	e5 	. 
	ld de,(l3d9bh)		;3b81	ed 5b 9b 3d 	. [ . = 
	or a			;3b85	b7 	. 
	sbc hl,de		;3b86	ed 52 	. R 
	pop hl			;3b88	e1 	. 
	jp nz,l3b8fh		;3b89	c2 8f 3b 	. . ; 
	ld hl,(l3d9dh)		;3b8c	2a 9d 3d 	* . = 
l3b8fh:
	dec hl			;3b8f	2b 	+ 
	call sub_3ca7h		;3b90	cd a7 3c 	. . < 
	call sub_3b9dh		;3b93	cd 9d 3b 	. . ; 
	and 0c8h		;3b96	e6 c8 	. . 
l3b98h:
	ld d,a			;3b98	57 	W 
	pop hl			;3b99	e1 	. 
	jp sub_3ca7h		;3b9a	c3 a7 3c 	. . < 
sub_3b9dh:
	call sub_3badh		;3b9d	cd ad 3b 	. . ; 
sub_3ba0h:
	and 011h		;3ba0	e6 11 	. . 
	xor 011h		;3ba2	ee 11 	. . 
	ld a,d			;3ba4	7a 	z 
	jr nz,l3ba9h		;3ba5	20 02 	  . 
	or 008h		;3ba7	f6 08 	. . 
l3ba9h:
	and 0c8h		;3ba9	e6 c8 	. . 
	ld d,a			;3bab	57 	W 
	ret			;3bac	c9 	. 
sub_3badh:
	ld hl,00001h		;3bad	21 01 00 	! . . 
	ld (l3d56h),hl		;3bb0	22 56 3d 	" V = 
	ld hl,l3d53h		;3bb3	21 53 3d 	! S = 
	call sub_3cadh		;3bb6	cd ad 3c 	. . < 
	call sub_3cddh		;3bb9	cd dd 3c 	. . < 
	ld d,a			;3bbc	57 	W 
	ret			;3bbd	c9 	. 
	ld a,00dh		;3bbe	3e 0d 	> . 
	jp sub_3cc7h		;3bc0	c3 c7 3c 	. . < 
	ld a,00ch		;3bc3	3e 0c 	> . 
	jp sub_3cc7h		;3bc5	c3 c7 3c 	. . < 
	ld a,020h		;3bc8	3e 20 	>   
	jp sub_3486h		;3bca	c3 86 34 	. . 4 
l3bcdh:
	ld a,0ffh		;3bcd	3e ff 	> . 
	ld (l2febh),a		;3bcf	32 eb 2f 	2 . / 
	call sub_3c6ah		;3bd2	cd 6a 3c 	. j < 
	ld hl,l3d5bh		;3bd5	21 5b 3d 	! [ = 
	call sub_3cadh		;3bd8	cd ad 3c 	. . < 
	call sub_3cddh		;3bdb	cd dd 3c 	. . < 
	ld (l3c21h),a		;3bde	32 21 3c 	2 ! < 
	or a			;3be1	b7 	. 
	jr z,l3be6h		;3be2	28 02 	( . 
	sub 020h		;3be4	d6 20 	.   
l3be6h:
	ld d,a			;3be6	57 	W 
	push de			;3be7	d5 	. 
	call sub_3cddh		;3be8	cd dd 3c 	. . < 
	pop de			;3beb	d1 	. 
	ld e,a			;3bec	5f 	_ 
	ld (l3c22h),a		;3bed	32 22 3c 	2 " < 
	push de			;3bf0	d5 	. 
	ld hl,l3c20h		;3bf1	21 20 3c 	!   < 
	ld (hl),d			;3bf4	72 	r 
	xor a			;3bf5	af 	. 
	rld		;3bf6	ed 6f 	. o 
	ld d,a			;3bf8	57 	W 
	ld e,(hl)			;3bf9	5e 	^ 
	pop hl			;3bfa	e1 	. 
	ld a,l			;3bfb	7d 	} 
	push af			;3bfc	f5 	. 
	ld hl,l6a12h		;3bfd	21 12 6a 	! . j 
	add hl,de			;3c00	19 	. 
	ld bc,00010h		;3c01	01 10 00 	. . . 
	ld de,l3c23h		;3c04	11 23 3c 	. # < 
	ldir		;3c07	ed b0 	. . 
	pop af			;3c09	f1 	. 
	and 008h		;3c0a	e6 08 	. . 
	ld hl,l3c23h		;3c0c	21 23 3c 	! # < 
	call nz,sub_3c33h		;3c0f	c4 33 3c 	. 3 < 
	ld hl,l3c21h		;3c12	21 21 3c 	! ! < 
	ld b,(hl)			;3c15	46 	F 
	inc hl			;3c16	23 	# 
	ld c,(hl)			;3c17	4e 	N 
	ld hl,l3c23h		;3c18	21 23 3c 	! # < 
	xor a			;3c1b	af 	. 
	ld (l2febh),a		;3c1c	32 eb 2f 	2 . / 
	ret			;3c1f	c9 	. 
l3c20h:
	nop			;3c20	00 	. 
l3c21h:
	nop			;3c21	00 	. 
l3c22h:
	nop			;3c22	00 	. 
l3c23h:
	nop			;3c23	00 	. 
	nop			;3c24	00 	. 
	nop			;3c25	00 	. 
	nop			;3c26	00 	. 
	nop			;3c27	00 	. 
	nop			;3c28	00 	. 
	nop			;3c29	00 	. 
	nop			;3c2a	00 	. 
	nop			;3c2b	00 	. 
	nop			;3c2c	00 	. 
	nop			;3c2d	00 	. 
	nop			;3c2e	00 	. 
	nop			;3c2f	00 	. 
	nop			;3c30	00 	. 
	nop			;3c31	00 	. 
l3c32h:
	nop			;3c32	00 	. 
sub_3c33h:
	ld b,010h		;3c33	06 10 	. . 
l3c35h:
	ld a,(hl)			;3c35	7e 	~ 
	cpl			;3c36	2f 	/ 
	ld (hl),a			;3c37	77 	w 
	inc hl			;3c38	23 	# 
	djnz l3c35h		;3c39	10 fa 	. . 
	ret			;3c3b	c9 	. 
l3c3ch:
	ld hl,(l3d8fh)		;3c3c	2a 8f 3d 	* . = 
	ret			;3c3f	c9 	. 
	ld a,(l3d90h)		;3c40	3a 90 3d 	: . = 
	add a,020h		;3c43	c6 20 	.   
	ld b,a			;3c45	47 	G 
	ld a,(l3d8fh)		;3c46	3a 8f 3d 	: . = 
	add a,020h		;3c49	c6 20 	.   
	ld c,a			;3c4b	4f 	O 
	push bc			;3c4c	c5 	. 
	call sub_a020h		;3c4d	cd 20 a0 	.   . 
	pop bc			;3c50	c1 	. 
	ld a,b			;3c51	78 	x 
	push bc			;3c52	c5 	. 
	call sub_a03bh		;3c53	cd 3b a0 	. ; . 
	pop bc			;3c56	c1 	. 
	ld a,c			;3c57	79 	y 
	call sub_a03bh		;3c58	cd 3b a0 	. ; . 
	ld a,00dh		;3c5b	3e 0d 	> . 
	call sub_a03bh		;3c5d	cd 3b a0 	. ; . 
	ret			;3c60	c9 	. 
sub_3c61h:
	ld hl,00000h		;3c61	21 00 00 	! . . 
l3c64h:
	ld (l3d8fh),hl		;3c64	22 8f 3d 	" . = 
sub_3c67h:
	ld hl,(l3d8fh)		;3c67	2a 8f 3d 	* . = 
sub_3c6ah:
	push de			;3c6a	d5 	. 
	xor a			;3c6b	af 	. 
sub_3c6ch:
	ld (l3da3h),a		;3c6c	32 a3 3d 	2 . = 
	ld a,h			;3c6f	7c 	| 
	cp 018h		;3c70	fe 18 	. . 
	jr nz,l3c7dh		;3c72	20 09 	  . 
	ld h,000h		;3c74	26 00 	& . 
	ld de,(l3d9dh)		;3c76	ed 5b 9d 3d 	. [ . = 
	add hl,de			;3c7a	19 	. 
	jr l3ca6h		;3c7b	18 29 	. ) 
l3c7dh:
	ld de,l3ce7h		;3c7d	11 e7 3c 	. . < 
	ld a,l			;3c80	7d 	} 
	ld l,h			;3c81	6c 	l 
	ld h,000h		;3c82	26 00 	& . 
	add hl,hl			;3c84	29 	) 
	add hl,de			;3c85	19 	. 
	add a,(hl)			;3c86	86 	. 
	ld e,a			;3c87	5f 	_ 
	inc hl			;3c88	23 	# 
	ld a,(hl)			;3c89	7e 	~ 
	adc a,000h		;3c8a	ce 00 	. . 
	ld d,a			;3c8c	57 	W 
	ld hl,(l3d7fh)		;3c8d	2a 7f 3d 	*  = 
	add hl,de			;3c90	19 	. 
	push hl			;3c91	e5 	. 
	ld de,(l3d9dh)		;3c92	ed 5b 9d 3d 	. [ . = 
	xor a			;3c96	af 	. 
	sbc hl,de		;3c97	ed 52 	. R 
	ex de,hl			;3c99	eb 	. 
	pop hl			;3c9a	e1 	. 
	jr c,l3ca6h		;3c9b	38 09 	8 . 
	ld hl,(l3d9bh)		;3c9d	2a 9b 3d 	* . = 
	add hl,de			;3ca0	19 	. 
	ld a,001h		;3ca1	3e 01 	> . 
	ld (l3da3h),a		;3ca3	32 a3 3d 	2 . = 
l3ca6h:
	pop de			;3ca6	d1 	. 
sub_3ca7h:
	ld (l3d42h),hl		;3ca7	22 42 3d 	" B = 
sub_3caah:
	ld hl,l3d40h		;3caa	21 40 3d 	! @ = 
sub_3cadh:
	push bc			;3cad	c5 	. 
l3caeh:
	ld b,(hl)			;3cae	46 	F 
	inc hl			;3caf	23 	# 
	ld a,b			;3cb0	78 	x 
	or a			;3cb1	b7 	. 
	jr z,l3cc5h		;3cb2	28 11 	( . 
	ld a,(hl)			;3cb4	7e 	~ 
	inc hl			;3cb5	23 	# 
	call sub_3cc7h		;3cb6	cd c7 3c 	. . < 
	dec b			;3cb9	05 	. 
	jr z,l3caeh		;3cba	28 f2 	( . 
l3cbch:
	ld a,(hl)			;3cbc	7e 	~ 
	inc hl			;3cbd	23 	# 
	call sub_3ccdh		;3cbe	cd cd 3c 	. . < 
	djnz l3cbch		;3cc1	10 f9 	. . 
	jr l3caeh		;3cc3	18 e9 	. . 
l3cc5h:
	pop bc			;3cc5	c1 	. 
	ret			;3cc6	c9 	. 
sub_3cc7h:
	call sub_3cd3h		;3cc7	cd d3 3c 	. . < 
	out (039h),a		;3cca	d3 39 	. 9 
	ret			;3ccc	c9 	. 
sub_3ccdh:
	call sub_3cd3h		;3ccd	cd d3 3c 	. . < 
	out (038h),a		;3cd0	d3 38 	. 8 
	ret			;3cd2	c9 	. 
sub_3cd3h:
	push af			;3cd3	f5 	. 
l3cd4h:
	in a,(038h)		;3cd4	db 38 	. 8 
	and 002h		;3cd6	e6 02 	. . 
	jp nz,l3cd4h		;3cd8	c2 d4 3c 	. . < 
	pop af			;3cdb	f1 	. 
	ret			;3cdc	c9 	. 
sub_3cddh:
	in a,(038h)		;3cdd	db 38 	. 8 
	and 001h		;3cdf	e6 01 	. . 
	jp z,sub_3cddh		;3ce1	ca dd 3c 	. . < 
	in a,(039h)		;3ce4	db 39 	. 9 
	ret			;3ce6	c9 	. 
l3ce7h:
	nop			;3ce7	00 	. 
	nop			;3ce8	00 	. 
	ld d,b			;3ce9	50 	P 
	nop			;3cea	00 	. 
	and b			;3ceb	a0 	. 
	nop			;3cec	00 	. 
	ret p			;3ced	f0 	. 
	nop			;3cee	00 	. 
	ld b,b			;3cef	40 	@ 
	ld bc,00190h		;3cf0	01 90 01 	. . . 
	ret po			;3cf3	e0 	. 
	ld bc,00230h		;3cf4	01 30 02 	. 0 . 
	add a,b			;3cf7	80 	. 
	ld (bc),a			;3cf8	02 	. 
	ret nc			;3cf9	d0 	. 
	ld (bc),a			;3cfa	02 	. 
	jr nz,l3d00h		;3cfb	20 03 	  . 
	ld (hl),b			;3cfd	70 	p 
	inc bc			;3cfe	03 	. 
	ret nz			;3cff	c0 	. 
l3d00h:
	inc bc			;3d00	03 	. 
	djnz l3d07h		;3d01	10 04 	. . 
	ld h,b			;3d03	60 	` 
	inc b			;3d04	04 	. 
	or b			;3d05	b0 	. 
	inc b			;3d06	04 	. 
l3d07h:
	nop			;3d07	00 	. 
	dec b			;3d08	05 	. 
	ld d,b			;3d09	50 	P 
	dec b			;3d0a	05 	. 
	and b			;3d0b	a0 	. 
	dec b			;3d0c	05 	. 
	ret p			;3d0d	f0 	. 
	dec b			;3d0e	05 	. 
	ld b,b			;3d0f	40 	@ 
	ld b,090h		;3d10	06 90 	. . 
	ld b,0e0h		;3d12	06 e0 	. . 
	ld b,030h		;3d14	06 30 	. 0 
	rlca			;3d16	07 	. 
	add a,b			;3d17	80 	. 
	rlca			;3d18	07 	. 
	ret nc			;3d19	d0 	. 
	rlca			;3d1a	07 	. 
l3d1bh:
	add hl,bc			;3d1b	09 	. 
	ld c,014h		;3d1c	0e 14 	. . 
	ld c,(hl)			;3d1e	4e 	N 
	ld (bc),a			;3d1f	02 	. 
	ld a,(de)			;3d20	1a 	. 
	ld (de),a			;3d21	12 	. 
	ld bc,01190h		;3d22	01 90 11 	. . . 
	nop			;3d25	00 	. 
l3d26h:
	inc b			;3d26	04 	. 
	ld c,e			;3d27	4b 	K 
	rrca			;3d28	0f 	. 
	ld l,l			;3d29	6d 	m 
	ld (hl),b			;3d2a	70 	p 
	nop			;3d2b	00 	. 
l3d2ch:
	ld (bc),a			;3d2c	02 	. 
	ld b,(hl)			;3d2d	46 	F 
	nop			;3d2e	00 	. 
	nop			;3d2f	00 	. 
l3d30h:
	ld (bc),a			;3d30	02 	. 
	ld b,a			;3d31	47 	G 
	ld d,b			;3d32	50 	P 
	nop			;3d33	00 	. 
l3d34h:
	dec b			;3d34	05 	. 
	ld (hl),b			;3d35	70 	p 
	nop			;3d36	00 	. 
	nop			;3d37	00 	. 
	nop			;3d38	00 	. 
	add hl,de			;3d39	19 	. 
	nop			;3d3a	00 	. 
l3d3bh:
	inc bc			;3d3b	03 	. 
	ld c,d			;3d3c	4a 	J 
	rst 38h			;3d3d	ff 	. 
	rst 38h			;3d3e	ff 	. 
	nop			;3d3f	00 	. 
l3d40h:
	inc bc			;3d40	03 	. 
	ld c,c			;3d41	49 	I 
l3d42h:
	nop			;3d42	00 	. 
	nop			;3d43	00 	. 
	nop			;3d44	00 	. 
l3d45h:
	inc bc			;3d45	03 	. 
	jr nz,l3d48h		;3d46	20 00 	  . 
l3d48h:
	nop			;3d48	00 	. 
	nop			;3d49	00 	. 
l3d4ah:
	inc b			;3d4a	04 	. 
	ld c,h			;3d4b	4c 	L 
	ld (bc),a			;3d4c	02 	. 
l3d4dh:
	nop			;3d4d	00 	. 
	nop			;3d4e	00 	. 
	ld (bc),a			;3d4f	02 	. 
l3d50h:
	nop			;3d50	00 	. 
l3d51h:
	nop			;3d51	00 	. 
	nop			;3d52	00 	. 
l3d53h:
	inc b			;3d53	04 	. 
	ld c,h			;3d54	4c 	L 
	ld (bc),a			;3d55	02 	. 
l3d56h:
	nop			;3d56	00 	. 
	nop			;3d57	00 	. 
	ld bc,000b8h		;3d58	01 b8 00 	. . . 
l3d5bh:
	inc b			;3d5b	04 	. 
	ld c,h			;3d5c	4c 	L 
	ld (bc),a			;3d5d	02 	. 
	ld bc,00100h		;3d5e	01 00 01 	. . . 
	and b			;3d61	a0 	. 
	nop			;3d62	00 	. 
l3d63h:
	inc b			;3d63	04 	. 
	ld c,h			;3d64	4c 	L 
	ld (bc),a			;3d65	02 	. 
l3d66h:
	nop			;3d66	00 	. 
	nop			;3d67	00 	. 
	inc bc			;3d68	03 	. 
	jr nz,l3d6bh		;3d69	20 00 	  . 
l3d6bh:
	nop			;3d6b	00 	. 
	nop			;3d6c	00 	. 
l3d6dh:
	inc b			;3d6d	04 	. 
	ld c,h			;3d6e	4c 	L 
	ld (bc),a			;3d6f	02 	. 
	ld d,b			;3d70	50 	P 
	nop			;3d71	00 	. 
	ld bc,000a0h		;3d72	01 a0 00 	. . . 
l3d75h:
	inc b			;3d75	04 	. 
	ld c,h			;3d76	4c 	L 
	ld (bc),a			;3d77	02 	. 
	nop			;3d78	00 	. 
	nop			;3d79	00 	. 
	ld bc,00020h		;3d7a	01 20 00 	.   . 
l3d7dh:
	dec c			;3d7d	0d 	. 
	ld (hl),b			;3d7e	70 	p 
l3d7fh:
	nop			;3d7f	00 	. 
	nop			;3d80	00 	. 
	nop			;3d81	00 	. 
l3d82h:
	nop			;3d82	00 	. 
l3d83h:
	nop			;3d83	00 	. 
	nop			;3d84	00 	. 
	nop			;3d85	00 	. 
l3d86h:
	nop			;3d86	00 	. 
	add a,b			;3d87	80 	. 
	rlca			;3d88	07 	. 
	nop			;3d89	00 	. 
	ld bc,00000h		;3d8a	01 00 00 	. . . 
	nop			;3d8d	00 	. 
l3d8eh:
	ld d,b			;3d8e	50 	P 
l3d8fh:
	nop			;3d8f	00 	. 
l3d90h:
	nop			;3d90	00 	. 
l3d91h:
	jr l3d97h		;3d91	18 04 	. . 
l3d93h:
	nop			;3d93	00 	. 
l3d94h:
	nop			;3d94	00 	. 
l3d95h:
	nop			;3d95	00 	. 
	nop			;3d96	00 	. 
l3d97h:
	nop			;3d97	00 	. 
l3d98h:
	nop			;3d98	00 	. 
	nop			;3d99	00 	. 
l3d9ah:
	nop			;3d9a	00 	. 
l3d9bh:
	nop			;3d9b	00 	. 
	nop			;3d9c	00 	. 
l3d9dh:
	add a,b			;3d9d	80 	. 
	rlca			;3d9e	07 	. 
l3d9fh:
	add a,b			;3d9f	80 	. 
	rlca			;3da0	07 	. 
l3da1h:
	add a,b			;3da1	80 	. 
	rlca			;3da2	07 	. 
l3da3h:
	nop			;3da3	00 	. 
l3da4h:
	ld b,h			;3da4	44 	D 
l3da5h:
	adc a,a			;3da5	8f 	. 
l3da6h:
	nop			;3da6	00 	. 
l3da7h:
	nop			;3da7	00 	. 
	ld d,h			;3da8	54 	T 
	ld d,(hl)			;3da9	56 	V 
	dec l			;3daa	2d 	- 
	add hl,sp			;3dab	39 	9 
	ld (00030h),a		;3dac	32 30 00 	2 0 . 
	nop			;3daf	00 	. 
l3db0h:
	nop			;3db0	00 	. 
	nop			;3db1	00 	. 
	nop			;3db2	00 	. 
	nop			;3db3	00 	. 
	nop			;3db4	00 	. 
	nop			;3db5	00 	. 
	nop			;3db6	00 	. 
	nop			;3db7	00 	. 
	nop			;3db8	00 	. 
	nop			;3db9	00 	. 
	nop			;3dba	00 	. 
	nop			;3dbb	00 	. 
	nop			;3dbc	00 	. 
	nop			;3dbd	00 	. 
	nop			;3dbe	00 	. 
	nop			;3dbf	00 	. 
	nop			;3dc0	00 	. 
	nop			;3dc1	00 	. 
	nop			;3dc2	00 	. 
	nop			;3dc3	00 	. 
	nop			;3dc4	00 	. 
	nop			;3dc5	00 	. 
	nop			;3dc6	00 	. 
	nop			;3dc7	00 	. 
	nop			;3dc8	00 	. 
	nop			;3dc9	00 	. 
	nop			;3dca	00 	. 
	nop			;3dcb	00 	. 
	nop			;3dcc	00 	. 
	nop			;3dcd	00 	. 
	nop			;3dce	00 	. 
	nop			;3dcf	00 	. 
	nop			;3dd0	00 	. 
	nop			;3dd1	00 	. 
	nop			;3dd2	00 	. 
	nop			;3dd3	00 	. 
	nop			;3dd4	00 	. 
	nop			;3dd5	00 	. 
	nop			;3dd6	00 	. 
	nop			;3dd7	00 	. 
	nop			;3dd8	00 	. 
	nop			;3dd9	00 	. 
	nop			;3dda	00 	. 
	nop			;3ddb	00 	. 
	nop			;3ddc	00 	. 
	nop			;3ddd	00 	. 
	nop			;3dde	00 	. 
	nop			;3ddf	00 	. 
	nop			;3de0	00 	. 
	nop			;3de1	00 	. 
	nop			;3de2	00 	. 
	nop			;3de3	00 	. 
	nop			;3de4	00 	. 
	nop			;3de5	00 	. 
	nop			;3de6	00 	. 
	nop			;3de7	00 	. 
	nop			;3de8	00 	. 
	nop			;3de9	00 	. 
	nop			;3dea	00 	. 
	nop			;3deb	00 	. 
	nop			;3dec	00 	. 
	nop			;3ded	00 	. 
	nop			;3dee	00 	. 
	nop			;3def	00 	. 
	nop			;3df0	00 	. 
	nop			;3df1	00 	. 
	nop			;3df2	00 	. 
	nop			;3df3	00 	. 
	nop			;3df4	00 	. 
	nop			;3df5	00 	. 
	nop			;3df6	00 	. 
	nop			;3df7	00 	. 
	nop			;3df8	00 	. 
	nop			;3df9	00 	. 
	nop			;3dfa	00 	. 
	nop			;3dfb	00 	. 
	nop			;3dfc	00 	. 
	nop			;3dfd	00 	. 
	nop			;3dfe	00 	. 
	nop			;3dff	00 	. 
	nop			;3e00	00 	. 
	nop			;3e01	00 	. 
	nop			;3e02	00 	. 
	nop			;3e03	00 	. 
	nop			;3e04	00 	. 
	nop			;3e05	00 	. 
	nop			;3e06	00 	. 
	nop			;3e07	00 	. 
	nop			;3e08	00 	. 
	nop			;3e09	00 	. 
	nop			;3e0a	00 	. 
	nop			;3e0b	00 	. 
	nop			;3e0c	00 	. 
	nop			;3e0d	00 	. 
	nop			;3e0e	00 	. 
	nop			;3e0f	00 	. 
	nop			;3e10	00 	. 
	nop			;3e11	00 	. 
	nop			;3e12	00 	. 
	nop			;3e13	00 	. 
	nop			;3e14	00 	. 
	nop			;3e15	00 	. 
	nop			;3e16	00 	. 
	nop			;3e17	00 	. 
	nop			;3e18	00 	. 
	nop			;3e19	00 	. 
	nop			;3e1a	00 	. 
	nop			;3e1b	00 	. 
l3e1ch:
	nop			;3e1c	00 	. 
	nop			;3e1d	00 	. 
	nop			;3e1e	00 	. 
	nop			;3e1f	00 	. 
	nop			;3e20	00 	. 
	nop			;3e21	00 	. 
l3e22h:
	nop			;3e22	00 	. 
	nop			;3e23	00 	. 
	nop			;3e24	00 	. 
	nop			;3e25	00 	. 
	nop			;3e26	00 	. 
	nop			;3e27	00 	. 
	nop			;3e28	00 	. 
	nop			;3e29	00 	. 
	nop			;3e2a	00 	. 
	nop			;3e2b	00 	. 
	nop			;3e2c	00 	. 
	nop			;3e2d	00 	. 
	nop			;3e2e	00 	. 
	nop			;3e2f	00 	. 
	nop			;3e30	00 	. 
	nop			;3e31	00 	. 
	nop			;3e32	00 	. 
	nop			;3e33	00 	. 
	nop			;3e34	00 	. 
	nop			;3e35	00 	. 
	nop			;3e36	00 	. 
	nop			;3e37	00 	. 
	nop			;3e38	00 	. 
	nop			;3e39	00 	. 
	nop			;3e3a	00 	. 
	nop			;3e3b	00 	. 
	nop			;3e3c	00 	. 
	nop			;3e3d	00 	. 
	nop			;3e3e	00 	. 
	nop			;3e3f	00 	. 
	nop			;3e40	00 	. 
	nop			;3e41	00 	. 
	nop			;3e42	00 	. 
	nop			;3e43	00 	. 
	nop			;3e44	00 	. 
	nop			;3e45	00 	. 
	nop			;3e46	00 	. 
	nop			;3e47	00 	. 
	nop			;3e48	00 	. 
	nop			;3e49	00 	. 
	nop			;3e4a	00 	. 
	nop			;3e4b	00 	. 
	nop			;3e4c	00 	. 
l3e4dh:
	nop			;3e4d	00 	. 
	nop			;3e4e	00 	. 
l3e4fh:
	nop			;3e4f	00 	. 
l3e50h:
	jp l3e65h		;3e50	c3 65 3e 	. e > 
	jp l4d5eh		;3e53	c3 5e 4d 	. ^ M 
	jp l4147h		;3e56	c3 47 41 	. G A 
	jp l4142h		;3e59	c3 42 41 	. B A 
	jp l4e80h		;3e5c	c3 80 4e 	. . N 
	jp l4ea8h		;3e5f	c3 a8 4e 	. . N 
	jp l4e46h		;3e62	c3 46 4e 	. F N 
l3e65h:
	ld hl,l506eh		;3e65	21 6e 50 	! n P 
	ld (hl),c			;3e68	71 	q 
	ld a,0ffh		;3e69	3e ff 	> . 
	ld (l2febh),a		;3e6b	32 eb 2f 	2 . / 
	ld a,(l5069h)		;3e6e	3a 69 50 	: i P 
	or a			;3e71	b7 	. 
	jr z,l3e81h		;3e72	28 0d 	( . 
	xor a			;3e74	af 	. 
	ld (l5069h),a		;3e75	32 69 50 	2 i P 
	call sub_4ef2h		;3e78	cd f2 4e 	. . N 
	call sub_4ef8h		;3e7b	cd f8 4e 	. . N 
	call sub_4ef2h		;3e7e	cd f2 4e 	. . N 
l3e81h:
	ld a,(l5096h)		;3e81	3a 96 50 	: . P 
	or a			;3e84	b7 	. 
	jp nz,l414dh		;3e85	c2 4d 41 	. M A 
	ld a,(l5095h)		;3e88	3a 95 50 	: . P 
	or a			;3e8b	b7 	. 
	jr z,l3e92h		;3e8c	28 04 	( . 
	ld hl,(l5097h)		;3e8e	2a 97 50 	* . P 
	jp (hl)			;3e91	e9 	. 
l3e92h:
	ld a,(l506eh)		;3e92	3a 6e 50 	: n P 
	or a			;3e95	b7 	. 
	jr z,l3eabh		;3e96	28 13 	( . 
	cp 020h		;3e98	fe 20 	.   
	jp c,l4161h		;3e9a	da 61 41 	. a A 
	ld a,(sys_page_disp_mask)		;3e9d	3a 6f 2c 	: o , 
	or a			;3ea0	b7 	. 
	jr z,l3ea5h		;3ea1	28 02 	( . 
	res 7,c		;3ea3	cb b9 	. . 
l3ea5h:
	ld a,(l506eh)		;3ea5	3a 6e 50 	: n P 
	call sub_3eb0h		;3ea8	cd b0 3e 	. . > 
l3eabh:
	xor a			;3eab	af 	. 
	ld (l2febh),a		;3eac	32 eb 2f 	2 . / 
	ret			;3eaf	c9 	. 
sub_3eb0h:
	ld (l5082h),a		;3eb0	32 82 50 	2 . P 
	ld hl,l508eh		;3eb3	21 8e 50 	! . P 
	ld a,(l508fh)		;3eb6	3a 8f 50 	: . P 
	or (hl)			;3eb9	b6 	. 
	jp nz,l3f85h		;3eba	c2 85 3f 	. . ? 
	ld a,(l5082h)		;3ebd	3a 82 50 	: . P 
	push af			;3ec0	f5 	. 
	ld hl,l5083h		;3ec1	21 83 50 	! . P 
	sub (hl)			;3ec4	96 	. 
	ld (l5082h),a		;3ec5	32 82 50 	2 . P 
	ld hl,l5082h		;3ec8	21 82 50 	! . P 
	xor a			;3ecb	af 	. 
	rld		;3ecc	ed 6f 	. o 
	ld d,a			;3ece	57 	W 
	ld e,(hl)			;3ecf	5e 	^ 
	pop af			;3ed0	f1 	. 
	and 080h		;3ed1	e6 80 	. . 
	ld hl,l6a12h		;3ed3	21 12 6a 	! . j 
	jr nz,l3edbh		;3ed6	20 03 	  . 
	ld hl,(l5083h+1)		;3ed8	2a 84 50 	* . P 
l3edbh:
	add hl,de			;3edb	19 	. 
	ld bc,00008h		;3edc	01 08 00 	. . . 
	ld de,l4fe4h		;3edf	11 e4 4f 	. . O 
	ldir		;3ee2	ed b0 	. . 
	ld bc,00008h		;3ee4	01 08 00 	. . . 
	ld de,l4ff5h		;3ee7	11 f5 4f 	. . O 
	ldir		;3eea	ed b0 	. . 
l3eech:
	call sub_474bh		;3eec	cd 4b 47 	. K G 
	jr z,l3f1eh		;3eef	28 2d 	( - 
	ld hl,(l5087h)		;3ef1	2a 87 50 	* . P 
	call sub_4ccdh		;3ef4	cd cd 4c 	. . L 
	ld (l506fh),a		;3ef7	32 6f 50 	2 o P 
	and 00fh		;3efa	e6 0f 	. . 
	call nz,sub_3f46h		;3efc	c4 46 3f 	. F ? 
	ld a,(l506fh)		;3eff	3a 6f 50 	: o P 
	and 040h		;3f02	e6 40 	. @ 
	jr z,l3f0bh		;3f04	28 05 	( . 
	ld a,0ffh		;3f06	3e ff 	> . 
	ld (l4feah),a		;3f08	32 ea 4f 	2 . O 
l3f0bh:
	ld a,(l506fh)		;3f0b	3a 6f 50 	: o P 
	and 080h		;3f0e	e6 80 	. . 
	jr z,l3f3dh		;3f10	28 2b 	( + 
	ld hl,l4fe4h		;3f12	21 e4 4f 	! . O 
	call sub_3f7ch		;3f15	cd 7c 3f 	. | ? 
	ld hl,l4ff5h		;3f18	21 f5 4f 	! . O 
	call sub_3f7ch		;3f1b	cd 7c 3f 	. | ? 
l3f1eh:
	ld a,(l506ch)		;3f1e	3a 6c 50 	: l P 
	cp 0ffh		;3f21	fe ff 	. . 
	jr nz,l3f2ah		;3f23	20 05 	  . 
	ld a,0ffh		;3f25	3e ff 	> . 
	ld (l4feah),a		;3f27	32 ea 4f 	2 . O 
l3f2ah:
	ld a,(l506dh)		;3f2a	3a 6d 50 	: m P 
	cp 0ffh		;3f2d	fe ff 	. . 
	jr nz,l3f3dh		;3f2f	20 0c 	  . 
	ld hl,l4fe4h		;3f31	21 e4 4f 	! . O 
	call sub_3f7ch		;3f34	cd 7c 3f 	. | ? 
	ld hl,l4ff5h		;3f37	21 f5 4f 	! . O 
	call sub_3f7ch		;3f3a	cd 7c 3f 	. | ? 
l3f3dh:
	ld hl,l4fe1h		;3f3d	21 e1 4f 	! . O 
	call sub_4f1eh		;3f40	cd 1e 4f 	. . O 
	jp l3fc7h		;3f43	c3 c7 3f 	. . ? 
sub_3f46h:
	push hl			;3f46	e5 	. 
	ld hl,(l5087h)		;3f47	2a 87 50 	* . P 
	call sub_4cb8h		;3f4a	cd b8 4c 	. . L 
	pop hl			;3f4d	e1 	. 
	ld (hl),a			;3f4e	77 	w 
	ld (l506fh),a		;3f4f	32 6f 50 	2 o P 
	push af			;3f52	f5 	. 
	ld hl,(l5087h)		;3f53	2a 87 50 	* . P 
	call sub_4612h		;3f56	cd 12 46 	. . F 
	pop af			;3f59	f1 	. 
	call sub_44d5h		;3f5a	cd d5 44 	. . D 
	ret			;3f5d	c9 	. 
	ld hl,l4fe4h		;3f5e	21 e4 4f 	! . O 
	ld b,008h		;3f61	06 08 	. . 
l3f63h:
	call sub_3f73h		;3f63	cd 73 3f 	. s ? 
	djnz l3f63h		;3f66	10 fb 	. . 
	ld hl,l4ff5h		;3f68	21 f5 4f 	! . O 
	ld b,008h		;3f6b	06 08 	. . 
l3f6dh:
	call sub_3f73h		;3f6d	cd 73 3f 	. s ? 
	djnz l3f6dh		;3f70	10 fb 	. . 
	ret			;3f72	c9 	. 
sub_3f73h:
	ld a,(hl)			;3f73	7e 	~ 
	sla a		;3f74	cb 27 	. ' 
	or (hl)			;3f76	b6 	. 
	and 07fh		;3f77	e6 7f 	.  
	ld (hl),a			;3f79	77 	w 
	inc hl			;3f7a	23 	# 
	ret			;3f7b	c9 	. 
sub_3f7ch:
	ld b,008h		;3f7c	06 08 	. . 
l3f7eh:
	ld a,(hl)			;3f7e	7e 	~ 
	cpl			;3f7f	2f 	/ 
	ld (hl),a			;3f80	77 	w 
	inc hl			;3f81	23 	# 
	djnz l3f7eh		;3f82	10 fa 	. . 
	ret			;3f84	c9 	. 
l3f85h:
	ld a,(l5082h)		;3f85	3a 82 50 	: . P 
	sub 020h		;3f88	d6 20 	.   
	ld (l5082h),a		;3f8a	32 82 50 	2 . P 
	call sub_4af3h		;3f8d	cd f3 4a 	. . J 
	ld hl,l6304h		;3f90	21 04 63 	! . c 
	add hl,de			;3f93	19 	. 
	push hl			;3f94	e5 	. 
	ld a,(l508eh)		;3f95	3a 8e 50 	: . P 
	or a			;3f98	b7 	. 
	jp z,l3fb3h		;3f99	ca b3 3f 	. . ? 
	pop hl			;3f9c	e1 	. 
	ld de,l4fe4h		;3f9d	11 e4 4f 	. . O 
	ld bc,00008h		;3fa0	01 08 00 	. . . 
	ldir		;3fa3	ed b0 	. . 
	ld hl,l504ah		;3fa5	21 4a 50 	! J P 
	ld de,l4ff5h		;3fa8	11 f5 4f 	. . O 
	ld bc,00008h		;3fab	01 08 00 	. . . 
	ldir		;3fae	ed b0 	. . 
	jp l3eech		;3fb0	c3 ec 3e 	. . > 
l3fb3h:
	pop hl			;3fb3	e1 	. 
	ld de,l4ff5h		;3fb4	11 f5 4f 	. . O 
	ld bc,00008h		;3fb7	01 08 00 	. . . 
	ldir		;3fba	ed b0 	. . 
	ld hl,l504ah		;3fbc	21 4a 50 	! J P 
	ld de,l4fe4h		;3fbf	11 e4 4f 	. . O 
	ld bc,00008h		;3fc2	01 08 00 	. . . 
	ldir		;3fc5	ed b0 	. . 
l3fc7h:
	ld hl,l5087h		;3fc7	21 87 50 	! . P 
	inc (hl)			;3fca	34 	4 
	ld a,(hl)			;3fcb	7e 	~ 
	dec hl			;3fcc	2b 	+ 
	cp (hl)			;3fcd	be 	. 
	jr nz,l3fe9h		;3fce	20 19 	  . 
	inc hl			;3fd0	23 	# 
	ld a,(sys_page_crt_wrap)		;3fd1	3a 64 2c 	: d , 
	or a			;3fd4	b7 	. 
	jr nz,l3fdbh		;3fd5	20 04 	  . 
	dec (hl)			;3fd7	35 	5 
l3fd8h:
	jp l4eabh		;3fd8	c3 ab 4e 	. . N 
l3fdbh:
	xor a			;3fdb	af 	. 
	ld (hl),a			;3fdc	77 	w 
	inc hl			;3fdd	23 	# 
	inc (hl)			;3fde	34 	4 
	ld a,(hl)			;3fdf	7e 	~ 
	inc hl			;3fe0	23 	# 
	cp (hl)			;3fe1	be 	. 
	jr nz,l3fd8h		;3fe2	20 f4 	  . 
	dec hl			;3fe4	2b 	+ 
	dec (hl)			;3fe5	35 	5 
	jp l4006h		;3fe6	c3 06 40 	. . @ 
l3fe9h:
	srl a		;3fe9	cb 3f 	. ? 
	jr c,l3fffh		;3feb	38 12 	8 . 
	ld a,000h		;3fed	3e 00 	> . 
	ld (l4f98h),a		;3fef	32 98 4f 	2 . O 
	ld hl,(l4f96h)		;3ff2	2a 96 4f 	* . O 
	inc hl			;3ff5	23 	# 
	ld (l4f96h),hl		;3ff6	22 96 4f 	" . O 
l3ff9h:
	ld hl,04f93h		;3ff9	21 93 4f 	! . O 
	jp sub_4f1eh		;3ffc	c3 1e 4f 	. . O 
l3fffh:
	ld a,080h		;3fff	3e 80 	> . 
	ld (l4f98h),a		;4001	32 98 4f 	2 . O 
	jr l3ff9h		;4004	18 f3 	. . 
l4006h:
	call l4142h		;4006	cd 42 41 	. B A 
	ld a,000h		;4009	3e 00 	> . 
	call sub_4b00h		;400b	cd 00 4b 	. . K 
	call sub_40eeh		;400e	cd ee 40 	. . @ 
	ld a,017h		;4011	3e 17 	> . 
	call sub_4b00h		;4013	cd 00 4b 	. . K 
	call sub_474bh		;4016	cd 4b 47 	. K G 
	jr z,l4050h		;4019	28 35 	( 5 
	ld b,017h		;401b	06 17 	. . 
	ld h,001h		;401d	26 01 	& . 
	ld l,000h		;401f	2e 00 	. . 
l4021h:
	push bc			;4021	c5 	. 
	push hl			;4022	e5 	. 
	call sub_498fh		;4023	cd 8f 49 	. . I 
	pop hl			;4026	e1 	. 
	inc h			;4027	24 	$ 
	inc l			;4028	2c 	, 
	pop bc			;4029	c1 	. 
	djnz l4021h		;402a	10 f5 	. . 
	ld h,017h		;402c	26 17 	& . 
	ld l,000h		;402e	2e 00 	. . 
	call sub_4ccdh		;4030	cd cd 4c 	. . L 
	ld b,050h		;4033	06 50 	. P 
	xor a			;4035	af 	. 
l4036h:
	ld (hl),a			;4036	77 	w 
	inc hl			;4037	23 	# 
	djnz l4036h		;4038	10 fc 	. . 
	ld hl,00000h		;403a	21 00 00 	! . . 
	ld a,000h		;403d	3e 00 	> . 
	call sub_44d5h		;403f	cd d5 44 	. . D 
	ld h,016h		;4042	26 16 	& . 
	ld l,04fh		;4044	2e 4f 	. O 
	call sub_4ccdh		;4046	cd cd 4c 	. . L 
	ld h,017h		;4049	26 17 	& . 
	ld l,000h		;404b	2e 00 	. . 
	call sub_44d5h		;404d	cd d5 44 	. . D 
l4050h:
	ld a,(l509ch)		;4050	3a 9c 50 	: . P 
	inc a			;4053	3c 	< 
	ld (l509ch),a		;4054	32 9c 50 	2 . P 
	cp 018h		;4057	fe 18 	. . 
	call z,sub_4728h		;4059	cc 28 47 	. ( G 
	call l4147h		;405c	cd 47 41 	. G A 
	jp l4eabh		;405f	c3 ab 4e 	. . N 
sub_4062h:
	push af			;4062	f5 	. 
	ld a,(05063h)		;4063	3a 63 50 	: c P 
	or a			;4066	b7 	. 
	jr nz,l40b1h		;4067	20 48 	  H 
	ld hl,00000h		;4069	21 00 00 	! . . 
	ld (l4faah),hl		;406c	22 aa 4f 	" . O 
	ld hl,03e80h		;406f	21 80 3e 	! . > 
	ld (l4faeh),hl		;4072	22 ae 4f 	" . O 
	ld a,(l508ch)		;4075	3a 8c 50 	: . P 
	ld (l4fach),a		;4078	32 ac 4f 	2 . O 
	ld (l4fb0h),a		;407b	32 b0 4f 	2 . O 
	ld a,040h		;407e	3e 40 	> @ 
sub_4080h:
	ld (l4fb1h),a		;4080	32 b1 4f 	2 . O 
	ld hl,(050a5h)		;4083	2a a5 50 	* . P 
	push hl			;4086	e5 	. 
	ld a,l			;4087	7d 	} 
	call sub_40dch		;4088	cd dc 40 	. . @ 
	ld hl,l4fach		;408b	21 ac 4f 	! . O 
	or (hl)			;408e	b6 	. 
	ld (hl),a			;408f	77 	w 
	pop hl			;4090	e1 	. 
	ld a,l			;4091	7d 	} 
	call sub_40e5h		;4092	cd e5 40 	. . @ 
	push af			;4095	f5 	. 
	ld a,h			;4096	7c 	| 
	call sub_40dch		;4097	cd dc 40 	. . @ 
	ld h,a			;409a	67 	g 
	pop af			;409b	f1 	. 
	or h			;409c	b4 	. 
	and 03fh		;409d	e6 3f 	. ? 
	or 040h		;409f	f6 40 	. @ 
	ld (l4fadh),a		;40a1	32 ad 4f 	2 . O 
	ld a,002h		;40a4	3e 02 	> . 
	ld (04fb4h),a		;40a6	32 b4 4f 	2 . O 
	ld hl,l4fa7h		;40a9	21 a7 4f 	! . O 
	call sub_4f1eh		;40ac	cd 1e 4f 	. . O 
l40afh:
	pop af			;40af	f1 	. 
	ret			;40b0	c9 	. 
l40b1h:
	ld hl,00000h		;40b1	21 00 00 	! . . 
	ld (l4faah),hl		;40b4	22 aa 4f 	" . O 
	ld hl,03e80h		;40b7	21 80 3e 	! . > 
	ld (l4faeh),hl		;40ba	22 ae 4f 	" . O 
	ld a,(l508ch)		;40bd	3a 8c 50 	: . P 
	ld (l4fach),a		;40c0	32 ac 4f 	2 . O 
	ld (l4fb0h),a		;40c3	32 b0 4f 	2 . O 
	xor a			;40c6	af 	. 
	ld (l4fb1h),a		;40c7	32 b1 4f 	2 . O 
	ld a,019h		;40ca	3e 19 	> . 
	ld (l4fadh),a		;40cc	32 ad 4f 	2 . O 
	ld a,002h		;40cf	3e 02 	> . 
	ld (04fb4h),a		;40d1	32 b4 4f 	2 . O 
	ld hl,l4fa7h		;40d4	21 a7 4f 	! . O 
	call sub_4f1eh		;40d7	cd 1e 4f 	. . O 
	jr l40afh		;40da	18 d3 	. . 
sub_40dch:
	sla a		;40dc	cb 27 	. ' 
	sla a		;40de	cb 27 	. ' 
	sla a		;40e0	cb 27 	. ' 
	sla a		;40e2	cb 27 	. ' 
	ret			;40e4	c9 	. 
sub_40e5h:
	srl a		;40e5	cb 3f 	. ? 
	srl a		;40e7	cb 3f 	. ? 
	srl a		;40e9	cb 3f 	. ? 
	srl a		;40eb	cb 3f 	. ? 
	ret			;40ed	c9 	. 
sub_40eeh:
	ld hl,(l4faah)		;40ee	2a aa 4f 	* . O 
	ld de,00280h		;40f1	11 80 02 	. . . 
	add hl,de			;40f4	19 	. 
	ld (l4faah),hl		;40f5	22 aa 4f 	" . O 
	ld de,(l509dh)		;40f8	ed 5b 9d 50 	. [ . P 
	ld (l4faeh),de		;40fc	ed 53 ae 4f 	. S . O 
	sbc hl,de		;4100	ed 52 	. R 
	ld (050a1h),hl		;4102	22 a1 50 	" . P 
	ld a,(l4fadh)		;4105	3a ad 4f 	: . O 
	and 03fh		;4108	e6 3f 	. ? 
	dec a			;410a	3d 	= 
	call z,sub_4062h		;410b	cc 62 40 	. b @ 
	jr z,l4130h		;410e	28 20 	(   
	push af			;4110	f5 	. 
	ld a,(05063h)		;4111	3a 63 50 	: c P 
	or a			;4114	b7 	. 
	jr nz,l413ch		;4115	20 25 	  % 
	pop af			;4117	f1 	. 
	or 040h		;4118	f6 40 	. @ 
l411ah:
	ld (l4fadh),a		;411a	32 ad 4f 	2 . O 
	ld a,(l4fb1h)		;411d	3a b1 4f 	: . O 
	and 03fh		;4120	e6 3f 	. ? 
l4122h:
	inc a			;4122	3c 	< 
	push af			;4123	f5 	. 
	ld a,(05063h)		;4124	3a 63 50 	: c P 
	or a			;4127	b7 	. 
	jr nz,l413fh		;4128	20 15 	  . 
	pop af			;412a	f1 	. 
	or 040h		;412b	f6 40 	. @ 
l412dh:
	ld (l4fb1h),a		;412d	32 b1 4f 	2 . O 
l4130h:
	in a,(038h)		;4130	db 38 	. 8 
	and 020h		;4132	e6 20 	.   
	jr z,l4130h		;4134	28 fa 	( . 
	ld hl,l4fa7h		;4136	21 a7 4f 	! . O 
	jp sub_4f1eh		;4139	c3 1e 4f 	. . O 
l413ch:
	pop af			;413c	f1 	. 
	jr l411ah		;413d	18 db 	. . 
l413fh:
	pop af			;413f	f1 	. 
	jr l412dh		;4140	18 eb 	. . 
l4142h:
	xor a			;4142	af 	. 
	ld (l5068h),a		;4143	32 68 50 	2 h P 
	ret			;4146	c9 	. 
l4147h:
	ld a,0ffh		;4147	3e ff 	> . 
	ld (l5068h),a		;4149	32 68 50 	2 h P 
	ret			;414c	c9 	. 
l414dh:
	xor a			;414d	af 	. 
	ld (l5096h),a		;414e	32 96 50 	2 . P 
	ld a,(l506eh)		;4151	3a 6e 50 	: n P 
	ld hl,l41fch		;4154	21 fc 41 	! . A 
	ld b,01dh		;4157	06 1d 	. . 
	jr l4166h		;4159	18 0b 	. . 
	ld a,0ffh		;415b	3e ff 	> . 
	ld (l5096h),a		;415d	32 96 50 	2 . P 
	ret			;4160	c9 	. 
l4161h:
	ld hl,l41d4h		;4161	21 d4 41 	! . A 
	ld b,014h		;4164	06 14 	. . 
l4166h:
	cp (hl)			;4166	be 	. 
	jr z,l4170h		;4167	28 07 	( . 
	inc hl			;4169	23 	# 
	inc hl			;416a	23 	# 
	djnz l4166h		;416b	10 f9 	. . 
	jp l3eabh		;416d	c3 ab 3e 	. . > 
l4170h:
	inc hl			;4170	23 	# 
	ld a,(hl)			;4171	7e 	~ 
	ld d,000h		;4172	16 00 	. . 
	add a,a			;4174	87 	. 
	ld hl,l4186h		;4175	21 86 41 	! . A 
	ld e,a			;4178	5f 	_ 
	add hl,de			;4179	19 	. 
	ld e,(hl)			;417a	5e 	^ 
	inc hl			;417b	23 	# 
	ld d,(hl)			;417c	56 	V 
	ld hl,l3eabh		;417d	21 ab 3e 	! . > 
	push hl			;4180	e5 	. 
	push de			;4181	d5 	. 
	ld hl,(l5087h)		;4182	2a 87 50 	* . P 
	ret			;4185	c9 	. 
l4186h:
	ld e,h			;4186	5c 	\ 
	ld c,d			;4187	4a 	J 
	ld a,(de)			;4188	1a 	. 
	ld b,e			;4189	43 	C 
	ld b,d			;418a	42 	B 
	ld b,e			;418b	43 	C 
	add a,d			;418c	82 	. 
	ld c,d			;418d	4a 	J 
	xor d			;418e	aa 	. 
	ld c,c			;418f	49 	I 
	ld d,b			;4190	50 	P 
	ld b,a			;4191	47 	G 
	ld d,(hl)			;4192	56 	V 
	ld b,a			;4193	47 	G 
	ld e,h			;4194	5c 	\ 
	ld b,a			;4195	47 	G 
	sub h			;4196	94 	. 
	ld b,a			;4197	47 	G 
	sub h			;4198	94 	. 
	ld b,d			;4199	42 	B 
	push af			;419a	f5 	. 
	and c			;419b	a1 	. 
	dec (hl)			;419c	35 	5 
	ld c,d			;419d	4a 	J 
	dec de			;419e	1b 	. 
	ld c,d			;419f	4a 	J 
	ld c,(hl)			;41a0	4e 	N 
	ld c,d			;41a1	4a 	J 
	ld c,04ah		;41a2	0e 4a 	. J 
	ld l,04ah		;41a4	2e 4a 	. J 
	ld e,e			;41a6	5b 	[ 
	ld b,c			;41a7	41 	A 
	and l			;41a8	a5 	. 
	ld c,(hl)			;41a9	4e 	N 
	xor e			;41aa	ab 	. 
	ld a,0ach		;41ab	3e ac 	> . 
	ld b,e			;41ad	43 	C 
	or d			;41ae	b2 	. 
	ld b,e			;41af	43 	C 
	add hl,bc			;41b0	09 	. 
	ld b,e			;41b1	43 	C 
	ret m			;41b2	f8 	. 
	ld b,d			;41b3	42 	B 
	cp b			;41b4	b8 	. 
	ld b,e			;41b5	43 	C 
	cp (hl)			;41b6	be 	. 
	ld b,e			;41b7	43 	C 
	or d			;41b8	b2 	. 
	ld c,c			;41b9	49 	I 
	sbc a,049h		;41ba	de 49 	. I 
	ex de,hl			;41bc	eb 	. 
	and c			;41bd	a1 	. 
	ret p			;41be	f0 	. 
	and c			;41bf	a1 	. 
	halt			;41c0	76 	v 
	ld c,d			;41c1	4a 	J 
	ld a,l			;41c2	7d 	} 
	ld c,d			;41c3	4a 	J 
	and l			;41c4	a5 	. 
	ld c,c			;41c5	49 	I 
	ld e,h			;41c6	5c 	\ 
	ld c,d			;41c7	4a 	J 
	pop de			;41c8	d1 	. 
	ld b,d			;41c9	42 	B 
	add a,h			;41ca	84 	. 
	ld c,(hl)			;41cb	4e 	N 
	ld h,e			;41cc	63 	c 
	ld b,e			;41cd	43 	C 
	adc a,e			;41ce	8b 	. 
	ld b,e			;41cf	43 	C 
	ld (hl),042h		;41d0	36 42 	6 B 
	adc a,e			;41d2	8b 	. 
	ld b,d			;41d3	42 	B 
l41d4h:
	rlca			;41d4	07 	. 
	ld a,(bc)			;41d5	0a 	. 
	ex af,af'			;41d6	08 	. 
	dec bc			;41d7	0b 	. 
	add hl,bc			;41d8	09 	. 
	add hl,de			;41d9	19 	. 
	ld a,(bc)			;41da	0a 	. 
	inc c			;41db	0c 	. 
	dec bc			;41dc	0b 	. 
	dec c			;41dd	0d 	. 
	inc c			;41de	0c 	. 
	ld c,00dh		;41df	0e 0d 	. . 
	rrca			;41e1	0f 	. 
	ld a,(de)			;41e2	1a 	. 
	nop			;41e3	00 	. 
	dec de			;41e4	1b 	. 
	djnz l4205h		;41e5	10 1e 	. . 
	ld de,00000h		;41e7	11 00 00 	. . . 
	nop			;41ea	00 	. 
	nop			;41eb	00 	. 
	nop			;41ec	00 	. 
	nop			;41ed	00 	. 
	nop			;41ee	00 	. 
	nop			;41ef	00 	. 
	nop			;41f0	00 	. 
	nop			;41f1	00 	. 
	nop			;41f2	00 	. 
	nop			;41f3	00 	. 
	nop			;41f4	00 	. 
	nop			;41f5	00 	. 
	nop			;41f6	00 	. 
	nop			;41f7	00 	. 
	nop			;41f8	00 	. 
	nop			;41f9	00 	. 
	nop			;41fa	00 	. 
	nop			;41fb	00 	. 
l41fch:
	dec hl			;41fc	2b 	+ 
	jr nz,l4269h		;41fd	20 6a 	  j 
	ld bc,0026bh		;41ff	01 6b 02 	. k . 
	ld e,c			;4202	59 	Y 
	inc bc			;4203	03 	. 
	ld d,h			;4204	54 	T 
l4205h:
	inc b			;4205	04 	. 
	ld b,l			;4206	45 	E 
	dec b			;4207	05 	. 
	ld c,c			;4208	49 	I 
	ld a,(de)			;4209	1a 	. 
	ld d,d			;420a	52 	R 
	ld b,051h		;420b	06 51 	. Q 
	rlca			;420d	07 	. 
	ld d,a			;420e	57 	W 
	ex af,af'			;420f	08 	. 
	dec a			;4210	3d 	= 
	add hl,bc			;4211	09 	. 
	ld e,(hl)			;4212	5e 	^ 
	inc de			;4213	13 	. 
	ld (hl),c			;4214	71 	q 
	inc d			;4215	14 	. 
	add hl,hl			;4216	29 	) 
	dec d			;4217	15 	. 
	jr z,l4230h		;4218	28 16 	( . 
	ld (l231ch),hl		;421a	22 1c 23 	" . # 
	dec de			;421d	1b 	. 
	ld hl,(0791dh)		;421e	2a 1d 79 	* . y 
	ld e,074h		;4221	1e 74 	. t 
	rra			;4223	1f 	. 
	ld e,a			;4224	5f 	_ 
	rla			;4225	17 	. 
	ld l,021h		;4226	2e 21 	. ! 
	ccf			;4228	3f 	? 
	ld (0236ch),hl		;4229	22 6c 23 	" l # 
	ld l,l			;422c	6d 	m 
	inc h			;422d	24 	$ 
	ld e,b			;422e	58 	X 
	dec h			;422f	25 	% 
l4230h:
	ld d,b			;4230	50 	P 
	ld h,000h		;4231	26 00 	& . 
	nop			;4233	00 	. 
	nop			;4234	00 	. 
	nop			;4235	00 	. 
	ld a,0ffh		;4236	3e ff 	> . 
	ld (l5095h),a		;4238	32 95 50 	2 . P 
	ld hl,l4242h		;423b	21 42 42 	! B B 
	ld (l5097h),hl		;423e	22 97 50 	" . P 
	ret			;4241	c9 	. 
l4242h:
	xor a			;4242	af 	. 
	ld (l5095h),a		;4243	32 95 50 	2 . P 
l4246h:
	ld a,(l506eh)		;4246	3a 6e 50 	: n P 
	cp 031h		;4249	fe 31 	. 1 
	jp z,l43c4h		;424b	ca c4 43 	. . C 
	cp 032h		;424e	fe 32 	. 2 
	jp z,l4416h		;4250	ca 16 44 	. . D 
	cp 033h		;4253	fe 33 	. 3 
	jp z,l4499h		;4255	ca 99 44 	. . D 
	cp 034h		;4258	fe 34 	. 4 
	jp z,l44a3h		;425a	ca a3 44 	. . D 
	cp 035h		;425d	fe 35 	. 5 
	jp z,l44adh		;425f	ca ad 44 	. . D 
	cp 036h		;4262	fe 36 	. 6 
	jp z,l44b5h		;4264	ca b5 44 	. . D 
	cp 037h		;4267	fe 37 	. 7 
l4269h:
	jp z,l44b9h		;4269	ca b9 44 	. . D 
	cp 038h		;426c	fe 38 	. 8 
	jp z,l44bdh		;426e	ca bd 44 	. . D 
	cp 039h		;4271	fe 39 	. 9 
	jp z,l44beh		;4273	ca be 44 	. . D 
	cp 041h		;4276	fe 41 	. A 
	jp z,l44bfh		;4278	ca bf 44 	. . D 
	cp 042h		;427b	fe 42 	. B 
	jp z,l44c5h		;427d	ca c5 44 	. . D 
	cp 043h		;4280	fe 43 	. C 
	jp z,l44cah		;4282	ca ca 44 	. . D 
	cp 044h		;4285	fe 44 	. D 
	jp z,l44d0h		;4287	ca d0 44 	. . D 
	ret			;428a	c9 	. 
	ld a,(0f3d3h)		;428b	3a d3 f3 	: . . 
	or 001h		;428e	f6 01 	. . 
	ld (0f3d3h),a		;4290	32 d3 f3 	2 . . 
	ret			;4293	c9 	. 
	ld a,0ffh		;4294	3e ff 	> . 
	ld (l5095h),a		;4296	32 95 50 	2 . P 
	ld hl,l42a0h		;4299	21 a0 42 	! . B 
	ld (l5097h),hl		;429c	22 97 50 	" . P 
	ret			;429f	c9 	. 
l42a0h:
	ld a,(l506eh)		;42a0	3a 6e 50 	: n P 
	sub 020h		;42a3	d6 20 	.   
	cp 019h		;42a5	fe 19 	. . 
	jr nc,l42ach		;42a7	30 03 	0 . 
	ld (l5099h),a		;42a9	32 99 50 	2 . P 
l42ach:
	ld hl,l42b5h		;42ac	21 b5 42 	! . B 
	ld (l5097h),hl		;42af	22 97 50 	" . P 
	jp l3eabh		;42b2	c3 ab 3e 	. . > 
l42b5h:
	ld a,(l506eh)		;42b5	3a 6e 50 	: n P 
	sub 020h		;42b8	d6 20 	.   
	cp 050h		;42ba	fe 50 	. P 
	jr nc,l42c1h		;42bc	30 03 	0 . 
	ld (l5087h),a		;42be	32 87 50 	2 . P 
l42c1h:
	xor a			;42c1	af 	. 
	ld (l5095h),a		;42c2	32 95 50 	2 . P 
	ld a,(l5099h)		;42c5	3a 99 50 	: . P 
	ld (l5088h),a		;42c8	32 88 50 	2 . P 
	call l4eabh		;42cb	cd ab 4e 	. . N 
	jp l3eabh		;42ce	c3 ab 3e 	. . > 
	ld a,0ffh		;42d1	3e ff 	> . 
	ld (l5095h),a		;42d3	32 95 50 	2 . P 
	ld hl,l42ddh		;42d6	21 dd 42 	! . B 
	ld (l5097h),hl		;42d9	22 97 50 	" . P 
	ret			;42dc	c9 	. 
l42ddh:
	ld a,(l506eh)		;42dd	3a 6e 50 	: n P 
	sub 030h		;42e0	d6 30 	. 0 
	jp nz,l42f4h		;42e2	c2 f4 42 	. . B 
	ld a,00fh		;42e5	3e 0f 	> . 
l42e7h:
	ld (l50abh),a		;42e7	32 ab 50 	2 . P 
	xor a			;42ea	af 	. 
	ld (l5095h),a		;42eb	32 95 50 	2 . P 
	call l4147h		;42ee	cd 47 41 	. G A 
	jp l3eabh		;42f1	c3 ab 3e 	. . > 
l42f4h:
	ld a,08fh		;42f4	3e 8f 	> . 
	jr l42e7h		;42f6	18 ef 	. . 
	ld a,0ffh		;42f8	3e ff 	> . 
	ld (l506ah),a		;42fa	32 6a 50 	2 j P 
	ld a,(l508dh)		;42fd	3a 8d 50 	: . P 
	or 001h		;4300	f6 01 	. . 
	ld (l508dh),a		;4302	32 8d 50 	2 . P 
	call sub_43dah		;4305	cd da 43 	. . C 
	ret			;4308	c9 	. 
	ld a,000h		;4309	3e 00 	> . 
	ld (l506ah),a		;430b	32 6a 50 	2 j P 
	ld a,(l508dh)		;430e	3a 8d 50 	: . P 
	and 0feh		;4311	e6 fe 	. . 
	ld (l508dh),a		;4313	32 8d 50 	2 . P 
	call sub_43dah		;4316	cd da 43 	. . C 
	ret			;4319	c9 	. 
	ld a,0ffh		;431a	3e ff 	> . 
	ld (l506bh),a		;431c	32 6b 50 	2 k P 
	ld hl,(l5087h)		;431f	2a 87 50 	* . P 
	call sub_4ccdh		;4322	cd cd 4c 	. . L 
	push af			;4325	f5 	. 
	or 001h		;4326	f6 01 	. . 
	ld (hl),a			;4328	77 	w 
	pop af			;4329	f1 	. 
	or 080h		;432a	f6 80 	. . 
	push af			;432c	f5 	. 
	ld hl,(l5087h)		;432d	2a 87 50 	* . P 
	call sub_4612h		;4330	cd 12 46 	. . F 
	push hl			;4333	e5 	. 
	call l4eabh		;4334	cd ab 4e 	. . N 
	call sub_47d6h		;4337	cd d6 47 	. . G 
	call l3fc7h		;433a	cd c7 3f 	. . ? 
	pop hl			;433d	e1 	. 
	pop af			;433e	f1 	. 
	jp sub_44d5h		;433f	c3 d5 44 	. . D 
	ld hl,(l5087h)		;4342	2a 87 50 	* . P 
	call sub_4ccdh		;4345	cd cd 4c 	. . L 
	and 07fh		;4348	e6 7f 	.  
	push af			;434a	f5 	. 
	or 004h		;434b	f6 04 	. . 
	ld (hl),a			;434d	77 	w 
	ld hl,(l5087h)		;434e	2a 87 50 	* . P 
	call sub_4612h		;4351	cd 12 46 	. . F 
	push hl			;4354	e5 	. 
	call l4eabh		;4355	cd ab 4e 	. . N 
	call sub_47d6h		;4358	cd d6 47 	. . G 
	call l3fc7h		;435b	cd c7 3f 	. . ? 
	pop hl			;435e	e1 	. 
	pop af			;435f	f1 	. 
	jp sub_44d5h		;4360	c3 d5 44 	. . D 
	ld a,0ffh		;4363	3e ff 	> . 
	ld (l506bh),a		;4365	32 6b 50 	2 k P 
	ld hl,(l5087h)		;4368	2a 87 50 	* . P 
	call sub_4ccdh		;436b	cd cd 4c 	. . L 
	push af			;436e	f5 	. 
	or 002h		;436f	f6 02 	. . 
	ld (hl),a			;4371	77 	w 
	pop af			;4372	f1 	. 
	or 040h		;4373	f6 40 	. @ 
	push af			;4375	f5 	. 
	ld hl,(l5087h)		;4376	2a 87 50 	* . P 
	call sub_4612h		;4379	cd 12 46 	. . F 
	push hl			;437c	e5 	. 
	call l4eabh		;437d	cd ab 4e 	. . N 
	call sub_47d6h		;4380	cd d6 47 	. . G 
	call l3fc7h		;4383	cd c7 3f 	. . ? 
	pop hl			;4386	e1 	. 
	pop af			;4387	f1 	. 
	jp sub_44d5h		;4388	c3 d5 44 	. . D 
	ld hl,(l5087h)		;438b	2a 87 50 	* . P 
	call sub_4ccdh		;438e	cd cd 4c 	. . L 
	and 0bfh		;4391	e6 bf 	. . 
	push af			;4393	f5 	. 
	or 008h		;4394	f6 08 	. . 
	ld (hl),a			;4396	77 	w 
	ld hl,(l5087h)		;4397	2a 87 50 	* . P 
	call sub_4612h		;439a	cd 12 46 	. . F 
	push hl			;439d	e5 	. 
	call l4eabh		;439e	cd ab 4e 	. . N 
	call sub_47d6h		;43a1	cd d6 47 	. . G 
	call l3fc7h		;43a4	cd c7 3f 	. . ? 
	pop hl			;43a7	e1 	. 
	pop af			;43a8	f1 	. 
	jp sub_44d5h		;43a9	c3 d5 44 	. . D 
	call sub_47d6h		;43ac	cd d6 47 	. . G 
	jp l3fc7h		;43af	c3 c7 3f 	. . ? 
	call sub_47d6h		;43b2	cd d6 47 	. . G 
	jp l3fc7h		;43b5	c3 c7 3f 	. . ? 
	call sub_47d6h		;43b8	cd d6 47 	. . G 
	jp l3fc7h		;43bb	c3 c7 3f 	. . ? 
	call sub_47d6h		;43be	cd d6 47 	. . G 
	jp l3fc7h		;43c1	c3 c7 3f 	. . ? 
l43c4h:
	ld a,0ffh		;43c4	3e ff 	> . 
	ld (l5095h),a		;43c6	32 95 50 	2 . P 
	ld hl,l43d0h		;43c9	21 d0 43 	! . C 
	ld (l5097h),hl		;43cc	22 97 50 	" . P 
	ret			;43cf	c9 	. 
l43d0h:
	xor a			;43d0	af 	. 
	ld (l5095h),a		;43d1	32 95 50 	2 . P 
	ld a,(l506eh)		;43d4	3a 6e 50 	: n P 
	ld (l508dh),a		;43d7	32 8d 50 	2 . P 
sub_43dah:
	ld a,(l508dh)		;43da	3a 8d 50 	: . P 
	cp 000h		;43dd	fe 00 	. . 
	jr z,l43f6h		;43df	28 15 	( . 
	cp 002h		;43e1	fe 02 	. . 
	jr z,l43fbh		;43e3	28 16 	( . 
	cp 004h		;43e5	fe 04 	. . 
	jr z,l4400h		;43e7	28 17 	( . 
	cp 001h		;43e9	fe 01 	. . 
	jr z,l4405h		;43eb	28 18 	( . 
	cp 003h		;43ed	fe 03 	. . 
	jr z,l440ah		;43ef	28 19 	( . 
	cp 005h		;43f1	fe 05 	. . 
	jr z,l440fh		;43f3	28 1a 	( . 
	ret			;43f5	c9 	. 
l43f6h:
	ld hl,l6a12h		;43f6	21 12 6a 	! . j 
	jr l4412h		;43f9	18 17 	. . 
l43fbh:
	ld hl,l7e2fh		;43fb	21 2f 7e 	! / ~ 
	jr l4412h		;43fe	18 12 	. . 
l4400h:
	ld hl,l8a51h		;4400	21 51 8a 	! Q . 
	jr l4412h		;4403	18 0d 	. . 
l4405h:
	ld hl,l7821h		;4405	21 21 78 	! ! x 
	jr l4412h		;4408	18 08 	. . 
l440ah:
	ld hl,l843eh		;440a	21 3e 84 	! > . 
	jr l4412h		;440d	18 03 	. . 
l440fh:
	ld hl,l9051h		;440f	21 51 90 	! Q . 
l4412h:
	ld (l5083h+1),hl		;4412	22 84 50 	" . P 
	ret			;4415	c9 	. 
l4416h:
	ld a,0ffh		;4416	3e ff 	> . 
	ld (l5095h),a		;4418	32 95 50 	2 . P 
	ld hl,l4422h		;441b	21 22 44 	! " D 
	ld (l5097h),hl		;441e	22 97 50 	" . P 
	ret			;4421	c9 	. 
l4422h:
	ld a,(l506eh)		;4422	3a 6e 50 	: n P 
	ld hl,l5adbh		;4425	21 db 5a 	! . Z 
	ld (hl),a			;4428	77 	w 
	ld (l5aech),hl		;4429	22 ec 5a 	" . Z 
	ld b,010h		;442c	06 10 	. . 
	ld c,000h		;442e	0e 00 	. . 
l4430h:
	ld (l5066h),bc		;4430	ed 43 66 50 	. C f P 
	ld a,0ffh		;4434	3e ff 	> . 
	ld (l5095h),a		;4436	32 95 50 	2 . P 
	ld hl,l4440h		;4439	21 40 44 	! @ D 
	ld (l5097h),hl		;443c	22 97 50 	" . P 
	ret			;443f	c9 	. 
l4440h:
	ld hl,(l5aech)		;4440	2a ec 5a 	* . Z 
	inc hl			;4443	23 	# 
	ld (l5aech),hl		;4444	22 ec 5a 	" . Z 
	ld a,(l506eh)		;4447	3a 6e 50 	: n P 
	ld (hl),a			;444a	77 	w 
	ld bc,(l5066h)		;444b	ed 4b 66 50 	. K f P 
	djnz l4430h		;444f	10 df 	. . 
	xor a			;4451	af 	. 
	ld (l5095h),a		;4452	32 95 50 	2 . P 
	ld hl,l5adbh		;4455	21 db 5a 	! . Z 
	ld a,(hl)			;4458	7e 	~ 
	ld (l5082h),a		;4459	32 82 50 	2 . P 
	inc hl			;445c	23 	# 
	ld de,l5acbh		;445d	11 cb 5a 	. . Z 
	ld bc,00010h		;4460	01 10 00 	. . . 
	ldir		;4463	ed b0 	. . 
	ld a,(l5082h)		;4465	3a 82 50 	: . P 
	ld hl,l5083h		;4468	21 83 50 	! . P 
	sub (hl)			;446b	96 	. 
	ld (l5082h),a		;446c	32 82 50 	2 . P 
	ld hl,l5082h		;446f	21 82 50 	! . P 
	xor a			;4472	af 	. 
	rld		;4473	ed 6f 	. o 
	ld d,a			;4475	57 	W 
	ld e,(hl)			;4476	5e 	^ 
	ld hl,l8a51h		;4477	21 51 8a 	! Q . 
	add hl,de			;447a	19 	. 
	ld (l5075h),hl		;447b	22 75 50 	" u P 
	ld hl,l5ad2h		;447e	21 d2 5a 	! . Z 
	ld de,(l5075h)		;4481	ed 5b 75 50 	. [ u P 
	ld b,008h		;4485	06 08 	. . 
l4487h:
	ld a,(hl)			;4487	7e 	~ 
	ld (de),a			;4488	12 	. 
	inc de			;4489	13 	. 
	dec hl			;448a	2b 	+ 
	djnz l4487h		;448b	10 fa 	. . 
	ld hl,l5adah		;448d	21 da 5a 	! . Z 
	ld b,008h		;4490	06 08 	. . 
l4492h:
	ld a,(hl)			;4492	7e 	~ 
	ld (de),a			;4493	12 	. 
	inc de			;4494	13 	. 
	dec hl			;4495	2b 	+ 
	djnz l4492h		;4496	10 fa 	. . 
	ret			;4498	c9 	. 
l4499h:
	ld a,0ffh		;4499	3e ff 	> . 
	ld (l508eh),a		;449b	32 8e 50 	2 . P 
	xor a			;449e	af 	. 
	ld (l508fh),a		;449f	32 8f 50 	2 . P 
	ret			;44a2	c9 	. 
l44a3h:
	ld a,0ffh		;44a3	3e ff 	> . 
	ld (l508fh),a		;44a5	32 8f 50 	2 . P 
	xor a			;44a8	af 	. 
	ld (l508eh),a		;44a9	32 8e 50 	2 . P 
	ret			;44ac	c9 	. 
l44adh:
	xor a			;44ad	af 	. 
	ld (l508eh),a		;44ae	32 8e 50 	2 . P 
	ld (l508fh),a		;44b1	32 8f 50 	2 . P 
	ret			;44b4	c9 	. 
l44b5h:
	call sub_a2e9h		;44b5	cd e9 a2 	. . . 
	ret			;44b8	c9 	. 
l44b9h:
	call sub_a2f2h		;44b9	cd f2 a2 	. . . 
	ret			;44bc	c9 	. 
l44bdh:
	ret			;44bd	c9 	. 
l44beh:
	ret			;44be	c9 	. 
l44bfh:
	ld a,0ffh		;44bf	3e ff 	> . 
	ld (l506dh),a		;44c1	32 6d 50 	2 m P 
	ret			;44c4	c9 	. 
l44c5h:
	xor a			;44c5	af 	. 
	ld (l506dh),a		;44c6	32 6d 50 	2 m P 
	ret			;44c9	c9 	. 
l44cah:
	ld a,0ffh		;44ca	3e ff 	> . 
	ld (l506ch),a		;44cc	32 6c 50 	2 l P 
	ret			;44cf	c9 	. 
l44d0h:
	xor a			;44d0	af 	. 
	ld (l506ch),a		;44d1	32 6c 50 	2 l P 
	ret			;44d4	c9 	. 
sub_44d5h:
	ld (l5070h),a		;44d5	32 70 50 	2 p P 
	xor a			;44d8	af 	. 
	ld (l5077h),a		;44d9	32 77 50 	2 w P 
	ld (l5078h),a		;44dc	32 78 50 	2 x P 
	ld (l50bfh),hl		;44df	22 bf 50 	" . P 
	ld (l507bh),hl		;44e2	22 7b 50 	" { P 
	ld (l507dh),hl		;44e5	22 7d 50 	" } P 
	call sub_4ccdh		;44e8	cd cd 4c 	. . L 
	ld (l5071h),hl		;44eb	22 71 50 	" q P 
	ld a,(l5070h)		;44ee	3a 70 50 	: p P 
	and 040h		;44f1	e6 40 	. @ 
	ld (l5079h),a		;44f3	32 79 50 	2 y P 
	ld a,(l5070h)		;44f6	3a 70 50 	: p P 
	and 080h		;44f9	e6 80 	. . 
	ld (l507ah),a		;44fb	32 7a 50 	2 z P 
l44feh:
	ld a,(l5077h)		;44fe	3a 77 50 	: w P 
	cp 000h		;4501	fe 00 	. . 
	call z,sub_458dh		;4503	cc 8d 45 	. . E 
	ld a,(l5078h)		;4506	3a 78 50 	: x P 
	cp 000h		;4509	fe 00 	. . 
	call z,sub_45d0h		;450b	cc d0 45 	. . E 
	ld hl,l5077h		;450e	21 77 50 	! w P 
	ld a,(l5078h)		;4511	3a 78 50 	: x P 
	and (hl)			;4514	a6 	. 
	jr nz,l4530h		;4515	20 19 	  . 
	ld hl,(l5071h)		;4517	2a 71 50 	* q P 
	inc hl			;451a	23 	# 
	ld a,0ffh		;451b	3e ff 	> . 
	cp (hl)			;451d	be 	. 
	jr nz,l4527h		;451e	20 07 	  . 
	inc hl			;4520	23 	# 
	cp (hl)			;4521	be 	. 
	jr nz,l4527h		;4522	20 03 	  . 
	jp l4530h		;4524	c3 30 45 	. 0 E 
l4527h:
	ld hl,(l5071h)		;4527	2a 71 50 	* q P 
	inc hl			;452a	23 	# 
	ld (l5071h),hl		;452b	22 71 50 	" q P 
	jr l44feh		;452e	18 ce 	. . 
l4530h:
	ld hl,(l50bfh)		;4530	2a bf 50 	* . P 
	ld de,(l507bh)		;4533	ed 5b 7b 50 	. [ { P 
	call sub_456bh		;4537	cd 6b 45 	. k E 
	jr z,l454fh		;453a	28 13 	( . 
	ld hl,(l50bfh)		;453c	2a bf 50 	* . P 
	call sub_4eaeh		;453f	cd ae 4e 	. . N 
	ld hl,(l50bfh)		;4542	2a bf 50 	* . P 
	ld de,(l507bh)		;4545	ed 5b 7b 50 	. [ { P 
	call sub_4576h		;4549	cd 76 45 	. v E 
	call sub_4622h		;454c	cd 22 46 	. " F 
l454fh:
	ld hl,(l50bfh)		;454f	2a bf 50 	* . P 
	call sub_4eaeh		;4552	cd ae 4e 	. . N 
	ld hl,(l50bfh)		;4555	2a bf 50 	* . P 
	ld de,(l507dh)		;4558	ed 5b 7d 50 	. [ } P 
	call sub_456bh		;455c	cd 6b 45 	. k E 
	jr z,l4567h		;455f	28 06 	( . 
	call sub_4576h		;4561	cd 76 45 	. v E 
	call sub_469ah		;4564	cd 9a 46 	. . F 
l4567h:
	call l4eabh		;4567	cd ab 4e 	. . N 
	ret			;456a	c9 	. 
sub_456bh:
	push de			;456b	d5 	. 
	push hl			;456c	e5 	. 
	ld a,h			;456d	7c 	| 
	xor d			;456e	aa 	. 
	jr nz,l4573h		;456f	20 02 	  . 
	ld a,l			;4571	7d 	} 
	xor e			;4572	ab 	. 
l4573h:
	pop hl			;4573	e1 	. 
	pop de			;4574	d1 	. 
	ret			;4575	c9 	. 
sub_4576h:
	ld a,d			;4576	7a 	z 
	cp h			;4577	bc 	. 
	jr nz,l4582h		;4578	20 08 	  . 
	ld a,e			;457a	7b 	{ 
	sub l			;457b	95 	. 
	push af			;457c	f5 	. 
	ld hl,00000h		;457d	21 00 00 	! . . 
	jr l458bh		;4580	18 09 	. . 
l4582h:
	ld a,050h		;4582	3e 50 	> P 
	sub l			;4584	95 	. 
	push af			;4585	f5 	. 
	ld a,d			;4586	7a 	z 
	sub h			;4587	94 	. 
	dec a			;4588	3d 	= 
	ld h,a			;4589	67 	g 
	ld l,e			;458a	6b 	k 
l458bh:
	pop af			;458b	f1 	. 
	ret			;458c	c9 	. 
sub_458dh:
	ld a,002h		;458d	3e 02 	> . 
	ld hl,(l5071h)		;458f	2a 71 50 	* q P 
	and (hl)			;4592	a6 	. 
	call nz,sub_45cah		;4593	c4 ca 45 	. . E 
	jr nz,l45bah		;4596	20 22 	  " 
	ld a,(l5079h)		;4598	3a 79 50 	: y P 
	and 040h		;459b	e6 40 	. @ 
	jr z,l45a7h		;459d	28 08 	( . 
	ld a,008h		;459f	3e 08 	> . 
	ld hl,(l5071h)		;45a1	2a 71 50 	* q P 
	and (hl)			;45a4	a6 	. 
	jr nz,sub_45cah		;45a5	20 23 	  # 
l45a7h:
	ld a,(l5079h)		;45a7	3a 79 50 	: y P 
	ld c,a			;45aa	4f 	O 
	ld a,(hl)			;45ab	7e 	~ 
	and 040h		;45ac	e6 40 	. @ 
	xor c			;45ae	a9 	. 
	jr z,sub_45cah		;45af	28 19 	( . 
	ld hl,(l507bh)		;45b1	2a 7b 50 	* { P 
	call sub_4612h		;45b4	cd 12 46 	. . F 
	ld (l507bh),hl		;45b7	22 7b 50 	" { P 
l45bah:
	ld hl,(l5071h)		;45ba	2a 71 50 	* q P 
	ld a,040h		;45bd	3e 40 	> @ 
	cpl			;45bf	2f 	/ 
	and (hl)			;45c0	a6 	. 
	ld hl,l5079h		;45c1	21 79 50 	! y P 
	or (hl)			;45c4	b6 	. 
	ld hl,(l5071h)		;45c5	2a 71 50 	* q P 
	ld (hl),a			;45c8	77 	w 
	ret			;45c9	c9 	. 
sub_45cah:
	ld a,0ffh		;45ca	3e ff 	> . 
	ld (l5077h),a		;45cc	32 77 50 	2 w P 
	ret			;45cf	c9 	. 
sub_45d0h:
	ld hl,(l5071h)		;45d0	2a 71 50 	* q P 
	ld a,001h		;45d3	3e 01 	> . 
	and (hl)			;45d5	a6 	. 
	call nz,sub_460ch		;45d6	c4 0c 46 	. . F 
	jr nz,l45fdh		;45d9	20 22 	  " 
	ld a,(l507ah)		;45db	3a 7a 50 	: z P 
	and 080h		;45de	e6 80 	. . 
	jr z,l45eah		;45e0	28 08 	( . 
	ld a,004h		;45e2	3e 04 	> . 
	ld hl,(l5071h)		;45e4	2a 71 50 	* q P 
	and (hl)			;45e7	a6 	. 
	jr nz,sub_460ch		;45e8	20 22 	  " 
l45eah:
	ld a,(l507ah)		;45ea	3a 7a 50 	: z P 
	ld c,a			;45ed	4f 	O 
	ld a,(hl)			;45ee	7e 	~ 
	and 080h		;45ef	e6 80 	. . 
	xor c			;45f1	a9 	. 
	jr z,sub_460ch		;45f2	28 18 	( . 
	ld hl,(l507dh)		;45f4	2a 7d 50 	* } P 
	call sub_4612h		;45f7	cd 12 46 	. . F 
	ld (l507dh),hl		;45fa	22 7d 50 	" } P 
l45fdh:
	ld hl,(l5071h)		;45fd	2a 71 50 	* q P 
	ld a,07fh		;4600	3e 7f 	>  
	and (hl)			;4602	a6 	. 
	ld hl,l507ah		;4603	21 7a 50 	! z P 
	or (hl)			;4606	b6 	. 
	ld hl,(l5071h)		;4607	2a 71 50 	* q P 
	ld (hl),a			;460a	77 	w 
	ret			;460b	c9 	. 
sub_460ch:
	ld a,0ffh		;460c	3e ff 	> . 
	ld (l5078h),a		;460e	32 78 50 	2 x P 
	ret			;4611	c9 	. 
sub_4612h:
	inc l			;4612	2c 	, 
	ld a,l			;4613	7d 	} 
	cp 050h		;4614	fe 50 	. P 
	ret nz			;4616	c0 	. 
	ld a,h			;4617	7c 	| 
	cp 018h		;4618	fe 18 	. . 
	jr z,l4620h		;461a	28 04 	( . 
	inc h			;461c	24 	$ 
	ld l,000h		;461d	2e 00 	. . 
	ret			;461f	c9 	. 
l4620h:
	dec l			;4620	2d 	- 
	ret			;4621	c9 	. 
sub_4622h:
	push hl			;4622	e5 	. 
	call sub_4af3h		;4623	cd f3 4a 	. . J 
	ld (l4fdbh),de		;4626	ed 53 db 4f 	. S . O 
	ld (l4fddh),de		;462a	ed 53 dd 4f 	. S . O 
	ld hl,(l50bfh)		;462e	2a bf 50 	* . P 
	ld a,h			;4631	7c 	| 
	ld (l507fh),a		;4632	32 7f 50 	2  P 
	ld a,001h		;4635	3e 01 	> . 
	or 020h		;4637	f6 20 	.   
	call sub_4f3fh		;4639	cd 3f 4f 	. ? O 
	ld hl,l4fcbh		;463c	21 cb 4f 	! . O 
	call sub_4f1eh		;463f	cd 1e 4f 	. . O 
	pop hl			;4642	e1 	. 
	push hl			;4643	e5 	. 
	ld a,h			;4644	7c 	| 
	ld b,a			;4645	47 	G 
	cp 000h		;4646	fe 00 	. . 
	jr z,l465eh		;4648	28 14 	( . 
l464ah:
	push bc			;464a	c5 	. 
	ld a,(l507fh)		;464b	3a 7f 50 	:  P 
	inc a			;464e	3c 	< 
	ld (l507fh),a		;464f	32 7f 50 	2  P 
	ld h,a			;4652	67 	g 
	ld l,000h		;4653	2e 00 	. . 
	call sub_4eaeh		;4655	cd ae 4e 	. . N 
	call sub_4688h		;4658	cd 88 46 	. . F 
	pop bc			;465b	c1 	. 
	djnz l464ah		;465c	10 ec 	. . 
l465eh:
	pop hl			;465e	e1 	. 
	ld a,l			;465f	7d 	} 
	cp 000h		;4660	fe 00 	. . 
	jr z,l4682h		;4662	28 1e 	( . 
	push hl			;4664	e5 	. 
	ld a,(l507fh)		;4665	3a 7f 50 	:  P 
	inc a			;4668	3c 	< 
	ld h,a			;4669	67 	g 
	ld l,000h		;466a	2e 00 	. . 
	call sub_4eaeh		;466c	cd ae 4e 	. . N 
	pop hl			;466f	e1 	. 
	ld a,l			;4670	7d 	} 
	call sub_4af3h		;4671	cd f3 4a 	. . J 
	ld (l4fdbh),de		;4674	ed 53 db 4f 	. S . O 
	ld (l4fddh),de		;4678	ed 53 dd 4f 	. S . O 
	ld hl,l4fcbh		;467c	21 cb 4f 	! . O 
	call sub_4f1eh		;467f	cd 1e 4f 	. . O 
l4682h:
	ld a,020h		;4682	3e 20 	>   
	call sub_4f3fh		;4684	cd 3f 4f 	. ? O 
	ret			;4687	c9 	. 
sub_4688h:
	ld de,00280h		;4688	11 80 02 	. . . 
	ld (l4fdbh),de		;468b	ed 53 db 4f 	. S . O 
	ld (l4fddh),de		;468f	ed 53 dd 4f 	. S . O 
	ld hl,l4fcbh		;4693	21 cb 4f 	! . O 
	call sub_4f1eh		;4696	cd 1e 4f 	. . O 
	ret			;4699	c9 	. 
sub_469ah:
	push hl			;469a	e5 	. 
	push af			;469b	f5 	. 
	ld hl,(l50bfh)		;469c	2a bf 50 	* . P 
	ld a,h			;469f	7c 	| 
	ld (l507fh),a		;46a0	32 7f 50 	2  P 
	call sub_4705h		;46a3	cd 05 47 	. . G 
	pop af			;46a6	f1 	. 
	call sub_4af3h		;46a7	cd f3 4a 	. . J 
	ld (l4fc5h),de		;46aa	ed 53 c5 4f 	. S . O 
	ld (l4fc7h),de		;46ae	ed 53 c7 4f 	. S . O 
	ld a,001h		;46b2	3e 01 	> . 
	or 020h		;46b4	f6 20 	.   
	call sub_4f3fh		;46b6	cd 3f 4f 	. ? O 
	ld hl,04fb5h		;46b9	21 b5 4f 	! . O 
	call sub_4f1eh		;46bc	cd 1e 4f 	. . O 
	pop hl			;46bf	e1 	. 
	push hl			;46c0	e5 	. 
	ld a,h			;46c1	7c 	| 
	ld b,a			;46c2	47 	G 
	cp 000h		;46c3	fe 00 	. . 
	jr z,l46dbh		;46c5	28 14 	( . 
l46c7h:
	push bc			;46c7	c5 	. 
	ld a,(l507fh)		;46c8	3a 7f 50 	:  P 
	inc a			;46cb	3c 	< 
	ld (l507fh),a		;46cc	32 7f 50 	2  P 
	ld h,a			;46cf	67 	g 
	ld l,000h		;46d0	2e 00 	. . 
	call sub_4eaeh		;46d2	cd ae 4e 	. . N 
	call sub_4711h		;46d5	cd 11 47 	. . G 
	pop bc			;46d8	c1 	. 
	djnz l46c7h		;46d9	10 ec 	. . 
l46dbh:
	pop hl			;46db	e1 	. 
	ld a,l			;46dc	7d 	} 
	cp 000h		;46dd	fe 00 	. . 
	jr z,l46ffh		;46df	28 1e 	( . 
	push hl			;46e1	e5 	. 
	ld a,(l507fh)		;46e2	3a 7f 50 	:  P 
	inc a			;46e5	3c 	< 
	ld h,a			;46e6	67 	g 
	ld l,000h		;46e7	2e 00 	. . 
	call sub_4eaeh		;46e9	cd ae 4e 	. . N 
	pop hl			;46ec	e1 	. 
	ld a,l			;46ed	7d 	} 
	call sub_4af3h		;46ee	cd f3 4a 	. . J 
	ld (l4fc5h),de		;46f1	ed 53 c5 4f 	. S . O 
	ld (l4fc7h),de		;46f5	ed 53 c7 4f 	. S . O 
	ld hl,04fb5h		;46f9	21 b5 4f 	! . O 
	call sub_4f1eh		;46fc	cd 1e 4f 	. . O 
l46ffh:
	ld a,020h		;46ff	3e 20 	>   
	call sub_4f3fh		;4701	cd 3f 4f 	. ? O 
	ret			;4704	c9 	. 
sub_4705h:
	ld b,008h		;4705	06 08 	. . 
	ld a,0ffh		;4707	3e ff 	> . 
	ld hl,l4fb8h		;4709	21 b8 4f 	! . O 
l470ch:
	ld (hl),a			;470c	77 	w 
	inc hl			;470d	23 	# 
	djnz l470ch		;470e	10 fc 	. . 
	ret			;4710	c9 	. 
sub_4711h:
	ld de,00280h		;4711	11 80 02 	. . . 
	ld (l4fc5h),de		;4714	ed 53 c5 4f 	. S . O 
	ld (l4fc7h),de		;4718	ed 53 c7 4f 	. S . O 
	call sub_4705h		;471c	cd 05 47 	. . G 
	ld hl,04fb5h		;471f	21 b5 4f 	! . O 
	call sub_4f1eh		;4722	cd 1e 4f 	. . O 
	ret			;4725	c9 	. 
	ret			;4726	c9 	. 
	ret			;4727	c9 	. 
sub_4728h:
	xor a			;4728	af 	. 
	ld (l506bh),a		;4729	32 6b 50 	2 k P 
	ld bc,00780h		;472c	01 80 07 	. . . 
	ld hl,l5aeeh		;472f	21 ee 5a 	! . Z 
l4732h:
	xor a			;4732	af 	. 
	ld (hl),a			;4733	77 	w 
	inc hl			;4734	23 	# 
	dec bc			;4735	0b 	. 
	ld a,c			;4736	79 	y 
	or b			;4737	b0 	. 
	jp nz,l4732h		;4738	c2 32 47 	. 2 G 
	ld bc,00050h		;473b	01 50 00 	. P . 
	ld hl,l6270h		;473e	21 70 62 	! p b 
l4741h:
	xor a			;4741	af 	. 
	ld (hl),a			;4742	77 	w 
	inc hl			;4743	23 	# 
	dec bc			;4744	0b 	. 
	ld a,c			;4745	79 	y 
	or b			;4746	b0 	. 
	jp nz,l4741h		;4747	c2 41 47 	. A G 
	ret			;474a	c9 	. 
sub_474bh:
	ld a,(l506bh)		;474b	3a 6b 50 	: k P 
	or a			;474e	b7 	. 
	ret			;474f	c9 	. 
	ld a,(l5088h)		;4750	3a 88 50 	: . P 
	jp l4ba7h		;4753	c3 a7 4b 	. . K 
	ld a,(l5088h)		;4756	3a 88 50 	: . P 
	jp l4b42h		;4759	c3 42 4b 	. B K 
	ld a,(l5086h)		;475c	3a 86 50 	: . P 
	ld hl,l5087h		;475f	21 87 50 	! . P 
	sub (hl)			;4762	96 	. 
	dec a			;4763	3d 	= 
	jr z,l4773h		;4764	28 0d 	( . 
	push af			;4766	f5 	. 
	ld hl,(l5087h)		;4767	2a 87 50 	* . P 
	ld e,l			;476a	5d 	] 
	inc e			;476b	1c 	. 
	ld d,h			;476c	54 	T 
	ld c,a			;476d	4f 	O 
	ld b,000h		;476e	06 00 	. . 
	call sub_4813h		;4770	cd 13 48 	. . H 
l4773h:
	ld hl,(l5087h)		;4773	2a 87 50 	* . P 
	call sub_4eaeh		;4776	cd ae 4e 	. . N 
	call sub_47d6h		;4779	cd d6 47 	. . G 
	pop af			;477c	f1 	. 
	ld c,a			;477d	4f 	O 
	ld hl,(l5087h)		;477e	2a 87 50 	* . P 
	ld d,h			;4781	54 	T 
	ld e,l			;4782	5d 	] 
	inc e			;4783	1c 	. 
	call sub_47f8h		;4784	cd f8 47 	. . G 
	ld hl,(l5087h)		;4787	2a 87 50 	* . P 
	call sub_4cb8h		;478a	cd b8 4c 	. . L 
	ld hl,(l5087h)		;478d	2a 87 50 	* . P 
	call sub_44d5h		;4790	cd d5 44 	. . D 
	ret			;4793	c9 	. 
	ld a,(l5086h)		;4794	3a 86 50 	: . P 
	ld hl,l5087h		;4797	21 87 50 	! . P 
	sub (hl)			;479a	96 	. 
	dec a			;479b	3d 	= 
	jr z,l47abh		;479c	28 0d 	( . 
	push af			;479e	f5 	. 
	ld hl,(l5087h)		;479f	2a 87 50 	* . P 
	ld e,l			;47a2	5d 	] 
	ld d,h			;47a3	54 	T 
	inc l			;47a4	2c 	, 
	ld c,a			;47a5	4f 	O 
	ld b,000h		;47a6	06 00 	. . 
	call sub_4813h		;47a8	cd 13 48 	. . H 
l47abh:
	ld a,(l5088h)		;47ab	3a 88 50 	: . P 
	ld h,a			;47ae	67 	g 
	ld l,04fh		;47af	2e 4f 	. O 
	call sub_4eaeh		;47b1	cd ae 4e 	. . N 
	call sub_47d6h		;47b4	cd d6 47 	. . G 
	ld hl,(l5087h)		;47b7	2a 87 50 	* . P 
	call sub_4eaeh		;47ba	cd ae 4e 	. . N 
	pop af			;47bd	f1 	. 
	ld de,(l5087h)		;47be	ed 5b 87 50 	. [ . P 
	ld h,d			;47c2	62 	b 
	ld l,e			;47c3	6b 	k 
	inc l			;47c4	2c 	, 
	ld c,a			;47c5	4f 	O 
	call sub_47f8h		;47c6	cd f8 47 	. . G 
	ld hl,(l5087h)		;47c9	2a 87 50 	* . P 
	call sub_4cb8h		;47cc	cd b8 4c 	. . L 
	ld hl,(l5087h)		;47cf	2a 87 50 	* . P 
	jp sub_44d5h		;47d2	c3 d5 44 	. . D 
	ret			;47d5	c9 	. 
sub_47d6h:
	ld de,l4fb8h		;47d6	11 b8 4f 	. . O 
	ld hl,l504ah		;47d9	21 4a 50 	! J P 
	ld bc,00008h		;47dc	01 08 00 	. . . 
	ldir		;47df	ed b0 	. . 
	ld a,00fh		;47e1	3e 0f 	> . 
	ld (l4fc3h),a		;47e3	32 c3 4f 	2 . O 
	ld bc,00008h		;47e6	01 08 00 	. . . 
	ld (l4fc5h),bc		;47e9	ed 43 c5 4f 	. C . O 
	ld (l4fc7h),bc		;47ed	ed 43 c7 4f 	. C . O 
	ld hl,04fb5h		;47f1	21 b5 4f 	! . O 
	call sub_4f1eh		;47f4	cd 1e 4f 	. . O 
	ret			;47f7	c9 	. 
sub_47f8h:
	ld b,000h		;47f8	06 00 	. . 
	push bc			;47fa	c5 	. 
	push de			;47fb	d5 	. 
	push bc			;47fc	c5 	. 
	call sub_4ccdh		;47fd	cd cd 4c 	. . L 
	pop bc			;4800	c1 	. 
	ld de,l50cbh		;4801	11 cb 50 	. . P 
	ldir		;4804	ed b0 	. . 
	pop de			;4806	d1 	. 
	ex de,hl			;4807	eb 	. 
	call sub_4ccdh		;4808	cd cd 4c 	. . L 
	ld de,l50cbh		;480b	11 cb 50 	. . P 
	ex de,hl			;480e	eb 	. 
	pop bc			;480f	c1 	. 
	ldir		;4810	ed b0 	. . 
	ret			;4812	c9 	. 
sub_4813h:
	ld (l50c9h),de		;4813	ed 53 c9 50 	. S . P 
	ld a,l			;4817	7d 	} 
	srl a		;4818	cb 3f 	. ? 
	ld a,0ffh		;481a	3e ff 	> . 
	jr c,l4820h		;481c	38 02 	8 . 
	ld a,000h		;481e	3e 00 	> . 
l4820h:
	ld (l50bfh),a		;4820	32 bf 50 	2 . P 
	ld (l50c1h),hl		;4823	22 c1 50 	" . P 
	cp 000h		;4826	fe 00 	. . 
	jr z,l482bh		;4828	28 01 	( . 
	inc l			;482a	2c 	, 
l482bh:
	ld (l50c3h),hl		;482b	22 c3 50 	" . P 
	ld a,c			;482e	79 	y 
	srl a		;482f	cb 3f 	. ? 
	ld (l50bdh),a		;4831	32 bd 50 	2 . P 
	ld (l50bch),a		;4834	32 bc 50 	2 . P 
	ld a,000h		;4837	3e 00 	> . 
	ld (l50beh),a		;4839	32 be 50 	2 . P 
	jr nc,l485eh		;483c	30 20 	0   
	ld a,0ffh		;483e	3e ff 	> . 
	ld (l50beh),a		;4840	32 be 50 	2 . P 
	ld a,(l50bfh)		;4843	3a bf 50 	: . P 
	cp 000h		;4846	fe 00 	. . 
	push af			;4848	f5 	. 
	ld a,c			;4849	79 	y 
	dec a			;484a	3d 	= 
	srl a		;484b	cb 3f 	. ? 
	ld (l50c0h),a		;484d	32 c0 50 	2 . P 
	pop af			;4850	f1 	. 
	jp z,l4964h		;4851	ca 64 49 	. d I 
	ld a,(l50c0h)		;4854	3a c0 50 	: . P 
	ld (l50bdh),a		;4857	32 bd 50 	2 . P 
	inc a			;485a	3c 	< 
	ld (l50bch),a		;485b	32 bc 50 	2 . P 
l485eh:
	ld hl,(l50c3h)		;485e	2a c3 50 	* . P 
	call sub_4eaeh		;4861	cd ae 4e 	. . N 
	ld a,(l50bdh)		;4864	3a bd 50 	: . P 
	push af			;4867	f5 	. 
	ld (l5082h),a		;4868	32 82 50 	2 . P 
	xor a			;486b	af 	. 
	ld hl,l5082h		;486c	21 82 50 	! . P 
	rld		;486f	ed 6f 	. o 
	ld b,a			;4871	47 	G 
	ld c,(hl)			;4872	4e 	N 
	ld (l50c7h),bc		;4873	ed 43 c7 50 	. C . P 
	pop af			;4877	f1 	. 
	ld d,a			;4878	57 	W 
	ld e,010h		;4879	1e 10 	. . 
	ld a,0a4h		;487b	3e a4 	> . 
	or 010h		;487d	f6 10 	. . 
	ld hl,l55cbh		;487f	21 cb 55 	! . U 
	call sub_4c1eh		;4882	cd 1e 4c 	. . L 
	ld hl,(l50c1h)		;4885	2a c1 50 	* . P 
	call sub_4eaeh		;4888	cd ae 4e 	. . N 
	ld a,(l50bch)		;488b	3a bc 50 	: . P 
	push af			;488e	f5 	. 
	ld (l5082h),a		;488f	32 82 50 	2 . P 
	xor a			;4892	af 	. 
	ld hl,l5082h		;4893	21 82 50 	! . P 
	rld		;4896	ed 6f 	. o 
	ld b,a			;4898	47 	G 
	ld c,(hl)			;4899	4e 	N 
	ld (l50c5h),bc		;489a	ed 43 c5 50 	. C . P 
	pop af			;489e	f1 	. 
	ld d,a			;489f	57 	W 
	ld e,010h		;48a0	1e 10 	. . 
	ld a,0a4h		;48a2	3e a4 	> . 
	or 018h		;48a4	f6 18 	. . 
	ld hl,l50cbh		;48a6	21 cb 50 	! . P 
	call sub_4c1eh		;48a9	cd 1e 4c 	. . L 
	ld de,(l50c9h)		;48ac	ed 5b c9 50 	. [ . P 
	push de			;48b0	d5 	. 
	ex de,hl			;48b1	eb 	. 
	call sub_4eaeh		;48b2	cd ae 4e 	. . N 
	pop de			;48b5	d1 	. 
	push de			;48b6	d5 	. 
	ld a,e			;48b7	7b 	{ 
	srl a		;48b8	cb 3f 	. ? 
	jr nc,l4911h		;48ba	30 55 	0 U 
	ld a,(l50bfh)		;48bc	3a bf 50 	: . P 
	cp 0ffh		;48bf	fe ff 	. . 
	jr z,l48eah		;48c1	28 27 	( ' 
	ld hl,l55cbh		;48c3	21 cb 55 	! . U 
	ld a,(l50bdh)		;48c6	3a bd 50 	: . P 
	ld d,a			;48c9	57 	W 
	ld e,010h		;48ca	1e 10 	. . 
	ld bc,(l50c7h)		;48cc	ed 4b c7 50 	. K . P 
	call sub_4971h		;48d0	cd 71 49 	. q I 
	pop de			;48d3	d1 	. 
	inc e			;48d4	1c 	. 
	ex de,hl			;48d5	eb 	. 
	call sub_4eaeh		;48d6	cd ae 4e 	. . N 
	ld hl,l50cbh		;48d9	21 cb 50 	! . P 
	ld a,(l50bch)		;48dc	3a bc 50 	: . P 
	ld d,a			;48df	57 	W 
	ld e,010h		;48e0	1e 10 	. . 
	ld bc,(l50c5h)		;48e2	ed 4b c5 50 	. K . P 
	call sub_497eh		;48e6	cd 7e 49 	. ~ I 
	ret			;48e9	c9 	. 
l48eah:
	ld hl,l50cbh		;48ea	21 cb 50 	! . P 
	ld a,(l50bch)		;48ed	3a bc 50 	: . P 
	ld d,a			;48f0	57 	W 
	ld e,010h		;48f1	1e 10 	. . 
	ld bc,(l50c5h)		;48f3	ed 4b c5 50 	. K . P 
	call sub_4971h		;48f7	cd 71 49 	. q I 
	pop de			;48fa	d1 	. 
	inc e			;48fb	1c 	. 
	ex de,hl			;48fc	eb 	. 
	call sub_4eaeh		;48fd	cd ae 4e 	. . N 
	ld hl,l55cbh		;4900	21 cb 55 	! . U 
	ld a,(l50bdh)		;4903	3a bd 50 	: . P 
	ld d,a			;4906	57 	W 
	ld e,010h		;4907	1e 10 	. . 
	ld bc,(l50c7h)		;4909	ed 4b c7 50 	. K . P 
	call sub_497eh		;490d	cd 7e 49 	. ~ I 
	ret			;4910	c9 	. 
l4911h:
	ld a,(l50bfh)		;4911	3a bf 50 	: . P 
	cp 0ffh		;4914	fe ff 	. . 
	jr z,l493eh		;4916	28 26 	( & 
	ld hl,l55cbh		;4918	21 cb 55 	! . U 
	ld a,(l50bdh)		;491b	3a bd 50 	: . P 
	ld d,a			;491e	57 	W 
	ld e,010h		;491f	1e 10 	. . 
	ld bc,(l50c7h)		;4921	ed 4b c7 50 	. K . P 
	call sub_497eh		;4925	cd 7e 49 	. ~ I 
	pop de			;4928	d1 	. 
	ex de,hl			;4929	eb 	. 
	call sub_4eaeh		;492a	cd ae 4e 	. . N 
	ld hl,l50cbh		;492d	21 cb 50 	! . P 
	ld a,(l50bch)		;4930	3a bc 50 	: . P 
	ld d,a			;4933	57 	W 
	ld e,010h		;4934	1e 10 	. . 
	ld bc,(l50c5h)		;4936	ed 4b c5 50 	. K . P 
	call sub_4971h		;493a	cd 71 49 	. q I 
	ret			;493d	c9 	. 
l493eh:
	ld hl,l50cbh		;493e	21 cb 50 	! . P 
	ld a,(l50bch)		;4941	3a bc 50 	: . P 
	ld d,a			;4944	57 	W 
	ld e,010h		;4945	1e 10 	. . 
	ld bc,(l50c5h)		;4947	ed 4b c5 50 	. K . P 
	call sub_497eh		;494b	cd 7e 49 	. ~ I 
	pop de			;494e	d1 	. 
	ex de,hl			;494f	eb 	. 
	call sub_4eaeh		;4950	cd ae 4e 	. . N 
	ld hl,l55cbh		;4953	21 cb 55 	! . U 
	ld a,(l50bdh)		;4956	3a bd 50 	: . P 
	ld d,a			;4959	57 	W 
	ld e,010h		;495a	1e 10 	. . 
	ld bc,(l50c7h)		;495c	ed 4b c7 50 	. K . P 
	call sub_4971h		;4960	cd 71 49 	. q I 
	ret			;4963	c9 	. 
l4964h:
	ld a,(l50c0h)		;4964	3a c0 50 	: . P 
	ld (l50bch),a		;4967	32 bc 50 	2 . P 
	inc a			;496a	3c 	< 
	ld (l50bdh),a		;496b	32 bd 50 	2 . P 
	jp l485eh		;496e	c3 5e 48 	. ^ H 
sub_4971h:
	xor a			;4971	af 	. 
	ld (l503fh),a		;4972	32 3f 50 	2 ? P 
	ld a,0ffh		;4975	3e ff 	> . 
	ld (l5040h),a		;4977	32 40 50 	2 @ P 
	ld a,018h		;497a	3e 18 	> . 
	jr l4989h		;497c	18 0b 	. . 
sub_497eh:
	ld a,0ffh		;497e	3e ff 	> . 
	ld (l503fh),a		;4980	32 3f 50 	2 ? P 
	xor a			;4983	af 	. 
	ld (l5040h),a		;4984	32 40 50 	2 @ P 
	ld a,010h		;4987	3e 10 	> . 
l4989h:
	or 024h		;4989	f6 24 	. $ 
	call sub_4c1eh		;498b	cd 1e 4c 	. . L 
	ret			;498e	c9 	. 
sub_498fh:
	push hl			;498f	e5 	. 
	ld h,l			;4990	65 	e 
	ld l,000h		;4991	2e 00 	. . 
	call sub_4ccdh		;4993	cd cd 4c 	. . L 
	ex de,hl			;4996	eb 	. 
	pop hl			;4997	e1 	. 
	push de			;4998	d5 	. 
	ld l,000h		;4999	2e 00 	. . 
	call sub_4ccdh		;499b	cd cd 4c 	. . L 
	pop de			;499e	d1 	. 
	ld bc,00050h		;499f	01 50 00 	. P . 
	ldir		;49a2	ed b0 	. . 
	ret			;49a4	c9 	. 
	ld a,0ffh		;49a5	3e ff 	> . 
	ld (l50ach),a		;49a7	32 ac 50 	2 . P 
	call sub_4aafh		;49aa	cd af 4a 	. . J 
	xor a			;49ad	af 	. 
	ld (l50ach),a		;49ae	32 ac 50 	2 . P 
	ret			;49b1	c9 	. 
	ld a,(l5087h)		;49b2	3a 87 50 	: . P 
	srl a		;49b5	cb 3f 	. ? 
	srl a		;49b7	cb 3f 	. ? 
	srl a		;49b9	cb 3f 	. ? 
	ld e,a			;49bb	5f 	_ 
	ld d,000h		;49bc	16 00 	. . 
	ld hl,l49d4h		;49be	21 d4 49 	! . I 
	add hl,de			;49c1	19 	. 
	ld a,(hl)			;49c2	7e 	~ 
	ld (l5087h),a		;49c3	32 87 50 	2 . P 
	cp 0ffh		;49c6	fe ff 	. . 
	jr nz,l49d0h		;49c8	20 06 	  . 
	call sub_4a2eh		;49ca	cd 2e 4a 	. . J 
	call sub_4a1bh		;49cd	cd 1b 4a 	. . J 
l49d0h:
	call l4eabh		;49d0	cd ab 4e 	. . N 
	ret			;49d3	c9 	. 
l49d4h:
	ex af,af'			;49d4	08 	. 
	djnz l49efh		;49d5	10 18 	. . 
	jr nz,l4a01h		;49d7	20 28 	  ( 
	jr nc,l4a13h		;49d9	30 38 	0 8 
	ld b,b			;49db	40 	@ 
	ld c,b			;49dc	48 	H 
	rst 38h			;49dd	ff 	. 
	ld a,(l5087h)		;49de	3a 87 50 	: . P 
	srl a		;49e1	cb 3f 	. ? 
	srl a		;49e3	cb 3f 	. ? 
	srl a		;49e5	cb 3f 	. ? 
	ld e,a			;49e7	5f 	_ 
	ld d,000h		;49e8	16 00 	. . 
	ld hl,l4a04h		;49ea	21 04 4a 	! . J 
	add hl,de			;49ed	19 	. 
	ld a,(hl)			;49ee	7e 	~ 
l49efh:
	ld (l5087h),a		;49ef	32 87 50 	2 . P 
	cp 0ffh		;49f2	fe ff 	. . 
	jr nz,l49feh		;49f4	20 08 	  . 
	ld a,04fh		;49f6	3e 4f 	> O 
	ld (l5087h),a		;49f8	32 87 50 	2 . P 
	call sub_4a4eh		;49fb	cd 4e 4a 	. N J 
l49feh:
	call l4eabh		;49fe	cd ab 4e 	. . N 
l4a01h:
	jp l3eabh		;4a01	c3 ab 3e 	. . > 
l4a04h:
	rst 38h			;4a04	ff 	. 
	ex af,af'			;4a05	08 	. 
	djnz l4a20h		;4a06	10 18 	. . 
	jr nz,l4a32h		;4a08	20 28 	  ( 
	jr nc,l4a42h		;4a0a	30 36 	0 6 
	ld b,b			;4a0c	40 	@ 
	ld c,b			;4a0d	48 	H 
	ld hl,l5087h		;4a0e	21 87 50 	! . P 
	inc (hl)			;4a11	34 	4 
	ld a,(hl)			;4a12	7e 	~ 
l4a13h:
	dec hl			;4a13	2b 	+ 
	cp (hl)			;4a14	be 	. 
	jp c,l4eabh		;4a15	da ab 4e 	. . N 
	call sub_4a2eh		;4a18	cd 2e 4a 	. . J 
sub_4a1bh:
	ld hl,l5088h		;4a1b	21 88 50 	! . P 
	ld a,018h		;4a1e	3e 18 	> . 
l4a20h:
	cp (hl)			;4a20	be 	. 
	ret z			;4a21	c8 	. 
	inc (hl)			;4a22	34 	4 
	ld a,(hl)			;4a23	7e 	~ 
	inc hl			;4a24	23 	# 
	cp (hl)			;4a25	be 	. 
	jp nz,l4eabh		;4a26	c2 ab 4e 	. . N 
	dec hl			;4a29	2b 	+ 
	dec (hl)			;4a2a	35 	5 
	jp l4006h		;4a2b	c3 06 40 	. . @ 
sub_4a2eh:
	xor a			;4a2e	af 	. 
	ld (l5087h),a		;4a2f	32 87 50 	2 . P 
l4a32h:
	jp l4eabh		;4a32	c3 ab 4e 	. . N 
	ld hl,l5087h		;4a35	21 87 50 	! . P 
	dec (hl)			;4a38	35 	5 
	jp p,l4eabh		;4a39	f2 ab 4e 	. . N 
	dec hl			;4a3c	2b 	+ 
	ld a,(hl)			;4a3d	7e 	~ 
	inc hl			;4a3e	23 	# 
	dec a			;4a3f	3d 	= 
	ld (hl),a			;4a40	77 	w 
	inc hl			;4a41	23 	# 
l4a42h:
	dec (hl)			;4a42	35 	5 
	jp p,l4eabh		;4a43	f2 ab 4e 	. . N 
	inc hl			;4a46	23 	# 
	ld a,(hl)			;4a47	7e 	~ 
	dec a			;4a48	3d 	= 
	dec hl			;4a49	2b 	+ 
	ld (hl),a			;4a4a	77 	w 
l4a4bh:
	jp l4eabh		;4a4b	c3 ab 4e 	. . N 
sub_4a4eh:
	ld hl,l5088h		;4a4e	21 88 50 	! . P 
	dec (hl)			;4a51	35 	5 
	jp p,l4eabh		;4a52	f2 ab 4e 	. . N 
	inc hl			;4a55	23 	# 
	ld a,(hl)			;4a56	7e 	~ 
	dec a			;4a57	3d 	= 
	dec hl			;4a58	2b 	+ 
	ld (hl),a			;4a59	77 	w 
	jr l4a4bh		;4a5a	18 ef 	. . 
l4a5ch:
	call sub_4062h		;4a5c	cd 62 40 	. b @ 
	ld hl,(l509dh)		;4a5f	2a 9d 50 	* . P 
	ld bc,(050a3h)		;4a62	ed 4b a3 50 	. K . P 
	ld de,00000h		;4a66	11 00 00 	. . . 
	call sub_4b28h		;4a69	cd 28 4b 	. ( K 
	call sub_4ea5h		;4a6c	cd a5 4e 	. . N 
	xor a			;4a6f	af 	. 
	ld (l50ach),a		;4a70	32 ac 50 	2 . P 
	jp sub_4728h		;4a73	c3 28 47 	. ( G 
	ld a,0ffh		;4a76	3e ff 	> . 
	ld (l50ach),a		;4a78	32 ac 50 	2 . P 
	jr l4a5ch		;4a7b	18 df 	. . 
	ld a,0ffh		;4a7d	3e ff 	> . 
	ld (l50ach),a		;4a7f	32 ac 50 	2 . P 
	ld hl,l5089h		;4a82	21 89 50 	! . P 
	ld a,(hl)			;4a85	7e 	~ 
	dec hl			;4a86	2b 	+ 
	sub (hl)			;4a87	96 	. 
	dec a			;4a88	3d 	= 
	jr z,l4a9fh		;4a89	28 14 	( . 
	ld b,a			;4a8b	47 	G 
	ld c,(hl)			;4a8c	4e 	N 
l4a8dh:
	inc c			;4a8d	0c 	. 
	push bc			;4a8e	c5 	. 
	ld a,(l5094h)		;4a8f	3a 94 50 	: . P 
	ld d,a			;4a92	57 	W 
	ld a,c			;4a93	79 	y 
	push bc			;4a94	c5 	. 
	call sub_4b00h		;4a95	cd 00 4b 	. . K 
	pop bc			;4a98	c1 	. 
	call sub_4aa1h		;4a99	cd a1 4a 	. . J 
	pop bc			;4a9c	c1 	. 
	djnz l4a8dh		;4a9d	10 ee 	. . 
l4a9fh:
	jr sub_4aafh		;4a9f	18 0e 	. . 
sub_4aa1h:
	ld h,c			;4aa1	61 	a 
	ld l,000h		;4aa2	2e 00 	. . 
	call sub_4ccdh		;4aa4	cd cd 4c 	. . L 
	xor a			;4aa7	af 	. 
	ld b,050h		;4aa8	06 50 	. P 
l4aaah:
	ld (hl),a			;4aaa	77 	w 
	inc hl			;4aab	23 	# 
	djnz l4aaah		;4aac	10 fc 	. . 
	ret			;4aae	c9 	. 
sub_4aafh:
	ld hl,l5086h		;4aaf	21 86 50 	! . P 
	ld a,(hl)			;4ab2	7e 	~ 
	inc hl			;4ab3	23 	# 
	sub (hl)			;4ab4	96 	. 
	push af			;4ab5	f5 	. 
	call sub_4af3h		;4ab6	cd f3 4a 	. . J 
	ld (l4fc5h),de		;4ab9	ed 53 c5 4f 	. S . O 
	ld (l4fc7h),de		;4abd	ed 53 c7 4f 	. S . O 
	ld a,00fh		;4ac1	3e 0f 	> . 
	ld (l4fc3h),a		;4ac3	32 c3 4f 	2 . O 
	ld hl,l504ah		;4ac6	21 4a 50 	! J P 
	ld de,l4fb8h		;4ac9	11 b8 4f 	. . O 
	ld bc,00008h		;4acc	01 08 00 	. . . 
	ldir		;4acf	ed b0 	. . 
	call l4eabh		;4ad1	cd ab 4e 	. . N 
	ld hl,04fb5h		;4ad4	21 b5 4f 	! . O 
	call sub_4f1eh		;4ad7	cd 1e 4f 	. . O 
	ld hl,(l5087h)		;4ada	2a 87 50 	* . P 
	call sub_4ccdh		;4add	cd cd 4c 	. . L 
	pop af			;4ae0	f1 	. 
	ld b,a			;4ae1	47 	G 
	xor a			;4ae2	af 	. 
l4ae3h:
	ld (hl),a			;4ae3	77 	w 
	inc hl			;4ae4	23 	# 
	djnz l4ae3h		;4ae5	10 fc 	. . 
	ld hl,(l5087h)		;4ae7	2a 87 50 	* . P 
	call sub_4cb8h		;4aea	cd b8 4c 	. . L 
	ld hl,(l5087h)		;4aed	2a 87 50 	* . P 
	jp sub_44d5h		;4af0	c3 d5 44 	. . D 
sub_4af3h:
	ld e,a			;4af3	5f 	_ 
	xor a			;4af4	af 	. 
	ld d,000h		;4af5	16 00 	. . 
	ld b,003h		;4af7	06 03 	. . 
l4af9h:
	sla e		;4af9	cb 23 	. # 
	rl d		;4afb	cb 12 	. . 
	djnz l4af9h		;4afd	10 fa 	. . 
	ret			;4aff	c9 	. 
sub_4b00h:
	ld h,a			;4b00	67 	g 
	ld l,000h		;4b01	2e 00 	. . 
	call sub_4eaeh		;4b03	cd ae 4e 	. . N 
	ld hl,l504ah		;4b06	21 4a 50 	! J P 
	ld de,l4fb8h		;4b09	11 b8 4f 	. . O 
	ld bc,00008h		;4b0c	01 08 00 	. . . 
	ldir		;4b0f	ed b0 	. . 
	ld bc,00280h		;4b11	01 80 02 	. . . 
	ld (l4fc5h),bc		;4b14	ed 43 c5 4f 	. C . O 
	ld (l4fc7h),bc		;4b18	ed 43 c7 4f 	. C . O 
	ld a,00fh		;4b1c	3e 0f 	> . 
	ld (l4fc3h),a		;4b1e	32 c3 4f 	2 . O 
	ld hl,04fb5h		;4b21	21 b5 4f 	! . O 
	call sub_4f1eh		;4b24	cd 1e 4f 	. . O 
	ret			;4b27	c9 	. 
sub_4b28h:
	push bc			;4b28	c5 	. 
	ld de,00000h		;4b29	11 00 00 	. . . 
	call sub_4eech		;4b2c	cd ec 4e 	. . N 
	pop bc			;4b2f	c1 	. 
sub_4b30h:
	dec bc			;4b30	0b 	. 
	ld (l4f9dh),bc		;4b31	ed 43 9d 4f 	. C . O 
	ld (l4fa5h),de		;4b35	ed 53 a5 4f 	. S . O 
	ld hl,l4f99h		;4b39	21 99 4f 	! . O 
	call sub_4f1eh		;4b3c	cd 1e 4f 	. . O 
	jp l4eabh		;4b3f	c3 ab 4e 	. . N 
l4b42h:
	or a			;4b42	b7 	. 
	jp z,l4006h		;4b43	ca 06 40 	. . @ 
	ld b,a			;4b46	47 	G 
	ld a,017h		;4b47	3e 17 	> . 
	sub b			;4b49	90 	. 
	jr z,l4b79h		;4b4a	28 2d 	( - 
	ld c,a			;4b4c	4f 	O 
	ld d,b			;4b4d	50 	P 
	inc b			;4b4e	04 	. 
l4b4fh:
	ld (l5090h),de		;4b4f	ed 53 90 50 	. S . P 
	ld (l5092h),bc		;4b53	ed 43 92 50 	. C . P 
	ld l,d			;4b57	6a 	j 
	ld h,b			;4b58	60 	` 
	call sub_498fh		;4b59	cd 8f 49 	. . I 
	call sub_4bf7h		;4b5c	cd f7 4b 	. . K 
	ld de,(l5090h)		;4b5f	ed 5b 90 50 	. [ . P 
	ld h,d			;4b63	62 	b 
	ld l,000h		;4b64	2e 00 	. . 
	call sub_4eaeh		;4b66	cd ae 4e 	. . N 
	call sub_4c0eh		;4b69	cd 0e 4c 	. . L 
	ld bc,(l5092h)		;4b6c	ed 4b 92 50 	. K . P 
	ld de,(l5090h)		;4b70	ed 5b 90 50 	. [ . P 
	inc d			;4b74	14 	. 
	inc b			;4b75	04 	. 
	dec c			;4b76	0d 	. 
	jr nz,l4b4fh		;4b77	20 d6 	  . 
l4b79h:
	ld a,017h		;4b79	3e 17 	> . 
	call sub_4b00h		;4b7b	cd 00 4b 	. . K 
	ld c,017h		;4b7e	0e 17 	. . 
	call sub_4aa1h		;4b80	cd a1 4a 	. . J 
	ld hl,(l5087h)		;4b83	2a 87 50 	* . P 
	ld l,000h		;4b86	2e 00 	. . 
	push hl			;4b88	e5 	. 
	ld h,016h		;4b89	26 16 	& . 
	ld l,04fh		;4b8b	2e 4f 	. O 
	call sub_4cb8h		;4b8d	cd b8 4c 	. . L 
	ld h,017h		;4b90	26 17 	& . 
	ld l,000h		;4b92	2e 00 	. . 
	call sub_44d5h		;4b94	cd d5 44 	. . D 
	call l4147h		;4b97	cd 47 41 	. G A 
	pop hl			;4b9a	e1 	. 
	ld (l5087h),hl		;4b9b	22 87 50 	" . P 
	call sub_4cb8h		;4b9e	cd b8 4c 	. . L 
	ld hl,(l5087h)		;4ba1	2a 87 50 	* . P 
	jp sub_44d5h		;4ba4	c3 d5 44 	. . D 
l4ba7h:
	push af			;4ba7	f5 	. 
	ld b,a			;4ba8	47 	G 
	ld a,017h		;4ba9	3e 17 	> . 
	sub b			;4bab	90 	. 
	jr z,l4bddh		;4bac	28 2f 	( / 
	ld c,a			;4bae	4f 	O 
	ld b,016h		;4baf	06 16 	. . 
	ld d,017h		;4bb1	16 17 	. . 
l4bb3h:
	ld (l5090h),de		;4bb3	ed 53 90 50 	. S . P 
	ld (l5092h),bc		;4bb7	ed 43 92 50 	. C . P 
	ld h,b			;4bbb	60 	` 
	ld l,d			;4bbc	6a 	j 
	call sub_498fh		;4bbd	cd 8f 49 	. . I 
	call sub_4bf7h		;4bc0	cd f7 4b 	. . K 
	ld de,(l5090h)		;4bc3	ed 5b 90 50 	. [ . P 
	ld h,d			;4bc7	62 	b 
	ld l,000h		;4bc8	2e 00 	. . 
	call sub_4eaeh		;4bca	cd ae 4e 	. . N 
	call sub_4c0eh		;4bcd	cd 0e 4c 	. . L 
	ld de,(l5090h)		;4bd0	ed 5b 90 50 	. [ . P 
	dec d			;4bd4	15 	. 
	ld bc,(l5092h)		;4bd5	ed 4b 92 50 	. K . P 
	dec b			;4bd9	05 	. 
	dec c			;4bda	0d 	. 
	jr nz,l4bb3h		;4bdb	20 d6 	  . 
l4bddh:
	pop af			;4bdd	f1 	. 
	push af			;4bde	f5 	. 
	call sub_4b00h		;4bdf	cd 00 4b 	. . K 
	pop af			;4be2	f1 	. 
	ld c,a			;4be3	4f 	O 
	call sub_4aa1h		;4be4	cd a1 4a 	. . J 
	xor a			;4be7	af 	. 
	ld (l5087h),a		;4be8	32 87 50 	2 . P 
	ld hl,(l5087h)		;4beb	2a 87 50 	* . P 
	call sub_4cb8h		;4bee	cd b8 4c 	. . L 
	ld hl,(l5087h)		;4bf1	2a 87 50 	* . P 
	jp sub_44d5h		;4bf4	c3 d5 44 	. . D 
sub_4bf7h:
	ld bc,(l5092h)		;4bf7	ed 4b 92 50 	. K . P 
	ld h,b			;4bfb	60 	` 
	ld l,000h		;4bfc	2e 00 	. . 
	call sub_4eaeh		;4bfe	cd ae 4e 	. . N 
	call sub_4c05h		;4c01	cd 05 4c 	. . L 
	ret			;4c04	c9 	. 
sub_4c05h:
	ld hl,l50cbh		;4c05	21 cb 50 	! . P 
	ld a,0a4h		;4c08	3e a4 	> . 
	call sub_4c17h		;4c0a	cd 17 4c 	. . L 
	ret			;4c0d	c9 	. 
sub_4c0eh:
	ld hl,l50cbh		;4c0e	21 cb 50 	! . P 
	ld a,024h		;4c11	3e 24 	> $ 
	call sub_4c17h		;4c13	cd 17 4c 	. . L 
	ret			;4c16	c9 	. 
sub_4c17h:
	ld d,028h		;4c17	16 28 	. ( 
	ld e,020h		;4c19	1e 20 	.   
	ld bc,00500h		;4c1b	01 00 05 	. . . 
sub_4c1eh:
	push hl			;4c1e	e5 	. 
	push bc			;4c1f	c5 	. 
	push af			;4c20	f5 	. 
	and 0e4h		;4c21	e6 e4 	. . 
	ld (l50bbh),a		;4c23	32 bb 50 	2 . P 
	cp 024h		;4c26	fe 24 	. $ 
	jr z,l4c78h		;4c28	28 4e 	( N 
	pop af			;4c2a	f1 	. 
	cp 0a4h		;4c2b	fe a4 	. . 
	jr nz,l4c61h		;4c2d	20 32 	  2 
	ld (l502ch),a		;4c2f	32 2c 50 	2 , P 
	ld a,d			;4c32	7a 	z 
	dec a			;4c33	3d 	= 
	ld (l5026h),a		;4c34	32 26 50 	2 & P 
	ld a,040h		;4c37	3e 40 	> @ 
	ld (l5027h),a		;4c39	32 27 50 	2 ' P 
	ld a,e			;4c3c	7b 	{ 
	dec a			;4c3d	3d 	= 
	dec a			;4c3e	3d 	= 
	ld (l5028h),a		;4c3f	32 28 50 	2 ( P 
	srl a		;4c42	cb 3f 	. ? 
	ld (l502ah),a		;4c44	32 2a 50 	2 * P 
	ld hl,l501eh		;4c47	21 1e 50 	! . P 
l4c4ah:
	call sub_4f1eh		;4c4a	cd 1e 4f 	. . O 
	pop bc			;4c4d	c1 	. 
	pop hl			;4c4e	e1 	. 
	ld a,(l50bbh)		;4c4f	3a bb 50 	: . P 
	cp 024h		;4c52	fe 24 	. $ 
	ld a,008h		;4c54	3e 08 	> . 
	jr z,l4c5ah		;4c56	28 02 	( . 
	ld a,004h		;4c58	3e 04 	> . 
l4c5ah:
	call sub_4c99h		;4c5a	cd 99 4c 	. . L 
	call sub_4c90h		;4c5d	cd 90 4c 	. . L 
	ret			;4c60	c9 	. 
l4c61h:
	ld (l503ah),a		;4c61	32 3a 50 	2 : P 
	ld a,d			;4c64	7a 	z 
	dec a			;4c65	3d 	= 
	ld (l5036h),a		;4c66	32 36 50 	2 6 P 
	ld a,040h		;4c69	3e 40 	> @ 
	ld (l5037h),a		;4c6b	32 37 50 	2 7 P 
	ld a,e			;4c6e	7b 	{ 
	dec a			;4c6f	3d 	= 
	ld (l5038h),a		;4c70	32 38 50 	2 8 P 
	ld hl,l502eh		;4c73	21 2e 50 	! . P 
	jr l4c4ah		;4c76	18 d2 	. . 
l4c78h:
	pop af			;4c78	f1 	. 
	ld (l5048h),a		;4c79	32 48 50 	2 H P 
	ld a,d			;4c7c	7a 	z 
	dec a			;4c7d	3d 	= 
	ld (l5044h),a		;4c7e	32 44 50 	2 D P 
	ld a,040h		;4c81	3e 40 	> @ 
	ld (l5045h),a		;4c83	32 45 50 	2 E P 
	ld a,e			;4c86	7b 	{ 
	dec a			;4c87	3d 	= 
	ld (l5046h),a		;4c88	32 46 50 	2 F P 
	ld hl,l503ch		;4c8b	21 3c 50 	! < P 
	jr l4c4ah		;4c8e	18 ba 	. . 
sub_4c90h:
	in a,(048h)		;4c90	db 48 	. H 
	in a,(038h)		;4c92	db 38 	. 8 
	and 010h		;4c94	e6 10 	. . 
	jr nz,sub_4c90h		;4c96	20 f8 	  . 
	ret			;4c98	c9 	. 
sub_4c99h:
	push af			;4c99	f5 	. 
	xor a			;4c9a	af 	. 
	out (04dh),a		;4c9b	d3 4d 	. M 
	pop af			;4c9d	f1 	. 
	or 001h		;4c9e	f6 01 	. . 
	out (04bh),a		;4ca0	d3 4b 	. K 
	ld a,l			;4ca2	7d 	} 
	out (042h),a		;4ca3	d3 42 	. B 
	ld a,h			;4ca5	7c 	| 
	out (042h),a		;4ca6	d3 42 	. B 
	dec bc			;4ca8	0b 	. 
	ld a,c			;4ca9	79 	y 
	out (043h),a		;4caa	d3 43 	. C 
	ld a,b			;4cac	78 	x 
	out (043h),a		;4cad	d3 43 	. C 
	ld a,060h		;4caf	3e 60 	> ` 
	out (048h),a		;4cb1	d3 48 	. H 
	ld a,00dh		;4cb3	3e 0d 	> . 
	out (04fh),a		;4cb5	d3 4f 	. O 
	ret			;4cb7	c9 	. 
sub_4cb8h:
	ld a,h			;4cb8	7c 	| 
	or l			;4cb9	b5 	. 
	jr z,l4ccbh		;4cba	28 0f 	( . 
	ld a,h			;4cbc	7c 	| 
	cp 018h		;4cbd	fe 18 	. . 
	jr nz,l4cc5h		;4cbf	20 04 	  . 
	ld a,l			;4cc1	7d 	} 
	or a			;4cc2	b7 	. 
	jr z,l4ccbh		;4cc3	28 06 	( . 
l4cc5h:
	call sub_4ccdh		;4cc5	cd cd 4c 	. . L 
	dec hl			;4cc8	2b 	+ 
	ld a,(hl)			;4cc9	7e 	~ 
	ret			;4cca	c9 	. 
l4ccbh:
	xor a			;4ccb	af 	. 
	ret			;4ccc	c9 	. 
sub_4ccdh:
	push hl			;4ccd	e5 	. 
	ld e,h			;4cce	5c 	\ 
	sla e		;4ccf	cb 23 	. # 
	ld d,000h		;4cd1	16 00 	. . 
	ld hl,l62c2h		;4cd3	21 c2 62 	! . b 
	add hl,de			;4cd6	19 	. 
	ld e,(hl)			;4cd7	5e 	^ 
	inc hl			;4cd8	23 	# 
	ld d,(hl)			;4cd9	56 	V 
	pop hl			;4cda	e1 	. 
	ld h,000h		;4cdb	26 00 	& . 
	add hl,de			;4cdd	19 	. 
	ex de,hl			;4cde	eb 	. 
	ld hl,l5aeeh		;4cdf	21 ee 5a 	! . Z 
	add hl,de			;4ce2	19 	. 
	ld a,(hl)			;4ce3	7e 	~ 
	ret			;4ce4	c9 	. 
	ld a,00dh		;4ce5	3e 0d 	> . 
	jp sub_4f3fh		;4ce7	c3 3f 4f 	. ? O 
	ld a,00ch		;4cea	3e 0c 	> . 
	jp sub_4f3fh		;4cec	c3 3f 4f 	. ? O 
pixel_set_reset:
	ld (l50b5h),de		;4cef	ed 53 b5 50 	. S . P 
	ld (l50b7h),hl		;4cf3	22 b7 50 	" . P 
	cp 001h		;4cf6	fe 01 	. . 
	jr nz,l4cfeh		;4cf8	20 04 	  . 
l4cfah:
	ld a,000h		;4cfa	3e 00 	> . 
	jr l4d14h		;4cfc	18 16 	. . 
l4cfeh:
	cp 002h		;4cfe	fe 02 	. . 
	jr nz,l4d06h		;4d00	20 04 	  . 
	ld a,003h		;4d02	3e 03 	> . 
	jr l4d14h		;4d04	18 0e 	. . 
l4d06h:
	cp 003h		;4d06	fe 03 	. . 
	jr nz,l4d0eh		;4d08	20 04 	  . 
	ld a,001h		;4d0a	3e 01 	> . 
	jr l4d14h		;4d0c	18 06 	. . 
l4d0eh:
	cp 004h		;4d0e	fe 04 	. . 
	jr nz,l4cfah		;4d10	20 e8 	  . 
	ld a,002h		;4d12	3e 02 	> . 
l4d14h:
	or 020h		;4d14	f6 20 	.   
	call sub_4f3fh		;4d16	cd 3f 4f 	. ? O 
	xor a			;4d19	af 	. 
	ld hl,00190h		;4d1a	21 90 01 	! . . 
	ld de,(l50b7h)		;4d1d	ed 5b b7 50 	. [ . P 
	sbc hl,de		;4d21	ed 52 	. R 
	dec hl			;4d23	2b 	+ 
	add hl,hl			;4d24	29 	) 
	add hl,hl			;4d25	29 	) 
	push hl			;4d26	e5 	. 
	add hl,hl			;4d27	29 	) 
	add hl,hl			;4d28	29 	) 
	pop bc			;4d29	c1 	. 
	add hl,bc			;4d2a	09 	. 
	add hl,hl			;4d2b	29 	) 
	push hl			;4d2c	e5 	. 
	ld bc,(l50b5h)		;4d2d	ed 4b b5 50 	. K . P 
	ld a,c			;4d31	79 	y 
	and 00fh		;4d32	e6 0f 	. . 
	sla a		;4d34	cb 27 	. ' 
	sla a		;4d36	cb 27 	. ' 
	sla a		;4d38	cb 27 	. ' 
	sla a		;4d3a	cb 27 	. ' 
	ld (l5018h),a		;4d3c	32 18 50 	2 . P 
	ld a,b			;4d3f	78 	x 
	ld hl,l50b9h		;4d40	21 b9 50 	! . P 
	ld (hl),c			;4d43	71 	q 
	rrd		;4d44	ed 67 	. g 
	ld bc,(l50b9h)		;4d46	ed 4b b9 50 	. K . P 
	pop hl			;4d4a	e1 	. 
	add hl,bc			;4d4b	09 	. 
	ld (l5016h),hl		;4d4c	22 16 50 	" . P 
	ld hl,l500fh		;4d4f	21 0f 50 	! . P 
	call sub_4f1eh		;4d52	cd 1e 4f 	. . O 
	ld a,020h		;4d55	3e 20 	>   
	call sub_4f3fh		;4d57	cd 3f 4f 	. ? O 
	call l4eabh		;4d5a	cd ab 4e 	. . N 
	ret			;4d5d	c9 	. 
l4d5eh:
	ld a,(05063h)		;4d5e	3a 63 50 	: c P 
	or a			;4d61	b7 	. 
	jp nz,l4dd4h		;4d62	c2 d4 4d 	. . M 
	ld hl,l4e04h		;4d65	21 04 4e 	! . N 
	ld a,000h		;4d68	3e 00 	> . 
	call sub_4de4h		;4d6a	cd e4 4d 	. . M 
	ld b,008h		;4d6d	06 08 	. . 
	call sub_4dfch		;4d6f	cd fc 4d 	. . M 
	ld a,06fh		;4d72	3e 6f 	> o 
	call sub_4de4h		;4d74	cd e4 4d 	. . M 
	ld hl,l4e0ch		;4d77	21 0c 4e 	! . N 
	ld a,04bh		;4d7a	3e 4b 	> K 
	call sub_4de4h		;4d7c	cd e4 4d 	. . M 
	ld b,001h		;4d7f	06 01 	. . 
	call sub_4dfch		;4d81	cd fc 4d 	. . M 
	ld hl,l4e0dh		;4d84	21 0d 4e 	! . N 
	ld a,046h		;4d87	3e 46 	> F 
	call sub_4de4h		;4d89	cd e4 4d 	. . M 
	ld b,002h		;4d8c	06 02 	. . 
	call sub_4dfch		;4d8e	cd fc 4d 	. . M 
	ld hl,l4e0eh		;4d91	21 0e 4e 	! . N 
	ld a,047h		;4d94	3e 47 	> G 
	call sub_4de4h		;4d96	cd e4 4d 	. . M 
	ld b,001h		;4d99	06 01 	. . 
	call sub_4dfch		;4d9b	cd fc 4d 	. . M 
	ld hl,l4e0fh		;4d9e	21 0f 4e 	! . N 
	ld a,070h		;4da1	3e 70 	> p 
	call sub_4de4h		;4da3	cd e4 4d 	. . M 
	ld b,008h		;4da6	06 08 	. . 
	call sub_4dfch		;4da8	cd fc 4d 	. . M 
	ld a,06bh		;4dab	3e 6b 	> k 
	call sub_4de4h		;4dad	cd e4 4d 	. . M 
l4db0h:
	ld a,002h		;4db0	3e 02 	> . 
	out (02dh),a		;4db2	d3 2d 	. - 
	ld hl,00000h		;4db4	21 00 00 	! . . 
	ld a,000h		;4db7	3e 00 	> . 
	call sub_4eech		;4db9	cd ec 4e 	. . N 
	ld bc,03e80h		;4dbc	01 80 3e 	. . > 
	ld de,00000h		;4dbf	11 00 00 	. . . 
	call sub_4b30h		;4dc2	cd 30 4b 	. 0 K 
	ld hl,00000h		;4dc5	21 00 00 	! . . 
	ld a,000h		;4dc8	3e 00 	> . 
	call sub_4eech		;4dca	cd ec 4e 	. . N 
	call l4a5ch		;4dcd	cd 5c 4a 	. \ J 
	call sub_4ea5h		;4dd0	cd a5 4e 	. . N 
	ret			;4dd3	c9 	. 
l4dd4h:
	xor a			;4dd4	af 	. 
	ld (l4fc4h),a		;4dd5	32 c4 4f 	2 . O 
	ld (l4fdah),a		;4dd8	32 da 4f 	2 . O 
	ld (l4ff0h),a		;4ddb	32 f0 4f 	2 . O 
	ld (l5001h),a		;4dde	32 01 50 	2 . P 
	jp l4db0h		;4de1	c3 b0 4d 	. . M 
sub_4de4h:
	call sub_4deah		;4de4	cd ea 4d 	. . M 
	out (039h),a		;4de7	d3 39 	. 9 
	ret			;4de9	c9 	. 
sub_4deah:
	push af			;4dea	f5 	. 
l4debh:
	in a,(038h)		;4deb	db 38 	. 8 
	and 002h		;4ded	e6 02 	. . 
	jp nz,l4debh		;4def	c2 eb 4d 	. . M 
	pop af			;4df2	f1 	. 
	ret			;4df3	c9 	. 
l4df4h:
	in a,(038h)		;4df4	db 38 	. 8 
	and 006h		;4df6	e6 06 	. . 
	xor h			;4df8	ac 	. 
	jr z,l4df4h		;4df9	28 f9 	( . 
	ret			;4dfb	c9 	. 
sub_4dfch:
	call l4df4h		;4dfc	cd f4 4d 	. . M 
	ld c,038h		;4dff	0e 38 	. 8 
	otir		;4e01	ed b3 	. . 
	ret			;4e03	c9 	. 
l4e04h:
	inc d			;4e04	14 	. 
	ld c,(hl)			;4e05	4e 	N 
	ld (bc),a			;4e06	02 	. 
	ld a,(de)			;4e07	1a 	. 
	ld (de),a			;4e08	12 	. 
	ld bc,01190h		;4e09	01 90 11 	. . . 
l4e0ch:
	nop			;4e0c	00 	. 
l4e0dh:
	nop			;4e0d	00 	. 
l4e0eh:
	ld d,b			;4e0e	50 	P 
l4e0fh:
	nop			;4e0f	00 	. 
	nop			;4e10	00 	. 
	nop			;4e11	00 	. 
	ld e,c			;4e12	59 	Y 
	nop			;4e13	00 	. 
	defb 0fdh,000h,040h	;illegal sequence		;4e14	fd 00 40 	. . @ 
	ld a,0ffh		;4e17	3e ff 	> . 
	out (001h),a		;4e19	d3 01 	. . 
	xor a			;4e1b	af 	. 
	out (001h),a		;4e1c	d3 01 	. . 
	ld a,(l2febh)		;4e1e	3a eb 2f 	: . / 
	or a			;4e21	b7 	. 
	jr nz,l4e3fh		;4e22	20 1b 	  . 
	ld a,(l5068h)		;4e24	3a 68 50 	: h P 
	or a			;4e27	b7 	. 
	jr z,l4e3fh		;4e28	28 15 	( . 
	ld hl,l5069h		;4e2a	21 69 50 	! i P 
	ld a,(hl)			;4e2d	7e 	~ 
	cpl			;4e2e	2f 	/ 
	ld (hl),a			;4e2f	77 	w 
	ld hl,04f93h		;4e30	21 93 4f 	! . O 
	call sub_4f1eh		;4e33	cd 1e 4f 	. . O 
	call sub_4ef8h		;4e36	cd f8 4e 	. . N 
	ld hl,04f93h		;4e39	21 93 4f 	! . O 
	call sub_4f1eh		;4e3c	cd 1e 4f 	. . O 
l4e3fh:
	ld a,020h		;4e3f	3e 20 	>   
	out (008h),a		;4e41	d3 08 	. . 
	out (00ch),a		;4e43	d3 0c 	. . 
	ret			;4e45	c9 	. 
l4e46h:
	push hl			;4e46	e5 	. 
	call sub_4eaeh		;4e47	cd ae 4e 	. . N 
	pop hl			;4e4a	e1 	. 
	srl l		;4e4b	cb 3d 	. = 
	ld a,0b8h		;4e4d	3e b8 	> . 
	jr c,l4e53h		;4e4f	38 02 	8 . 
l4e51h:
	ld a,0b0h		;4e51	3e b0 	> . 
l4e53h:
	ld (0500dh),a		;4e53	32 0d 50 	2 . P 
	ld hl,l5004h		;4e56	21 04 50 	! . P 
	call sub_4f1eh		;4e59	cd 1e 4f 	. . O 
	ld hl,l4e70h		;4e5c	21 70 4e 	! p N 
	ld b,010h		;4e5f	06 10 	. . 
l4e61h:
	push bc			;4e61	c5 	. 
	push hl			;4e62	e5 	. 
	call sub_4f57h		;4e63	cd 57 4f 	. W O 
	ld (hl),a			;4e66	77 	w 
	pop hl			;4e67	e1 	. 
	inc hl			;4e68	23 	# 
	pop bc			;4e69	c1 	. 
	djnz l4e61h		;4e6a	10 f5 	. . 
	ld hl,l4e70h		;4e6c	21 70 4e 	! p N 
	ret			;4e6f	c9 	. 
l4e70h:
	nop			;4e70	00 	. 
	nop			;4e71	00 	. 
	nop			;4e72	00 	. 
	nop			;4e73	00 	. 
	nop			;4e74	00 	. 
	nop			;4e75	00 	. 
	nop			;4e76	00 	. 
	nop			;4e77	00 	. 
	nop			;4e78	00 	. 
	nop			;4e79	00 	. 
	nop			;4e7a	00 	. 
	nop			;4e7b	00 	. 
	nop			;4e7c	00 	. 
	nop			;4e7d	00 	. 
	nop			;4e7e	00 	. 
	nop			;4e7f	00 	. 
l4e80h:
	ld hl,(l5087h)		;4e80	2a 87 50 	* . P 
	ret			;4e83	c9 	. 
	ld a,(l5088h)		;4e84	3a 88 50 	: . P 
	add a,020h		;4e87	c6 20 	.   
	ld b,a			;4e89	47 	G 
	ld a,(l5087h)		;4e8a	3a 87 50 	: . P 
	add a,020h		;4e8d	c6 20 	.   
	ld c,a			;4e8f	4f 	O 
	push bc			;4e90	c5 	. 
	call sub_a020h		;4e91	cd 20 a0 	.   . 
	pop bc			;4e94	c1 	. 
	ld a,b			;4e95	78 	x 
	push bc			;4e96	c5 	. 
	call sub_a03bh		;4e97	cd 3b a0 	. ; . 
	pop bc			;4e9a	c1 	. 
	ld a,c			;4e9b	79 	y 
	call sub_a03bh		;4e9c	cd 3b a0 	. ; . 
	ld a,00dh		;4e9f	3e 0d 	> . 
	call sub_a03bh		;4ea1	cd 3b a0 	. ; . 
	ret			;4ea4	c9 	. 
sub_4ea5h:
	ld hl,00000h		;4ea5	21 00 00 	! . . 
l4ea8h:
	ld (l5087h),hl		;4ea8	22 87 50 	" . P 
l4eabh:
	ld hl,(l5087h)		;4eab	2a 87 50 	* . P 
sub_4eaeh:
	xor a			;4eae	af 	. 
	ld (050a7h),a		;4eaf	32 a7 50 	2 . P 
	ld a,h			;4eb2	7c 	| 
	ld de,l4f61h		;4eb3	11 61 4f 	. a O 
	ld a,l			;4eb6	7d 	} 
	srl a		;4eb7	cb 3f 	. ? 
	ld (l508bh),a		;4eb9	32 8b 50 	2 . P 
	ld a,080h		;4ebc	3e 80 	> . 
	jr c,l4ec2h		;4ebe	38 02 	8 . 
	ld a,000h		;4ec0	3e 00 	> . 
l4ec2h:
	push af			;4ec2	f5 	. 
	ld a,(l508bh)		;4ec3	3a 8b 50 	: . P 
	ld l,h			;4ec6	6c 	l 
	ld h,000h		;4ec7	26 00 	& . 
	add hl,hl			;4ec9	29 	) 
	add hl,de			;4eca	19 	. 
	add a,(hl)			;4ecb	86 	. 
	ld e,a			;4ecc	5f 	_ 
	inc hl			;4ecd	23 	# 
	ld a,(hl)			;4ece	7e 	~ 
	adc a,000h		;4ecf	ce 00 	. . 
	ld d,a			;4ed1	57 	W 
	ld hl,(l4faah)		;4ed2	2a aa 4f 	* . O 
	add hl,de			;4ed5	19 	. 
	push hl			;4ed6	e5 	. 
	ld de,(l509fh)		;4ed7	ed 5b 9f 50 	. [ . P 
	xor a			;4edb	af 	. 
	sbc hl,de		;4edc	ed 52 	. R 
	ex de,hl			;4ede	eb 	. 
	pop hl			;4edf	e1 	. 
	jr c,l4eebh		;4ee0	38 09 	8 . 
	ld hl,(l509dh)		;4ee2	2a 9d 50 	* . P 
	add hl,de			;4ee5	19 	. 
	ld a,001h		;4ee6	3e 01 	> . 
	ld (050a7h),a		;4ee8	32 a7 50 	2 . P 
l4eebh:
	pop af			;4eeb	f1 	. 
sub_4eech:
	ld (l4f96h),hl		;4eec	22 96 4f 	" . O 
	ld (l4f98h),a		;4eef	32 98 4f 	2 . O 
sub_4ef2h:
	ld hl,04f93h		;4ef2	21 93 4f 	! . O 
	jp sub_4f1eh		;4ef5	c3 1e 4f 	. . O 
sub_4ef8h:
	ld bc,00008h		;4ef8	01 08 00 	. . . 
	ld de,l4fe4h		;4efb	11 e4 4f 	. . O 
	ld hl,l5052h		;4efe	21 52 50 	! R P 
	ldir		;4f01	ed b0 	. . 
	ld de,l4ff5h		;4f03	11 f5 4f 	. . O 
	ld bc,00008h		;4f06	01 08 00 	. . . 
	ldir		;4f09	ed b0 	. . 
	ld a,020h		;4f0b	3e 20 	>   
	or 001h		;4f0d	f6 01 	. . 
	call sub_4f3fh		;4f0f	cd 3f 4f 	. ? O 
	ld hl,l4fe1h		;4f12	21 e1 4f 	! . O 
	call sub_4f1eh		;4f15	cd 1e 4f 	. . O 
	ld a,020h		;4f18	3e 20 	>   
	call sub_4f3fh		;4f1a	cd 3f 4f 	. ? O 
	ret			;4f1d	c9 	. 
sub_4f1eh:
	ld a,002h		;4f1e	3e 02 	> . 
	out (02dh),a		;4f20	d3 2d 	. - 
	ld b,(hl)			;4f22	46 	F 
	inc hl			;4f23	23 	# 
l4f24h:
	push bc			;4f24	c5 	. 
	ld a,(hl)			;4f25	7e 	~ 
	call sub_4f3fh		;4f26	cd 3f 4f 	. ? O 
	inc hl			;4f29	23 	# 
	ld a,000h		;4f2a	3e 00 	> . 
	cp (hl)			;4f2c	be 	. 
	jr z,l4f3ch		;4f2d	28 0d 	( . 
	ld b,(hl)			;4f2f	46 	F 
	ld c,038h		;4f30	0e 38 	. 8 
	inc hl			;4f32	23 	# 
	call sub_4f4fh		;4f33	cd 4f 4f 	. O O 
	otir		;4f36	ed b3 	. . 
l4f38h:
	pop bc			;4f38	c1 	. 
	djnz l4f24h		;4f39	10 e9 	. . 
	ret			;4f3b	c9 	. 
l4f3ch:
	inc hl			;4f3c	23 	# 
	jr l4f38h		;4f3d	18 f9 	. . 
sub_4f3fh:
	call sub_4f45h		;4f3f	cd 45 4f 	. E O 
	out (039h),a		;4f42	d3 39 	. 9 
	ret			;4f44	c9 	. 
sub_4f45h:
	push af			;4f45	f5 	. 
l4f46h:
	in a,(038h)		;4f46	db 38 	. 8 
	and 002h		;4f48	e6 02 	. . 
	jp nz,l4f46h		;4f4a	c2 46 4f 	. F O 
	pop af			;4f4d	f1 	. 
	ret			;4f4e	c9 	. 
sub_4f4fh:
	in a,(038h)		;4f4f	db 38 	. 8 
	and 004h		;4f51	e6 04 	. . 
	jp z,sub_4f4fh		;4f53	ca 4f 4f 	. O O 
	ret			;4f56	c9 	. 
sub_4f57h:
	in a,(038h)		;4f57	db 38 	. 8 
	and 001h		;4f59	e6 01 	. . 
	jp z,sub_4f57h		;4f5b	ca 57 4f 	. W O 
	in a,(039h)		;4f5e	db 39 	. 9 
	ret			;4f60	c9 	. 
l4f61h:
	ld e,b			;4f61	58 	X 
	ld (bc),a			;4f62	02 	. 
	ret c			;4f63	d8 	. 
	inc b			;4f64	04 	. 
	ld e,b			;4f65	58 	X 
	rlca			;4f66	07 	. 
	ret c			;4f67	d8 	. 
	add hl,bc			;4f68	09 	. 
	ld e,b			;4f69	58 	X 
	inc c			;4f6a	0c 	. 
	ret c			;4f6b	d8 	. 
	ld c,058h		;4f6c	0e 58 	. X 
	ld de,013d8h		;4f6e	11 d8 13 	. . . 
	ld e,b			;4f71	58 	X 
	ld d,0d8h		;4f72	16 d8 	. . 
	jr l4fceh		;4f74	18 58 	. X 
	dec de			;4f76	1b 	. 
	ret c			;4f77	d8 	. 
	dec e			;4f78	1d 	. 
	ld e,b			;4f79	58 	X 
	jr nz,-38		;4f7a	20 d8 	  . 
	ld (l2558h),hl		;4f7c	22 58 25 	" X % 
	ret c			;4f7f	d8 	. 
	daa			;4f80	27 	' 
	ld e,b			;4f81	58 	X 
	ld hl,(l2cd8h)		;4f82	2a d8 2c 	* . , 
	ld e,b			;4f85	58 	X 
	cpl			;4f86	2f 	/ 
	ret c			;4f87	d8 	. 
	ld sp,l3458h		;4f88	31 58 34 	1 X 4 
	ret c			;4f8b	d8 	. 
	ld (hl),058h		;4f8c	36 58 	6 X 
	add hl,sp			;4f8e	39 	9 
	ret c			;4f8f	d8 	. 
	dec sp			;4f90	3b 	; 
	ld e,b			;4f91	58 	X 
	ld a,001h		;4f92	3e 01 	> . 
	ld c,c			;4f94	49 	I 
	inc bc			;4f95	03 	. 
l4f96h:
	nop			;4f96	00 	. 
	nop			;4f97	00 	. 
l4f98h:
	nop			;4f98	00 	. 
l4f99h:
	inc bc			;4f99	03 	. 
	ld c,h			;4f9a	4c 	L 
	inc bc			;4f9b	03 	. 
	ld (bc),a			;4f9c	02 	. 
l4f9dh:
	nop			;4f9d	00 	. 
	nop			;4f9e	00 	. 
	ld c,d			;4f9f	4a 	J 
	ld (bc),a			;4fa0	02 	. 
	rst 38h			;4fa1	ff 	. 
	rst 38h			;4fa2	ff 	. 
	jr nz,l4fa7h		;4fa3	20 02 	  . 
l4fa5h:
	nop			;4fa5	00 	. 
	nop			;4fa6	00 	. 
l4fa7h:
	ld (bc),a			;4fa7	02 	. 
	ld (hl),b			;4fa8	70 	p 
	ex af,af'			;4fa9	08 	. 
l4faah:
	nop			;4faa	00 	. 
	nop			;4fab	00 	. 
l4fach:
	nop			;4fac	00 	. 
l4fadh:
	nop			;4fad	00 	. 
l4faeh:
	nop			;4fae	00 	. 
	nop			;4faf	00 	. 
l4fb0h:
	nop			;4fb0	00 	. 
l4fb1h:
	nop			;4fb1	00 	. 
	ld c,h			;4fb2	4c 	L 
	ld bc,00302h		;4fb3	01 02 03 	. . . 
	ld a,b			;4fb6	78 	x 
	ex af,af'			;4fb7	08 	. 
l4fb8h:
	nop			;4fb8	00 	. 
	nop			;4fb9	00 	. 
	nop			;4fba	00 	. 
	nop			;4fbb	00 	. 
	nop			;4fbc	00 	. 
	nop			;4fbd	00 	. 
	nop			;4fbe	00 	. 
	nop			;4fbf	00 	. 
	ld c,h			;4fc0	4c 	L 
	rlca			;4fc1	07 	. 
	ld (de),a			;4fc2	12 	. 
l4fc3h:
	rrca			;4fc3	0f 	. 
l4fc4h:
	ld b,b			;4fc4	40 	@ 
l4fc5h:
	nop			;4fc5	00 	. 
	nop			;4fc6	00 	. 
l4fc7h:
	nop			;4fc7	00 	. 
	nop			;4fc8	00 	. 
	ld l,b			;4fc9	68 	h 
	nop			;4fca	00 	. 
l4fcbh:
	inc bc			;4fcb	03 	. 
	ld a,b			;4fcc	78 	x 
	ex af,af'			;4fcd	08 	. 
l4fceh:
	nop			;4fce	00 	. 
	nop			;4fcf	00 	. 
	nop			;4fd0	00 	. 
	nop			;4fd1	00 	. 
	nop			;4fd2	00 	. 
	nop			;4fd3	00 	. 
	rst 38h			;4fd4	ff 	. 
	nop			;4fd5	00 	. 
	ld c,h			;4fd6	4c 	L 
	rlca			;4fd7	07 	. 
	ld (de),a			;4fd8	12 	. 
	rlca			;4fd9	07 	. 
l4fdah:
	ld b,b			;4fda	40 	@ 
l4fdbh:
	nop			;4fdb	00 	. 
	nop			;4fdc	00 	. 
l4fddh:
	nop			;4fdd	00 	. 
	nop			;4fde	00 	. 
	ld l,b			;4fdf	68 	h 
	nop			;4fe0	00 	. 
l4fe1h:
	ld b,078h		;4fe1	06 78 	. x 
	ex af,af'			;4fe3	08 	. 
l4fe4h:
	nop			;4fe4	00 	. 
	nop			;4fe5	00 	. 
	nop			;4fe6	00 	. 
	nop			;4fe7	00 	. 
	nop			;4fe8	00 	. 
	nop			;4fe9	00 	. 
l4feah:
	nop			;4fea	00 	. 
	nop			;4feb	00 	. 
	ld c,h			;4fec	4c 	L 
	inc bc			;4fed	03 	. 
	ld (de),a			;4fee	12 	. 
	rlca			;4fef	07 	. 
l4ff0h:
	ld b,b			;4ff0	40 	@ 
	ld l,b			;4ff1	68 	h 
	nop			;4ff2	00 	. 
	ld a,b			;4ff3	78 	x 
	ex af,af'			;4ff4	08 	. 
l4ff5h:
	nop			;4ff5	00 	. 
	nop			;4ff6	00 	. 
	nop			;4ff7	00 	. 
	nop			;4ff8	00 	. 
	nop			;4ff9	00 	. 
	nop			;4ffa	00 	. 
	nop			;4ffb	00 	. 
	nop			;4ffc	00 	. 
	ld c,h			;4ffd	4c 	L 
	inc bc			;4ffe	03 	. 
	ld (de),a			;4fff	12 	. 
	rlca			;5000	07 	. 
l5001h:
	ld b,b			;5001	40 	@ 
	ld l,b			;5002	68 	h 
	nop			;5003	00 	. 
l5004h:
	inc bc			;5004	03 	. 
	ld c,d			;5005	4a 	J 
	ld (bc),a			;5006	02 	. 
	rst 38h			;5007	ff 	. 
	rst 38h			;5008	ff 	. 
	ld c,h			;5009	4c 	L 
	ld (bc),a			;500a	02 	. 
	inc b			;500b	04 	. 
	djnz l500eh		;500c	10 00 	. . 
l500eh:
	nop			;500e	00 	. 
l500fh:
	inc b			;500f	04 	. 
	ld a,b			;5010	78 	x 
	ld (bc),a			;5011	02 	. 
	rst 38h			;5012	ff 	. 
	rst 38h			;5013	ff 	. 
	ld c,c			;5014	49 	I 
	inc bc			;5015	03 	. 
l5016h:
	nop			;5016	00 	. 
	nop			;5017	00 	. 
l5018h:
	nop			;5018	00 	. 
	ld c,h			;5019	4c 	L 
	ld bc,06c02h		;501a	01 02 6c 	. . l 
	nop			;501d	00 	. 
l501eh:
	inc bc			;501e	03 	. 
	ld c,d			;501f	4a 	J 
	ld (bc),a			;5020	02 	. 
	rst 38h			;5021	ff 	. 
	rst 38h			;5022	ff 	. 
	ld c,h			;5023	4c 	L 
	rlca			;5024	07 	. 
	inc b			;5025	04 	. 
l5026h:
	nop			;5026	00 	. 
l5027h:
	nop			;5027	00 	. 
l5028h:
	nop			;5028	00 	. 
	nop			;5029	00 	. 
l502ah:
	nop			;502a	00 	. 
	nop			;502b	00 	. 
l502ch:
	and h			;502c	a4 	. 
	nop			;502d	00 	. 
l502eh:
	inc bc			;502e	03 	. 
	ld c,d			;502f	4a 	J 
	ld (bc),a			;5030	02 	. 
	rst 38h			;5031	ff 	. 
	rst 38h			;5032	ff 	. 
	ld c,h			;5033	4c 	L 
	dec b			;5034	05 	. 
	inc b			;5035	04 	. 
l5036h:
	nop			;5036	00 	. 
l5037h:
	nop			;5037	00 	. 
l5038h:
	nop			;5038	00 	. 
	nop			;5039	00 	. 
l503ah:
	and h			;503a	a4 	. 
	nop			;503b	00 	. 
l503ch:
	inc bc			;503c	03 	. 
	ld c,d			;503d	4a 	J 
	ld (bc),a			;503e	02 	. 
l503fh:
	rst 38h			;503f	ff 	. 
l5040h:
	rst 38h			;5040	ff 	. 
	ld c,h			;5041	4c 	L 
	dec b			;5042	05 	. 
	inc b			;5043	04 	. 
l5044h:
	nop			;5044	00 	. 
l5045h:
	nop			;5045	00 	. 
l5046h:
	nop			;5046	00 	. 
	nop			;5047	00 	. 
l5048h:
	inc h			;5048	24 	$ 
	nop			;5049	00 	. 
l504ah:
	nop			;504a	00 	. 
	nop			;504b	00 	. 
	nop			;504c	00 	. 
	nop			;504d	00 	. 
	nop			;504e	00 	. 
	nop			;504f	00 	. 
	nop			;5050	00 	. 
	nop			;5051	00 	. 
l5052h:
	rst 38h			;5052	ff 	. 
	rst 38h			;5053	ff 	. 
	rst 38h			;5054	ff 	. 
	rst 38h			;5055	ff 	. 
	rst 38h			;5056	ff 	. 
	rst 38h			;5057	ff 	. 
	rst 38h			;5058	ff 	. 
	rst 38h			;5059	ff 	. 
	rst 38h			;505a	ff 	. 
	rst 38h			;505b	ff 	. 
	rst 38h			;505c	ff 	. 
	rst 38h			;505d	ff 	. 
	rst 38h			;505e	ff 	. 
	rst 38h			;505f	ff 	. 
	rst 38h			;5060	ff 	. 
	rst 38h			;5061	ff 	. 
	ld bc,00000h		;5062	01 00 00 	. . . 
	nop			;5065	00 	. 
l5066h:
	nop			;5066	00 	. 
	nop			;5067	00 	. 
l5068h:
	nop			;5068	00 	. 
l5069h:
	nop			;5069	00 	. 
l506ah:
	nop			;506a	00 	. 
l506bh:
	nop			;506b	00 	. 
l506ch:
	nop			;506c	00 	. 
l506dh:
	nop			;506d	00 	. 
l506eh:
	nop			;506e	00 	. 
l506fh:
	nop			;506f	00 	. 
l5070h:
	nop			;5070	00 	. 
l5071h:
	nop			;5071	00 	. 
	nop			;5072	00 	. 
	nop			;5073	00 	. 
	nop			;5074	00 	. 
l5075h:
	nop			;5075	00 	. 
	nop			;5076	00 	. 
l5077h:
	nop			;5077	00 	. 
l5078h:
	nop			;5078	00 	. 
l5079h:
	nop			;5079	00 	. 
l507ah:
	nop			;507a	00 	. 
l507bh:
	nop			;507b	00 	. 
	nop			;507c	00 	. 
l507dh:
	nop			;507d	00 	. 
	nop			;507e	00 	. 
l507fh:
	nop			;507f	00 	. 
	nop			;5080	00 	. 
	nop			;5081	00 	. 
l5082h:
	nop			;5082	00 	. 
l5083h:
	jr nz,l5097h		;5083	20 12 	  . 
	ld l,d			;5085	6a 	j 
l5086h:
	ld d,b			;5086	50 	P 
l5087h:
	nop			;5087	00 	. 
l5088h:
	nop			;5088	00 	. 
l5089h:
	jr l509bh		;5089	18 10 	. . 
l508bh:
	nop			;508b	00 	. 
l508ch:
	nop			;508c	00 	. 
l508dh:
	nop			;508d	00 	. 
l508eh:
	nop			;508e	00 	. 
l508fh:
	nop			;508f	00 	. 
l5090h:
	nop			;5090	00 	. 
	nop			;5091	00 	. 
l5092h:
	nop			;5092	00 	. 
	nop			;5093	00 	. 
l5094h:
	inc b			;5094	04 	. 
l5095h:
	nop			;5095	00 	. 
l5096h:
	nop			;5096	00 	. 
l5097h:
	nop			;5097	00 	. 
	nop			;5098	00 	. 
l5099h:
	nop			;5099	00 	. 
	nop			;509a	00 	. 
l509bh:
	nop			;509b	00 	. 
l509ch:
	nop			;509c	00 	. 
l509dh:
	nop			;509d	00 	. 
	nop			;509e	00 	. 
l509fh:
	add a,b			;509f	80 	. 
	ld a,080h		;50a0	3e 80 	> . 
	ld a,080h		;50a2	3e 80 	> . 
	ld a,090h		;50a4	3e 90 	> . 
	ld bc,00000h		;50a6	01 00 00 	. . . 
	nop			;50a9	00 	. 
	ld b,h			;50aa	44 	D 
l50abh:
	adc a,a			;50ab	8f 	. 
l50ach:
	nop			;50ac	00 	. 
	ld d,h			;50ad	54 	T 
	ld d,(hl)			;50ae	56 	V 
	dec l			;50af	2d 	- 
	add hl,sp			;50b0	39 	9 
	ld (00030h),a		;50b1	32 30 00 	2 0 . 
	nop			;50b4	00 	. 
l50b5h:
	nop			;50b5	00 	. 
	nop			;50b6	00 	. 
l50b7h:
	nop			;50b7	00 	. 
	nop			;50b8	00 	. 
l50b9h:
	nop			;50b9	00 	. 
	nop			;50ba	00 	. 
l50bbh:
	nop			;50bb	00 	. 
l50bch:
	nop			;50bc	00 	. 
l50bdh:
	nop			;50bd	00 	. 
l50beh:
	nop			;50be	00 	. 
l50bfh:
	nop			;50bf	00 	. 
l50c0h:
	nop			;50c0	00 	. 
l50c1h:
	nop			;50c1	00 	. 
	nop			;50c2	00 	. 
l50c3h:
	nop			;50c3	00 	. 
	nop			;50c4	00 	. 
l50c5h:
	nop			;50c5	00 	. 
	nop			;50c6	00 	. 
l50c7h:
	nop			;50c7	00 	. 
	nop			;50c8	00 	. 
l50c9h:
	nop			;50c9	00 	. 
	nop			;50ca	00 	. 
l50cbh:
	nop			;50cb	00 	. 
	nop			;50cc	00 	. 
	nop			;50cd	00 	. 
	nop			;50ce	00 	. 
	nop			;50cf	00 	. 
	nop			;50d0	00 	. 
	nop			;50d1	00 	. 
	nop			;50d2	00 	. 
	nop			;50d3	00 	. 
	nop			;50d4	00 	. 
	nop			;50d5	00 	. 
	nop			;50d6	00 	. 
	nop			;50d7	00 	. 
	nop			;50d8	00 	. 
	nop			;50d9	00 	. 
	nop			;50da	00 	. 
	nop			;50db	00 	. 
	nop			;50dc	00 	. 
	nop			;50dd	00 	. 
	nop			;50de	00 	. 
	nop			;50df	00 	. 
	nop			;50e0	00 	. 
	nop			;50e1	00 	. 
	nop			;50e2	00 	. 
	nop			;50e3	00 	. 
	nop			;50e4	00 	. 
	nop			;50e5	00 	. 
	nop			;50e6	00 	. 
	nop			;50e7	00 	. 
	nop			;50e8	00 	. 
	nop			;50e9	00 	. 
	nop			;50ea	00 	. 
	nop			;50eb	00 	. 
	nop			;50ec	00 	. 
	nop			;50ed	00 	. 
	nop			;50ee	00 	. 
	nop			;50ef	00 	. 
	nop			;50f0	00 	. 
	nop			;50f1	00 	. 
	nop			;50f2	00 	. 
	nop			;50f3	00 	. 
	nop			;50f4	00 	. 
	nop			;50f5	00 	. 
	nop			;50f6	00 	. 
	nop			;50f7	00 	. 
	nop			;50f8	00 	. 
	nop			;50f9	00 	. 
	nop			;50fa	00 	. 
	nop			;50fb	00 	. 
	nop			;50fc	00 	. 
	nop			;50fd	00 	. 
	nop			;50fe	00 	. 
	nop			;50ff	00 	. 
	nop			;5100	00 	. 
	nop			;5101	00 	. 
	nop			;5102	00 	. 
	nop			;5103	00 	. 
	nop			;5104	00 	. 
	nop			;5105	00 	. 
	nop			;5106	00 	. 
	nop			;5107	00 	. 
	nop			;5108	00 	. 
	nop			;5109	00 	. 
	nop			;510a	00 	. 
	nop			;510b	00 	. 
	nop			;510c	00 	. 
	nop			;510d	00 	. 
	nop			;510e	00 	. 
	nop			;510f	00 	. 
	nop			;5110	00 	. 
	nop			;5111	00 	. 
	nop			;5112	00 	. 
	nop			;5113	00 	. 
	nop			;5114	00 	. 
	nop			;5115	00 	. 
	nop			;5116	00 	. 
	nop			;5117	00 	. 
	nop			;5118	00 	. 
	nop			;5119	00 	. 
	nop			;511a	00 	. 
	nop			;511b	00 	. 
	nop			;511c	00 	. 
	nop			;511d	00 	. 
	nop			;511e	00 	. 
	nop			;511f	00 	. 
	nop			;5120	00 	. 
l5121h:
	nop			;5121	00 	. 
	nop			;5122	00 	. 
	nop			;5123	00 	. 
	nop			;5124	00 	. 
	nop			;5125	00 	. 
	nop			;5126	00 	. 
	nop			;5127	00 	. 
	nop			;5128	00 	. 
	nop			;5129	00 	. 
	nop			;512a	00 	. 
	nop			;512b	00 	. 
	nop			;512c	00 	. 
	nop			;512d	00 	. 
	nop			;512e	00 	. 
	nop			;512f	00 	. 
	nop			;5130	00 	. 
	nop			;5131	00 	. 
	nop			;5132	00 	. 
	nop			;5133	00 	. 
	nop			;5134	00 	. 
	nop			;5135	00 	. 
	nop			;5136	00 	. 
	nop			;5137	00 	. 
	nop			;5138	00 	. 
	nop			;5139	00 	. 
	nop			;513a	00 	. 
	nop			;513b	00 	. 
	nop			;513c	00 	. 
	nop			;513d	00 	. 
	nop			;513e	00 	. 
	nop			;513f	00 	. 
	nop			;5140	00 	. 
	nop			;5141	00 	. 
	nop			;5142	00 	. 
	nop			;5143	00 	. 
	nop			;5144	00 	. 
	nop			;5145	00 	. 
	nop			;5146	00 	. 
	nop			;5147	00 	. 
	nop			;5148	00 	. 
	nop			;5149	00 	. 
	nop			;514a	00 	. 
	nop			;514b	00 	. 
	nop			;514c	00 	. 
	nop			;514d	00 	. 
	nop			;514e	00 	. 
	nop			;514f	00 	. 
	nop			;5150	00 	. 
	nop			;5151	00 	. 
	nop			;5152	00 	. 
	nop			;5153	00 	. 
	nop			;5154	00 	. 
	nop			;5155	00 	. 
	nop			;5156	00 	. 
	nop			;5157	00 	. 
	nop			;5158	00 	. 
	nop			;5159	00 	. 
	nop			;515a	00 	. 
	nop			;515b	00 	. 
	nop			;515c	00 	. 
	nop			;515d	00 	. 
	nop			;515e	00 	. 
	nop			;515f	00 	. 
	nop			;5160	00 	. 
l5161h:
	nop			;5161	00 	. 
	nop			;5162	00 	. 
	nop			;5163	00 	. 
	nop			;5164	00 	. 
	nop			;5165	00 	. 
	nop			;5166	00 	. 
	nop			;5167	00 	. 
	nop			;5168	00 	. 
	nop			;5169	00 	. 
	nop			;516a	00 	. 
	nop			;516b	00 	. 
	nop			;516c	00 	. 
	nop			;516d	00 	. 
	nop			;516e	00 	. 
	nop			;516f	00 	. 
	nop			;5170	00 	. 
	nop			;5171	00 	. 
	nop			;5172	00 	. 
	nop			;5173	00 	. 
	nop			;5174	00 	. 
	nop			;5175	00 	. 
	nop			;5176	00 	. 
	nop			;5177	00 	. 
	nop			;5178	00 	. 
	nop			;5179	00 	. 
	nop			;517a	00 	. 
	nop			;517b	00 	. 
	nop			;517c	00 	. 
	nop			;517d	00 	. 
	nop			;517e	00 	. 
	nop			;517f	00 	. 
	nop			;5180	00 	. 
	nop			;5181	00 	. 
	nop			;5182	00 	. 
	nop			;5183	00 	. 
	nop			;5184	00 	. 
	nop			;5185	00 	. 
	nop			;5186	00 	. 
	nop			;5187	00 	. 
	nop			;5188	00 	. 
	nop			;5189	00 	. 
	nop			;518a	00 	. 
	nop			;518b	00 	. 
	nop			;518c	00 	. 
	nop			;518d	00 	. 
	nop			;518e	00 	. 
	nop			;518f	00 	. 
	nop			;5190	00 	. 
	nop			;5191	00 	. 
	nop			;5192	00 	. 
	nop			;5193	00 	. 
	nop			;5194	00 	. 
	nop			;5195	00 	. 
	nop			;5196	00 	. 
	nop			;5197	00 	. 
	nop			;5198	00 	. 
	nop			;5199	00 	. 
	nop			;519a	00 	. 
	nop			;519b	00 	. 
	nop			;519c	00 	. 
	nop			;519d	00 	. 
	nop			;519e	00 	. 
	nop			;519f	00 	. 
	nop			;51a0	00 	. 
	nop			;51a1	00 	. 
	nop			;51a2	00 	. 
	nop			;51a3	00 	. 
	nop			;51a4	00 	. 
	nop			;51a5	00 	. 
	nop			;51a6	00 	. 
	nop			;51a7	00 	. 
	nop			;51a8	00 	. 
	nop			;51a9	00 	. 
	nop			;51aa	00 	. 
	nop			;51ab	00 	. 
	nop			;51ac	00 	. 
	nop			;51ad	00 	. 
	nop			;51ae	00 	. 
	nop			;51af	00 	. 
	nop			;51b0	00 	. 
	nop			;51b1	00 	. 
	nop			;51b2	00 	. 
	nop			;51b3	00 	. 
	nop			;51b4	00 	. 
	nop			;51b5	00 	. 
	nop			;51b6	00 	. 
	nop			;51b7	00 	. 
	nop			;51b8	00 	. 
	nop			;51b9	00 	. 
	nop			;51ba	00 	. 
	nop			;51bb	00 	. 
	nop			;51bc	00 	. 
	nop			;51bd	00 	. 
	nop			;51be	00 	. 
	nop			;51bf	00 	. 
	nop			;51c0	00 	. 
	nop			;51c1	00 	. 
	nop			;51c2	00 	. 
	nop			;51c3	00 	. 
	nop			;51c4	00 	. 
	nop			;51c5	00 	. 
	nop			;51c6	00 	. 
	nop			;51c7	00 	. 
	nop			;51c8	00 	. 
	nop			;51c9	00 	. 
	nop			;51ca	00 	. 
	nop			;51cb	00 	. 
	nop			;51cc	00 	. 
	nop			;51cd	00 	. 
	nop			;51ce	00 	. 
	nop			;51cf	00 	. 
	nop			;51d0	00 	. 
	nop			;51d1	00 	. 
	nop			;51d2	00 	. 
	nop			;51d3	00 	. 
	nop			;51d4	00 	. 
	nop			;51d5	00 	. 
	nop			;51d6	00 	. 
	nop			;51d7	00 	. 
	nop			;51d8	00 	. 
	nop			;51d9	00 	. 
	nop			;51da	00 	. 
	nop			;51db	00 	. 
	nop			;51dc	00 	. 
	nop			;51dd	00 	. 
	nop			;51de	00 	. 
	nop			;51df	00 	. 
	nop			;51e0	00 	. 
	nop			;51e1	00 	. 
	nop			;51e2	00 	. 
	nop			;51e3	00 	. 
	nop			;51e4	00 	. 
	nop			;51e5	00 	. 
	nop			;51e6	00 	. 
	nop			;51e7	00 	. 
	nop			;51e8	00 	. 
	nop			;51e9	00 	. 
	nop			;51ea	00 	. 
	nop			;51eb	00 	. 
	nop			;51ec	00 	. 
	nop			;51ed	00 	. 
	nop			;51ee	00 	. 
	nop			;51ef	00 	. 
	nop			;51f0	00 	. 
	nop			;51f1	00 	. 
	nop			;51f2	00 	. 
	nop			;51f3	00 	. 
	nop			;51f4	00 	. 
	nop			;51f5	00 	. 
	nop			;51f6	00 	. 
	nop			;51f7	00 	. 
	nop			;51f8	00 	. 
	nop			;51f9	00 	. 
	nop			;51fa	00 	. 
	nop			;51fb	00 	. 
	nop			;51fc	00 	. 
	nop			;51fd	00 	. 
	nop			;51fe	00 	. 
	nop			;51ff	00 	. 
	nop			;5200	00 	. 
	nop			;5201	00 	. 
	nop			;5202	00 	. 
	nop			;5203	00 	. 
	nop			;5204	00 	. 
	nop			;5205	00 	. 
	nop			;5206	00 	. 
	nop			;5207	00 	. 
	nop			;5208	00 	. 
	nop			;5209	00 	. 
	nop			;520a	00 	. 
	nop			;520b	00 	. 
	nop			;520c	00 	. 
	nop			;520d	00 	. 
	nop			;520e	00 	. 
	nop			;520f	00 	. 
	nop			;5210	00 	. 
	nop			;5211	00 	. 
	nop			;5212	00 	. 
	nop			;5213	00 	. 
	nop			;5214	00 	. 
	nop			;5215	00 	. 
	nop			;5216	00 	. 
	nop			;5217	00 	. 
	nop			;5218	00 	. 
	nop			;5219	00 	. 
	nop			;521a	00 	. 
	nop			;521b	00 	. 
	nop			;521c	00 	. 
	nop			;521d	00 	. 
	nop			;521e	00 	. 
	nop			;521f	00 	. 
	nop			;5220	00 	. 
	nop			;5221	00 	. 
	nop			;5222	00 	. 
	nop			;5223	00 	. 
	nop			;5224	00 	. 
	nop			;5225	00 	. 
	nop			;5226	00 	. 
	nop			;5227	00 	. 
	nop			;5228	00 	. 
	nop			;5229	00 	. 
	nop			;522a	00 	. 
	nop			;522b	00 	. 
	nop			;522c	00 	. 
	nop			;522d	00 	. 
	nop			;522e	00 	. 
	nop			;522f	00 	. 
	nop			;5230	00 	. 
	nop			;5231	00 	. 
	nop			;5232	00 	. 
	nop			;5233	00 	. 
	nop			;5234	00 	. 
	nop			;5235	00 	. 
	nop			;5236	00 	. 
	nop			;5237	00 	. 
	nop			;5238	00 	. 
	nop			;5239	00 	. 
	nop			;523a	00 	. 
	nop			;523b	00 	. 
	nop			;523c	00 	. 
	nop			;523d	00 	. 
	nop			;523e	00 	. 
	nop			;523f	00 	. 
	nop			;5240	00 	. 
	nop			;5241	00 	. 
	nop			;5242	00 	. 
	nop			;5243	00 	. 
	nop			;5244	00 	. 
	nop			;5245	00 	. 
	nop			;5246	00 	. 
	nop			;5247	00 	. 
	nop			;5248	00 	. 
	nop			;5249	00 	. 
	nop			;524a	00 	. 
	nop			;524b	00 	. 
	nop			;524c	00 	. 
	nop			;524d	00 	. 
	nop			;524e	00 	. 
	nop			;524f	00 	. 
	nop			;5250	00 	. 
	nop			;5251	00 	. 
	nop			;5252	00 	. 
	nop			;5253	00 	. 
	nop			;5254	00 	. 
	nop			;5255	00 	. 
	nop			;5256	00 	. 
	nop			;5257	00 	. 
	nop			;5258	00 	. 
	nop			;5259	00 	. 
	nop			;525a	00 	. 
	nop			;525b	00 	. 
	nop			;525c	00 	. 
	nop			;525d	00 	. 
	nop			;525e	00 	. 
	nop			;525f	00 	. 
	nop			;5260	00 	. 
	nop			;5261	00 	. 
	nop			;5262	00 	. 
	nop			;5263	00 	. 
	nop			;5264	00 	. 
	nop			;5265	00 	. 
	nop			;5266	00 	. 
	nop			;5267	00 	. 
	nop			;5268	00 	. 
	nop			;5269	00 	. 
	nop			;526a	00 	. 
	nop			;526b	00 	. 
	nop			;526c	00 	. 
	nop			;526d	00 	. 
	nop			;526e	00 	. 
	nop			;526f	00 	. 
	nop			;5270	00 	. 
	nop			;5271	00 	. 
	nop			;5272	00 	. 
	nop			;5273	00 	. 
	nop			;5274	00 	. 
	nop			;5275	00 	. 
	nop			;5276	00 	. 
	nop			;5277	00 	. 
	nop			;5278	00 	. 
	nop			;5279	00 	. 
	nop			;527a	00 	. 
	nop			;527b	00 	. 
	nop			;527c	00 	. 
	nop			;527d	00 	. 
	nop			;527e	00 	. 
	nop			;527f	00 	. 
	nop			;5280	00 	. 
	nop			;5281	00 	. 
	nop			;5282	00 	. 
	nop			;5283	00 	. 
	nop			;5284	00 	. 
	nop			;5285	00 	. 
	nop			;5286	00 	. 
	nop			;5287	00 	. 
	nop			;5288	00 	. 
	nop			;5289	00 	. 
	nop			;528a	00 	. 
	nop			;528b	00 	. 
	nop			;528c	00 	. 
	nop			;528d	00 	. 
	nop			;528e	00 	. 
	nop			;528f	00 	. 
	nop			;5290	00 	. 
	nop			;5291	00 	. 
	nop			;5292	00 	. 
	nop			;5293	00 	. 
	nop			;5294	00 	. 
	nop			;5295	00 	. 
	nop			;5296	00 	. 
	nop			;5297	00 	. 
	nop			;5298	00 	. 
	nop			;5299	00 	. 
	nop			;529a	00 	. 
	nop			;529b	00 	. 
	nop			;529c	00 	. 
	nop			;529d	00 	. 
	nop			;529e	00 	. 
	nop			;529f	00 	. 
	nop			;52a0	00 	. 
	nop			;52a1	00 	. 
	nop			;52a2	00 	. 
	nop			;52a3	00 	. 
	nop			;52a4	00 	. 
	nop			;52a5	00 	. 
	nop			;52a6	00 	. 
	nop			;52a7	00 	. 
	nop			;52a8	00 	. 
	nop			;52a9	00 	. 
	nop			;52aa	00 	. 
	nop			;52ab	00 	. 
	nop			;52ac	00 	. 
	nop			;52ad	00 	. 
	nop			;52ae	00 	. 
	nop			;52af	00 	. 
	nop			;52b0	00 	. 
	nop			;52b1	00 	. 
	nop			;52b2	00 	. 
	nop			;52b3	00 	. 
	nop			;52b4	00 	. 
	nop			;52b5	00 	. 
	nop			;52b6	00 	. 
	nop			;52b7	00 	. 
	nop			;52b8	00 	. 
	nop			;52b9	00 	. 
	nop			;52ba	00 	. 
	nop			;52bb	00 	. 
	nop			;52bc	00 	. 
	nop			;52bd	00 	. 
	nop			;52be	00 	. 
	nop			;52bf	00 	. 
	nop			;52c0	00 	. 
	nop			;52c1	00 	. 
	nop			;52c2	00 	. 
	nop			;52c3	00 	. 
	nop			;52c4	00 	. 
	nop			;52c5	00 	. 
	nop			;52c6	00 	. 
	nop			;52c7	00 	. 
	nop			;52c8	00 	. 
	nop			;52c9	00 	. 
	nop			;52ca	00 	. 
	nop			;52cb	00 	. 
	nop			;52cc	00 	. 
	nop			;52cd	00 	. 
	nop			;52ce	00 	. 
	nop			;52cf	00 	. 
	nop			;52d0	00 	. 
	nop			;52d1	00 	. 
	nop			;52d2	00 	. 
	nop			;52d3	00 	. 
	nop			;52d4	00 	. 
	nop			;52d5	00 	. 
	nop			;52d6	00 	. 
	nop			;52d7	00 	. 
	nop			;52d8	00 	. 
	nop			;52d9	00 	. 
	nop			;52da	00 	. 
	nop			;52db	00 	. 
	nop			;52dc	00 	. 
	nop			;52dd	00 	. 
	nop			;52de	00 	. 
	nop			;52df	00 	. 
	nop			;52e0	00 	. 
	nop			;52e1	00 	. 
	nop			;52e2	00 	. 
	nop			;52e3	00 	. 
	nop			;52e4	00 	. 
	nop			;52e5	00 	. 
	nop			;52e6	00 	. 
	nop			;52e7	00 	. 
	nop			;52e8	00 	. 
	nop			;52e9	00 	. 
	nop			;52ea	00 	. 
	nop			;52eb	00 	. 
	nop			;52ec	00 	. 
	nop			;52ed	00 	. 
	nop			;52ee	00 	. 
	nop			;52ef	00 	. 
	nop			;52f0	00 	. 
	nop			;52f1	00 	. 
	nop			;52f2	00 	. 
	nop			;52f3	00 	. 
	nop			;52f4	00 	. 
	nop			;52f5	00 	. 
	nop			;52f6	00 	. 
	nop			;52f7	00 	. 
	nop			;52f8	00 	. 
	nop			;52f9	00 	. 
	nop			;52fa	00 	. 
	nop			;52fb	00 	. 
	nop			;52fc	00 	. 
	nop			;52fd	00 	. 
	nop			;52fe	00 	. 
	nop			;52ff	00 	. 
	nop			;5300	00 	. 
	nop			;5301	00 	. 
	nop			;5302	00 	. 
	nop			;5303	00 	. 
	nop			;5304	00 	. 
	nop			;5305	00 	. 
	nop			;5306	00 	. 
	nop			;5307	00 	. 
	nop			;5308	00 	. 
	nop			;5309	00 	. 
	nop			;530a	00 	. 
	nop			;530b	00 	. 
	nop			;530c	00 	. 
	nop			;530d	00 	. 
	nop			;530e	00 	. 
	nop			;530f	00 	. 
	nop			;5310	00 	. 
	nop			;5311	00 	. 
	nop			;5312	00 	. 
	nop			;5313	00 	. 
	nop			;5314	00 	. 
	nop			;5315	00 	. 
	nop			;5316	00 	. 
	nop			;5317	00 	. 
	nop			;5318	00 	. 
	nop			;5319	00 	. 
	nop			;531a	00 	. 
	nop			;531b	00 	. 
	nop			;531c	00 	. 
	nop			;531d	00 	. 
	nop			;531e	00 	. 
	nop			;531f	00 	. 
	nop			;5320	00 	. 
	nop			;5321	00 	. 
	nop			;5322	00 	. 
	nop			;5323	00 	. 
	nop			;5324	00 	. 
	nop			;5325	00 	. 
	nop			;5326	00 	. 
	nop			;5327	00 	. 
	nop			;5328	00 	. 
	nop			;5329	00 	. 
	nop			;532a	00 	. 
	nop			;532b	00 	. 
	nop			;532c	00 	. 
	nop			;532d	00 	. 
	nop			;532e	00 	. 
	nop			;532f	00 	. 
	nop			;5330	00 	. 
	nop			;5331	00 	. 
	nop			;5332	00 	. 
	nop			;5333	00 	. 
	nop			;5334	00 	. 
	nop			;5335	00 	. 
	nop			;5336	00 	. 
	nop			;5337	00 	. 
	nop			;5338	00 	. 
	nop			;5339	00 	. 
	nop			;533a	00 	. 
	nop			;533b	00 	. 
	nop			;533c	00 	. 
	nop			;533d	00 	. 
	nop			;533e	00 	. 
	nop			;533f	00 	. 
	nop			;5340	00 	. 
	nop			;5341	00 	. 
	nop			;5342	00 	. 
	nop			;5343	00 	. 
	nop			;5344	00 	. 
	nop			;5345	00 	. 
	nop			;5346	00 	. 
	nop			;5347	00 	. 
	nop			;5348	00 	. 
	nop			;5349	00 	. 
	nop			;534a	00 	. 
	nop			;534b	00 	. 
	nop			;534c	00 	. 
	nop			;534d	00 	. 
	nop			;534e	00 	. 
	nop			;534f	00 	. 
	nop			;5350	00 	. 
	nop			;5351	00 	. 
l5352h:
	nop			;5352	00 	. 
	nop			;5353	00 	. 
	nop			;5354	00 	. 
	nop			;5355	00 	. 
	nop			;5356	00 	. 
	nop			;5357	00 	. 
	nop			;5358	00 	. 
	nop			;5359	00 	. 
	nop			;535a	00 	. 
	nop			;535b	00 	. 
	nop			;535c	00 	. 
	nop			;535d	00 	. 
	nop			;535e	00 	. 
	nop			;535f	00 	. 
	nop			;5360	00 	. 
	nop			;5361	00 	. 
	nop			;5362	00 	. 
	nop			;5363	00 	. 
	nop			;5364	00 	. 
	nop			;5365	00 	. 
	nop			;5366	00 	. 
	nop			;5367	00 	. 
	nop			;5368	00 	. 
	nop			;5369	00 	. 
	nop			;536a	00 	. 
	nop			;536b	00 	. 
	nop			;536c	00 	. 
	nop			;536d	00 	. 
	nop			;536e	00 	. 
	nop			;536f	00 	. 
	nop			;5370	00 	. 
	nop			;5371	00 	. 
	nop			;5372	00 	. 
	nop			;5373	00 	. 
	nop			;5374	00 	. 
	nop			;5375	00 	. 
	nop			;5376	00 	. 
	nop			;5377	00 	. 
	nop			;5378	00 	. 
	nop			;5379	00 	. 
	nop			;537a	00 	. 
	nop			;537b	00 	. 
	nop			;537c	00 	. 
	nop			;537d	00 	. 
	nop			;537e	00 	. 
	nop			;537f	00 	. 
	nop			;5380	00 	. 
	nop			;5381	00 	. 
	nop			;5382	00 	. 
	nop			;5383	00 	. 
	nop			;5384	00 	. 
	nop			;5385	00 	. 
	nop			;5386	00 	. 
	nop			;5387	00 	. 
	nop			;5388	00 	. 
	nop			;5389	00 	. 
	nop			;538a	00 	. 
	nop			;538b	00 	. 
	nop			;538c	00 	. 
	nop			;538d	00 	. 
	nop			;538e	00 	. 
	nop			;538f	00 	. 
	nop			;5390	00 	. 
	nop			;5391	00 	. 
	nop			;5392	00 	. 
	nop			;5393	00 	. 
	nop			;5394	00 	. 
	nop			;5395	00 	. 
	nop			;5396	00 	. 
	nop			;5397	00 	. 
	nop			;5398	00 	. 
	nop			;5399	00 	. 
	nop			;539a	00 	. 
	nop			;539b	00 	. 
	nop			;539c	00 	. 
	nop			;539d	00 	. 
	nop			;539e	00 	. 
	nop			;539f	00 	. 
	nop			;53a0	00 	. 
	nop			;53a1	00 	. 
	nop			;53a2	00 	. 
	nop			;53a3	00 	. 
	nop			;53a4	00 	. 
	nop			;53a5	00 	. 
	nop			;53a6	00 	. 
	nop			;53a7	00 	. 
	nop			;53a8	00 	. 
	nop			;53a9	00 	. 
	nop			;53aa	00 	. 
	nop			;53ab	00 	. 
	nop			;53ac	00 	. 
	nop			;53ad	00 	. 
	nop			;53ae	00 	. 
	nop			;53af	00 	. 
	nop			;53b0	00 	. 
	nop			;53b1	00 	. 
	nop			;53b2	00 	. 
	nop			;53b3	00 	. 
	nop			;53b4	00 	. 
	nop			;53b5	00 	. 
	nop			;53b6	00 	. 
	nop			;53b7	00 	. 
	nop			;53b8	00 	. 
	nop			;53b9	00 	. 
	nop			;53ba	00 	. 
	nop			;53bb	00 	. 
	nop			;53bc	00 	. 
	nop			;53bd	00 	. 
	nop			;53be	00 	. 
	nop			;53bf	00 	. 
	nop			;53c0	00 	. 
	nop			;53c1	00 	. 
	nop			;53c2	00 	. 
	nop			;53c3	00 	. 
	nop			;53c4	00 	. 
	nop			;53c5	00 	. 
	nop			;53c6	00 	. 
	nop			;53c7	00 	. 
	nop			;53c8	00 	. 
	nop			;53c9	00 	. 
	nop			;53ca	00 	. 
	nop			;53cb	00 	. 
	nop			;53cc	00 	. 
	nop			;53cd	00 	. 
	nop			;53ce	00 	. 
	nop			;53cf	00 	. 
	nop			;53d0	00 	. 
	nop			;53d1	00 	. 
	nop			;53d2	00 	. 
	nop			;53d3	00 	. 
	nop			;53d4	00 	. 
	nop			;53d5	00 	. 
	nop			;53d6	00 	. 
	nop			;53d7	00 	. 
	nop			;53d8	00 	. 
	nop			;53d9	00 	. 
	nop			;53da	00 	. 
	nop			;53db	00 	. 
	nop			;53dc	00 	. 
	nop			;53dd	00 	. 
	nop			;53de	00 	. 
	nop			;53df	00 	. 
	nop			;53e0	00 	. 
	nop			;53e1	00 	. 
	nop			;53e2	00 	. 
	nop			;53e3	00 	. 
	nop			;53e4	00 	. 
	nop			;53e5	00 	. 
	nop			;53e6	00 	. 
	nop			;53e7	00 	. 
	nop			;53e8	00 	. 
	nop			;53e9	00 	. 
	nop			;53ea	00 	. 
	nop			;53eb	00 	. 
	nop			;53ec	00 	. 
	nop			;53ed	00 	. 
	nop			;53ee	00 	. 
	nop			;53ef	00 	. 
	nop			;53f0	00 	. 
	nop			;53f1	00 	. 
	nop			;53f2	00 	. 
	nop			;53f3	00 	. 
	nop			;53f4	00 	. 
	nop			;53f5	00 	. 
	nop			;53f6	00 	. 
	nop			;53f7	00 	. 
	nop			;53f8	00 	. 
	nop			;53f9	00 	. 
	nop			;53fa	00 	. 
	nop			;53fb	00 	. 
	nop			;53fc	00 	. 
	nop			;53fd	00 	. 
	nop			;53fe	00 	. 
	nop			;53ff	00 	. 
	nop			;5400	00 	. 
	nop			;5401	00 	. 
	nop			;5402	00 	. 
	nop			;5403	00 	. 
	nop			;5404	00 	. 
	nop			;5405	00 	. 
	nop			;5406	00 	. 
	nop			;5407	00 	. 
	nop			;5408	00 	. 
	nop			;5409	00 	. 
	nop			;540a	00 	. 
	nop			;540b	00 	. 
	nop			;540c	00 	. 
	nop			;540d	00 	. 
	nop			;540e	00 	. 
	nop			;540f	00 	. 
	nop			;5410	00 	. 
	nop			;5411	00 	. 
	nop			;5412	00 	. 
	nop			;5413	00 	. 
	nop			;5414	00 	. 
	nop			;5415	00 	. 
	nop			;5416	00 	. 
	nop			;5417	00 	. 
	nop			;5418	00 	. 
	nop			;5419	00 	. 
	nop			;541a	00 	. 
	nop			;541b	00 	. 
	nop			;541c	00 	. 
	nop			;541d	00 	. 
	nop			;541e	00 	. 
	nop			;541f	00 	. 
	nop			;5420	00 	. 
	nop			;5421	00 	. 
	nop			;5422	00 	. 
	nop			;5423	00 	. 
	nop			;5424	00 	. 
	nop			;5425	00 	. 
	nop			;5426	00 	. 
	nop			;5427	00 	. 
	nop			;5428	00 	. 
	nop			;5429	00 	. 
	nop			;542a	00 	. 
	nop			;542b	00 	. 
	nop			;542c	00 	. 
	nop			;542d	00 	. 
	nop			;542e	00 	. 
	nop			;542f	00 	. 
	nop			;5430	00 	. 
	nop			;5431	00 	. 
	nop			;5432	00 	. 
	nop			;5433	00 	. 
	nop			;5434	00 	. 
	nop			;5435	00 	. 
	nop			;5436	00 	. 
	nop			;5437	00 	. 
	nop			;5438	00 	. 
	nop			;5439	00 	. 
	nop			;543a	00 	. 
	nop			;543b	00 	. 
	nop			;543c	00 	. 
	nop			;543d	00 	. 
	nop			;543e	00 	. 
	nop			;543f	00 	. 
	nop			;5440	00 	. 
	nop			;5441	00 	. 
	nop			;5442	00 	. 
	nop			;5443	00 	. 
	nop			;5444	00 	. 
	nop			;5445	00 	. 
	nop			;5446	00 	. 
	nop			;5447	00 	. 
	nop			;5448	00 	. 
	nop			;5449	00 	. 
	nop			;544a	00 	. 
	nop			;544b	00 	. 
	nop			;544c	00 	. 
	nop			;544d	00 	. 
	nop			;544e	00 	. 
	nop			;544f	00 	. 
	nop			;5450	00 	. 
	nop			;5451	00 	. 
	nop			;5452	00 	. 
	nop			;5453	00 	. 
	nop			;5454	00 	. 
	nop			;5455	00 	. 
	nop			;5456	00 	. 
	nop			;5457	00 	. 
	nop			;5458	00 	. 
	nop			;5459	00 	. 
	nop			;545a	00 	. 
	nop			;545b	00 	. 
	nop			;545c	00 	. 
	nop			;545d	00 	. 
	nop			;545e	00 	. 
	nop			;545f	00 	. 
	nop			;5460	00 	. 
	nop			;5461	00 	. 
	nop			;5462	00 	. 
	nop			;5463	00 	. 
	nop			;5464	00 	. 
	nop			;5465	00 	. 
	nop			;5466	00 	. 
	nop			;5467	00 	. 
	nop			;5468	00 	. 
	nop			;5469	00 	. 
	nop			;546a	00 	. 
	nop			;546b	00 	. 
	nop			;546c	00 	. 
	nop			;546d	00 	. 
	nop			;546e	00 	. 
	nop			;546f	00 	. 
	nop			;5470	00 	. 
	nop			;5471	00 	. 
	nop			;5472	00 	. 
	nop			;5473	00 	. 
	nop			;5474	00 	. 
	nop			;5475	00 	. 
	nop			;5476	00 	. 
	nop			;5477	00 	. 
	nop			;5478	00 	. 
	nop			;5479	00 	. 
	nop			;547a	00 	. 
	nop			;547b	00 	. 
	nop			;547c	00 	. 
	nop			;547d	00 	. 
	nop			;547e	00 	. 
	nop			;547f	00 	. 
	nop			;5480	00 	. 
	nop			;5481	00 	. 
	nop			;5482	00 	. 
	nop			;5483	00 	. 
	nop			;5484	00 	. 
	nop			;5485	00 	. 
	nop			;5486	00 	. 
	nop			;5487	00 	. 
	nop			;5488	00 	. 
	nop			;5489	00 	. 
	nop			;548a	00 	. 
	nop			;548b	00 	. 
	nop			;548c	00 	. 
	nop			;548d	00 	. 
	nop			;548e	00 	. 
	nop			;548f	00 	. 
	nop			;5490	00 	. 
	nop			;5491	00 	. 
	nop			;5492	00 	. 
	nop			;5493	00 	. 
	nop			;5494	00 	. 
	nop			;5495	00 	. 
	nop			;5496	00 	. 
	nop			;5497	00 	. 
	nop			;5498	00 	. 
	nop			;5499	00 	. 
	nop			;549a	00 	. 
	nop			;549b	00 	. 
	nop			;549c	00 	. 
	nop			;549d	00 	. 
	nop			;549e	00 	. 
	nop			;549f	00 	. 
	nop			;54a0	00 	. 
	nop			;54a1	00 	. 
	nop			;54a2	00 	. 
	nop			;54a3	00 	. 
	nop			;54a4	00 	. 
	nop			;54a5	00 	. 
	nop			;54a6	00 	. 
	nop			;54a7	00 	. 
	nop			;54a8	00 	. 
	nop			;54a9	00 	. 
	nop			;54aa	00 	. 
	nop			;54ab	00 	. 
	nop			;54ac	00 	. 
	nop			;54ad	00 	. 
	nop			;54ae	00 	. 
	nop			;54af	00 	. 
	nop			;54b0	00 	. 
	nop			;54b1	00 	. 
	nop			;54b2	00 	. 
	nop			;54b3	00 	. 
	nop			;54b4	00 	. 
	nop			;54b5	00 	. 
	nop			;54b6	00 	. 
	nop			;54b7	00 	. 
	nop			;54b8	00 	. 
	nop			;54b9	00 	. 
	nop			;54ba	00 	. 
	nop			;54bb	00 	. 
	nop			;54bc	00 	. 
	nop			;54bd	00 	. 
	nop			;54be	00 	. 
	nop			;54bf	00 	. 
	nop			;54c0	00 	. 
	nop			;54c1	00 	. 
	nop			;54c2	00 	. 
	nop			;54c3	00 	. 
	nop			;54c4	00 	. 
	nop			;54c5	00 	. 
	nop			;54c6	00 	. 
	nop			;54c7	00 	. 
	nop			;54c8	00 	. 
	nop			;54c9	00 	. 
	nop			;54ca	00 	. 
	nop			;54cb	00 	. 
	nop			;54cc	00 	. 
	nop			;54cd	00 	. 
	nop			;54ce	00 	. 
	nop			;54cf	00 	. 
	nop			;54d0	00 	. 
	nop			;54d1	00 	. 
	nop			;54d2	00 	. 
	nop			;54d3	00 	. 
	nop			;54d4	00 	. 
	nop			;54d5	00 	. 
	nop			;54d6	00 	. 
	nop			;54d7	00 	. 
	nop			;54d8	00 	. 
	nop			;54d9	00 	. 
	nop			;54da	00 	. 
	nop			;54db	00 	. 
	nop			;54dc	00 	. 
	nop			;54dd	00 	. 
	nop			;54de	00 	. 
	nop			;54df	00 	. 
	nop			;54e0	00 	. 
	nop			;54e1	00 	. 
	nop			;54e2	00 	. 
	nop			;54e3	00 	. 
	nop			;54e4	00 	. 
	nop			;54e5	00 	. 
	nop			;54e6	00 	. 
	nop			;54e7	00 	. 
	nop			;54e8	00 	. 
	nop			;54e9	00 	. 
	nop			;54ea	00 	. 
	nop			;54eb	00 	. 
	nop			;54ec	00 	. 
	nop			;54ed	00 	. 
	nop			;54ee	00 	. 
	nop			;54ef	00 	. 
	nop			;54f0	00 	. 
	nop			;54f1	00 	. 
	nop			;54f2	00 	. 
	nop			;54f3	00 	. 
	nop			;54f4	00 	. 
	nop			;54f5	00 	. 
	nop			;54f6	00 	. 
	nop			;54f7	00 	. 
	nop			;54f8	00 	. 
	nop			;54f9	00 	. 
	nop			;54fa	00 	. 
	nop			;54fb	00 	. 
	nop			;54fc	00 	. 
	nop			;54fd	00 	. 
	nop			;54fe	00 	. 
	nop			;54ff	00 	. 
	nop			;5500	00 	. 
	nop			;5501	00 	. 
	nop			;5502	00 	. 
	nop			;5503	00 	. 
	nop			;5504	00 	. 
	nop			;5505	00 	. 
	nop			;5506	00 	. 
	nop			;5507	00 	. 
	nop			;5508	00 	. 
	nop			;5509	00 	. 
	nop			;550a	00 	. 
	nop			;550b	00 	. 
	nop			;550c	00 	. 
	nop			;550d	00 	. 
	nop			;550e	00 	. 
	nop			;550f	00 	. 
	nop			;5510	00 	. 
	nop			;5511	00 	. 
	nop			;5512	00 	. 
	nop			;5513	00 	. 
	nop			;5514	00 	. 
	nop			;5515	00 	. 
	nop			;5516	00 	. 
	nop			;5517	00 	. 
	nop			;5518	00 	. 
	nop			;5519	00 	. 
	nop			;551a	00 	. 
	nop			;551b	00 	. 
	nop			;551c	00 	. 
	nop			;551d	00 	. 
	nop			;551e	00 	. 
	nop			;551f	00 	. 
	nop			;5520	00 	. 
	nop			;5521	00 	. 
l5522h:
	nop			;5522	00 	. 
	nop			;5523	00 	. 
	nop			;5524	00 	. 
	nop			;5525	00 	. 
	nop			;5526	00 	. 
	nop			;5527	00 	. 
	nop			;5528	00 	. 
	nop			;5529	00 	. 
	nop			;552a	00 	. 
	nop			;552b	00 	. 
	nop			;552c	00 	. 
	nop			;552d	00 	. 
	nop			;552e	00 	. 
	nop			;552f	00 	. 
	nop			;5530	00 	. 
	nop			;5531	00 	. 
	nop			;5532	00 	. 
	nop			;5533	00 	. 
	nop			;5534	00 	. 
	nop			;5535	00 	. 
	nop			;5536	00 	. 
	nop			;5537	00 	. 
	nop			;5538	00 	. 
	nop			;5539	00 	. 
	nop			;553a	00 	. 
	nop			;553b	00 	. 
	nop			;553c	00 	. 
	nop			;553d	00 	. 
	nop			;553e	00 	. 
	nop			;553f	00 	. 
	nop			;5540	00 	. 
	nop			;5541	00 	. 
	nop			;5542	00 	. 
	nop			;5543	00 	. 
	nop			;5544	00 	. 
	nop			;5545	00 	. 
	nop			;5546	00 	. 
	nop			;5547	00 	. 
	nop			;5548	00 	. 
	nop			;5549	00 	. 
	nop			;554a	00 	. 
	nop			;554b	00 	. 
	nop			;554c	00 	. 
	nop			;554d	00 	. 
	nop			;554e	00 	. 
	nop			;554f	00 	. 
	nop			;5550	00 	. 
	nop			;5551	00 	. 
	nop			;5552	00 	. 
	nop			;5553	00 	. 
	nop			;5554	00 	. 
	nop			;5555	00 	. 
	nop			;5556	00 	. 
	nop			;5557	00 	. 
	nop			;5558	00 	. 
	nop			;5559	00 	. 
	nop			;555a	00 	. 
	nop			;555b	00 	. 
	nop			;555c	00 	. 
	nop			;555d	00 	. 
	nop			;555e	00 	. 
	nop			;555f	00 	. 
	nop			;5560	00 	. 
	nop			;5561	00 	. 
	nop			;5562	00 	. 
	nop			;5563	00 	. 
	nop			;5564	00 	. 
	nop			;5565	00 	. 
	nop			;5566	00 	. 
	nop			;5567	00 	. 
	nop			;5568	00 	. 
	nop			;5569	00 	. 
	nop			;556a	00 	. 
	nop			;556b	00 	. 
	nop			;556c	00 	. 
	nop			;556d	00 	. 
	nop			;556e	00 	. 
	nop			;556f	00 	. 
	nop			;5570	00 	. 
	nop			;5571	00 	. 
	nop			;5572	00 	. 
	nop			;5573	00 	. 
	nop			;5574	00 	. 
	nop			;5575	00 	. 
	nop			;5576	00 	. 
	nop			;5577	00 	. 
	nop			;5578	00 	. 
	nop			;5579	00 	. 
	nop			;557a	00 	. 
	nop			;557b	00 	. 
	nop			;557c	00 	. 
	nop			;557d	00 	. 
	nop			;557e	00 	. 
	nop			;557f	00 	. 
	nop			;5580	00 	. 
	nop			;5581	00 	. 
	nop			;5582	00 	. 
	nop			;5583	00 	. 
	nop			;5584	00 	. 
	nop			;5585	00 	. 
	nop			;5586	00 	. 
	nop			;5587	00 	. 
	nop			;5588	00 	. 
	nop			;5589	00 	. 
	nop			;558a	00 	. 
	nop			;558b	00 	. 
	nop			;558c	00 	. 
	nop			;558d	00 	. 
	nop			;558e	00 	. 
	nop			;558f	00 	. 
	nop			;5590	00 	. 
	nop			;5591	00 	. 
	nop			;5592	00 	. 
	nop			;5593	00 	. 
	nop			;5594	00 	. 
	nop			;5595	00 	. 
	nop			;5596	00 	. 
	nop			;5597	00 	. 
	nop			;5598	00 	. 
	nop			;5599	00 	. 
	nop			;559a	00 	. 
	nop			;559b	00 	. 
	nop			;559c	00 	. 
	nop			;559d	00 	. 
	nop			;559e	00 	. 
	nop			;559f	00 	. 
	nop			;55a0	00 	. 
	nop			;55a1	00 	. 
	nop			;55a2	00 	. 
	nop			;55a3	00 	. 
	nop			;55a4	00 	. 
	nop			;55a5	00 	. 
	nop			;55a6	00 	. 
	nop			;55a7	00 	. 
	nop			;55a8	00 	. 
	nop			;55a9	00 	. 
	nop			;55aa	00 	. 
	nop			;55ab	00 	. 
	nop			;55ac	00 	. 
	nop			;55ad	00 	. 
	nop			;55ae	00 	. 
	nop			;55af	00 	. 
	nop			;55b0	00 	. 
	nop			;55b1	00 	. 
	nop			;55b2	00 	. 
	nop			;55b3	00 	. 
	nop			;55b4	00 	. 
	nop			;55b5	00 	. 
	nop			;55b6	00 	. 
	nop			;55b7	00 	. 
	nop			;55b8	00 	. 
	nop			;55b9	00 	. 
	nop			;55ba	00 	. 
	nop			;55bb	00 	. 
	nop			;55bc	00 	. 
	nop			;55bd	00 	. 
	nop			;55be	00 	. 
	nop			;55bf	00 	. 
	nop			;55c0	00 	. 
	nop			;55c1	00 	. 
	nop			;55c2	00 	. 
	nop			;55c3	00 	. 
	nop			;55c4	00 	. 
	nop			;55c5	00 	. 
	nop			;55c6	00 	. 
	nop			;55c7	00 	. 
	nop			;55c8	00 	. 
	nop			;55c9	00 	. 
	nop			;55ca	00 	. 
l55cbh:
	nop			;55cb	00 	. 
	nop			;55cc	00 	. 
	nop			;55cd	00 	. 
	nop			;55ce	00 	. 
	nop			;55cf	00 	. 
	nop			;55d0	00 	. 
	nop			;55d1	00 	. 
	nop			;55d2	00 	. 
	nop			;55d3	00 	. 
	nop			;55d4	00 	. 
	nop			;55d5	00 	. 
	nop			;55d6	00 	. 
	nop			;55d7	00 	. 
	nop			;55d8	00 	. 
	nop			;55d9	00 	. 
	nop			;55da	00 	. 
	nop			;55db	00 	. 
	nop			;55dc	00 	. 
	nop			;55dd	00 	. 
	nop			;55de	00 	. 
	nop			;55df	00 	. 
	nop			;55e0	00 	. 
	nop			;55e1	00 	. 
	nop			;55e2	00 	. 
	nop			;55e3	00 	. 
	nop			;55e4	00 	. 
	nop			;55e5	00 	. 
	nop			;55e6	00 	. 
	nop			;55e7	00 	. 
	nop			;55e8	00 	. 
	nop			;55e9	00 	. 
	nop			;55ea	00 	. 
	nop			;55eb	00 	. 
	nop			;55ec	00 	. 
	nop			;55ed	00 	. 
	nop			;55ee	00 	. 
	nop			;55ef	00 	. 
	nop			;55f0	00 	. 
	nop			;55f1	00 	. 
	nop			;55f2	00 	. 
	nop			;55f3	00 	. 
	nop			;55f4	00 	. 
	nop			;55f5	00 	. 
	nop			;55f6	00 	. 
	nop			;55f7	00 	. 
	nop			;55f8	00 	. 
	nop			;55f9	00 	. 
	nop			;55fa	00 	. 
	nop			;55fb	00 	. 
	nop			;55fc	00 	. 
	nop			;55fd	00 	. 
	nop			;55fe	00 	. 
	nop			;55ff	00 	. 
	nop			;5600	00 	. 
	nop			;5601	00 	. 
	nop			;5602	00 	. 
	nop			;5603	00 	. 
	nop			;5604	00 	. 
	nop			;5605	00 	. 
	nop			;5606	00 	. 
	nop			;5607	00 	. 
	nop			;5608	00 	. 
	nop			;5609	00 	. 
	nop			;560a	00 	. 
	nop			;560b	00 	. 
	nop			;560c	00 	. 
	nop			;560d	00 	. 
	nop			;560e	00 	. 
	nop			;560f	00 	. 
	nop			;5610	00 	. 
	nop			;5611	00 	. 
	nop			;5612	00 	. 
	nop			;5613	00 	. 
	nop			;5614	00 	. 
	nop			;5615	00 	. 
	nop			;5616	00 	. 
	nop			;5617	00 	. 
	nop			;5618	00 	. 
	nop			;5619	00 	. 
	nop			;561a	00 	. 
	nop			;561b	00 	. 
	nop			;561c	00 	. 
	nop			;561d	00 	. 
	nop			;561e	00 	. 
	nop			;561f	00 	. 
	nop			;5620	00 	. 
	nop			;5621	00 	. 
	nop			;5622	00 	. 
	nop			;5623	00 	. 
	nop			;5624	00 	. 
	nop			;5625	00 	. 
	nop			;5626	00 	. 
	nop			;5627	00 	. 
	nop			;5628	00 	. 
	nop			;5629	00 	. 
	nop			;562a	00 	. 
	nop			;562b	00 	. 
	nop			;562c	00 	. 
	nop			;562d	00 	. 
	nop			;562e	00 	. 
	nop			;562f	00 	. 
	nop			;5630	00 	. 
	nop			;5631	00 	. 
	nop			;5632	00 	. 
	nop			;5633	00 	. 
	nop			;5634	00 	. 
	nop			;5635	00 	. 
	nop			;5636	00 	. 
	nop			;5637	00 	. 
	nop			;5638	00 	. 
	nop			;5639	00 	. 
	nop			;563a	00 	. 
	nop			;563b	00 	. 
	nop			;563c	00 	. 
	nop			;563d	00 	. 
	nop			;563e	00 	. 
	nop			;563f	00 	. 
	nop			;5640	00 	. 
	nop			;5641	00 	. 
	nop			;5642	00 	. 
	nop			;5643	00 	. 
	nop			;5644	00 	. 
	nop			;5645	00 	. 
	nop			;5646	00 	. 
	nop			;5647	00 	. 
	nop			;5648	00 	. 
	nop			;5649	00 	. 
	nop			;564a	00 	. 
	nop			;564b	00 	. 
	nop			;564c	00 	. 
	nop			;564d	00 	. 
	nop			;564e	00 	. 
	nop			;564f	00 	. 
	nop			;5650	00 	. 
	nop			;5651	00 	. 
	nop			;5652	00 	. 
	nop			;5653	00 	. 
	nop			;5654	00 	. 
	nop			;5655	00 	. 
	nop			;5656	00 	. 
	nop			;5657	00 	. 
	nop			;5658	00 	. 
	nop			;5659	00 	. 
	nop			;565a	00 	. 
	nop			;565b	00 	. 
	nop			;565c	00 	. 
	nop			;565d	00 	. 
	nop			;565e	00 	. 
	nop			;565f	00 	. 
	nop			;5660	00 	. 
	nop			;5661	00 	. 
	nop			;5662	00 	. 
	nop			;5663	00 	. 
	nop			;5664	00 	. 
	nop			;5665	00 	. 
	nop			;5666	00 	. 
	nop			;5667	00 	. 
	nop			;5668	00 	. 
	nop			;5669	00 	. 
	nop			;566a	00 	. 
	nop			;566b	00 	. 
	nop			;566c	00 	. 
	nop			;566d	00 	. 
	nop			;566e	00 	. 
	nop			;566f	00 	. 
	nop			;5670	00 	. 
	nop			;5671	00 	. 
	nop			;5672	00 	. 
	nop			;5673	00 	. 
	nop			;5674	00 	. 
	nop			;5675	00 	. 
	nop			;5676	00 	. 
	nop			;5677	00 	. 
	nop			;5678	00 	. 
	nop			;5679	00 	. 
	nop			;567a	00 	. 
	nop			;567b	00 	. 
	nop			;567c	00 	. 
	nop			;567d	00 	. 
	nop			;567e	00 	. 
	nop			;567f	00 	. 
	nop			;5680	00 	. 
	nop			;5681	00 	. 
	nop			;5682	00 	. 
	nop			;5683	00 	. 
	nop			;5684	00 	. 
	nop			;5685	00 	. 
	nop			;5686	00 	. 
	nop			;5687	00 	. 
	nop			;5688	00 	. 
	nop			;5689	00 	. 
	nop			;568a	00 	. 
	nop			;568b	00 	. 
	nop			;568c	00 	. 
	nop			;568d	00 	. 
	nop			;568e	00 	. 
	nop			;568f	00 	. 
	nop			;5690	00 	. 
	nop			;5691	00 	. 
	nop			;5692	00 	. 
	nop			;5693	00 	. 
	nop			;5694	00 	. 
	nop			;5695	00 	. 
	nop			;5696	00 	. 
	nop			;5697	00 	. 
	nop			;5698	00 	. 
	nop			;5699	00 	. 
	nop			;569a	00 	. 
	nop			;569b	00 	. 
	nop			;569c	00 	. 
	nop			;569d	00 	. 
	nop			;569e	00 	. 
	nop			;569f	00 	. 
	nop			;56a0	00 	. 
	nop			;56a1	00 	. 
	nop			;56a2	00 	. 
	nop			;56a3	00 	. 
	nop			;56a4	00 	. 
	nop			;56a5	00 	. 
	nop			;56a6	00 	. 
	nop			;56a7	00 	. 
	nop			;56a8	00 	. 
	nop			;56a9	00 	. 
	nop			;56aa	00 	. 
	nop			;56ab	00 	. 
	nop			;56ac	00 	. 
	nop			;56ad	00 	. 
	nop			;56ae	00 	. 
	nop			;56af	00 	. 
	nop			;56b0	00 	. 
	nop			;56b1	00 	. 
	nop			;56b2	00 	. 
	nop			;56b3	00 	. 
	nop			;56b4	00 	. 
	nop			;56b5	00 	. 
	nop			;56b6	00 	. 
	nop			;56b7	00 	. 
	nop			;56b8	00 	. 
	nop			;56b9	00 	. 
	nop			;56ba	00 	. 
	nop			;56bb	00 	. 
	nop			;56bc	00 	. 
	nop			;56bd	00 	. 
	nop			;56be	00 	. 
	nop			;56bf	00 	. 
	nop			;56c0	00 	. 
	nop			;56c1	00 	. 
	nop			;56c2	00 	. 
	nop			;56c3	00 	. 
	nop			;56c4	00 	. 
	nop			;56c5	00 	. 
	nop			;56c6	00 	. 
	nop			;56c7	00 	. 
	nop			;56c8	00 	. 
	nop			;56c9	00 	. 
	nop			;56ca	00 	. 
	nop			;56cb	00 	. 
	nop			;56cc	00 	. 
	nop			;56cd	00 	. 
	nop			;56ce	00 	. 
	nop			;56cf	00 	. 
	nop			;56d0	00 	. 
	nop			;56d1	00 	. 
	nop			;56d2	00 	. 
	nop			;56d3	00 	. 
	nop			;56d4	00 	. 
	nop			;56d5	00 	. 
sub_56d6h:
	nop			;56d6	00 	. 
	nop			;56d7	00 	. 
	nop			;56d8	00 	. 
	nop			;56d9	00 	. 
	nop			;56da	00 	. 
	nop			;56db	00 	. 
	nop			;56dc	00 	. 
	nop			;56dd	00 	. 
	nop			;56de	00 	. 
	nop			;56df	00 	. 
	nop			;56e0	00 	. 
	nop			;56e1	00 	. 
	nop			;56e2	00 	. 
	nop			;56e3	00 	. 
	nop			;56e4	00 	. 
	nop			;56e5	00 	. 
	nop			;56e6	00 	. 
	nop			;56e7	00 	. 
	nop			;56e8	00 	. 
	nop			;56e9	00 	. 
	nop			;56ea	00 	. 
	nop			;56eb	00 	. 
	nop			;56ec	00 	. 
	nop			;56ed	00 	. 
	nop			;56ee	00 	. 
	nop			;56ef	00 	. 
	nop			;56f0	00 	. 
	nop			;56f1	00 	. 
	nop			;56f2	00 	. 
	nop			;56f3	00 	. 
	nop			;56f4	00 	. 
	nop			;56f5	00 	. 
	nop			;56f6	00 	. 
	nop			;56f7	00 	. 
	nop			;56f8	00 	. 
	nop			;56f9	00 	. 
	nop			;56fa	00 	. 
	nop			;56fb	00 	. 
	nop			;56fc	00 	. 
	nop			;56fd	00 	. 
	nop			;56fe	00 	. 
	nop			;56ff	00 	. 
	nop			;5700	00 	. 
	nop			;5701	00 	. 
	nop			;5702	00 	. 
	nop			;5703	00 	. 
	nop			;5704	00 	. 
	nop			;5705	00 	. 
	nop			;5706	00 	. 
	nop			;5707	00 	. 
	nop			;5708	00 	. 
	nop			;5709	00 	. 
	nop			;570a	00 	. 
	nop			;570b	00 	. 
	nop			;570c	00 	. 
	nop			;570d	00 	. 
	nop			;570e	00 	. 
	nop			;570f	00 	. 
	nop			;5710	00 	. 
	nop			;5711	00 	. 
	nop			;5712	00 	. 
	nop			;5713	00 	. 
	nop			;5714	00 	. 
	nop			;5715	00 	. 
	nop			;5716	00 	. 
	nop			;5717	00 	. 
	nop			;5718	00 	. 
	nop			;5719	00 	. 
	nop			;571a	00 	. 
	nop			;571b	00 	. 
	nop			;571c	00 	. 
	nop			;571d	00 	. 
	nop			;571e	00 	. 
	nop			;571f	00 	. 
	nop			;5720	00 	. 
	nop			;5721	00 	. 
	nop			;5722	00 	. 
	nop			;5723	00 	. 
	nop			;5724	00 	. 
	nop			;5725	00 	. 
	nop			;5726	00 	. 
	nop			;5727	00 	. 
	nop			;5728	00 	. 
	nop			;5729	00 	. 
	nop			;572a	00 	. 
	nop			;572b	00 	. 
	nop			;572c	00 	. 
	nop			;572d	00 	. 
	nop			;572e	00 	. 
	nop			;572f	00 	. 
	nop			;5730	00 	. 
	nop			;5731	00 	. 
	nop			;5732	00 	. 
	nop			;5733	00 	. 
	nop			;5734	00 	. 
	nop			;5735	00 	. 
	nop			;5736	00 	. 
	nop			;5737	00 	. 
	nop			;5738	00 	. 
	nop			;5739	00 	. 
	nop			;573a	00 	. 
	nop			;573b	00 	. 
	nop			;573c	00 	. 
	nop			;573d	00 	. 
	nop			;573e	00 	. 
	nop			;573f	00 	. 
	nop			;5740	00 	. 
	nop			;5741	00 	. 
	nop			;5742	00 	. 
	nop			;5743	00 	. 
	nop			;5744	00 	. 
	nop			;5745	00 	. 
	nop			;5746	00 	. 
	nop			;5747	00 	. 
	nop			;5748	00 	. 
	nop			;5749	00 	. 
	nop			;574a	00 	. 
	nop			;574b	00 	. 
	nop			;574c	00 	. 
	nop			;574d	00 	. 
	nop			;574e	00 	. 
	nop			;574f	00 	. 
	nop			;5750	00 	. 
	nop			;5751	00 	. 
	nop			;5752	00 	. 
	nop			;5753	00 	. 
	nop			;5754	00 	. 
	nop			;5755	00 	. 
	nop			;5756	00 	. 
	nop			;5757	00 	. 
	nop			;5758	00 	. 
	nop			;5759	00 	. 
	nop			;575a	00 	. 
	nop			;575b	00 	. 
	nop			;575c	00 	. 
	nop			;575d	00 	. 
	nop			;575e	00 	. 
	nop			;575f	00 	. 
	nop			;5760	00 	. 
	nop			;5761	00 	. 
	nop			;5762	00 	. 
	nop			;5763	00 	. 
	nop			;5764	00 	. 
	nop			;5765	00 	. 
	nop			;5766	00 	. 
	nop			;5767	00 	. 
	nop			;5768	00 	. 
	nop			;5769	00 	. 
	nop			;576a	00 	. 
	nop			;576b	00 	. 
	nop			;576c	00 	. 
	nop			;576d	00 	. 
	nop			;576e	00 	. 
	nop			;576f	00 	. 
	nop			;5770	00 	. 
	nop			;5771	00 	. 
	nop			;5772	00 	. 
	nop			;5773	00 	. 
	nop			;5774	00 	. 
	nop			;5775	00 	. 
	nop			;5776	00 	. 
	nop			;5777	00 	. 
	nop			;5778	00 	. 
	nop			;5779	00 	. 
	nop			;577a	00 	. 
	nop			;577b	00 	. 
	nop			;577c	00 	. 
	nop			;577d	00 	. 
	nop			;577e	00 	. 
	nop			;577f	00 	. 
	nop			;5780	00 	. 
	nop			;5781	00 	. 
	nop			;5782	00 	. 
	nop			;5783	00 	. 
	nop			;5784	00 	. 
	nop			;5785	00 	. 
	nop			;5786	00 	. 
	nop			;5787	00 	. 
	nop			;5788	00 	. 
	nop			;5789	00 	. 
	nop			;578a	00 	. 
	nop			;578b	00 	. 
	nop			;578c	00 	. 
	nop			;578d	00 	. 
	nop			;578e	00 	. 
	nop			;578f	00 	. 
	nop			;5790	00 	. 
	nop			;5791	00 	. 
	nop			;5792	00 	. 
	nop			;5793	00 	. 
	nop			;5794	00 	. 
	nop			;5795	00 	. 
	nop			;5796	00 	. 
	nop			;5797	00 	. 
	nop			;5798	00 	. 
	nop			;5799	00 	. 
	nop			;579a	00 	. 
	nop			;579b	00 	. 
	nop			;579c	00 	. 
	nop			;579d	00 	. 
	nop			;579e	00 	. 
	nop			;579f	00 	. 
	nop			;57a0	00 	. 
	nop			;57a1	00 	. 
	nop			;57a2	00 	. 
	nop			;57a3	00 	. 
	nop			;57a4	00 	. 
	nop			;57a5	00 	. 
	nop			;57a6	00 	. 
	nop			;57a7	00 	. 
	nop			;57a8	00 	. 
	nop			;57a9	00 	. 
	nop			;57aa	00 	. 
	nop			;57ab	00 	. 
	nop			;57ac	00 	. 
	nop			;57ad	00 	. 
	nop			;57ae	00 	. 
	nop			;57af	00 	. 
	nop			;57b0	00 	. 
	nop			;57b1	00 	. 
	nop			;57b2	00 	. 
	nop			;57b3	00 	. 
	nop			;57b4	00 	. 
	nop			;57b5	00 	. 
	nop			;57b6	00 	. 
	nop			;57b7	00 	. 
	nop			;57b8	00 	. 
	nop			;57b9	00 	. 
	nop			;57ba	00 	. 
	nop			;57bb	00 	. 
	nop			;57bc	00 	. 
	nop			;57bd	00 	. 
	nop			;57be	00 	. 
	nop			;57bf	00 	. 
	nop			;57c0	00 	. 
	nop			;57c1	00 	. 
	nop			;57c2	00 	. 
	nop			;57c3	00 	. 
	nop			;57c4	00 	. 
	nop			;57c5	00 	. 
	nop			;57c6	00 	. 
	nop			;57c7	00 	. 
	nop			;57c8	00 	. 
	nop			;57c9	00 	. 
	nop			;57ca	00 	. 
	nop			;57cb	00 	. 
	nop			;57cc	00 	. 
	nop			;57cd	00 	. 
	nop			;57ce	00 	. 
	nop			;57cf	00 	. 
	nop			;57d0	00 	. 
	nop			;57d1	00 	. 
	nop			;57d2	00 	. 
	nop			;57d3	00 	. 
	nop			;57d4	00 	. 
	nop			;57d5	00 	. 
	nop			;57d6	00 	. 
	nop			;57d7	00 	. 
	nop			;57d8	00 	. 
	nop			;57d9	00 	. 
	nop			;57da	00 	. 
	nop			;57db	00 	. 
	nop			;57dc	00 	. 
	nop			;57dd	00 	. 
	nop			;57de	00 	. 
	nop			;57df	00 	. 
	nop			;57e0	00 	. 
	nop			;57e1	00 	. 
	nop			;57e2	00 	. 
	nop			;57e3	00 	. 
	nop			;57e4	00 	. 
	nop			;57e5	00 	. 
	nop			;57e6	00 	. 
	nop			;57e7	00 	. 
	nop			;57e8	00 	. 
	nop			;57e9	00 	. 
	nop			;57ea	00 	. 
	nop			;57eb	00 	. 
	nop			;57ec	00 	. 
	nop			;57ed	00 	. 
	nop			;57ee	00 	. 
	nop			;57ef	00 	. 
	nop			;57f0	00 	. 
	nop			;57f1	00 	. 
	nop			;57f2	00 	. 
	nop			;57f3	00 	. 
	nop			;57f4	00 	. 
	nop			;57f5	00 	. 
	nop			;57f6	00 	. 
	nop			;57f7	00 	. 
	nop			;57f8	00 	. 
	nop			;57f9	00 	. 
	nop			;57fa	00 	. 
	nop			;57fb	00 	. 
	nop			;57fc	00 	. 
	nop			;57fd	00 	. 
	nop			;57fe	00 	. 
	nop			;57ff	00 	. 
	nop			;5800	00 	. 
	nop			;5801	00 	. 
	nop			;5802	00 	. 
	nop			;5803	00 	. 
	nop			;5804	00 	. 
	nop			;5805	00 	. 
	nop			;5806	00 	. 
	nop			;5807	00 	. 
	nop			;5808	00 	. 
	nop			;5809	00 	. 
	nop			;580a	00 	. 
	nop			;580b	00 	. 
	nop			;580c	00 	. 
	nop			;580d	00 	. 
	nop			;580e	00 	. 
	nop			;580f	00 	. 
	nop			;5810	00 	. 
	nop			;5811	00 	. 
	nop			;5812	00 	. 
	nop			;5813	00 	. 
	nop			;5814	00 	. 
	nop			;5815	00 	. 
	nop			;5816	00 	. 
	nop			;5817	00 	. 
	nop			;5818	00 	. 
	nop			;5819	00 	. 
	nop			;581a	00 	. 
	nop			;581b	00 	. 
	nop			;581c	00 	. 
	nop			;581d	00 	. 
	nop			;581e	00 	. 
	nop			;581f	00 	. 
	nop			;5820	00 	. 
	nop			;5821	00 	. 
	nop			;5822	00 	. 
	nop			;5823	00 	. 
	nop			;5824	00 	. 
	nop			;5825	00 	. 
	nop			;5826	00 	. 
	nop			;5827	00 	. 
	nop			;5828	00 	. 
	nop			;5829	00 	. 
	nop			;582a	00 	. 
	nop			;582b	00 	. 
	nop			;582c	00 	. 
	nop			;582d	00 	. 
	nop			;582e	00 	. 
	nop			;582f	00 	. 
	nop			;5830	00 	. 
	nop			;5831	00 	. 
	nop			;5832	00 	. 
	nop			;5833	00 	. 
	nop			;5834	00 	. 
	nop			;5835	00 	. 
	nop			;5836	00 	. 
	nop			;5837	00 	. 
	nop			;5838	00 	. 
	nop			;5839	00 	. 
	nop			;583a	00 	. 
	nop			;583b	00 	. 
	nop			;583c	00 	. 
	nop			;583d	00 	. 
	nop			;583e	00 	. 
	nop			;583f	00 	. 
	nop			;5840	00 	. 
	nop			;5841	00 	. 
	nop			;5842	00 	. 
	nop			;5843	00 	. 
	nop			;5844	00 	. 
	nop			;5845	00 	. 
	nop			;5846	00 	. 
	nop			;5847	00 	. 
	nop			;5848	00 	. 
	nop			;5849	00 	. 
	nop			;584a	00 	. 
	nop			;584b	00 	. 
	nop			;584c	00 	. 
	nop			;584d	00 	. 
	nop			;584e	00 	. 
	nop			;584f	00 	. 
	nop			;5850	00 	. 
	nop			;5851	00 	. 
	nop			;5852	00 	. 
	nop			;5853	00 	. 
	nop			;5854	00 	. 
	nop			;5855	00 	. 
	nop			;5856	00 	. 
	nop			;5857	00 	. 
	nop			;5858	00 	. 
	nop			;5859	00 	. 
	nop			;585a	00 	. 
	nop			;585b	00 	. 
	nop			;585c	00 	. 
	nop			;585d	00 	. 
	nop			;585e	00 	. 
	nop			;585f	00 	. 
	nop			;5860	00 	. 
	nop			;5861	00 	. 
	nop			;5862	00 	. 
	nop			;5863	00 	. 
	nop			;5864	00 	. 
	nop			;5865	00 	. 
	nop			;5866	00 	. 
	nop			;5867	00 	. 
	nop			;5868	00 	. 
	nop			;5869	00 	. 
	nop			;586a	00 	. 
	nop			;586b	00 	. 
	nop			;586c	00 	. 
	nop			;586d	00 	. 
	nop			;586e	00 	. 
	nop			;586f	00 	. 
	nop			;5870	00 	. 
	nop			;5871	00 	. 
	nop			;5872	00 	. 
	nop			;5873	00 	. 
	nop			;5874	00 	. 
	nop			;5875	00 	. 
	nop			;5876	00 	. 
	nop			;5877	00 	. 
	nop			;5878	00 	. 
	nop			;5879	00 	. 
	nop			;587a	00 	. 
	nop			;587b	00 	. 
	nop			;587c	00 	. 
	nop			;587d	00 	. 
	nop			;587e	00 	. 
	nop			;587f	00 	. 
	nop			;5880	00 	. 
	nop			;5881	00 	. 
	nop			;5882	00 	. 
	nop			;5883	00 	. 
	nop			;5884	00 	. 
	nop			;5885	00 	. 
	nop			;5886	00 	. 
	nop			;5887	00 	. 
	nop			;5888	00 	. 
	nop			;5889	00 	. 
	nop			;588a	00 	. 
	nop			;588b	00 	. 
	nop			;588c	00 	. 
	nop			;588d	00 	. 
	nop			;588e	00 	. 
	nop			;588f	00 	. 
	nop			;5890	00 	. 
	nop			;5891	00 	. 
	nop			;5892	00 	. 
	nop			;5893	00 	. 
	nop			;5894	00 	. 
	nop			;5895	00 	. 
	nop			;5896	00 	. 
	nop			;5897	00 	. 
	nop			;5898	00 	. 
	nop			;5899	00 	. 
	nop			;589a	00 	. 
	nop			;589b	00 	. 
	nop			;589c	00 	. 
	nop			;589d	00 	. 
	nop			;589e	00 	. 
	nop			;589f	00 	. 
	nop			;58a0	00 	. 
	nop			;58a1	00 	. 
	nop			;58a2	00 	. 
	nop			;58a3	00 	. 
	nop			;58a4	00 	. 
	nop			;58a5	00 	. 
	nop			;58a6	00 	. 
	nop			;58a7	00 	. 
	nop			;58a8	00 	. 
	nop			;58a9	00 	. 
	nop			;58aa	00 	. 
	nop			;58ab	00 	. 
	nop			;58ac	00 	. 
	nop			;58ad	00 	. 
	nop			;58ae	00 	. 
	nop			;58af	00 	. 
	nop			;58b0	00 	. 
	nop			;58b1	00 	. 
	nop			;58b2	00 	. 
	nop			;58b3	00 	. 
	nop			;58b4	00 	. 
	nop			;58b5	00 	. 
	nop			;58b6	00 	. 
	nop			;58b7	00 	. 
	nop			;58b8	00 	. 
	nop			;58b9	00 	. 
	nop			;58ba	00 	. 
	nop			;58bb	00 	. 
	nop			;58bc	00 	. 
	nop			;58bd	00 	. 
	nop			;58be	00 	. 
	nop			;58bf	00 	. 
	nop			;58c0	00 	. 
	nop			;58c1	00 	. 
	nop			;58c2	00 	. 
	nop			;58c3	00 	. 
	nop			;58c4	00 	. 
	nop			;58c5	00 	. 
	nop			;58c6	00 	. 
	nop			;58c7	00 	. 
	nop			;58c8	00 	. 
	nop			;58c9	00 	. 
	nop			;58ca	00 	. 
	nop			;58cb	00 	. 
	nop			;58cc	00 	. 
	nop			;58cd	00 	. 
	nop			;58ce	00 	. 
	nop			;58cf	00 	. 
	nop			;58d0	00 	. 
	nop			;58d1	00 	. 
	nop			;58d2	00 	. 
	nop			;58d3	00 	. 
	nop			;58d4	00 	. 
	nop			;58d5	00 	. 
	nop			;58d6	00 	. 
	nop			;58d7	00 	. 
	nop			;58d8	00 	. 
	nop			;58d9	00 	. 
	nop			;58da	00 	. 
	nop			;58db	00 	. 
	nop			;58dc	00 	. 
	nop			;58dd	00 	. 
	nop			;58de	00 	. 
	nop			;58df	00 	. 
	nop			;58e0	00 	. 
	nop			;58e1	00 	. 
	nop			;58e2	00 	. 
	nop			;58e3	00 	. 
	nop			;58e4	00 	. 
	nop			;58e5	00 	. 
	nop			;58e6	00 	. 
	nop			;58e7	00 	. 
	nop			;58e8	00 	. 
	nop			;58e9	00 	. 
	nop			;58ea	00 	. 
	nop			;58eb	00 	. 
	nop			;58ec	00 	. 
	nop			;58ed	00 	. 
	nop			;58ee	00 	. 
	nop			;58ef	00 	. 
	nop			;58f0	00 	. 
	nop			;58f1	00 	. 
	nop			;58f2	00 	. 
	nop			;58f3	00 	. 
	nop			;58f4	00 	. 
	nop			;58f5	00 	. 
	nop			;58f6	00 	. 
	nop			;58f7	00 	. 
	nop			;58f8	00 	. 
	nop			;58f9	00 	. 
	nop			;58fa	00 	. 
	nop			;58fb	00 	. 
	nop			;58fc	00 	. 
	nop			;58fd	00 	. 
	nop			;58fe	00 	. 
	nop			;58ff	00 	. 
	nop			;5900	00 	. 
	nop			;5901	00 	. 
	nop			;5902	00 	. 
	nop			;5903	00 	. 
	nop			;5904	00 	. 
	nop			;5905	00 	. 
	nop			;5906	00 	. 
	nop			;5907	00 	. 
	nop			;5908	00 	. 
	nop			;5909	00 	. 
	nop			;590a	00 	. 
	nop			;590b	00 	. 
	nop			;590c	00 	. 
	nop			;590d	00 	. 
	nop			;590e	00 	. 
	nop			;590f	00 	. 
	nop			;5910	00 	. 
	nop			;5911	00 	. 
	nop			;5912	00 	. 
	nop			;5913	00 	. 
	nop			;5914	00 	. 
	nop			;5915	00 	. 
	nop			;5916	00 	. 
	nop			;5917	00 	. 
	nop			;5918	00 	. 
	nop			;5919	00 	. 
	nop			;591a	00 	. 
	nop			;591b	00 	. 
	nop			;591c	00 	. 
	nop			;591d	00 	. 
	nop			;591e	00 	. 
	nop			;591f	00 	. 
	nop			;5920	00 	. 
	nop			;5921	00 	. 
	nop			;5922	00 	. 
	nop			;5923	00 	. 
	nop			;5924	00 	. 
	nop			;5925	00 	. 
	nop			;5926	00 	. 
	nop			;5927	00 	. 
	nop			;5928	00 	. 
	nop			;5929	00 	. 
	nop			;592a	00 	. 
	nop			;592b	00 	. 
	nop			;592c	00 	. 
	nop			;592d	00 	. 
	nop			;592e	00 	. 
	nop			;592f	00 	. 
	nop			;5930	00 	. 
	nop			;5931	00 	. 
	nop			;5932	00 	. 
	nop			;5933	00 	. 
	nop			;5934	00 	. 
	nop			;5935	00 	. 
	nop			;5936	00 	. 
	nop			;5937	00 	. 
	nop			;5938	00 	. 
	nop			;5939	00 	. 
	nop			;593a	00 	. 
	nop			;593b	00 	. 
	nop			;593c	00 	. 
	nop			;593d	00 	. 
	nop			;593e	00 	. 
	nop			;593f	00 	. 
	nop			;5940	00 	. 
l5941h:
	nop			;5941	00 	. 
	nop			;5942	00 	. 
	nop			;5943	00 	. 
	nop			;5944	00 	. 
	nop			;5945	00 	. 
	nop			;5946	00 	. 
	nop			;5947	00 	. 
	nop			;5948	00 	. 
	nop			;5949	00 	. 
	nop			;594a	00 	. 
	nop			;594b	00 	. 
	nop			;594c	00 	. 
	nop			;594d	00 	. 
	nop			;594e	00 	. 
	nop			;594f	00 	. 
	nop			;5950	00 	. 
	nop			;5951	00 	. 
	nop			;5952	00 	. 
	nop			;5953	00 	. 
	nop			;5954	00 	. 
	nop			;5955	00 	. 
	nop			;5956	00 	. 
	nop			;5957	00 	. 
	nop			;5958	00 	. 
	nop			;5959	00 	. 
	nop			;595a	00 	. 
	nop			;595b	00 	. 
	nop			;595c	00 	. 
	nop			;595d	00 	. 
	nop			;595e	00 	. 
	nop			;595f	00 	. 
	nop			;5960	00 	. 
	nop			;5961	00 	. 
	nop			;5962	00 	. 
	nop			;5963	00 	. 
	nop			;5964	00 	. 
	nop			;5965	00 	. 
	nop			;5966	00 	. 
	nop			;5967	00 	. 
	nop			;5968	00 	. 
	nop			;5969	00 	. 
	nop			;596a	00 	. 
	nop			;596b	00 	. 
	nop			;596c	00 	. 
	nop			;596d	00 	. 
	nop			;596e	00 	. 
	nop			;596f	00 	. 
	nop			;5970	00 	. 
	nop			;5971	00 	. 
	nop			;5972	00 	. 
	nop			;5973	00 	. 
	nop			;5974	00 	. 
	nop			;5975	00 	. 
	nop			;5976	00 	. 
	nop			;5977	00 	. 
	nop			;5978	00 	. 
	nop			;5979	00 	. 
	nop			;597a	00 	. 
	nop			;597b	00 	. 
	nop			;597c	00 	. 
	nop			;597d	00 	. 
	nop			;597e	00 	. 
	nop			;597f	00 	. 
	nop			;5980	00 	. 
	nop			;5981	00 	. 
	nop			;5982	00 	. 
	nop			;5983	00 	. 
	nop			;5984	00 	. 
	nop			;5985	00 	. 
	nop			;5986	00 	. 
	nop			;5987	00 	. 
	nop			;5988	00 	. 
	nop			;5989	00 	. 
	nop			;598a	00 	. 
	nop			;598b	00 	. 
	nop			;598c	00 	. 
	nop			;598d	00 	. 
	nop			;598e	00 	. 
	nop			;598f	00 	. 
	nop			;5990	00 	. 
	nop			;5991	00 	. 
	nop			;5992	00 	. 
	nop			;5993	00 	. 
	nop			;5994	00 	. 
	nop			;5995	00 	. 
	nop			;5996	00 	. 
	nop			;5997	00 	. 
	nop			;5998	00 	. 
	nop			;5999	00 	. 
	nop			;599a	00 	. 
	nop			;599b	00 	. 
	nop			;599c	00 	. 
	nop			;599d	00 	. 
	nop			;599e	00 	. 
	nop			;599f	00 	. 
	nop			;59a0	00 	. 
	nop			;59a1	00 	. 
	nop			;59a2	00 	. 
	nop			;59a3	00 	. 
	nop			;59a4	00 	. 
	nop			;59a5	00 	. 
	nop			;59a6	00 	. 
	nop			;59a7	00 	. 
	nop			;59a8	00 	. 
	nop			;59a9	00 	. 
	nop			;59aa	00 	. 
	nop			;59ab	00 	. 
	nop			;59ac	00 	. 
	nop			;59ad	00 	. 
	nop			;59ae	00 	. 
	nop			;59af	00 	. 
	nop			;59b0	00 	. 
	nop			;59b1	00 	. 
	nop			;59b2	00 	. 
	nop			;59b3	00 	. 
	nop			;59b4	00 	. 
	nop			;59b5	00 	. 
	nop			;59b6	00 	. 
	nop			;59b7	00 	. 
	nop			;59b8	00 	. 
	nop			;59b9	00 	. 
	nop			;59ba	00 	. 
	nop			;59bb	00 	. 
	nop			;59bc	00 	. 
	nop			;59bd	00 	. 
	nop			;59be	00 	. 
	nop			;59bf	00 	. 
	nop			;59c0	00 	. 
	nop			;59c1	00 	. 
	nop			;59c2	00 	. 
	nop			;59c3	00 	. 
	nop			;59c4	00 	. 
	nop			;59c5	00 	. 
	nop			;59c6	00 	. 
	nop			;59c7	00 	. 
	nop			;59c8	00 	. 
	nop			;59c9	00 	. 
	nop			;59ca	00 	. 
	nop			;59cb	00 	. 
	nop			;59cc	00 	. 
	nop			;59cd	00 	. 
	nop			;59ce	00 	. 
	nop			;59cf	00 	. 
	nop			;59d0	00 	. 
	nop			;59d1	00 	. 
	nop			;59d2	00 	. 
	nop			;59d3	00 	. 
	nop			;59d4	00 	. 
	nop			;59d5	00 	. 
	nop			;59d6	00 	. 
	nop			;59d7	00 	. 
	nop			;59d8	00 	. 
	nop			;59d9	00 	. 
	nop			;59da	00 	. 
	nop			;59db	00 	. 
	nop			;59dc	00 	. 
	nop			;59dd	00 	. 
	nop			;59de	00 	. 
	nop			;59df	00 	. 
	nop			;59e0	00 	. 
	nop			;59e1	00 	. 
	nop			;59e2	00 	. 
	nop			;59e3	00 	. 
	nop			;59e4	00 	. 
	nop			;59e5	00 	. 
	nop			;59e6	00 	. 
	nop			;59e7	00 	. 
	nop			;59e8	00 	. 
	nop			;59e9	00 	. 
	nop			;59ea	00 	. 
	nop			;59eb	00 	. 
	nop			;59ec	00 	. 
	nop			;59ed	00 	. 
	nop			;59ee	00 	. 
	nop			;59ef	00 	. 
	nop			;59f0	00 	. 
	nop			;59f1	00 	. 
	nop			;59f2	00 	. 
	nop			;59f3	00 	. 
	nop			;59f4	00 	. 
	nop			;59f5	00 	. 
	nop			;59f6	00 	. 
	nop			;59f7	00 	. 
	nop			;59f8	00 	. 
	nop			;59f9	00 	. 
	nop			;59fa	00 	. 
	nop			;59fb	00 	. 
	nop			;59fc	00 	. 
	nop			;59fd	00 	. 
	nop			;59fe	00 	. 
	nop			;59ff	00 	. 
	nop			;5a00	00 	. 
	nop			;5a01	00 	. 
	nop			;5a02	00 	. 
	nop			;5a03	00 	. 
	nop			;5a04	00 	. 
	nop			;5a05	00 	. 
	nop			;5a06	00 	. 
	nop			;5a07	00 	. 
	nop			;5a08	00 	. 
	nop			;5a09	00 	. 
	nop			;5a0a	00 	. 
	nop			;5a0b	00 	. 
	nop			;5a0c	00 	. 
	nop			;5a0d	00 	. 
	nop			;5a0e	00 	. 
	nop			;5a0f	00 	. 
	nop			;5a10	00 	. 
	nop			;5a11	00 	. 
	nop			;5a12	00 	. 
	nop			;5a13	00 	. 
	nop			;5a14	00 	. 
	nop			;5a15	00 	. 
	nop			;5a16	00 	. 
	nop			;5a17	00 	. 
	nop			;5a18	00 	. 
	nop			;5a19	00 	. 
	nop			;5a1a	00 	. 
	nop			;5a1b	00 	. 
	nop			;5a1c	00 	. 
	nop			;5a1d	00 	. 
	nop			;5a1e	00 	. 
	nop			;5a1f	00 	. 
	nop			;5a20	00 	. 
	nop			;5a21	00 	. 
	nop			;5a22	00 	. 
	nop			;5a23	00 	. 
	nop			;5a24	00 	. 
	nop			;5a25	00 	. 
	nop			;5a26	00 	. 
	nop			;5a27	00 	. 
	nop			;5a28	00 	. 
	nop			;5a29	00 	. 
	nop			;5a2a	00 	. 
	nop			;5a2b	00 	. 
	nop			;5a2c	00 	. 
	nop			;5a2d	00 	. 
	nop			;5a2e	00 	. 
	nop			;5a2f	00 	. 
	nop			;5a30	00 	. 
	nop			;5a31	00 	. 
	nop			;5a32	00 	. 
	nop			;5a33	00 	. 
	nop			;5a34	00 	. 
	nop			;5a35	00 	. 
	nop			;5a36	00 	. 
	nop			;5a37	00 	. 
	nop			;5a38	00 	. 
	nop			;5a39	00 	. 
	nop			;5a3a	00 	. 
	nop			;5a3b	00 	. 
	nop			;5a3c	00 	. 
	nop			;5a3d	00 	. 
	nop			;5a3e	00 	. 
	nop			;5a3f	00 	. 
	nop			;5a40	00 	. 
	nop			;5a41	00 	. 
	nop			;5a42	00 	. 
	nop			;5a43	00 	. 
	nop			;5a44	00 	. 
	nop			;5a45	00 	. 
	nop			;5a46	00 	. 
	nop			;5a47	00 	. 
	nop			;5a48	00 	. 
	nop			;5a49	00 	. 
	nop			;5a4a	00 	. 
	nop			;5a4b	00 	. 
	nop			;5a4c	00 	. 
	nop			;5a4d	00 	. 
	nop			;5a4e	00 	. 
	nop			;5a4f	00 	. 
	nop			;5a50	00 	. 
	nop			;5a51	00 	. 
	nop			;5a52	00 	. 
	nop			;5a53	00 	. 
	nop			;5a54	00 	. 
	nop			;5a55	00 	. 
	nop			;5a56	00 	. 
	nop			;5a57	00 	. 
	nop			;5a58	00 	. 
	nop			;5a59	00 	. 
	nop			;5a5a	00 	. 
	nop			;5a5b	00 	. 
	nop			;5a5c	00 	. 
	nop			;5a5d	00 	. 
	nop			;5a5e	00 	. 
	nop			;5a5f	00 	. 
	nop			;5a60	00 	. 
	nop			;5a61	00 	. 
	nop			;5a62	00 	. 
	nop			;5a63	00 	. 
	nop			;5a64	00 	. 
	nop			;5a65	00 	. 
	nop			;5a66	00 	. 
	nop			;5a67	00 	. 
	nop			;5a68	00 	. 
	nop			;5a69	00 	. 
	nop			;5a6a	00 	. 
	nop			;5a6b	00 	. 
	nop			;5a6c	00 	. 
	nop			;5a6d	00 	. 
	nop			;5a6e	00 	. 
	nop			;5a6f	00 	. 
	nop			;5a70	00 	. 
	nop			;5a71	00 	. 
	nop			;5a72	00 	. 
	nop			;5a73	00 	. 
	nop			;5a74	00 	. 
	nop			;5a75	00 	. 
	nop			;5a76	00 	. 
	nop			;5a77	00 	. 
	nop			;5a78	00 	. 
	nop			;5a79	00 	. 
	nop			;5a7a	00 	. 
	nop			;5a7b	00 	. 
	nop			;5a7c	00 	. 
	nop			;5a7d	00 	. 
	nop			;5a7e	00 	. 
	nop			;5a7f	00 	. 
	nop			;5a80	00 	. 
	nop			;5a81	00 	. 
	nop			;5a82	00 	. 
	nop			;5a83	00 	. 
	nop			;5a84	00 	. 
	nop			;5a85	00 	. 
	nop			;5a86	00 	. 
	nop			;5a87	00 	. 
	nop			;5a88	00 	. 
	nop			;5a89	00 	. 
	nop			;5a8a	00 	. 
	nop			;5a8b	00 	. 
	nop			;5a8c	00 	. 
	nop			;5a8d	00 	. 
	nop			;5a8e	00 	. 
	nop			;5a8f	00 	. 
	nop			;5a90	00 	. 
	nop			;5a91	00 	. 
	nop			;5a92	00 	. 
	nop			;5a93	00 	. 
	nop			;5a94	00 	. 
	nop			;5a95	00 	. 
	nop			;5a96	00 	. 
	nop			;5a97	00 	. 
	nop			;5a98	00 	. 
	nop			;5a99	00 	. 
	nop			;5a9a	00 	. 
	nop			;5a9b	00 	. 
	nop			;5a9c	00 	. 
	nop			;5a9d	00 	. 
	nop			;5a9e	00 	. 
	nop			;5a9f	00 	. 
	nop			;5aa0	00 	. 
	nop			;5aa1	00 	. 
	nop			;5aa2	00 	. 
	nop			;5aa3	00 	. 
	nop			;5aa4	00 	. 
	nop			;5aa5	00 	. 
	nop			;5aa6	00 	. 
	nop			;5aa7	00 	. 
	nop			;5aa8	00 	. 
	nop			;5aa9	00 	. 
	nop			;5aaa	00 	. 
	nop			;5aab	00 	. 
	nop			;5aac	00 	. 
	nop			;5aad	00 	. 
	nop			;5aae	00 	. 
	nop			;5aaf	00 	. 
	nop			;5ab0	00 	. 
	nop			;5ab1	00 	. 
	nop			;5ab2	00 	. 
	nop			;5ab3	00 	. 
	nop			;5ab4	00 	. 
	nop			;5ab5	00 	. 
	nop			;5ab6	00 	. 
	nop			;5ab7	00 	. 
	nop			;5ab8	00 	. 
	nop			;5ab9	00 	. 
	nop			;5aba	00 	. 
	nop			;5abb	00 	. 
	nop			;5abc	00 	. 
	nop			;5abd	00 	. 
	nop			;5abe	00 	. 
	nop			;5abf	00 	. 
	nop			;5ac0	00 	. 
	nop			;5ac1	00 	. 
	nop			;5ac2	00 	. 
	nop			;5ac3	00 	. 
	nop			;5ac4	00 	. 
	nop			;5ac5	00 	. 
	nop			;5ac6	00 	. 
	nop			;5ac7	00 	. 
	nop			;5ac8	00 	. 
	nop			;5ac9	00 	. 
	nop			;5aca	00 	. 
l5acbh:
	nop			;5acb	00 	. 
	nop			;5acc	00 	. 
	nop			;5acd	00 	. 
	nop			;5ace	00 	. 
	nop			;5acf	00 	. 
	nop			;5ad0	00 	. 
	nop			;5ad1	00 	. 
l5ad2h:
	nop			;5ad2	00 	. 
	nop			;5ad3	00 	. 
	nop			;5ad4	00 	. 
	nop			;5ad5	00 	. 
	nop			;5ad6	00 	. 
	nop			;5ad7	00 	. 
	nop			;5ad8	00 	. 
	nop			;5ad9	00 	. 
l5adah:
	nop			;5ada	00 	. 
l5adbh:
	nop			;5adb	00 	. 
	nop			;5adc	00 	. 
	nop			;5add	00 	. 
	nop			;5ade	00 	. 
	nop			;5adf	00 	. 
	nop			;5ae0	00 	. 
	nop			;5ae1	00 	. 
	nop			;5ae2	00 	. 
	nop			;5ae3	00 	. 
	nop			;5ae4	00 	. 
	nop			;5ae5	00 	. 
	nop			;5ae6	00 	. 
	nop			;5ae7	00 	. 
	nop			;5ae8	00 	. 
	nop			;5ae9	00 	. 
	nop			;5aea	00 	. 
	nop			;5aeb	00 	. 
l5aech:
	in a,(05ah)		;5aec	db 5a 	. Z 
l5aeeh:
	nop			;5aee	00 	. 
	nop			;5aef	00 	. 
	nop			;5af0	00 	. 
	nop			;5af1	00 	. 
	nop			;5af2	00 	. 
	nop			;5af3	00 	. 
	nop			;5af4	00 	. 
	nop			;5af5	00 	. 
	nop			;5af6	00 	. 
	nop			;5af7	00 	. 
	nop			;5af8	00 	. 
	nop			;5af9	00 	. 
	nop			;5afa	00 	. 
	nop			;5afb	00 	. 
	nop			;5afc	00 	. 
	nop			;5afd	00 	. 
	nop			;5afe	00 	. 
	nop			;5aff	00 	. 
	nop			;5b00	00 	. 
	nop			;5b01	00 	. 
	nop			;5b02	00 	. 
	nop			;5b03	00 	. 
	nop			;5b04	00 	. 
	nop			;5b05	00 	. 
	nop			;5b06	00 	. 
	nop			;5b07	00 	. 
	nop			;5b08	00 	. 
	nop			;5b09	00 	. 
	nop			;5b0a	00 	. 
	nop			;5b0b	00 	. 
	nop			;5b0c	00 	. 
	nop			;5b0d	00 	. 
	nop			;5b0e	00 	. 
	nop			;5b0f	00 	. 
	nop			;5b10	00 	. 
	nop			;5b11	00 	. 
	nop			;5b12	00 	. 
	nop			;5b13	00 	. 
	nop			;5b14	00 	. 
	nop			;5b15	00 	. 
	nop			;5b16	00 	. 
	nop			;5b17	00 	. 
	nop			;5b18	00 	. 
	nop			;5b19	00 	. 
	nop			;5b1a	00 	. 
	nop			;5b1b	00 	. 
	nop			;5b1c	00 	. 
	nop			;5b1d	00 	. 
	nop			;5b1e	00 	. 
	nop			;5b1f	00 	. 
	nop			;5b20	00 	. 
	nop			;5b21	00 	. 
	nop			;5b22	00 	. 
	nop			;5b23	00 	. 
	nop			;5b24	00 	. 
	nop			;5b25	00 	. 
	nop			;5b26	00 	. 
	nop			;5b27	00 	. 
	nop			;5b28	00 	. 
	nop			;5b29	00 	. 
	nop			;5b2a	00 	. 
	nop			;5b2b	00 	. 
	nop			;5b2c	00 	. 
	nop			;5b2d	00 	. 
	nop			;5b2e	00 	. 
	nop			;5b2f	00 	. 
	nop			;5b30	00 	. 
	nop			;5b31	00 	. 
	nop			;5b32	00 	. 
	nop			;5b33	00 	. 
	nop			;5b34	00 	. 
	nop			;5b35	00 	. 
	nop			;5b36	00 	. 
	nop			;5b37	00 	. 
	nop			;5b38	00 	. 
	nop			;5b39	00 	. 
	nop			;5b3a	00 	. 
	nop			;5b3b	00 	. 
	nop			;5b3c	00 	. 
	nop			;5b3d	00 	. 
	nop			;5b3e	00 	. 
	nop			;5b3f	00 	. 
	nop			;5b40	00 	. 
	nop			;5b41	00 	. 
	nop			;5b42	00 	. 
	nop			;5b43	00 	. 
	nop			;5b44	00 	. 
	nop			;5b45	00 	. 
	nop			;5b46	00 	. 
	nop			;5b47	00 	. 
	nop			;5b48	00 	. 
	nop			;5b49	00 	. 
	nop			;5b4a	00 	. 
	nop			;5b4b	00 	. 
	nop			;5b4c	00 	. 
	nop			;5b4d	00 	. 
	nop			;5b4e	00 	. 
	nop			;5b4f	00 	. 
	nop			;5b50	00 	. 
	nop			;5b51	00 	. 
	nop			;5b52	00 	. 
	nop			;5b53	00 	. 
	nop			;5b54	00 	. 
	nop			;5b55	00 	. 
	nop			;5b56	00 	. 
	nop			;5b57	00 	. 
	nop			;5b58	00 	. 
	nop			;5b59	00 	. 
	nop			;5b5a	00 	. 
	nop			;5b5b	00 	. 
	nop			;5b5c	00 	. 
	nop			;5b5d	00 	. 
	nop			;5b5e	00 	. 
	nop			;5b5f	00 	. 
	nop			;5b60	00 	. 
	nop			;5b61	00 	. 
	nop			;5b62	00 	. 
	nop			;5b63	00 	. 
	nop			;5b64	00 	. 
	nop			;5b65	00 	. 
	nop			;5b66	00 	. 
	nop			;5b67	00 	. 
	nop			;5b68	00 	. 
	nop			;5b69	00 	. 
	nop			;5b6a	00 	. 
	nop			;5b6b	00 	. 
	nop			;5b6c	00 	. 
	nop			;5b6d	00 	. 
	nop			;5b6e	00 	. 
	nop			;5b6f	00 	. 
	nop			;5b70	00 	. 
	nop			;5b71	00 	. 
	nop			;5b72	00 	. 
	nop			;5b73	00 	. 
	nop			;5b74	00 	. 
	nop			;5b75	00 	. 
	nop			;5b76	00 	. 
	nop			;5b77	00 	. 
	nop			;5b78	00 	. 
	nop			;5b79	00 	. 
	nop			;5b7a	00 	. 
	nop			;5b7b	00 	. 
	nop			;5b7c	00 	. 
	nop			;5b7d	00 	. 
	nop			;5b7e	00 	. 
	nop			;5b7f	00 	. 
	nop			;5b80	00 	. 
	nop			;5b81	00 	. 
	nop			;5b82	00 	. 
	nop			;5b83	00 	. 
	nop			;5b84	00 	. 
	nop			;5b85	00 	. 
	nop			;5b86	00 	. 
	nop			;5b87	00 	. 
	nop			;5b88	00 	. 
	nop			;5b89	00 	. 
	nop			;5b8a	00 	. 
	nop			;5b8b	00 	. 
	nop			;5b8c	00 	. 
	nop			;5b8d	00 	. 
	nop			;5b8e	00 	. 
	nop			;5b8f	00 	. 
	nop			;5b90	00 	. 
	nop			;5b91	00 	. 
	nop			;5b92	00 	. 
	nop			;5b93	00 	. 
	nop			;5b94	00 	. 
	nop			;5b95	00 	. 
	nop			;5b96	00 	. 
	nop			;5b97	00 	. 
	nop			;5b98	00 	. 
	nop			;5b99	00 	. 
	nop			;5b9a	00 	. 
	nop			;5b9b	00 	. 
	nop			;5b9c	00 	. 
	nop			;5b9d	00 	. 
	nop			;5b9e	00 	. 
	nop			;5b9f	00 	. 
	nop			;5ba0	00 	. 
	nop			;5ba1	00 	. 
	nop			;5ba2	00 	. 
	nop			;5ba3	00 	. 
	nop			;5ba4	00 	. 
	nop			;5ba5	00 	. 
	nop			;5ba6	00 	. 
	nop			;5ba7	00 	. 
	nop			;5ba8	00 	. 
	nop			;5ba9	00 	. 
	nop			;5baa	00 	. 
	nop			;5bab	00 	. 
	nop			;5bac	00 	. 
	nop			;5bad	00 	. 
	nop			;5bae	00 	. 
	nop			;5baf	00 	. 
	nop			;5bb0	00 	. 
	nop			;5bb1	00 	. 
	nop			;5bb2	00 	. 
	nop			;5bb3	00 	. 
	nop			;5bb4	00 	. 
	nop			;5bb5	00 	. 
	nop			;5bb6	00 	. 
	nop			;5bb7	00 	. 
	nop			;5bb8	00 	. 
	nop			;5bb9	00 	. 
	nop			;5bba	00 	. 
	nop			;5bbb	00 	. 
	nop			;5bbc	00 	. 
	nop			;5bbd	00 	. 
	nop			;5bbe	00 	. 
	nop			;5bbf	00 	. 
	nop			;5bc0	00 	. 
	nop			;5bc1	00 	. 
	nop			;5bc2	00 	. 
	nop			;5bc3	00 	. 
	nop			;5bc4	00 	. 
	nop			;5bc5	00 	. 
	nop			;5bc6	00 	. 
	nop			;5bc7	00 	. 
	nop			;5bc8	00 	. 
	nop			;5bc9	00 	. 
	nop			;5bca	00 	. 
	nop			;5bcb	00 	. 
	nop			;5bcc	00 	. 
	nop			;5bcd	00 	. 
	nop			;5bce	00 	. 
	nop			;5bcf	00 	. 
	nop			;5bd0	00 	. 
	nop			;5bd1	00 	. 
	nop			;5bd2	00 	. 
	nop			;5bd3	00 	. 
	nop			;5bd4	00 	. 
	nop			;5bd5	00 	. 
	nop			;5bd6	00 	. 
	nop			;5bd7	00 	. 
	nop			;5bd8	00 	. 
	nop			;5bd9	00 	. 
	nop			;5bda	00 	. 
	nop			;5bdb	00 	. 
	nop			;5bdc	00 	. 
	nop			;5bdd	00 	. 
	nop			;5bde	00 	. 
	nop			;5bdf	00 	. 
	nop			;5be0	00 	. 
	nop			;5be1	00 	. 
	nop			;5be2	00 	. 
	nop			;5be3	00 	. 
	nop			;5be4	00 	. 
	nop			;5be5	00 	. 
	nop			;5be6	00 	. 
	nop			;5be7	00 	. 
	nop			;5be8	00 	. 
	nop			;5be9	00 	. 
	nop			;5bea	00 	. 
	nop			;5beb	00 	. 
	nop			;5bec	00 	. 
	nop			;5bed	00 	. 
	nop			;5bee	00 	. 
	nop			;5bef	00 	. 
	nop			;5bf0	00 	. 
	nop			;5bf1	00 	. 
	nop			;5bf2	00 	. 
	nop			;5bf3	00 	. 
	nop			;5bf4	00 	. 
	nop			;5bf5	00 	. 
	nop			;5bf6	00 	. 
	nop			;5bf7	00 	. 
	nop			;5bf8	00 	. 
	nop			;5bf9	00 	. 
	nop			;5bfa	00 	. 
	nop			;5bfb	00 	. 
	nop			;5bfc	00 	. 
	nop			;5bfd	00 	. 
	nop			;5bfe	00 	. 
	nop			;5bff	00 	. 
	nop			;5c00	00 	. 
	nop			;5c01	00 	. 
	nop			;5c02	00 	. 
	nop			;5c03	00 	. 
	nop			;5c04	00 	. 
	nop			;5c05	00 	. 
	nop			;5c06	00 	. 
	nop			;5c07	00 	. 
	nop			;5c08	00 	. 
	nop			;5c09	00 	. 
	nop			;5c0a	00 	. 
	nop			;5c0b	00 	. 
	nop			;5c0c	00 	. 
	nop			;5c0d	00 	. 
	nop			;5c0e	00 	. 
	nop			;5c0f	00 	. 
	nop			;5c10	00 	. 
	nop			;5c11	00 	. 
	nop			;5c12	00 	. 
	nop			;5c13	00 	. 
	nop			;5c14	00 	. 
	nop			;5c15	00 	. 
	nop			;5c16	00 	. 
	nop			;5c17	00 	. 
	nop			;5c18	00 	. 
	nop			;5c19	00 	. 
	nop			;5c1a	00 	. 
	nop			;5c1b	00 	. 
	nop			;5c1c	00 	. 
	nop			;5c1d	00 	. 
	nop			;5c1e	00 	. 
	nop			;5c1f	00 	. 
	nop			;5c20	00 	. 
	nop			;5c21	00 	. 
	nop			;5c22	00 	. 
	nop			;5c23	00 	. 
	nop			;5c24	00 	. 
	nop			;5c25	00 	. 
	nop			;5c26	00 	. 
	nop			;5c27	00 	. 
	nop			;5c28	00 	. 
	nop			;5c29	00 	. 
	nop			;5c2a	00 	. 
	nop			;5c2b	00 	. 
	nop			;5c2c	00 	. 
	nop			;5c2d	00 	. 
	nop			;5c2e	00 	. 
	nop			;5c2f	00 	. 
	nop			;5c30	00 	. 
	nop			;5c31	00 	. 
	nop			;5c32	00 	. 
	nop			;5c33	00 	. 
	nop			;5c34	00 	. 
	nop			;5c35	00 	. 
	nop			;5c36	00 	. 
	nop			;5c37	00 	. 
	nop			;5c38	00 	. 
	nop			;5c39	00 	. 
	nop			;5c3a	00 	. 
	nop			;5c3b	00 	. 
	nop			;5c3c	00 	. 
	nop			;5c3d	00 	. 
	nop			;5c3e	00 	. 
	nop			;5c3f	00 	. 
	nop			;5c40	00 	. 
	nop			;5c41	00 	. 
	nop			;5c42	00 	. 
	nop			;5c43	00 	. 
	nop			;5c44	00 	. 
	nop			;5c45	00 	. 
	nop			;5c46	00 	. 
	nop			;5c47	00 	. 
	nop			;5c48	00 	. 
	nop			;5c49	00 	. 
	nop			;5c4a	00 	. 
	nop			;5c4b	00 	. 
	nop			;5c4c	00 	. 
	nop			;5c4d	00 	. 
	nop			;5c4e	00 	. 
	nop			;5c4f	00 	. 
	nop			;5c50	00 	. 
	nop			;5c51	00 	. 
	nop			;5c52	00 	. 
	nop			;5c53	00 	. 
	nop			;5c54	00 	. 
	nop			;5c55	00 	. 
	nop			;5c56	00 	. 
	nop			;5c57	00 	. 
	nop			;5c58	00 	. 
	nop			;5c59	00 	. 
	nop			;5c5a	00 	. 
	nop			;5c5b	00 	. 
	nop			;5c5c	00 	. 
	nop			;5c5d	00 	. 
	nop			;5c5e	00 	. 
	nop			;5c5f	00 	. 
	nop			;5c60	00 	. 
	nop			;5c61	00 	. 
	nop			;5c62	00 	. 
	nop			;5c63	00 	. 
	nop			;5c64	00 	. 
	nop			;5c65	00 	. 
	nop			;5c66	00 	. 
	nop			;5c67	00 	. 
	nop			;5c68	00 	. 
	nop			;5c69	00 	. 
	nop			;5c6a	00 	. 
	nop			;5c6b	00 	. 
	nop			;5c6c	00 	. 
	nop			;5c6d	00 	. 
	nop			;5c6e	00 	. 
	nop			;5c6f	00 	. 
	nop			;5c70	00 	. 
	nop			;5c71	00 	. 
	nop			;5c72	00 	. 
	nop			;5c73	00 	. 
	nop			;5c74	00 	. 
	nop			;5c75	00 	. 
	nop			;5c76	00 	. 
	nop			;5c77	00 	. 
	nop			;5c78	00 	. 
	nop			;5c79	00 	. 
	nop			;5c7a	00 	. 
	nop			;5c7b	00 	. 
	nop			;5c7c	00 	. 
	nop			;5c7d	00 	. 
	nop			;5c7e	00 	. 
	nop			;5c7f	00 	. 
	nop			;5c80	00 	. 
	nop			;5c81	00 	. 
	nop			;5c82	00 	. 
	nop			;5c83	00 	. 
	nop			;5c84	00 	. 
	nop			;5c85	00 	. 
	nop			;5c86	00 	. 
	nop			;5c87	00 	. 
	nop			;5c88	00 	. 
	nop			;5c89	00 	. 
	nop			;5c8a	00 	. 
	nop			;5c8b	00 	. 
	nop			;5c8c	00 	. 
	nop			;5c8d	00 	. 
	nop			;5c8e	00 	. 
	nop			;5c8f	00 	. 
	nop			;5c90	00 	. 
	nop			;5c91	00 	. 
	nop			;5c92	00 	. 
	nop			;5c93	00 	. 
	nop			;5c94	00 	. 
	nop			;5c95	00 	. 
	nop			;5c96	00 	. 
	nop			;5c97	00 	. 
	nop			;5c98	00 	. 
	nop			;5c99	00 	. 
	nop			;5c9a	00 	. 
	nop			;5c9b	00 	. 
	nop			;5c9c	00 	. 
	nop			;5c9d	00 	. 
	nop			;5c9e	00 	. 
	nop			;5c9f	00 	. 
	nop			;5ca0	00 	. 
	nop			;5ca1	00 	. 
	nop			;5ca2	00 	. 
	nop			;5ca3	00 	. 
	nop			;5ca4	00 	. 
	nop			;5ca5	00 	. 
	nop			;5ca6	00 	. 
	nop			;5ca7	00 	. 
	nop			;5ca8	00 	. 
	nop			;5ca9	00 	. 
	nop			;5caa	00 	. 
	nop			;5cab	00 	. 
	nop			;5cac	00 	. 
	nop			;5cad	00 	. 
	nop			;5cae	00 	. 
	nop			;5caf	00 	. 
	nop			;5cb0	00 	. 
	nop			;5cb1	00 	. 
	nop			;5cb2	00 	. 
	nop			;5cb3	00 	. 
	nop			;5cb4	00 	. 
	nop			;5cb5	00 	. 
	nop			;5cb6	00 	. 
	nop			;5cb7	00 	. 
	nop			;5cb8	00 	. 
	nop			;5cb9	00 	. 
	nop			;5cba	00 	. 
	nop			;5cbb	00 	. 
	nop			;5cbc	00 	. 
	nop			;5cbd	00 	. 
	nop			;5cbe	00 	. 
	nop			;5cbf	00 	. 
	nop			;5cc0	00 	. 
	nop			;5cc1	00 	. 
	nop			;5cc2	00 	. 
	nop			;5cc3	00 	. 
	nop			;5cc4	00 	. 
	nop			;5cc5	00 	. 
	nop			;5cc6	00 	. 
	nop			;5cc7	00 	. 
	nop			;5cc8	00 	. 
	nop			;5cc9	00 	. 
	nop			;5cca	00 	. 
	nop			;5ccb	00 	. 
	nop			;5ccc	00 	. 
	nop			;5ccd	00 	. 
	nop			;5cce	00 	. 
	nop			;5ccf	00 	. 
	nop			;5cd0	00 	. 
	nop			;5cd1	00 	. 
	nop			;5cd2	00 	. 
	nop			;5cd3	00 	. 
	nop			;5cd4	00 	. 
	nop			;5cd5	00 	. 
	nop			;5cd6	00 	. 
	nop			;5cd7	00 	. 
	nop			;5cd8	00 	. 
	nop			;5cd9	00 	. 
	nop			;5cda	00 	. 
	nop			;5cdb	00 	. 
	nop			;5cdc	00 	. 
	nop			;5cdd	00 	. 
	nop			;5cde	00 	. 
	nop			;5cdf	00 	. 
	nop			;5ce0	00 	. 
	nop			;5ce1	00 	. 
	nop			;5ce2	00 	. 
	nop			;5ce3	00 	. 
	nop			;5ce4	00 	. 
	nop			;5ce5	00 	. 
	nop			;5ce6	00 	. 
	nop			;5ce7	00 	. 
	nop			;5ce8	00 	. 
	nop			;5ce9	00 	. 
	nop			;5cea	00 	. 
	nop			;5ceb	00 	. 
	nop			;5cec	00 	. 
	nop			;5ced	00 	. 
	nop			;5cee	00 	. 
	nop			;5cef	00 	. 
	nop			;5cf0	00 	. 
	nop			;5cf1	00 	. 
	nop			;5cf2	00 	. 
	nop			;5cf3	00 	. 
	nop			;5cf4	00 	. 
	nop			;5cf5	00 	. 
	nop			;5cf6	00 	. 
	nop			;5cf7	00 	. 
	nop			;5cf8	00 	. 
	nop			;5cf9	00 	. 
	nop			;5cfa	00 	. 
	nop			;5cfb	00 	. 
	nop			;5cfc	00 	. 
	nop			;5cfd	00 	. 
	nop			;5cfe	00 	. 
	nop			;5cff	00 	. 
	nop			;5d00	00 	. 
	nop			;5d01	00 	. 
	nop			;5d02	00 	. 
	nop			;5d03	00 	. 
	nop			;5d04	00 	. 
	nop			;5d05	00 	. 
	nop			;5d06	00 	. 
	nop			;5d07	00 	. 
	nop			;5d08	00 	. 
	nop			;5d09	00 	. 
	nop			;5d0a	00 	. 
	nop			;5d0b	00 	. 
	nop			;5d0c	00 	. 
	nop			;5d0d	00 	. 
	nop			;5d0e	00 	. 
	nop			;5d0f	00 	. 
	nop			;5d10	00 	. 
	nop			;5d11	00 	. 
	nop			;5d12	00 	. 
	nop			;5d13	00 	. 
	nop			;5d14	00 	. 
	nop			;5d15	00 	. 
	nop			;5d16	00 	. 
	nop			;5d17	00 	. 
	nop			;5d18	00 	. 
	nop			;5d19	00 	. 
	nop			;5d1a	00 	. 
	nop			;5d1b	00 	. 
	nop			;5d1c	00 	. 
	nop			;5d1d	00 	. 
	nop			;5d1e	00 	. 
	nop			;5d1f	00 	. 
	nop			;5d20	00 	. 
	nop			;5d21	00 	. 
	nop			;5d22	00 	. 
	nop			;5d23	00 	. 
	nop			;5d24	00 	. 
	nop			;5d25	00 	. 
	nop			;5d26	00 	. 
	nop			;5d27	00 	. 
	nop			;5d28	00 	. 
	nop			;5d29	00 	. 
	nop			;5d2a	00 	. 
	nop			;5d2b	00 	. 
	nop			;5d2c	00 	. 
	nop			;5d2d	00 	. 
	nop			;5d2e	00 	. 
	nop			;5d2f	00 	. 
	nop			;5d30	00 	. 
	nop			;5d31	00 	. 
	nop			;5d32	00 	. 
	nop			;5d33	00 	. 
	nop			;5d34	00 	. 
	nop			;5d35	00 	. 
	nop			;5d36	00 	. 
	nop			;5d37	00 	. 
	nop			;5d38	00 	. 
	nop			;5d39	00 	. 
	nop			;5d3a	00 	. 
	nop			;5d3b	00 	. 
	nop			;5d3c	00 	. 
	nop			;5d3d	00 	. 
	nop			;5d3e	00 	. 
	nop			;5d3f	00 	. 
	nop			;5d40	00 	. 
	nop			;5d41	00 	. 
	nop			;5d42	00 	. 
	nop			;5d43	00 	. 
	nop			;5d44	00 	. 
	nop			;5d45	00 	. 
	nop			;5d46	00 	. 
	nop			;5d47	00 	. 
	nop			;5d48	00 	. 
	nop			;5d49	00 	. 
	nop			;5d4a	00 	. 
	nop			;5d4b	00 	. 
	nop			;5d4c	00 	. 
	nop			;5d4d	00 	. 
	nop			;5d4e	00 	. 
	nop			;5d4f	00 	. 
	nop			;5d50	00 	. 
	nop			;5d51	00 	. 
	nop			;5d52	00 	. 
	nop			;5d53	00 	. 
	nop			;5d54	00 	. 
	nop			;5d55	00 	. 
	nop			;5d56	00 	. 
	nop			;5d57	00 	. 
	nop			;5d58	00 	. 
	nop			;5d59	00 	. 
	nop			;5d5a	00 	. 
	nop			;5d5b	00 	. 
	nop			;5d5c	00 	. 
	nop			;5d5d	00 	. 
	nop			;5d5e	00 	. 
	nop			;5d5f	00 	. 
	nop			;5d60	00 	. 
	nop			;5d61	00 	. 
	nop			;5d62	00 	. 
	nop			;5d63	00 	. 
	nop			;5d64	00 	. 
	nop			;5d65	00 	. 
	nop			;5d66	00 	. 
	nop			;5d67	00 	. 
	nop			;5d68	00 	. 
	nop			;5d69	00 	. 
	nop			;5d6a	00 	. 
	nop			;5d6b	00 	. 
	nop			;5d6c	00 	. 
	nop			;5d6d	00 	. 
	nop			;5d6e	00 	. 
	nop			;5d6f	00 	. 
	nop			;5d70	00 	. 
	nop			;5d71	00 	. 
	nop			;5d72	00 	. 
	nop			;5d73	00 	. 
	nop			;5d74	00 	. 
	nop			;5d75	00 	. 
	nop			;5d76	00 	. 
	nop			;5d77	00 	. 
	nop			;5d78	00 	. 
	nop			;5d79	00 	. 
	nop			;5d7a	00 	. 
	nop			;5d7b	00 	. 
	nop			;5d7c	00 	. 
	nop			;5d7d	00 	. 
	nop			;5d7e	00 	. 
	nop			;5d7f	00 	. 
	nop			;5d80	00 	. 
	nop			;5d81	00 	. 
	nop			;5d82	00 	. 
	nop			;5d83	00 	. 
	nop			;5d84	00 	. 
	nop			;5d85	00 	. 
	nop			;5d86	00 	. 
	nop			;5d87	00 	. 
	nop			;5d88	00 	. 
	nop			;5d89	00 	. 
	nop			;5d8a	00 	. 
	nop			;5d8b	00 	. 
	nop			;5d8c	00 	. 
	nop			;5d8d	00 	. 
	nop			;5d8e	00 	. 
	nop			;5d8f	00 	. 
	nop			;5d90	00 	. 
	nop			;5d91	00 	. 
	nop			;5d92	00 	. 
	nop			;5d93	00 	. 
	nop			;5d94	00 	. 
	nop			;5d95	00 	. 
	nop			;5d96	00 	. 
	nop			;5d97	00 	. 
	nop			;5d98	00 	. 
	nop			;5d99	00 	. 
	nop			;5d9a	00 	. 
	nop			;5d9b	00 	. 
	nop			;5d9c	00 	. 
	nop			;5d9d	00 	. 
	nop			;5d9e	00 	. 
	nop			;5d9f	00 	. 
	nop			;5da0	00 	. 
	nop			;5da1	00 	. 
	nop			;5da2	00 	. 
	nop			;5da3	00 	. 
	nop			;5da4	00 	. 
	nop			;5da5	00 	. 
	nop			;5da6	00 	. 
	nop			;5da7	00 	. 
	nop			;5da8	00 	. 
	nop			;5da9	00 	. 
	nop			;5daa	00 	. 
	nop			;5dab	00 	. 
	nop			;5dac	00 	. 
	nop			;5dad	00 	. 
	nop			;5dae	00 	. 
	nop			;5daf	00 	. 
	nop			;5db0	00 	. 
	nop			;5db1	00 	. 
	nop			;5db2	00 	. 
	nop			;5db3	00 	. 
	nop			;5db4	00 	. 
	nop			;5db5	00 	. 
	nop			;5db6	00 	. 
	nop			;5db7	00 	. 
	nop			;5db8	00 	. 
	nop			;5db9	00 	. 
	nop			;5dba	00 	. 
	nop			;5dbb	00 	. 
	nop			;5dbc	00 	. 
	nop			;5dbd	00 	. 
	nop			;5dbe	00 	. 
	nop			;5dbf	00 	. 
	nop			;5dc0	00 	. 
	nop			;5dc1	00 	. 
	nop			;5dc2	00 	. 
	nop			;5dc3	00 	. 
	nop			;5dc4	00 	. 
	nop			;5dc5	00 	. 
	nop			;5dc6	00 	. 
	nop			;5dc7	00 	. 
	nop			;5dc8	00 	. 
	nop			;5dc9	00 	. 
	nop			;5dca	00 	. 
	nop			;5dcb	00 	. 
	nop			;5dcc	00 	. 
	nop			;5dcd	00 	. 
	nop			;5dce	00 	. 
	nop			;5dcf	00 	. 
	nop			;5dd0	00 	. 
	nop			;5dd1	00 	. 
	nop			;5dd2	00 	. 
	nop			;5dd3	00 	. 
	nop			;5dd4	00 	. 
	nop			;5dd5	00 	. 
	nop			;5dd6	00 	. 
	nop			;5dd7	00 	. 
	nop			;5dd8	00 	. 
	nop			;5dd9	00 	. 
	nop			;5dda	00 	. 
	nop			;5ddb	00 	. 
	nop			;5ddc	00 	. 
	nop			;5ddd	00 	. 
	nop			;5dde	00 	. 
	nop			;5ddf	00 	. 
	nop			;5de0	00 	. 
	nop			;5de1	00 	. 
	nop			;5de2	00 	. 
	nop			;5de3	00 	. 
	nop			;5de4	00 	. 
	nop			;5de5	00 	. 
	nop			;5de6	00 	. 
	nop			;5de7	00 	. 
	nop			;5de8	00 	. 
	nop			;5de9	00 	. 
	nop			;5dea	00 	. 
	nop			;5deb	00 	. 
	nop			;5dec	00 	. 
	nop			;5ded	00 	. 
	nop			;5dee	00 	. 
	nop			;5def	00 	. 
	nop			;5df0	00 	. 
	nop			;5df1	00 	. 
	nop			;5df2	00 	. 
	nop			;5df3	00 	. 
	nop			;5df4	00 	. 
	nop			;5df5	00 	. 
	nop			;5df6	00 	. 
	nop			;5df7	00 	. 
	nop			;5df8	00 	. 
	nop			;5df9	00 	. 
	nop			;5dfa	00 	. 
	nop			;5dfb	00 	. 
	nop			;5dfc	00 	. 
	nop			;5dfd	00 	. 
	nop			;5dfe	00 	. 
	nop			;5dff	00 	. 
	nop			;5e00	00 	. 
	nop			;5e01	00 	. 
	nop			;5e02	00 	. 
	nop			;5e03	00 	. 
	nop			;5e04	00 	. 
	nop			;5e05	00 	. 
	nop			;5e06	00 	. 
	nop			;5e07	00 	. 
	nop			;5e08	00 	. 
	nop			;5e09	00 	. 
	nop			;5e0a	00 	. 
	nop			;5e0b	00 	. 
	nop			;5e0c	00 	. 
	nop			;5e0d	00 	. 
	nop			;5e0e	00 	. 
	nop			;5e0f	00 	. 
	nop			;5e10	00 	. 
	nop			;5e11	00 	. 
	nop			;5e12	00 	. 
	nop			;5e13	00 	. 
	nop			;5e14	00 	. 
	nop			;5e15	00 	. 
	nop			;5e16	00 	. 
	nop			;5e17	00 	. 
	nop			;5e18	00 	. 
	nop			;5e19	00 	. 
	nop			;5e1a	00 	. 
	nop			;5e1b	00 	. 
	nop			;5e1c	00 	. 
	nop			;5e1d	00 	. 
	nop			;5e1e	00 	. 
	nop			;5e1f	00 	. 
	nop			;5e20	00 	. 
	nop			;5e21	00 	. 
	nop			;5e22	00 	. 
	nop			;5e23	00 	. 
	nop			;5e24	00 	. 
	nop			;5e25	00 	. 
	nop			;5e26	00 	. 
	nop			;5e27	00 	. 
	nop			;5e28	00 	. 
	nop			;5e29	00 	. 
	nop			;5e2a	00 	. 
	nop			;5e2b	00 	. 
	nop			;5e2c	00 	. 
	nop			;5e2d	00 	. 
	nop			;5e2e	00 	. 
	nop			;5e2f	00 	. 
	nop			;5e30	00 	. 
	nop			;5e31	00 	. 
	nop			;5e32	00 	. 
	nop			;5e33	00 	. 
	nop			;5e34	00 	. 
	nop			;5e35	00 	. 
	nop			;5e36	00 	. 
	nop			;5e37	00 	. 
	nop			;5e38	00 	. 
	nop			;5e39	00 	. 
	nop			;5e3a	00 	. 
	nop			;5e3b	00 	. 
	nop			;5e3c	00 	. 
	nop			;5e3d	00 	. 
	nop			;5e3e	00 	. 
	nop			;5e3f	00 	. 
	nop			;5e40	00 	. 
	nop			;5e41	00 	. 
	nop			;5e42	00 	. 
	nop			;5e43	00 	. 
	nop			;5e44	00 	. 
	nop			;5e45	00 	. 
	nop			;5e46	00 	. 
	nop			;5e47	00 	. 
	nop			;5e48	00 	. 
	nop			;5e49	00 	. 
	nop			;5e4a	00 	. 
	nop			;5e4b	00 	. 
	nop			;5e4c	00 	. 
	nop			;5e4d	00 	. 
	nop			;5e4e	00 	. 
	nop			;5e4f	00 	. 
	nop			;5e50	00 	. 
	nop			;5e51	00 	. 
	nop			;5e52	00 	. 
	nop			;5e53	00 	. 
	nop			;5e54	00 	. 
	nop			;5e55	00 	. 
	nop			;5e56	00 	. 
	nop			;5e57	00 	. 
	nop			;5e58	00 	. 
	nop			;5e59	00 	. 
	nop			;5e5a	00 	. 
	nop			;5e5b	00 	. 
	nop			;5e5c	00 	. 
	nop			;5e5d	00 	. 
	nop			;5e5e	00 	. 
	nop			;5e5f	00 	. 
	nop			;5e60	00 	. 
	nop			;5e61	00 	. 
	nop			;5e62	00 	. 
	nop			;5e63	00 	. 
	nop			;5e64	00 	. 
	nop			;5e65	00 	. 
	nop			;5e66	00 	. 
	nop			;5e67	00 	. 
	nop			;5e68	00 	. 
	nop			;5e69	00 	. 
	nop			;5e6a	00 	. 
	nop			;5e6b	00 	. 
	nop			;5e6c	00 	. 
	nop			;5e6d	00 	. 
	nop			;5e6e	00 	. 
	nop			;5e6f	00 	. 
	nop			;5e70	00 	. 
	nop			;5e71	00 	. 
	nop			;5e72	00 	. 
	nop			;5e73	00 	. 
	nop			;5e74	00 	. 
	nop			;5e75	00 	. 
	nop			;5e76	00 	. 
	nop			;5e77	00 	. 
	nop			;5e78	00 	. 
	nop			;5e79	00 	. 
	nop			;5e7a	00 	. 
	nop			;5e7b	00 	. 
	nop			;5e7c	00 	. 
	nop			;5e7d	00 	. 
	nop			;5e7e	00 	. 
	nop			;5e7f	00 	. 
	nop			;5e80	00 	. 
	nop			;5e81	00 	. 
	nop			;5e82	00 	. 
	nop			;5e83	00 	. 
	nop			;5e84	00 	. 
	nop			;5e85	00 	. 
	nop			;5e86	00 	. 
	nop			;5e87	00 	. 
	nop			;5e88	00 	. 
	nop			;5e89	00 	. 
	nop			;5e8a	00 	. 
	nop			;5e8b	00 	. 
	nop			;5e8c	00 	. 
	nop			;5e8d	00 	. 
	nop			;5e8e	00 	. 
	nop			;5e8f	00 	. 
	nop			;5e90	00 	. 
	nop			;5e91	00 	. 
	nop			;5e92	00 	. 
	nop			;5e93	00 	. 
	nop			;5e94	00 	. 
	nop			;5e95	00 	. 
	nop			;5e96	00 	. 
	nop			;5e97	00 	. 
	nop			;5e98	00 	. 
	nop			;5e99	00 	. 
	nop			;5e9a	00 	. 
	nop			;5e9b	00 	. 
	nop			;5e9c	00 	. 
	nop			;5e9d	00 	. 
	nop			;5e9e	00 	. 
	nop			;5e9f	00 	. 
	nop			;5ea0	00 	. 
	nop			;5ea1	00 	. 
	nop			;5ea2	00 	. 
	nop			;5ea3	00 	. 
	nop			;5ea4	00 	. 
	nop			;5ea5	00 	. 
	nop			;5ea6	00 	. 
	nop			;5ea7	00 	. 
	nop			;5ea8	00 	. 
	nop			;5ea9	00 	. 
	nop			;5eaa	00 	. 
	nop			;5eab	00 	. 
	nop			;5eac	00 	. 
	nop			;5ead	00 	. 
	nop			;5eae	00 	. 
	nop			;5eaf	00 	. 
	nop			;5eb0	00 	. 
	nop			;5eb1	00 	. 
	nop			;5eb2	00 	. 
	nop			;5eb3	00 	. 
	nop			;5eb4	00 	. 
	nop			;5eb5	00 	. 
	nop			;5eb6	00 	. 
	nop			;5eb7	00 	. 
	nop			;5eb8	00 	. 
	nop			;5eb9	00 	. 
	nop			;5eba	00 	. 
	nop			;5ebb	00 	. 
	nop			;5ebc	00 	. 
	nop			;5ebd	00 	. 
	nop			;5ebe	00 	. 
	nop			;5ebf	00 	. 
	nop			;5ec0	00 	. 
	nop			;5ec1	00 	. 
	nop			;5ec2	00 	. 
	nop			;5ec3	00 	. 
	nop			;5ec4	00 	. 
	nop			;5ec5	00 	. 
	nop			;5ec6	00 	. 
	nop			;5ec7	00 	. 
	nop			;5ec8	00 	. 
	nop			;5ec9	00 	. 
	nop			;5eca	00 	. 
	nop			;5ecb	00 	. 
	nop			;5ecc	00 	. 
	nop			;5ecd	00 	. 
	nop			;5ece	00 	. 
	nop			;5ecf	00 	. 
	nop			;5ed0	00 	. 
	nop			;5ed1	00 	. 
	nop			;5ed2	00 	. 
	nop			;5ed3	00 	. 
	nop			;5ed4	00 	. 
	nop			;5ed5	00 	. 
	nop			;5ed6	00 	. 
	nop			;5ed7	00 	. 
	nop			;5ed8	00 	. 
	nop			;5ed9	00 	. 
	nop			;5eda	00 	. 
	nop			;5edb	00 	. 
	nop			;5edc	00 	. 
	nop			;5edd	00 	. 
	nop			;5ede	00 	. 
	nop			;5edf	00 	. 
	nop			;5ee0	00 	. 
	nop			;5ee1	00 	. 
	nop			;5ee2	00 	. 
	nop			;5ee3	00 	. 
	nop			;5ee4	00 	. 
	nop			;5ee5	00 	. 
	nop			;5ee6	00 	. 
	nop			;5ee7	00 	. 
	nop			;5ee8	00 	. 
	nop			;5ee9	00 	. 
	nop			;5eea	00 	. 
	nop			;5eeb	00 	. 
	nop			;5eec	00 	. 
	nop			;5eed	00 	. 
	nop			;5eee	00 	. 
	nop			;5eef	00 	. 
	nop			;5ef0	00 	. 
	nop			;5ef1	00 	. 
	nop			;5ef2	00 	. 
	nop			;5ef3	00 	. 
	nop			;5ef4	00 	. 
	nop			;5ef5	00 	. 
	nop			;5ef6	00 	. 
	nop			;5ef7	00 	. 
	nop			;5ef8	00 	. 
	nop			;5ef9	00 	. 
	nop			;5efa	00 	. 
	nop			;5efb	00 	. 
	nop			;5efc	00 	. 
	nop			;5efd	00 	. 
	nop			;5efe	00 	. 
	nop			;5eff	00 	. 
	nop			;5f00	00 	. 
	nop			;5f01	00 	. 
	nop			;5f02	00 	. 
	nop			;5f03	00 	. 
	nop			;5f04	00 	. 
	nop			;5f05	00 	. 
	nop			;5f06	00 	. 
	nop			;5f07	00 	. 
	nop			;5f08	00 	. 
	nop			;5f09	00 	. 
	nop			;5f0a	00 	. 
	nop			;5f0b	00 	. 
	nop			;5f0c	00 	. 
	nop			;5f0d	00 	. 
	nop			;5f0e	00 	. 
	nop			;5f0f	00 	. 
	nop			;5f10	00 	. 
	nop			;5f11	00 	. 
	nop			;5f12	00 	. 
	nop			;5f13	00 	. 
	nop			;5f14	00 	. 
	nop			;5f15	00 	. 
	nop			;5f16	00 	. 
	nop			;5f17	00 	. 
	nop			;5f18	00 	. 
	nop			;5f19	00 	. 
	nop			;5f1a	00 	. 
	nop			;5f1b	00 	. 
	nop			;5f1c	00 	. 
	nop			;5f1d	00 	. 
	nop			;5f1e	00 	. 
	nop			;5f1f	00 	. 
	nop			;5f20	00 	. 
	nop			;5f21	00 	. 
	nop			;5f22	00 	. 
	nop			;5f23	00 	. 
	nop			;5f24	00 	. 
	nop			;5f25	00 	. 
	nop			;5f26	00 	. 
	nop			;5f27	00 	. 
	nop			;5f28	00 	. 
	nop			;5f29	00 	. 
	nop			;5f2a	00 	. 
	nop			;5f2b	00 	. 
	nop			;5f2c	00 	. 
	nop			;5f2d	00 	. 
	nop			;5f2e	00 	. 
	nop			;5f2f	00 	. 
	nop			;5f30	00 	. 
	nop			;5f31	00 	. 
	nop			;5f32	00 	. 
	nop			;5f33	00 	. 
	nop			;5f34	00 	. 
	nop			;5f35	00 	. 
	nop			;5f36	00 	. 
	nop			;5f37	00 	. 
	nop			;5f38	00 	. 
	nop			;5f39	00 	. 
	nop			;5f3a	00 	. 
	nop			;5f3b	00 	. 
	nop			;5f3c	00 	. 
	nop			;5f3d	00 	. 
	nop			;5f3e	00 	. 
	nop			;5f3f	00 	. 
	nop			;5f40	00 	. 
	nop			;5f41	00 	. 
	nop			;5f42	00 	. 
	nop			;5f43	00 	. 
	nop			;5f44	00 	. 
	nop			;5f45	00 	. 
	nop			;5f46	00 	. 
	nop			;5f47	00 	. 
	nop			;5f48	00 	. 
	nop			;5f49	00 	. 
	nop			;5f4a	00 	. 
	nop			;5f4b	00 	. 
	nop			;5f4c	00 	. 
	nop			;5f4d	00 	. 
	nop			;5f4e	00 	. 
	nop			;5f4f	00 	. 
	nop			;5f50	00 	. 
	nop			;5f51	00 	. 
	nop			;5f52	00 	. 
	nop			;5f53	00 	. 
	nop			;5f54	00 	. 
	nop			;5f55	00 	. 
	nop			;5f56	00 	. 
	nop			;5f57	00 	. 
	nop			;5f58	00 	. 
	nop			;5f59	00 	. 
	nop			;5f5a	00 	. 
	nop			;5f5b	00 	. 
	nop			;5f5c	00 	. 
	nop			;5f5d	00 	. 
	nop			;5f5e	00 	. 
	nop			;5f5f	00 	. 
	nop			;5f60	00 	. 
	nop			;5f61	00 	. 
	nop			;5f62	00 	. 
	nop			;5f63	00 	. 
	nop			;5f64	00 	. 
	nop			;5f65	00 	. 
	nop			;5f66	00 	. 
	nop			;5f67	00 	. 
	nop			;5f68	00 	. 
	nop			;5f69	00 	. 
	nop			;5f6a	00 	. 
	nop			;5f6b	00 	. 
	nop			;5f6c	00 	. 
	nop			;5f6d	00 	. 
	nop			;5f6e	00 	. 
	nop			;5f6f	00 	. 
	nop			;5f70	00 	. 
	nop			;5f71	00 	. 
	nop			;5f72	00 	. 
	nop			;5f73	00 	. 
	nop			;5f74	00 	. 
	nop			;5f75	00 	. 
	nop			;5f76	00 	. 
	nop			;5f77	00 	. 
	nop			;5f78	00 	. 
	nop			;5f79	00 	. 
	nop			;5f7a	00 	. 
	nop			;5f7b	00 	. 
	nop			;5f7c	00 	. 
	nop			;5f7d	00 	. 
	nop			;5f7e	00 	. 
	nop			;5f7f	00 	. 
	nop			;5f80	00 	. 
	nop			;5f81	00 	. 
	nop			;5f82	00 	. 
	nop			;5f83	00 	. 
	nop			;5f84	00 	. 
	nop			;5f85	00 	. 
	nop			;5f86	00 	. 
	nop			;5f87	00 	. 
	nop			;5f88	00 	. 
	nop			;5f89	00 	. 
	nop			;5f8a	00 	. 
	nop			;5f8b	00 	. 
	nop			;5f8c	00 	. 
	nop			;5f8d	00 	. 
	nop			;5f8e	00 	. 
	nop			;5f8f	00 	. 
	nop			;5f90	00 	. 
	nop			;5f91	00 	. 
	nop			;5f92	00 	. 
	nop			;5f93	00 	. 
	nop			;5f94	00 	. 
	nop			;5f95	00 	. 
	nop			;5f96	00 	. 
	nop			;5f97	00 	. 
	nop			;5f98	00 	. 
	nop			;5f99	00 	. 
	nop			;5f9a	00 	. 
	nop			;5f9b	00 	. 
	nop			;5f9c	00 	. 
	nop			;5f9d	00 	. 
	nop			;5f9e	00 	. 
	nop			;5f9f	00 	. 
	nop			;5fa0	00 	. 
	nop			;5fa1	00 	. 
	nop			;5fa2	00 	. 
	nop			;5fa3	00 	. 
	nop			;5fa4	00 	. 
	nop			;5fa5	00 	. 
	nop			;5fa6	00 	. 
	nop			;5fa7	00 	. 
	nop			;5fa8	00 	. 
	nop			;5fa9	00 	. 
	nop			;5faa	00 	. 
	nop			;5fab	00 	. 
	nop			;5fac	00 	. 
	nop			;5fad	00 	. 
	nop			;5fae	00 	. 
	nop			;5faf	00 	. 
	nop			;5fb0	00 	. 
	nop			;5fb1	00 	. 
	nop			;5fb2	00 	. 
	nop			;5fb3	00 	. 
	nop			;5fb4	00 	. 
	nop			;5fb5	00 	. 
	nop			;5fb6	00 	. 
	nop			;5fb7	00 	. 
	nop			;5fb8	00 	. 
	nop			;5fb9	00 	. 
	nop			;5fba	00 	. 
	nop			;5fbb	00 	. 
	nop			;5fbc	00 	. 
	nop			;5fbd	00 	. 
	nop			;5fbe	00 	. 
	nop			;5fbf	00 	. 
	nop			;5fc0	00 	. 
	nop			;5fc1	00 	. 
	nop			;5fc2	00 	. 
	nop			;5fc3	00 	. 
	nop			;5fc4	00 	. 
	nop			;5fc5	00 	. 
	nop			;5fc6	00 	. 
	nop			;5fc7	00 	. 
	nop			;5fc8	00 	. 
	nop			;5fc9	00 	. 
	nop			;5fca	00 	. 
	nop			;5fcb	00 	. 
	nop			;5fcc	00 	. 
	nop			;5fcd	00 	. 
	nop			;5fce	00 	. 
	nop			;5fcf	00 	. 
	nop			;5fd0	00 	. 
	nop			;5fd1	00 	. 
	nop			;5fd2	00 	. 
	nop			;5fd3	00 	. 
	nop			;5fd4	00 	. 
	nop			;5fd5	00 	. 
	nop			;5fd6	00 	. 
	nop			;5fd7	00 	. 
	nop			;5fd8	00 	. 
	nop			;5fd9	00 	. 
	nop			;5fda	00 	. 
	nop			;5fdb	00 	. 
	nop			;5fdc	00 	. 
	nop			;5fdd	00 	. 
	nop			;5fde	00 	. 
	nop			;5fdf	00 	. 
	nop			;5fe0	00 	. 
	nop			;5fe1	00 	. 
	nop			;5fe2	00 	. 
	nop			;5fe3	00 	. 
	nop			;5fe4	00 	. 
	nop			;5fe5	00 	. 
	nop			;5fe6	00 	. 
	nop			;5fe7	00 	. 
	nop			;5fe8	00 	. 
	nop			;5fe9	00 	. 
	nop			;5fea	00 	. 
	nop			;5feb	00 	. 
	nop			;5fec	00 	. 
	nop			;5fed	00 	. 
	nop			;5fee	00 	. 
	nop			;5fef	00 	. 
	nop			;5ff0	00 	. 
	nop			;5ff1	00 	. 
	nop			;5ff2	00 	. 
	nop			;5ff3	00 	. 
	nop			;5ff4	00 	. 
	nop			;5ff5	00 	. 
	nop			;5ff6	00 	. 
	nop			;5ff7	00 	. 
	nop			;5ff8	00 	. 
	nop			;5ff9	00 	. 
	nop			;5ffa	00 	. 
	nop			;5ffb	00 	. 
	nop			;5ffc	00 	. 
	nop			;5ffd	00 	. 
	nop			;5ffe	00 	. 
	nop			;5fff	00 	. 
	nop			;6000	00 	. 
	nop			;6001	00 	. 
	nop			;6002	00 	. 
	nop			;6003	00 	. 
	nop			;6004	00 	. 
	nop			;6005	00 	. 
	nop			;6006	00 	. 
	nop			;6007	00 	. 
	nop			;6008	00 	. 
	nop			;6009	00 	. 
	nop			;600a	00 	. 
	nop			;600b	00 	. 
	nop			;600c	00 	. 
	nop			;600d	00 	. 
	nop			;600e	00 	. 
	nop			;600f	00 	. 
	nop			;6010	00 	. 
	nop			;6011	00 	. 
	nop			;6012	00 	. 
	nop			;6013	00 	. 
	nop			;6014	00 	. 
	nop			;6015	00 	. 
	nop			;6016	00 	. 
	nop			;6017	00 	. 
	nop			;6018	00 	. 
	nop			;6019	00 	. 
	nop			;601a	00 	. 
	nop			;601b	00 	. 
	nop			;601c	00 	. 
	nop			;601d	00 	. 
	nop			;601e	00 	. 
	nop			;601f	00 	. 
	nop			;6020	00 	. 
	nop			;6021	00 	. 
	nop			;6022	00 	. 
	nop			;6023	00 	. 
	nop			;6024	00 	. 
	nop			;6025	00 	. 
	nop			;6026	00 	. 
	nop			;6027	00 	. 
	nop			;6028	00 	. 
	nop			;6029	00 	. 
	nop			;602a	00 	. 
	nop			;602b	00 	. 
	nop			;602c	00 	. 
	nop			;602d	00 	. 
	nop			;602e	00 	. 
	nop			;602f	00 	. 
	nop			;6030	00 	. 
	nop			;6031	00 	. 
	nop			;6032	00 	. 
	nop			;6033	00 	. 
	nop			;6034	00 	. 
	nop			;6035	00 	. 
	nop			;6036	00 	. 
	nop			;6037	00 	. 
	nop			;6038	00 	. 
	nop			;6039	00 	. 
	nop			;603a	00 	. 
	nop			;603b	00 	. 
	nop			;603c	00 	. 
	nop			;603d	00 	. 
	nop			;603e	00 	. 
	nop			;603f	00 	. 
	nop			;6040	00 	. 
	nop			;6041	00 	. 
	nop			;6042	00 	. 
	nop			;6043	00 	. 
l6044h:
	nop			;6044	00 	. 
	nop			;6045	00 	. 
	nop			;6046	00 	. 
	nop			;6047	00 	. 
	nop			;6048	00 	. 
	nop			;6049	00 	. 
	nop			;604a	00 	. 
	nop			;604b	00 	. 
	nop			;604c	00 	. 
	nop			;604d	00 	. 
	nop			;604e	00 	. 
	nop			;604f	00 	. 
	nop			;6050	00 	. 
	nop			;6051	00 	. 
	nop			;6052	00 	. 
	nop			;6053	00 	. 
	nop			;6054	00 	. 
	nop			;6055	00 	. 
	nop			;6056	00 	. 
	nop			;6057	00 	. 
	nop			;6058	00 	. 
	nop			;6059	00 	. 
	nop			;605a	00 	. 
	nop			;605b	00 	. 
	nop			;605c	00 	. 
	nop			;605d	00 	. 
	nop			;605e	00 	. 
	nop			;605f	00 	. 
	nop			;6060	00 	. 
	nop			;6061	00 	. 
	nop			;6062	00 	. 
	nop			;6063	00 	. 
	nop			;6064	00 	. 
	nop			;6065	00 	. 
	nop			;6066	00 	. 
	nop			;6067	00 	. 
	nop			;6068	00 	. 
	nop			;6069	00 	. 
	nop			;606a	00 	. 
	nop			;606b	00 	. 
	nop			;606c	00 	. 
	nop			;606d	00 	. 
	nop			;606e	00 	. 
	nop			;606f	00 	. 
	nop			;6070	00 	. 
	nop			;6071	00 	. 
	nop			;6072	00 	. 
	nop			;6073	00 	. 
	nop			;6074	00 	. 
	nop			;6075	00 	. 
	nop			;6076	00 	. 
	nop			;6077	00 	. 
	nop			;6078	00 	. 
	nop			;6079	00 	. 
	nop			;607a	00 	. 
	nop			;607b	00 	. 
	nop			;607c	00 	. 
	nop			;607d	00 	. 
	nop			;607e	00 	. 
	nop			;607f	00 	. 
	nop			;6080	00 	. 
	nop			;6081	00 	. 
	nop			;6082	00 	. 
	nop			;6083	00 	. 
	nop			;6084	00 	. 
	nop			;6085	00 	. 
	nop			;6086	00 	. 
	nop			;6087	00 	. 
	nop			;6088	00 	. 
	nop			;6089	00 	. 
	nop			;608a	00 	. 
	nop			;608b	00 	. 
	nop			;608c	00 	. 
	nop			;608d	00 	. 
	nop			;608e	00 	. 
	nop			;608f	00 	. 
	nop			;6090	00 	. 
	nop			;6091	00 	. 
	nop			;6092	00 	. 
	nop			;6093	00 	. 
	nop			;6094	00 	. 
	nop			;6095	00 	. 
	nop			;6096	00 	. 
	nop			;6097	00 	. 
	nop			;6098	00 	. 
	nop			;6099	00 	. 
	nop			;609a	00 	. 
	nop			;609b	00 	. 
	nop			;609c	00 	. 
	nop			;609d	00 	. 
	nop			;609e	00 	. 
	nop			;609f	00 	. 
	nop			;60a0	00 	. 
	nop			;60a1	00 	. 
	nop			;60a2	00 	. 
	nop			;60a3	00 	. 
	nop			;60a4	00 	. 
	nop			;60a5	00 	. 
	nop			;60a6	00 	. 
	nop			;60a7	00 	. 
	nop			;60a8	00 	. 
	nop			;60a9	00 	. 
	nop			;60aa	00 	. 
	nop			;60ab	00 	. 
	nop			;60ac	00 	. 
	nop			;60ad	00 	. 
	nop			;60ae	00 	. 
	nop			;60af	00 	. 
	nop			;60b0	00 	. 
	nop			;60b1	00 	. 
	nop			;60b2	00 	. 
	nop			;60b3	00 	. 
	nop			;60b4	00 	. 
	nop			;60b5	00 	. 
	nop			;60b6	00 	. 
	nop			;60b7	00 	. 
	nop			;60b8	00 	. 
	nop			;60b9	00 	. 
	nop			;60ba	00 	. 
	nop			;60bb	00 	. 
	nop			;60bc	00 	. 
	nop			;60bd	00 	. 
	nop			;60be	00 	. 
	nop			;60bf	00 	. 
	nop			;60c0	00 	. 
	nop			;60c1	00 	. 
	nop			;60c2	00 	. 
	nop			;60c3	00 	. 
	nop			;60c4	00 	. 
	nop			;60c5	00 	. 
	nop			;60c6	00 	. 
	nop			;60c7	00 	. 
	nop			;60c8	00 	. 
	nop			;60c9	00 	. 
	nop			;60ca	00 	. 
	nop			;60cb	00 	. 
	nop			;60cc	00 	. 
	nop			;60cd	00 	. 
	nop			;60ce	00 	. 
	nop			;60cf	00 	. 
	nop			;60d0	00 	. 
	nop			;60d1	00 	. 
	nop			;60d2	00 	. 
	nop			;60d3	00 	. 
	nop			;60d4	00 	. 
	nop			;60d5	00 	. 
	nop			;60d6	00 	. 
	nop			;60d7	00 	. 
	nop			;60d8	00 	. 
	nop			;60d9	00 	. 
	nop			;60da	00 	. 
	nop			;60db	00 	. 
	nop			;60dc	00 	. 
	nop			;60dd	00 	. 
	nop			;60de	00 	. 
	nop			;60df	00 	. 
	nop			;60e0	00 	. 
	nop			;60e1	00 	. 
	nop			;60e2	00 	. 
	nop			;60e3	00 	. 
	nop			;60e4	00 	. 
	nop			;60e5	00 	. 
	nop			;60e6	00 	. 
	nop			;60e7	00 	. 
	nop			;60e8	00 	. 
	nop			;60e9	00 	. 
	nop			;60ea	00 	. 
	nop			;60eb	00 	. 
	nop			;60ec	00 	. 
	nop			;60ed	00 	. 
	nop			;60ee	00 	. 
	nop			;60ef	00 	. 
	nop			;60f0	00 	. 
	nop			;60f1	00 	. 
	nop			;60f2	00 	. 
	nop			;60f3	00 	. 
	nop			;60f4	00 	. 
	nop			;60f5	00 	. 
	nop			;60f6	00 	. 
	nop			;60f7	00 	. 
	nop			;60f8	00 	. 
	nop			;60f9	00 	. 
	nop			;60fa	00 	. 
	nop			;60fb	00 	. 
	nop			;60fc	00 	. 
	nop			;60fd	00 	. 
	nop			;60fe	00 	. 
	nop			;60ff	00 	. 
	nop			;6100	00 	. 
	nop			;6101	00 	. 
	nop			;6102	00 	. 
	nop			;6103	00 	. 
	nop			;6104	00 	. 
	nop			;6105	00 	. 
	nop			;6106	00 	. 
	nop			;6107	00 	. 
	nop			;6108	00 	. 
	nop			;6109	00 	. 
	nop			;610a	00 	. 
	nop			;610b	00 	. 
	nop			;610c	00 	. 
	nop			;610d	00 	. 
	nop			;610e	00 	. 
	nop			;610f	00 	. 
	nop			;6110	00 	. 
	nop			;6111	00 	. 
	nop			;6112	00 	. 
	nop			;6113	00 	. 
	nop			;6114	00 	. 
	nop			;6115	00 	. 
	nop			;6116	00 	. 
	nop			;6117	00 	. 
	nop			;6118	00 	. 
	nop			;6119	00 	. 
	nop			;611a	00 	. 
	nop			;611b	00 	. 
	nop			;611c	00 	. 
	nop			;611d	00 	. 
	nop			;611e	00 	. 
	nop			;611f	00 	. 
	nop			;6120	00 	. 
	nop			;6121	00 	. 
	nop			;6122	00 	. 
	nop			;6123	00 	. 
	nop			;6124	00 	. 
	nop			;6125	00 	. 
	nop			;6126	00 	. 
	nop			;6127	00 	. 
	nop			;6128	00 	. 
	nop			;6129	00 	. 
	nop			;612a	00 	. 
	nop			;612b	00 	. 
	nop			;612c	00 	. 
	nop			;612d	00 	. 
	nop			;612e	00 	. 
	nop			;612f	00 	. 
	nop			;6130	00 	. 
	nop			;6131	00 	. 
	nop			;6132	00 	. 
	nop			;6133	00 	. 
	nop			;6134	00 	. 
	nop			;6135	00 	. 
	nop			;6136	00 	. 
	nop			;6137	00 	. 
	nop			;6138	00 	. 
	nop			;6139	00 	. 
	nop			;613a	00 	. 
	nop			;613b	00 	. 
	nop			;613c	00 	. 
	nop			;613d	00 	. 
	nop			;613e	00 	. 
	nop			;613f	00 	. 
	nop			;6140	00 	. 
	nop			;6141	00 	. 
	nop			;6142	00 	. 
	nop			;6143	00 	. 
	nop			;6144	00 	. 
	nop			;6145	00 	. 
	nop			;6146	00 	. 
	nop			;6147	00 	. 
	nop			;6148	00 	. 
	nop			;6149	00 	. 
	nop			;614a	00 	. 
	nop			;614b	00 	. 
	nop			;614c	00 	. 
	nop			;614d	00 	. 
	nop			;614e	00 	. 
	nop			;614f	00 	. 
	nop			;6150	00 	. 
	nop			;6151	00 	. 
	nop			;6152	00 	. 
	nop			;6153	00 	. 
	nop			;6154	00 	. 
	nop			;6155	00 	. 
	nop			;6156	00 	. 
	nop			;6157	00 	. 
	nop			;6158	00 	. 
	nop			;6159	00 	. 
	nop			;615a	00 	. 
	nop			;615b	00 	. 
	nop			;615c	00 	. 
	nop			;615d	00 	. 
	nop			;615e	00 	. 
	nop			;615f	00 	. 
	nop			;6160	00 	. 
	nop			;6161	00 	. 
	nop			;6162	00 	. 
	nop			;6163	00 	. 
	nop			;6164	00 	. 
	nop			;6165	00 	. 
	nop			;6166	00 	. 
	nop			;6167	00 	. 
	nop			;6168	00 	. 
	nop			;6169	00 	. 
	nop			;616a	00 	. 
	nop			;616b	00 	. 
	nop			;616c	00 	. 
	nop			;616d	00 	. 
	nop			;616e	00 	. 
	nop			;616f	00 	. 
	nop			;6170	00 	. 
	nop			;6171	00 	. 
	nop			;6172	00 	. 
	nop			;6173	00 	. 
	nop			;6174	00 	. 
	nop			;6175	00 	. 
	nop			;6176	00 	. 
	nop			;6177	00 	. 
	nop			;6178	00 	. 
	nop			;6179	00 	. 
	nop			;617a	00 	. 
	nop			;617b	00 	. 
	nop			;617c	00 	. 
	nop			;617d	00 	. 
	nop			;617e	00 	. 
	nop			;617f	00 	. 
	nop			;6180	00 	. 
	nop			;6181	00 	. 
	nop			;6182	00 	. 
	nop			;6183	00 	. 
	nop			;6184	00 	. 
	nop			;6185	00 	. 
	nop			;6186	00 	. 
	nop			;6187	00 	. 
	nop			;6188	00 	. 
	nop			;6189	00 	. 
	nop			;618a	00 	. 
	nop			;618b	00 	. 
	nop			;618c	00 	. 
	nop			;618d	00 	. 
	nop			;618e	00 	. 
	nop			;618f	00 	. 
	nop			;6190	00 	. 
	nop			;6191	00 	. 
	nop			;6192	00 	. 
	nop			;6193	00 	. 
	nop			;6194	00 	. 
	nop			;6195	00 	. 
	nop			;6196	00 	. 
	nop			;6197	00 	. 
	nop			;6198	00 	. 
	nop			;6199	00 	. 
	nop			;619a	00 	. 
	nop			;619b	00 	. 
	nop			;619c	00 	. 
	nop			;619d	00 	. 
	nop			;619e	00 	. 
	nop			;619f	00 	. 
	nop			;61a0	00 	. 
	nop			;61a1	00 	. 
	nop			;61a2	00 	. 
	nop			;61a3	00 	. 
	nop			;61a4	00 	. 
	nop			;61a5	00 	. 
	nop			;61a6	00 	. 
	nop			;61a7	00 	. 
	nop			;61a8	00 	. 
	nop			;61a9	00 	. 
	nop			;61aa	00 	. 
	nop			;61ab	00 	. 
	nop			;61ac	00 	. 
	nop			;61ad	00 	. 
	nop			;61ae	00 	. 
	nop			;61af	00 	. 
	nop			;61b0	00 	. 
	nop			;61b1	00 	. 
	nop			;61b2	00 	. 
	nop			;61b3	00 	. 
	nop			;61b4	00 	. 
	nop			;61b5	00 	. 
	nop			;61b6	00 	. 
	nop			;61b7	00 	. 
	nop			;61b8	00 	. 
	nop			;61b9	00 	. 
	nop			;61ba	00 	. 
	nop			;61bb	00 	. 
	nop			;61bc	00 	. 
	nop			;61bd	00 	. 
	nop			;61be	00 	. 
	nop			;61bf	00 	. 
	nop			;61c0	00 	. 
	nop			;61c1	00 	. 
	nop			;61c2	00 	. 
	nop			;61c3	00 	. 
	nop			;61c4	00 	. 
	nop			;61c5	00 	. 
	nop			;61c6	00 	. 
	nop			;61c7	00 	. 
	nop			;61c8	00 	. 
	nop			;61c9	00 	. 
	nop			;61ca	00 	. 
	nop			;61cb	00 	. 
	nop			;61cc	00 	. 
	nop			;61cd	00 	. 
	nop			;61ce	00 	. 
	nop			;61cf	00 	. 
	nop			;61d0	00 	. 
	nop			;61d1	00 	. 
	nop			;61d2	00 	. 
	nop			;61d3	00 	. 
	nop			;61d4	00 	. 
	nop			;61d5	00 	. 
	nop			;61d6	00 	. 
	nop			;61d7	00 	. 
	nop			;61d8	00 	. 
	nop			;61d9	00 	. 
	nop			;61da	00 	. 
	nop			;61db	00 	. 
	nop			;61dc	00 	. 
	nop			;61dd	00 	. 
	nop			;61de	00 	. 
	nop			;61df	00 	. 
	nop			;61e0	00 	. 
	nop			;61e1	00 	. 
	nop			;61e2	00 	. 
	nop			;61e3	00 	. 
	nop			;61e4	00 	. 
	nop			;61e5	00 	. 
	nop			;61e6	00 	. 
	nop			;61e7	00 	. 
	nop			;61e8	00 	. 
	nop			;61e9	00 	. 
	nop			;61ea	00 	. 
	nop			;61eb	00 	. 
	nop			;61ec	00 	. 
	nop			;61ed	00 	. 
	nop			;61ee	00 	. 
	nop			;61ef	00 	. 
	nop			;61f0	00 	. 
	nop			;61f1	00 	. 
	nop			;61f2	00 	. 
	nop			;61f3	00 	. 
	nop			;61f4	00 	. 
	nop			;61f5	00 	. 
	nop			;61f6	00 	. 
	nop			;61f7	00 	. 
	nop			;61f8	00 	. 
	nop			;61f9	00 	. 
	nop			;61fa	00 	. 
	nop			;61fb	00 	. 
	nop			;61fc	00 	. 
	nop			;61fd	00 	. 
	nop			;61fe	00 	. 
	nop			;61ff	00 	. 
	nop			;6200	00 	. 
	nop			;6201	00 	. 
	nop			;6202	00 	. 
	nop			;6203	00 	. 
	nop			;6204	00 	. 
	nop			;6205	00 	. 
	nop			;6206	00 	. 
	nop			;6207	00 	. 
	nop			;6208	00 	. 
	nop			;6209	00 	. 
	nop			;620a	00 	. 
	nop			;620b	00 	. 
	nop			;620c	00 	. 
	nop			;620d	00 	. 
	nop			;620e	00 	. 
	nop			;620f	00 	. 
	nop			;6210	00 	. 
	nop			;6211	00 	. 
	nop			;6212	00 	. 
	nop			;6213	00 	. 
	nop			;6214	00 	. 
	nop			;6215	00 	. 
	nop			;6216	00 	. 
	nop			;6217	00 	. 
	nop			;6218	00 	. 
	nop			;6219	00 	. 
	nop			;621a	00 	. 
	nop			;621b	00 	. 
	nop			;621c	00 	. 
	nop			;621d	00 	. 
	nop			;621e	00 	. 
	nop			;621f	00 	. 
	nop			;6220	00 	. 
	nop			;6221	00 	. 
	nop			;6222	00 	. 
	nop			;6223	00 	. 
	nop			;6224	00 	. 
	nop			;6225	00 	. 
	nop			;6226	00 	. 
	nop			;6227	00 	. 
	nop			;6228	00 	. 
	nop			;6229	00 	. 
	nop			;622a	00 	. 
	nop			;622b	00 	. 
	nop			;622c	00 	. 
	nop			;622d	00 	. 
	nop			;622e	00 	. 
	nop			;622f	00 	. 
	nop			;6230	00 	. 
	nop			;6231	00 	. 
	nop			;6232	00 	. 
	nop			;6233	00 	. 
	nop			;6234	00 	. 
	nop			;6235	00 	. 
	nop			;6236	00 	. 
	nop			;6237	00 	. 
	nop			;6238	00 	. 
	nop			;6239	00 	. 
	nop			;623a	00 	. 
	nop			;623b	00 	. 
	nop			;623c	00 	. 
	nop			;623d	00 	. 
	nop			;623e	00 	. 
	nop			;623f	00 	. 
	nop			;6240	00 	. 
	nop			;6241	00 	. 
	nop			;6242	00 	. 
	nop			;6243	00 	. 
	nop			;6244	00 	. 
	nop			;6245	00 	. 
	nop			;6246	00 	. 
	nop			;6247	00 	. 
	nop			;6248	00 	. 
	nop			;6249	00 	. 
	nop			;624a	00 	. 
	nop			;624b	00 	. 
	nop			;624c	00 	. 
	nop			;624d	00 	. 
	nop			;624e	00 	. 
	nop			;624f	00 	. 
	nop			;6250	00 	. 
	nop			;6251	00 	. 
	nop			;6252	00 	. 
	nop			;6253	00 	. 
	nop			;6254	00 	. 
	nop			;6255	00 	. 
	nop			;6256	00 	. 
	nop			;6257	00 	. 
	nop			;6258	00 	. 
	nop			;6259	00 	. 
	nop			;625a	00 	. 
	nop			;625b	00 	. 
	nop			;625c	00 	. 
	nop			;625d	00 	. 
	nop			;625e	00 	. 
	nop			;625f	00 	. 
	nop			;6260	00 	. 
	nop			;6261	00 	. 
	nop			;6262	00 	. 
	nop			;6263	00 	. 
	nop			;6264	00 	. 
	nop			;6265	00 	. 
	nop			;6266	00 	. 
	nop			;6267	00 	. 
	nop			;6268	00 	. 
	nop			;6269	00 	. 
	nop			;626a	00 	. 
	nop			;626b	00 	. 
	nop			;626c	00 	. 
	nop			;626d	00 	. 
	rst 38h			;626e	ff 	. 
	rst 38h			;626f	ff 	. 
l6270h:
	nop			;6270	00 	. 
	nop			;6271	00 	. 
	nop			;6272	00 	. 
	nop			;6273	00 	. 
	nop			;6274	00 	. 
	nop			;6275	00 	. 
	nop			;6276	00 	. 
	nop			;6277	00 	. 
	nop			;6278	00 	. 
	nop			;6279	00 	. 
	nop			;627a	00 	. 
	nop			;627b	00 	. 
	nop			;627c	00 	. 
	nop			;627d	00 	. 
	nop			;627e	00 	. 
	nop			;627f	00 	. 
	nop			;6280	00 	. 
	nop			;6281	00 	. 
	nop			;6282	00 	. 
	nop			;6283	00 	. 
	nop			;6284	00 	. 
	nop			;6285	00 	. 
	nop			;6286	00 	. 
	nop			;6287	00 	. 
	nop			;6288	00 	. 
	nop			;6289	00 	. 
	nop			;628a	00 	. 
	nop			;628b	00 	. 
	nop			;628c	00 	. 
	nop			;628d	00 	. 
	nop			;628e	00 	. 
	nop			;628f	00 	. 
	nop			;6290	00 	. 
	nop			;6291	00 	. 
	nop			;6292	00 	. 
	nop			;6293	00 	. 
	nop			;6294	00 	. 
	nop			;6295	00 	. 
	nop			;6296	00 	. 
	nop			;6297	00 	. 
	nop			;6298	00 	. 
	nop			;6299	00 	. 
	nop			;629a	00 	. 
	nop			;629b	00 	. 
	nop			;629c	00 	. 
	nop			;629d	00 	. 
	nop			;629e	00 	. 
	nop			;629f	00 	. 
	nop			;62a0	00 	. 
	nop			;62a1	00 	. 
	nop			;62a2	00 	. 
	nop			;62a3	00 	. 
	nop			;62a4	00 	. 
	nop			;62a5	00 	. 
	nop			;62a6	00 	. 
	nop			;62a7	00 	. 
	nop			;62a8	00 	. 
	nop			;62a9	00 	. 
	nop			;62aa	00 	. 
	nop			;62ab	00 	. 
	nop			;62ac	00 	. 
	nop			;62ad	00 	. 
	nop			;62ae	00 	. 
	nop			;62af	00 	. 
	nop			;62b0	00 	. 
	nop			;62b1	00 	. 
	nop			;62b2	00 	. 
	nop			;62b3	00 	. 
	nop			;62b4	00 	. 
	nop			;62b5	00 	. 
	nop			;62b6	00 	. 
	nop			;62b7	00 	. 
	nop			;62b8	00 	. 
	nop			;62b9	00 	. 
	nop			;62ba	00 	. 
	nop			;62bb	00 	. 
	nop			;62bc	00 	. 
	nop			;62bd	00 	. 
	nop			;62be	00 	. 
	nop			;62bf	00 	. 
	rst 38h			;62c0	ff 	. 
	rst 38h			;62c1	ff 	. 
l62c2h:
	nop			;62c2	00 	. 
	nop			;62c3	00 	. 
	ld d,b			;62c4	50 	P 
	nop			;62c5	00 	. 
	and b			;62c6	a0 	. 
	nop			;62c7	00 	. 
	ret p			;62c8	f0 	. 
	nop			;62c9	00 	. 
	ld b,b			;62ca	40 	@ 
	ld bc,00190h		;62cb	01 90 01 	. . . 
	ret po			;62ce	e0 	. 
	ld bc,00230h		;62cf	01 30 02 	. 0 . 
	add a,b			;62d2	80 	. 
	ld (bc),a			;62d3	02 	. 
	ret nc			;62d4	d0 	. 
	ld (bc),a			;62d5	02 	. 
	jr nz,l62dbh		;62d6	20 03 	  . 
	ld (hl),b			;62d8	70 	p 
	inc bc			;62d9	03 	. 
	ret nz			;62da	c0 	. 
l62dbh:
	inc bc			;62db	03 	. 
	djnz l62e2h		;62dc	10 04 	. . 
	ld h,b			;62de	60 	` 
	inc b			;62df	04 	. 
	or b			;62e0	b0 	. 
	inc b			;62e1	04 	. 
l62e2h:
	nop			;62e2	00 	. 
	dec b			;62e3	05 	. 
	ld d,b			;62e4	50 	P 
	dec b			;62e5	05 	. 
	and b			;62e6	a0 	. 
	dec b			;62e7	05 	. 
	ret p			;62e8	f0 	. 
	dec b			;62e9	05 	. 
	ld b,b			;62ea	40 	@ 
	ld b,090h		;62eb	06 90 	. . 
	ld b,0e0h		;62ed	06 e0 	. . 
	ld b,030h		;62ef	06 30 	. 0 
	rlca			;62f1	07 	. 
	add a,d			;62f2	82 	. 
	rlca			;62f3	07 	. 
	rst 38h			;62f4	ff 	. 
	rst 38h			;62f5	ff 	. 
	ld d,e			;62f6	53 	S 
	ld d,h			;62f7	54 	T 
	ld b,c			;62f8	41 	A 
	ld d,d			;62f9	52 	R 
	ld d,h			;62fa	54 	T 
	jr nz,l634ch		;62fb	20 4f 	  O 
	ld b,(hl)			;62fd	46 	F 
	jr nz,l6340h		;62fe	20 40 	  @ 
	ld d,e			;6300	53 	S 
	ld d,l			;6301	55 	U 
	ld b,d			;6302	42 	B 
	ld b,(hl)			;6303	46 	F 
l6304h:
	nop			;6304	00 	. 
	nop			;6305	00 	. 
	nop			;6306	00 	. 
	nop			;6307	00 	. 
	nop			;6308	00 	. 
	nop			;6309	00 	. 
	nop			;630a	00 	. 
	nop			;630b	00 	. 
	ex af,af'			;630c	08 	. 
	ex af,af'			;630d	08 	. 
	ex af,af'			;630e	08 	. 
	ex af,af'			;630f	08 	. 
	ex af,af'			;6310	08 	. 
	nop			;6311	00 	. 
	ex af,af'			;6312	08 	. 
	nop			;6313	00 	. 
	inc d			;6314	14 	. 
	inc d			;6315	14 	. 
	nop			;6316	00 	. 
	nop			;6317	00 	. 
	nop			;6318	00 	. 
	nop			;6319	00 	. 
	nop			;631a	00 	. 
	nop			;631b	00 	. 
	inc d			;631c	14 	. 
	inc d			;631d	14 	. 
	ld a,014h		;631e	3e 14 	> . 
	ld a,014h		;6320	3e 14 	> . 
	inc d			;6322	14 	. 
	nop			;6323	00 	. 
	ex af,af'			;6324	08 	. 
	inc a			;6325	3c 	< 
	ld a,(bc)			;6326	0a 	. 
	ld a,028h		;6327	3e 28 	> ( 
	ld e,008h		;6329	1e 08 	. . 
	nop			;632b	00 	. 
	nop			;632c	00 	. 
	ld h,016h		;632d	26 16 	& . 
	ex af,af'			;632f	08 	. 
	inc (hl)			;6330	34 	4 
	ld (00000h),a		;6331	32 00 00 	2 . . 
	inc b			;6334	04 	. 
	ld a,(bc)			;6335	0a 	. 
	ld a,(bc)			;6336	0a 	. 
	inc b			;6337	04 	. 
	ld hl,(l2c12h)		;6338	2a 12 2c 	* . , 
	nop			;633b	00 	. 
	ex af,af'			;633c	08 	. 
	ex af,af'			;633d	08 	. 
	nop			;633e	00 	. 
	nop			;633f	00 	. 
l6340h:
	nop			;6340	00 	. 
	nop			;6341	00 	. 
	nop			;6342	00 	. 
	nop			;6343	00 	. 
	ex af,af'			;6344	08 	. 
	inc b			;6345	04 	. 
	ld (bc),a			;6346	02 	. 
	ld (bc),a			;6347	02 	. 
	ld (bc),a			;6348	02 	. 
	inc b			;6349	04 	. 
	ex af,af'			;634a	08 	. 
	nop			;634b	00 	. 
l634ch:
	ex af,af'			;634c	08 	. 
	djnz l636fh		;634d	10 20 	.   
	jr nz,l6371h		;634f	20 20 	    
	djnz 10		;6351	10 08 	. . 
	nop			;6353	00 	. 
	ex af,af'			;6354	08 	. 
	ld hl,(0081ch)		;6355	2a 1c 08 	* . . 
	inc e			;6358	1c 	. 
	ld hl,(00008h)		;6359	2a 08 00 	* . . 
	ex af,af'			;635c	08 	. 
	ex af,af'			;635d	08 	. 
	ex af,af'			;635e	08 	. 
	ld a,008h		;635f	3e 08 	> . 
	ex af,af'			;6361	08 	. 
	ex af,af'			;6362	08 	. 
	nop			;6363	00 	. 
	nop			;6364	00 	. 
	nop			;6365	00 	. 
	nop			;6366	00 	. 
	nop			;6367	00 	. 
	ex af,af'			;6368	08 	. 
	ex af,af'			;6369	08 	. 
	inc b			;636a	04 	. 
	nop			;636b	00 	. 
	nop			;636c	00 	. 
	nop			;636d	00 	. 
	nop			;636e	00 	. 
l636fh:
	ld a,000h		;636f	3e 00 	> . 
l6371h:
	nop			;6371	00 	. 
	nop			;6372	00 	. 
	nop			;6373	00 	. 
	nop			;6374	00 	. 
	nop			;6375	00 	. 
	nop			;6376	00 	. 
	nop			;6377	00 	. 
	nop			;6378	00 	. 
	nop			;6379	00 	. 
	ex af,af'			;637a	08 	. 
	nop			;637b	00 	. 
	nop			;637c	00 	. 
	jr nz,l638fh		;637d	20 10 	  . 
	ex af,af'			;637f	08 	. 
	inc b			;6380	04 	. 
	ld (bc),a			;6381	02 	. 
	nop			;6382	00 	. 
	nop			;6383	00 	. 
	inc e			;6384	1c 	. 
	ld (l2a32h),hl		;6385	22 32 2a 	" 2 * 
	ld h,022h		;6388	26 22 	& " 
	inc e			;638a	1c 	. 
	nop			;638b	00 	. 
	ex af,af'			;638c	08 	. 
	inc c			;638d	0c 	. 
	ex af,af'			;638e	08 	. 
l638fh:
	ex af,af'			;638f	08 	. 
	ex af,af'			;6390	08 	. 
	ex af,af'			;6391	08 	. 
	inc e			;6392	1c 	. 
	nop			;6393	00 	. 
	inc e			;6394	1c 	. 
	ld (l1820h),hl		;6395	22 20 18 	"   . 
	inc b			;6398	04 	. 
	ld (bc),a			;6399	02 	. 
	ld a,000h		;639a	3e 00 	> . 
	ld a,020h		;639c	3e 20 	>   
	djnz 26		;639e	10 18 	. . 
	jr nz,l63c4h		;63a0	20 22 	  " 
	inc e			;63a2	1c 	. 
	nop			;63a3	00 	. 
	djnz l63beh		;63a4	10 18 	. . 
	inc d			;63a6	14 	. 
	ld (de),a			;63a7	12 	. 
	ld a,010h		;63a8	3e 10 	> . 
	djnz l63ach		;63aa	10 00 	. . 
l63ach:
	ld a,002h		;63ac	3e 02 	> . 
	ld e,020h		;63ae	1e 20 	.   
	jr nz,l63d4h		;63b0	20 22 	  " 
	inc e			;63b2	1c 	. 
	nop			;63b3	00 	. 
	jr c,6		;63b4	38 04 	8 . 
	ld (bc),a			;63b6	02 	. 
	ld e,022h		;63b7	1e 22 	. " 
	ld (0001ch),hl		;63b9	22 1c 00 	" . . 
	ld a,020h		;63bc	3e 20 	>   
l63beh:
	djnz l63c8h		;63be	10 08 	. . 
	inc b			;63c0	04 	. 
	inc b			;63c1	04 	. 
	inc b			;63c2	04 	. 
	nop			;63c3	00 	. 
l63c4h:
	inc e			;63c4	1c 	. 
	ld (disk_sector),hl		;63c5	22 22 1c 	" " . 
l63c8h:
	ld (disk_sector),hl		;63c8	22 22 1c 	" " . 
	nop			;63cb	00 	. 
	inc e			;63cc	1c 	. 
	ld (l3c22h),hl		;63cd	22 22 3c 	" " < 
	jr nz,l63e2h		;63d0	20 10 	  . 
	ld c,000h		;63d2	0e 00 	. . 
l63d4h:
	nop			;63d4	00 	. 
	nop			;63d5	00 	. 
	ex af,af'			;63d6	08 	. 
	nop			;63d7	00 	. 
	nop			;63d8	00 	. 
	ex af,af'			;63d9	08 	. 
	nop			;63da	00 	. 
	nop			;63db	00 	. 
	nop			;63dc	00 	. 
	nop			;63dd	00 	. 
	ex af,af'			;63de	08 	. 
	nop			;63df	00 	. 
	nop			;63e0	00 	. 
	ex af,af'			;63e1	08 	. 
l63e2h:
	inc b			;63e2	04 	. 
	nop			;63e3	00 	. 
	jr nz,l63f6h		;63e4	20 10 	  . 
	ex af,af'			;63e6	08 	. 
	inc b			;63e7	04 	. 
	ex af,af'			;63e8	08 	. 
	djnz l640bh		;63e9	10 20 	.   
	nop			;63eb	00 	. 
	nop			;63ec	00 	. 
	nop			;63ed	00 	. 
	ld a,000h		;63ee	3e 00 	> . 
	ld a,000h		;63f0	3e 00 	> . 
	nop			;63f2	00 	. 
	nop			;63f3	00 	. 
	ld (bc),a			;63f4	02 	. 
	inc b			;63f5	04 	. 
l63f6h:
	ex af,af'			;63f6	08 	. 
	djnz l6401h		;63f7	10 08 	. . 
	inc b			;63f9	04 	. 
	ld (bc),a			;63fa	02 	. 
	nop			;63fb	00 	. 
	inc e			;63fc	1c 	. 
	ld (00810h),hl		;63fd	22 10 08 	" . . 
	ex af,af'			;6400	08 	. 
l6401h:
	nop			;6401	00 	. 
	ex af,af'			;6402	08 	. 
	nop			;6403	00 	. 
	inc e			;6404	1c 	. 
	ld (l3a2ah),hl		;6405	22 2a 3a 	" * : 
	ld a,(de)			;6408	1a 	. 
	ld (bc),a			;6409	02 	. 
	inc a			;640a	3c 	< 
l640bh:
	nop			;640b	00 	. 
	ex af,af'			;640c	08 	. 
	inc d			;640d	14 	. 
	ld (l3e22h),hl		;640e	22 22 3e 	" " > 
	ld (00022h),hl		;6411	22 22 00 	" " . 
	ld e,022h		;6414	1e 22 	. " 
	ld (l221ch+2),hl		;6416	22 1e 22 	" . " 
	ld (0001eh),hl		;6419	22 1e 00 	" . . 
	inc e			;641c	1c 	. 
	ld (00202h),hl		;641d	22 02 02 	" . . 
	ld (bc),a			;6420	02 	. 
	ld (0001ch),hl		;6421	22 1c 00 	" . . 
	ld e,022h		;6424	1e 22 	. " 
	ld (l2222h),hl		;6426	22 22 22 	" " " 
	ld (0001eh),hl		;6429	22 1e 00 	" . . 
	ld a,002h		;642c	3e 02 	> . 
	ld (bc),a			;642e	02 	. 
	ld e,002h		;642f	1e 02 	. . 
	ld (bc),a			;6431	02 	. 
	ld a,000h		;6432	3e 00 	> . 
	ld a,002h		;6434	3e 02 	> . 
	ld (bc),a			;6436	02 	. 
	ld e,002h		;6437	1e 02 	. . 
	ld (bc),a			;6439	02 	. 
	ld (bc),a			;643a	02 	. 
	nop			;643b	00 	. 
	inc a			;643c	3c 	< 
	ld (bc),a			;643d	02 	. 
	ld (bc),a			;643e	02 	. 
	ld a,(l2222h)		;643f	3a 22 22 	: " " 
	inc e			;6442	1c 	. 
	nop			;6443	00 	. 
	ld (l2222h),hl		;6444	22 22 22 	" " " 
	ld a,022h		;6447	3e 22 	> " 
	ld (00022h),hl		;6449	22 22 00 	" " . 
	inc e			;644c	1c 	. 
	ex af,af'			;644d	08 	. 
	ex af,af'			;644e	08 	. 
	ex af,af'			;644f	08 	. 
	ex af,af'			;6450	08 	. 
	ex af,af'			;6451	08 	. 
	inc e			;6452	1c 	. 
	nop			;6453	00 	. 
	djnz l6466h		;6454	10 10 	. . 
	djnz l6468h		;6456	10 10 	. . 
	ld (de),a			;6458	12 	. 
	ld (de),a			;6459	12 	. 
	inc c			;645a	0c 	. 
	nop			;645b	00 	. 
	ld (00a12h),hl		;645c	22 12 0a 	" . . 
	ld b,00ah		;645f	06 0a 	. . 
	ld (de),a			;6461	12 	. 
	ld (00200h),hl		;6462	22 00 02 	" . . 
	ld (bc),a			;6465	02 	. 
l6466h:
	ld (bc),a			;6466	02 	. 
	ld (bc),a			;6467	02 	. 
l6468h:
	ld (bc),a			;6468	02 	. 
	ld (bc),a			;6469	02 	. 
	ld a,000h		;646a	3e 00 	> . 
	ld (l2a36h),hl		;646c	22 36 2a 	" 6 * 
	ld hl,(l2222h)		;646f	2a 22 22 	* " " 
	ld (restore_sel_func_key_tbl+2),hl		;6472	22 00 22 	" . " 
	ld (l2a26h),hl		;6475	22 26 2a 	" & * 
	ld (l2222h),a		;6478	32 22 22 	2 " " 
	nop			;647b	00 	. 
	inc e			;647c	1c 	. 
	ld (l2222h),hl		;647d	22 22 22 	" " " 
	ld (disk_sector),hl		;6480	22 22 1c 	" " . 
	nop			;6483	00 	. 
	ld e,022h		;6484	1e 22 	. " 
	ld (0021eh),hl		;6486	22 1e 02 	" . . 
	ld (bc),a			;6489	02 	. 
	ld (bc),a			;648a	02 	. 
	nop			;648b	00 	. 
	inc e			;648c	1c 	. 
	ld (l2222h),hl		;648d	22 22 22 	" " " 
	ld hl,(l3c32h)		;6490	2a 32 3c 	* 2 < 
	nop			;6493	00 	. 
	ld e,022h		;6494	1e 22 	. " 
	ld (00a1eh),hl		;6496	22 1e 0a 	" . . 
	ld (de),a			;6499	12 	. 
	ld (l1c00h),hl		;649a	22 00 1c 	" . . 
	ld (l1c02h),hl		;649d	22 02 1c 	" . . 
	jr nz,36		;64a0	20 22 	  " 
	inc e			;64a2	1c 	. 
	nop			;64a3	00 	. 
	ld a,008h		;64a4	3e 08 	> . 
	ex af,af'			;64a6	08 	. 
	ex af,af'			;64a7	08 	. 
	ex af,af'			;64a8	08 	. 
	ex af,af'			;64a9	08 	. 
	ex af,af'			;64aa	08 	. 
	nop			;64ab	00 	. 
	ld (l2222h),hl		;64ac	22 22 22 	" " " 
	ld (l2222h),hl		;64af	22 22 22 	" " " 
	inc e			;64b2	1c 	. 
	nop			;64b3	00 	. 
	ld (l2222h),hl		;64b4	22 22 22 	" " " 
	ld (01422h),hl		;64b7	22 22 14 	" " . 
	ex af,af'			;64ba	08 	. 
	nop			;64bb	00 	. 
	ld (l2222h),hl		;64bc	22 22 22 	" " " 
	ld hl,(l362ah)		;64bf	2a 2a 36 	* * 6 
	ld (restore_sel_func_key_tbl+2),hl		;64c2	22 00 22 	" . " 
	ld (00814h),hl		;64c5	22 14 08 	" . . 
	inc d			;64c8	14 	. 
	ld (00022h),hl		;64c9	22 22 00 	" " . 
	ld (l2222h),hl		;64cc	22 22 22 	" " " 
	inc d			;64cf	14 	. 
	ex af,af'			;64d0	08 	. 
	ex af,af'			;64d1	08 	. 
	ex af,af'			;64d2	08 	. 
	nop			;64d3	00 	. 
	ld a,020h		;64d4	3e 20 	>   
	djnz l64e0h		;64d6	10 08 	. . 
	inc b			;64d8	04 	. 
	ld (bc),a			;64d9	02 	. 
	ld a,000h		;64da	3e 00 	> . 
	ld a,006h		;64dc	3e 06 	> . 
	ld b,006h		;64de	06 06 	. . 
l64e0h:
	ld b,006h		;64e0	06 06 	. . 
	ld a,000h		;64e2	3e 00 	> . 
	nop			;64e4	00 	. 
	inc b			;64e5	04 	. 
	ex af,af'			;64e6	08 	. 
	djnz l6509h		;64e7	10 20 	.   
	ld b,b			;64e9	40 	@ 
	nop			;64ea	00 	. 
	nop			;64eb	00 	. 
	ld a,030h		;64ec	3e 30 	> 0 
	jr nc,l6520h		;64ee	30 30 	0 0 
	jr nc,l6522h		;64f0	30 30 	0 0 
	ld a,000h		;64f2	3e 00 	> . 
	nop			;64f4	00 	. 
	ex af,af'			;64f5	08 	. 
	inc d			;64f6	14 	. 
	ld (00000h),hl		;64f7	22 00 00 	" . . 
	nop			;64fa	00 	. 
	nop			;64fb	00 	. 
	nop			;64fc	00 	. 
	nop			;64fd	00 	. 
	nop			;64fe	00 	. 
	nop			;64ff	00 	. 
	nop			;6500	00 	. 
	nop			;6501	00 	. 
	ld a,(hl)			;6502	7e 	~ 
	nop			;6503	00 	. 
	inc b			;6504	04 	. 
	ex af,af'			;6505	08 	. 
	djnz l6508h		;6506	10 00 	. . 
l6508h:
	nop			;6508	00 	. 
l6509h:
	nop			;6509	00 	. 
	nop			;650a	00 	. 
	nop			;650b	00 	. 
	nop			;650c	00 	. 
	nop			;650d	00 	. 
	inc e			;650e	1c 	. 
	jr nz,l654dh		;650f	20 3c 	  < 
	ld (0003ch),hl		;6511	22 3c 00 	" < . 
	ld (bc),a			;6514	02 	. 
	ld (bc),a			;6515	02 	. 
	ld e,022h		;6516	1e 22 	. " 
	ld (01e22h),hl		;6518	22 22 1e 	" " . 
	nop			;651b	00 	. 
	nop			;651c	00 	. 
	nop			;651d	00 	. 
	inc a			;651e	3c 	< 
	ld (bc),a			;651f	02 	. 
l6520h:
	ld (bc),a			;6520	02 	. 
	ld (bc),a			;6521	02 	. 
l6522h:
	inc a			;6522	3c 	< 
	nop			;6523	00 	. 
	jr nz,l6546h		;6524	20 20 	    
	inc a			;6526	3c 	< 
	ld (l2222h),hl		;6527	22 22 22 	" " " 
	inc a			;652a	3c 	< 
	nop			;652b	00 	. 
	nop			;652c	00 	. 
	nop			;652d	00 	. 
	inc e			;652e	1c 	. 
	ld (0023eh),hl		;652f	22 3e 02 	" > . 
	inc e			;6532	1c 	. 
	nop			;6533	00 	. 
	djnz l653eh		;6534	10 08 	. . 
	ex af,af'			;6536	08 	. 
	inc e			;6537	1c 	. 
	ex af,af'			;6538	08 	. 
	ex af,af'			;6539	08 	. 
	ex af,af'			;653a	08 	. 
	nop			;653b	00 	. 
	nop			;653c	00 	. 
	nop			;653d	00 	. 
l653eh:
	jr c,l6564h		;653e	38 24 	8 $ 
	inc h			;6540	24 	$ 
	jr c,l6563h		;6541	38 20 	8   
	inc e			;6543	1c 	. 
	ld (bc),a			;6544	02 	. 
	ld (bc),a			;6545	02 	. 
l6546h:
	ld e,022h		;6546	1e 22 	. " 
	ld (l2222h),hl		;6548	22 22 22 	" " " 
	nop			;654b	00 	. 
	ex af,af'			;654c	08 	. 
l654dh:
	nop			;654d	00 	. 
	inc c			;654e	0c 	. 
	ex af,af'			;654f	08 	. 
	ex af,af'			;6550	08 	. 
	ex af,af'			;6551	08 	. 
	inc e			;6552	1c 	. 
	nop			;6553	00 	. 
	djnz l6556h		;6554	10 00 	. . 
l6556h:
	djnz l6568h		;6556	10 10 	. . 
	djnz l656ah		;6558	10 10 	. . 
	djnz l6568h		;655a	10 0c 	. . 
	inc b			;655c	04 	. 
	inc b			;655d	04 	. 
	inc h			;655e	24 	$ 
	inc d			;655f	14 	. 
	inc c			;6560	0c 	. 
	inc d			;6561	14 	. 
	inc h			;6562	24 	$ 
l6563h:
	nop			;6563	00 	. 
l6564h:
	ld b,004h		;6564	06 04 	. . 
	inc b			;6566	04 	. 
	inc b			;6567	04 	. 
l6568h:
	inc b			;6568	04 	. 
	inc b			;6569	04 	. 
l656ah:
	ld c,000h		;656a	0e 00 	. . 
	nop			;656c	00 	. 
	nop			;656d	00 	. 
	ld d,02ah		;656e	16 2a 	. * 
	ld hl,(l2a2ah)		;6570	2a 2a 2a 	* * * 
	nop			;6573	00 	. 
	nop			;6574	00 	. 
	nop			;6575	00 	. 
	ld e,022h		;6576	1e 22 	. " 
	ld (l2222h),hl		;6578	22 22 22 	" " " 
	nop			;657b	00 	. 
	nop			;657c	00 	. 
	nop			;657d	00 	. 
	inc e			;657e	1c 	. 
	ld (l2222h),hl		;657f	22 22 22 	" " " 
	inc e			;6582	1c 	. 
	nop			;6583	00 	. 
	nop			;6584	00 	. 
	nop			;6585	00 	. 
	ld e,022h		;6586	1e 22 	. " 
	ld (0021eh),hl		;6588	22 1e 02 	" . . 
	ld (bc),a			;658b	02 	. 
	nop			;658c	00 	. 
	nop			;658d	00 	. 
	inc a			;658e	3c 	< 
	ld (l3c22h),hl		;658f	22 22 3c 	" " < 
	jr nz,l65b4h		;6592	20 20 	    
	nop			;6594	00 	. 
	nop			;6595	00 	. 
	inc (hl)			;6596	34 	4 
	inc c			;6597	0c 	. 
	inc b			;6598	04 	. 
	inc b			;6599	04 	. 
	inc b			;659a	04 	. 
	nop			;659b	00 	. 
	nop			;659c	00 	. 
	nop			;659d	00 	. 
	inc a			;659e	3c 	< 
	ld (bc),a			;659f	02 	. 
	inc e			;65a0	1c 	. 
	jr nz,l65c1h		;65a1	20 1e 	  . 
	nop			;65a3	00 	. 
	ex af,af'			;65a4	08 	. 
	ex af,af'			;65a5	08 	. 
	inc e			;65a6	1c 	. 
	ex af,af'			;65a7	08 	. 
	ex af,af'			;65a8	08 	. 
	ex af,af'			;65a9	08 	. 
	djnz l65ach		;65aa	10 00 	. . 
l65ach:
	nop			;65ac	00 	. 
	nop			;65ad	00 	. 
	ld (l2222h),hl		;65ae	22 22 22 	" " " 
	ld (0001ch),hl		;65b1	22 1c 00 	" . . 
l65b4h:
	nop			;65b4	00 	. 
	nop			;65b5	00 	. 
	ld (l2222h),hl		;65b6	22 22 22 	" " " 
	inc d			;65b9	14 	. 
	ex af,af'			;65ba	08 	. 
	nop			;65bb	00 	. 
	nop			;65bc	00 	. 
	nop			;65bd	00 	. 
	ld (l2a22h),hl		;65be	22 22 2a 	" " * 
l65c1h:
	ld hl,(00014h)		;65c1	2a 14 00 	* . . 
	nop			;65c4	00 	. 
	nop			;65c5	00 	. 
	ld b,h			;65c6	44 	D 
	jr z,l65d9h		;65c7	28 10 	( . 
	jr z,l660fh		;65c9	28 44 	( D 
	nop			;65cb	00 	. 
	nop			;65cc	00 	. 
	nop			;65cd	00 	. 
	ld (l2222h),hl		;65ce	22 22 22 	" " " 
	inc a			;65d1	3c 	< 
	jr nz,l65ech		;65d2	20 18 	  . 
	nop			;65d4	00 	. 
	nop			;65d5	00 	. 
	inc a			;65d6	3c 	< 
	djnz l65e1h		;65d7	10 08 	. . 
l65d9h:
	inc b			;65d9	04 	. 
	inc a			;65da	3c 	< 
	nop			;65db	00 	. 
	nop			;65dc	00 	. 
	jr nz,l65efh		;65dd	20 10 	  . 
	djnz l65e9h		;65df	10 08 	. . 
l65e1h:
	djnz l65f3h		;65e1	10 10 	. . 
	jr nz,l65edh		;65e3	20 08 	  . 
	ex af,af'			;65e5	08 	. 
	ex af,af'			;65e6	08 	. 
	nop			;65e7	00 	. 
	ex af,af'			;65e8	08 	. 
l65e9h:
	ex af,af'			;65e9	08 	. 
	ex af,af'			;65ea	08 	. 
	nop			;65eb	00 	. 
l65ech:
	nop			;65ec	00 	. 
l65edh:
	ld (bc),a			;65ed	02 	. 
	inc b			;65ee	04 	. 
l65efh:
	inc b			;65ef	04 	. 
	ex af,af'			;65f0	08 	. 
	inc b			;65f1	04 	. 
	inc b			;65f2	04 	. 
l65f3h:
	ld (bc),a			;65f3	02 	. 
	jr nz,l6612h		;65f4	20 1c 	  . 
	ld (bc),a			;65f6	02 	. 
	nop			;65f7	00 	. 
	nop			;65f8	00 	. 
	nop			;65f9	00 	. 
	nop			;65fa	00 	. 
	nop			;65fb	00 	. 
	inc d			;65fc	14 	. 
	ld hl,(l2a14h)		;65fd	2a 14 2a 	* . * 
	inc d			;6600	14 	. 
	ld hl,(00014h)		;6601	2a 14 00 	* . . 
	nop			;6604	00 	. 
	nop			;6605	00 	. 
	nop			;6606	00 	. 
	nop			;6607	00 	. 
	nop			;6608	00 	. 
	nop			;6609	00 	. 
	nop			;660a	00 	. 
	nop			;660b	00 	. 
	nop			;660c	00 	. 
	nop			;660d	00 	. 
	nop			;660e	00 	. 
l660fh:
	nop			;660f	00 	. 
	nop			;6610	00 	. 
	nop			;6611	00 	. 
l6612h:
	nop			;6612	00 	. 
	nop			;6613	00 	. 
	nop			;6614	00 	. 
	nop			;6615	00 	. 
	nop			;6616	00 	. 
	nop			;6617	00 	. 
	nop			;6618	00 	. 
	nop			;6619	00 	. 
	nop			;661a	00 	. 
	nop			;661b	00 	. 
	nop			;661c	00 	. 
	nop			;661d	00 	. 
	nop			;661e	00 	. 
	nop			;661f	00 	. 
	nop			;6620	00 	. 
	nop			;6621	00 	. 
	nop			;6622	00 	. 
	nop			;6623	00 	. 
	nop			;6624	00 	. 
	nop			;6625	00 	. 
	nop			;6626	00 	. 
	nop			;6627	00 	. 
	nop			;6628	00 	. 
	nop			;6629	00 	. 
	nop			;662a	00 	. 
	nop			;662b	00 	. 
	nop			;662c	00 	. 
	nop			;662d	00 	. 
	nop			;662e	00 	. 
	nop			;662f	00 	. 
	nop			;6630	00 	. 
	nop			;6631	00 	. 
	nop			;6632	00 	. 
	nop			;6633	00 	. 
	nop			;6634	00 	. 
	nop			;6635	00 	. 
	nop			;6636	00 	. 
	nop			;6637	00 	. 
	nop			;6638	00 	. 
	nop			;6639	00 	. 
	nop			;663a	00 	. 
	nop			;663b	00 	. 
	nop			;663c	00 	. 
	nop			;663d	00 	. 
	nop			;663e	00 	. 
	nop			;663f	00 	. 
	nop			;6640	00 	. 
	nop			;6641	00 	. 
	nop			;6642	00 	. 
	nop			;6643	00 	. 
	nop			;6644	00 	. 
	nop			;6645	00 	. 
	nop			;6646	00 	. 
	nop			;6647	00 	. 
	nop			;6648	00 	. 
	nop			;6649	00 	. 
	nop			;664a	00 	. 
	nop			;664b	00 	. 
	nop			;664c	00 	. 
	nop			;664d	00 	. 
	nop			;664e	00 	. 
	nop			;664f	00 	. 
	nop			;6650	00 	. 
	nop			;6651	00 	. 
	nop			;6652	00 	. 
	nop			;6653	00 	. 
	nop			;6654	00 	. 
	nop			;6655	00 	. 
	nop			;6656	00 	. 
	nop			;6657	00 	. 
	nop			;6658	00 	. 
	nop			;6659	00 	. 
	nop			;665a	00 	. 
	nop			;665b	00 	. 
	nop			;665c	00 	. 
	nop			;665d	00 	. 
	nop			;665e	00 	. 
	nop			;665f	00 	. 
	nop			;6660	00 	. 
	nop			;6661	00 	. 
	nop			;6662	00 	. 
	nop			;6663	00 	. 
	nop			;6664	00 	. 
	nop			;6665	00 	. 
sub_6666h:
	nop			;6666	00 	. 
	nop			;6667	00 	. 
	nop			;6668	00 	. 
	nop			;6669	00 	. 
	nop			;666a	00 	. 
	nop			;666b	00 	. 
	nop			;666c	00 	. 
	nop			;666d	00 	. 
	nop			;666e	00 	. 
	nop			;666f	00 	. 
	nop			;6670	00 	. 
	nop			;6671	00 	. 
	nop			;6672	00 	. 
	nop			;6673	00 	. 
	nop			;6674	00 	. 
	nop			;6675	00 	. 
	nop			;6676	00 	. 
	nop			;6677	00 	. 
	nop			;6678	00 	. 
	nop			;6679	00 	. 
	nop			;667a	00 	. 
	nop			;667b	00 	. 
	nop			;667c	00 	. 
	nop			;667d	00 	. 
l667eh:
	nop			;667e	00 	. 
	nop			;667f	00 	. 
	nop			;6680	00 	. 
	nop			;6681	00 	. 
	nop			;6682	00 	. 
	nop			;6683	00 	. 
	nop			;6684	00 	. 
	nop			;6685	00 	. 
	nop			;6686	00 	. 
	nop			;6687	00 	. 
	nop			;6688	00 	. 
	nop			;6689	00 	. 
	nop			;668a	00 	. 
	nop			;668b	00 	. 
	nop			;668c	00 	. 
	nop			;668d	00 	. 
	nop			;668e	00 	. 
	nop			;668f	00 	. 
	nop			;6690	00 	. 
	nop			;6691	00 	. 
	nop			;6692	00 	. 
	nop			;6693	00 	. 
	nop			;6694	00 	. 
	nop			;6695	00 	. 
	nop			;6696	00 	. 
	nop			;6697	00 	. 
	nop			;6698	00 	. 
	nop			;6699	00 	. 
	nop			;669a	00 	. 
	nop			;669b	00 	. 
	nop			;669c	00 	. 
	nop			;669d	00 	. 
	nop			;669e	00 	. 
	nop			;669f	00 	. 
	nop			;66a0	00 	. 
	nop			;66a1	00 	. 
	nop			;66a2	00 	. 
	nop			;66a3	00 	. 
	nop			;66a4	00 	. 
	nop			;66a5	00 	. 
	nop			;66a6	00 	. 
	nop			;66a7	00 	. 
	nop			;66a8	00 	. 
	nop			;66a9	00 	. 
	nop			;66aa	00 	. 
	nop			;66ab	00 	. 
	nop			;66ac	00 	. 
	nop			;66ad	00 	. 
	nop			;66ae	00 	. 
	nop			;66af	00 	. 
	nop			;66b0	00 	. 
	nop			;66b1	00 	. 
	nop			;66b2	00 	. 
	nop			;66b3	00 	. 
	nop			;66b4	00 	. 
	nop			;66b5	00 	. 
	nop			;66b6	00 	. 
	nop			;66b7	00 	. 
	nop			;66b8	00 	. 
	nop			;66b9	00 	. 
	nop			;66ba	00 	. 
	nop			;66bb	00 	. 
	nop			;66bc	00 	. 
	nop			;66bd	00 	. 
	nop			;66be	00 	. 
	nop			;66bf	00 	. 
	nop			;66c0	00 	. 
	nop			;66c1	00 	. 
	nop			;66c2	00 	. 
	nop			;66c3	00 	. 
	nop			;66c4	00 	. 
	nop			;66c5	00 	. 
	nop			;66c6	00 	. 
	nop			;66c7	00 	. 
	nop			;66c8	00 	. 
	nop			;66c9	00 	. 
	nop			;66ca	00 	. 
	nop			;66cb	00 	. 
sub_66cch:
	nop			;66cc	00 	. 
	nop			;66cd	00 	. 
	nop			;66ce	00 	. 
	nop			;66cf	00 	. 
	nop			;66d0	00 	. 
	nop			;66d1	00 	. 
	nop			;66d2	00 	. 
	nop			;66d3	00 	. 
	nop			;66d4	00 	. 
	nop			;66d5	00 	. 
	nop			;66d6	00 	. 
	nop			;66d7	00 	. 
	nop			;66d8	00 	. 
	nop			;66d9	00 	. 
	nop			;66da	00 	. 
	nop			;66db	00 	. 
	nop			;66dc	00 	. 
	nop			;66dd	00 	. 
	nop			;66de	00 	. 
	nop			;66df	00 	. 
	nop			;66e0	00 	. 
	nop			;66e1	00 	. 
	nop			;66e2	00 	. 
	nop			;66e3	00 	. 
	nop			;66e4	00 	. 
	nop			;66e5	00 	. 
	nop			;66e6	00 	. 
	nop			;66e7	00 	. 
	nop			;66e8	00 	. 
	nop			;66e9	00 	. 
	nop			;66ea	00 	. 
	nop			;66eb	00 	. 
	nop			;66ec	00 	. 
	nop			;66ed	00 	. 
	nop			;66ee	00 	. 
	nop			;66ef	00 	. 
	nop			;66f0	00 	. 
	nop			;66f1	00 	. 
	nop			;66f2	00 	. 
	nop			;66f3	00 	. 
	nop			;66f4	00 	. 
	nop			;66f5	00 	. 
	nop			;66f6	00 	. 
	nop			;66f7	00 	. 
	nop			;66f8	00 	. 
	nop			;66f9	00 	. 
	nop			;66fa	00 	. 
	nop			;66fb	00 	. 
	nop			;66fc	00 	. 
	nop			;66fd	00 	. 
	nop			;66fe	00 	. 
	nop			;66ff	00 	. 
	nop			;6700	00 	. 
	nop			;6701	00 	. 
	nop			;6702	00 	. 
	nop			;6703	00 	. 
	nop			;6704	00 	. 
	nop			;6705	00 	. 
	nop			;6706	00 	. 
	nop			;6707	00 	. 
	nop			;6708	00 	. 
	nop			;6709	00 	. 
	nop			;670a	00 	. 
	nop			;670b	00 	. 
	nop			;670c	00 	. 
	nop			;670d	00 	. 
	nop			;670e	00 	. 
	nop			;670f	00 	. 
	nop			;6710	00 	. 
	nop			;6711	00 	. 
	nop			;6712	00 	. 
	nop			;6713	00 	. 
	nop			;6714	00 	. 
	nop			;6715	00 	. 
	nop			;6716	00 	. 
	nop			;6717	00 	. 
	nop			;6718	00 	. 
	nop			;6719	00 	. 
	nop			;671a	00 	. 
	nop			;671b	00 	. 
	nop			;671c	00 	. 
	nop			;671d	00 	. 
	nop			;671e	00 	. 
	nop			;671f	00 	. 
	nop			;6720	00 	. 
	nop			;6721	00 	. 
	nop			;6722	00 	. 
	nop			;6723	00 	. 
	nop			;6724	00 	. 
	nop			;6725	00 	. 
	nop			;6726	00 	. 
	nop			;6727	00 	. 
	nop			;6728	00 	. 
	nop			;6729	00 	. 
	nop			;672a	00 	. 
	nop			;672b	00 	. 
	nop			;672c	00 	. 
	nop			;672d	00 	. 
	nop			;672e	00 	. 
	nop			;672f	00 	. 
	nop			;6730	00 	. 
	nop			;6731	00 	. 
	nop			;6732	00 	. 
	nop			;6733	00 	. 
	nop			;6734	00 	. 
	nop			;6735	00 	. 
	nop			;6736	00 	. 
	nop			;6737	00 	. 
	nop			;6738	00 	. 
	nop			;6739	00 	. 
	nop			;673a	00 	. 
	nop			;673b	00 	. 
	nop			;673c	00 	. 
	nop			;673d	00 	. 
	nop			;673e	00 	. 
	nop			;673f	00 	. 
	nop			;6740	00 	. 
	nop			;6741	00 	. 
	nop			;6742	00 	. 
	nop			;6743	00 	. 
	nop			;6744	00 	. 
	nop			;6745	00 	. 
	nop			;6746	00 	. 
	nop			;6747	00 	. 
	nop			;6748	00 	. 
	nop			;6749	00 	. 
	nop			;674a	00 	. 
	nop			;674b	00 	. 
	nop			;674c	00 	. 
	nop			;674d	00 	. 
	nop			;674e	00 	. 
	nop			;674f	00 	. 
	nop			;6750	00 	. 
	nop			;6751	00 	. 
	nop			;6752	00 	. 
	nop			;6753	00 	. 
	nop			;6754	00 	. 
	nop			;6755	00 	. 
	nop			;6756	00 	. 
	nop			;6757	00 	. 
	nop			;6758	00 	. 
	nop			;6759	00 	. 
	nop			;675a	00 	. 
	nop			;675b	00 	. 
	nop			;675c	00 	. 
	nop			;675d	00 	. 
	nop			;675e	00 	. 
	nop			;675f	00 	. 
	nop			;6760	00 	. 
	nop			;6761	00 	. 
	nop			;6762	00 	. 
	nop			;6763	00 	. 
	nop			;6764	00 	. 
	nop			;6765	00 	. 
	nop			;6766	00 	. 
	nop			;6767	00 	. 
	nop			;6768	00 	. 
	nop			;6769	00 	. 
	nop			;676a	00 	. 
	nop			;676b	00 	. 
	nop			;676c	00 	. 
	nop			;676d	00 	. 
	nop			;676e	00 	. 
	nop			;676f	00 	. 
	nop			;6770	00 	. 
	nop			;6771	00 	. 
	nop			;6772	00 	. 
	nop			;6773	00 	. 
	nop			;6774	00 	. 
	nop			;6775	00 	. 
	nop			;6776	00 	. 
	nop			;6777	00 	. 
	nop			;6778	00 	. 
	nop			;6779	00 	. 
	nop			;677a	00 	. 
	nop			;677b	00 	. 
	nop			;677c	00 	. 
	nop			;677d	00 	. 
	nop			;677e	00 	. 
	nop			;677f	00 	. 
	nop			;6780	00 	. 
	nop			;6781	00 	. 
	nop			;6782	00 	. 
	nop			;6783	00 	. 
	nop			;6784	00 	. 
	nop			;6785	00 	. 
	nop			;6786	00 	. 
	nop			;6787	00 	. 
	nop			;6788	00 	. 
	nop			;6789	00 	. 
	nop			;678a	00 	. 
	nop			;678b	00 	. 
	nop			;678c	00 	. 
	nop			;678d	00 	. 
	nop			;678e	00 	. 
	nop			;678f	00 	. 
	nop			;6790	00 	. 
	nop			;6791	00 	. 
	nop			;6792	00 	. 
	nop			;6793	00 	. 
	nop			;6794	00 	. 
	nop			;6795	00 	. 
	nop			;6796	00 	. 
	nop			;6797	00 	. 
	nop			;6798	00 	. 
	nop			;6799	00 	. 
	nop			;679a	00 	. 
	nop			;679b	00 	. 
	nop			;679c	00 	. 
	nop			;679d	00 	. 
	nop			;679e	00 	. 
	nop			;679f	00 	. 
	nop			;67a0	00 	. 
	nop			;67a1	00 	. 
	nop			;67a2	00 	. 
	nop			;67a3	00 	. 
	nop			;67a4	00 	. 
	nop			;67a5	00 	. 
	nop			;67a6	00 	. 
	nop			;67a7	00 	. 
	nop			;67a8	00 	. 
	nop			;67a9	00 	. 
	nop			;67aa	00 	. 
	nop			;67ab	00 	. 
	nop			;67ac	00 	. 
	nop			;67ad	00 	. 
	nop			;67ae	00 	. 
	nop			;67af	00 	. 
	nop			;67b0	00 	. 
	nop			;67b1	00 	. 
	nop			;67b2	00 	. 
	nop			;67b3	00 	. 
	nop			;67b4	00 	. 
	nop			;67b5	00 	. 
	nop			;67b6	00 	. 
	nop			;67b7	00 	. 
	nop			;67b8	00 	. 
	nop			;67b9	00 	. 
	nop			;67ba	00 	. 
	nop			;67bb	00 	. 
	nop			;67bc	00 	. 
	nop			;67bd	00 	. 
	nop			;67be	00 	. 
	nop			;67bf	00 	. 
	nop			;67c0	00 	. 
	nop			;67c1	00 	. 
	nop			;67c2	00 	. 
	nop			;67c3	00 	. 
	nop			;67c4	00 	. 
	nop			;67c5	00 	. 
	nop			;67c6	00 	. 
	nop			;67c7	00 	. 
	nop			;67c8	00 	. 
	nop			;67c9	00 	. 
	nop			;67ca	00 	. 
	nop			;67cb	00 	. 
	nop			;67cc	00 	. 
	nop			;67cd	00 	. 
	nop			;67ce	00 	. 
	nop			;67cf	00 	. 
	nop			;67d0	00 	. 
	nop			;67d1	00 	. 
	nop			;67d2	00 	. 
	nop			;67d3	00 	. 
	nop			;67d4	00 	. 
	nop			;67d5	00 	. 
	nop			;67d6	00 	. 
	nop			;67d7	00 	. 
	nop			;67d8	00 	. 
	nop			;67d9	00 	. 
	nop			;67da	00 	. 
	nop			;67db	00 	. 
	nop			;67dc	00 	. 
	nop			;67dd	00 	. 
	nop			;67de	00 	. 
	nop			;67df	00 	. 
	nop			;67e0	00 	. 
	nop			;67e1	00 	. 
	nop			;67e2	00 	. 
	nop			;67e3	00 	. 
	nop			;67e4	00 	. 
	nop			;67e5	00 	. 
	nop			;67e6	00 	. 
	nop			;67e7	00 	. 
	nop			;67e8	00 	. 
	nop			;67e9	00 	. 
	nop			;67ea	00 	. 
	nop			;67eb	00 	. 
	nop			;67ec	00 	. 
	nop			;67ed	00 	. 
	nop			;67ee	00 	. 
	nop			;67ef	00 	. 
	nop			;67f0	00 	. 
	nop			;67f1	00 	. 
	nop			;67f2	00 	. 
	nop			;67f3	00 	. 
	nop			;67f4	00 	. 
	nop			;67f5	00 	. 
	nop			;67f6	00 	. 
	nop			;67f7	00 	. 
	nop			;67f8	00 	. 
	nop			;67f9	00 	. 
	nop			;67fa	00 	. 
	nop			;67fb	00 	. 
	nop			;67fc	00 	. 
	nop			;67fd	00 	. 
	nop			;67fe	00 	. 
	nop			;67ff	00 	. 
	nop			;6800	00 	. 
	nop			;6801	00 	. 
	nop			;6802	00 	. 
	nop			;6803	00 	. 
	nop			;6804	00 	. 
	nop			;6805	00 	. 
	nop			;6806	00 	. 
	nop			;6807	00 	. 
	nop			;6808	00 	. 
	nop			;6809	00 	. 
	nop			;680a	00 	. 
	nop			;680b	00 	. 
	nop			;680c	00 	. 
	nop			;680d	00 	. 
	nop			;680e	00 	. 
	nop			;680f	00 	. 
	nop			;6810	00 	. 
	nop			;6811	00 	. 
	nop			;6812	00 	. 
	nop			;6813	00 	. 
	nop			;6814	00 	. 
	nop			;6815	00 	. 
	nop			;6816	00 	. 
	nop			;6817	00 	. 
	nop			;6818	00 	. 
	nop			;6819	00 	. 
	nop			;681a	00 	. 
	nop			;681b	00 	. 
	nop			;681c	00 	. 
	nop			;681d	00 	. 
	nop			;681e	00 	. 
	nop			;681f	00 	. 
	nop			;6820	00 	. 
	nop			;6821	00 	. 
	nop			;6822	00 	. 
	nop			;6823	00 	. 
	nop			;6824	00 	. 
	nop			;6825	00 	. 
	nop			;6826	00 	. 
	nop			;6827	00 	. 
	nop			;6828	00 	. 
	nop			;6829	00 	. 
	nop			;682a	00 	. 
	nop			;682b	00 	. 
	nop			;682c	00 	. 
	nop			;682d	00 	. 
	nop			;682e	00 	. 
	nop			;682f	00 	. 
	nop			;6830	00 	. 
	nop			;6831	00 	. 
	nop			;6832	00 	. 
	nop			;6833	00 	. 
	nop			;6834	00 	. 
	nop			;6835	00 	. 
	nop			;6836	00 	. 
	nop			;6837	00 	. 
	nop			;6838	00 	. 
	nop			;6839	00 	. 
	nop			;683a	00 	. 
	nop			;683b	00 	. 
	nop			;683c	00 	. 
	nop			;683d	00 	. 
	nop			;683e	00 	. 
	nop			;683f	00 	. 
	nop			;6840	00 	. 
	nop			;6841	00 	. 
	nop			;6842	00 	. 
	nop			;6843	00 	. 
	nop			;6844	00 	. 
	nop			;6845	00 	. 
	nop			;6846	00 	. 
	nop			;6847	00 	. 
	nop			;6848	00 	. 
	nop			;6849	00 	. 
	nop			;684a	00 	. 
	nop			;684b	00 	. 
	nop			;684c	00 	. 
	nop			;684d	00 	. 
	nop			;684e	00 	. 
	nop			;684f	00 	. 
	nop			;6850	00 	. 
	nop			;6851	00 	. 
	nop			;6852	00 	. 
	nop			;6853	00 	. 
	nop			;6854	00 	. 
	nop			;6855	00 	. 
	nop			;6856	00 	. 
	nop			;6857	00 	. 
	nop			;6858	00 	. 
	nop			;6859	00 	. 
	nop			;685a	00 	. 
	nop			;685b	00 	. 
	nop			;685c	00 	. 
	nop			;685d	00 	. 
	nop			;685e	00 	. 
	nop			;685f	00 	. 
	nop			;6860	00 	. 
	nop			;6861	00 	. 
	nop			;6862	00 	. 
	nop			;6863	00 	. 
	nop			;6864	00 	. 
	nop			;6865	00 	. 
	nop			;6866	00 	. 
	nop			;6867	00 	. 
	nop			;6868	00 	. 
	nop			;6869	00 	. 
	nop			;686a	00 	. 
	nop			;686b	00 	. 
	nop			;686c	00 	. 
	nop			;686d	00 	. 
	nop			;686e	00 	. 
	nop			;686f	00 	. 
	nop			;6870	00 	. 
	nop			;6871	00 	. 
	nop			;6872	00 	. 
	nop			;6873	00 	. 
	nop			;6874	00 	. 
	nop			;6875	00 	. 
	nop			;6876	00 	. 
	nop			;6877	00 	. 
	nop			;6878	00 	. 
	nop			;6879	00 	. 
	nop			;687a	00 	. 
	nop			;687b	00 	. 
	nop			;687c	00 	. 
	nop			;687d	00 	. 
	nop			;687e	00 	. 
	nop			;687f	00 	. 
	nop			;6880	00 	. 
	nop			;6881	00 	. 
	nop			;6882	00 	. 
	nop			;6883	00 	. 
	nop			;6884	00 	. 
	nop			;6885	00 	. 
	nop			;6886	00 	. 
	nop			;6887	00 	. 
	nop			;6888	00 	. 
	nop			;6889	00 	. 
	nop			;688a	00 	. 
	nop			;688b	00 	. 
	nop			;688c	00 	. 
	nop			;688d	00 	. 
	nop			;688e	00 	. 
	nop			;688f	00 	. 
	nop			;6890	00 	. 
	nop			;6891	00 	. 
	nop			;6892	00 	. 
	nop			;6893	00 	. 
	nop			;6894	00 	. 
	nop			;6895	00 	. 
	nop			;6896	00 	. 
	nop			;6897	00 	. 
	nop			;6898	00 	. 
	nop			;6899	00 	. 
	nop			;689a	00 	. 
	nop			;689b	00 	. 
	nop			;689c	00 	. 
	nop			;689d	00 	. 
	nop			;689e	00 	. 
	nop			;689f	00 	. 
	nop			;68a0	00 	. 
	nop			;68a1	00 	. 
	nop			;68a2	00 	. 
	nop			;68a3	00 	. 
	nop			;68a4	00 	. 
	nop			;68a5	00 	. 
	nop			;68a6	00 	. 
	nop			;68a7	00 	. 
	nop			;68a8	00 	. 
	nop			;68a9	00 	. 
	nop			;68aa	00 	. 
	nop			;68ab	00 	. 
	nop			;68ac	00 	. 
	nop			;68ad	00 	. 
	nop			;68ae	00 	. 
	nop			;68af	00 	. 
	nop			;68b0	00 	. 
	nop			;68b1	00 	. 
	nop			;68b2	00 	. 
	nop			;68b3	00 	. 
	nop			;68b4	00 	. 
	nop			;68b5	00 	. 
	nop			;68b6	00 	. 
	nop			;68b7	00 	. 
	nop			;68b8	00 	. 
	nop			;68b9	00 	. 
	nop			;68ba	00 	. 
	nop			;68bb	00 	. 
	nop			;68bc	00 	. 
	nop			;68bd	00 	. 
	nop			;68be	00 	. 
	nop			;68bf	00 	. 
	nop			;68c0	00 	. 
	nop			;68c1	00 	. 
	nop			;68c2	00 	. 
	nop			;68c3	00 	. 
	nop			;68c4	00 	. 
	nop			;68c5	00 	. 
	nop			;68c6	00 	. 
	nop			;68c7	00 	. 
	nop			;68c8	00 	. 
	nop			;68c9	00 	. 
	nop			;68ca	00 	. 
	nop			;68cb	00 	. 
	nop			;68cc	00 	. 
	nop			;68cd	00 	. 
	nop			;68ce	00 	. 
	nop			;68cf	00 	. 
	nop			;68d0	00 	. 
	nop			;68d1	00 	. 
	nop			;68d2	00 	. 
	nop			;68d3	00 	. 
	nop			;68d4	00 	. 
	nop			;68d5	00 	. 
	nop			;68d6	00 	. 
	nop			;68d7	00 	. 
	nop			;68d8	00 	. 
	nop			;68d9	00 	. 
	nop			;68da	00 	. 
	nop			;68db	00 	. 
	nop			;68dc	00 	. 
	nop			;68dd	00 	. 
	nop			;68de	00 	. 
	nop			;68df	00 	. 
	nop			;68e0	00 	. 
	nop			;68e1	00 	. 
	nop			;68e2	00 	. 
	nop			;68e3	00 	. 
	nop			;68e4	00 	. 
	nop			;68e5	00 	. 
	nop			;68e6	00 	. 
	nop			;68e7	00 	. 
	nop			;68e8	00 	. 
	nop			;68e9	00 	. 
	nop			;68ea	00 	. 
	nop			;68eb	00 	. 
	nop			;68ec	00 	. 
	nop			;68ed	00 	. 
	nop			;68ee	00 	. 
	nop			;68ef	00 	. 
	nop			;68f0	00 	. 
	nop			;68f1	00 	. 
	nop			;68f2	00 	. 
	nop			;68f3	00 	. 
	nop			;68f4	00 	. 
	nop			;68f5	00 	. 
	nop			;68f6	00 	. 
	nop			;68f7	00 	. 
	nop			;68f8	00 	. 
	nop			;68f9	00 	. 
	nop			;68fa	00 	. 
	nop			;68fb	00 	. 
	nop			;68fc	00 	. 
	nop			;68fd	00 	. 
	nop			;68fe	00 	. 
	nop			;68ff	00 	. 
	nop			;6900	00 	. 
	nop			;6901	00 	. 
	nop			;6902	00 	. 
	nop			;6903	00 	. 
	nop			;6904	00 	. 
	nop			;6905	00 	. 
	nop			;6906	00 	. 
	nop			;6907	00 	. 
	nop			;6908	00 	. 
	nop			;6909	00 	. 
	nop			;690a	00 	. 
	nop			;690b	00 	. 
	nop			;690c	00 	. 
	nop			;690d	00 	. 
	nop			;690e	00 	. 
	nop			;690f	00 	. 
	nop			;6910	00 	. 
	nop			;6911	00 	. 
	nop			;6912	00 	. 
	nop			;6913	00 	. 
	nop			;6914	00 	. 
	nop			;6915	00 	. 
	nop			;6916	00 	. 
	nop			;6917	00 	. 
	nop			;6918	00 	. 
	nop			;6919	00 	. 
	nop			;691a	00 	. 
	nop			;691b	00 	. 
	nop			;691c	00 	. 
	nop			;691d	00 	. 
	nop			;691e	00 	. 
	nop			;691f	00 	. 
	nop			;6920	00 	. 
	nop			;6921	00 	. 
	nop			;6922	00 	. 
	nop			;6923	00 	. 
	nop			;6924	00 	. 
	nop			;6925	00 	. 
	nop			;6926	00 	. 
	nop			;6927	00 	. 
	nop			;6928	00 	. 
	nop			;6929	00 	. 
	nop			;692a	00 	. 
	nop			;692b	00 	. 
	nop			;692c	00 	. 
	nop			;692d	00 	. 
	nop			;692e	00 	. 
	nop			;692f	00 	. 
	nop			;6930	00 	. 
	nop			;6931	00 	. 
	nop			;6932	00 	. 
	nop			;6933	00 	. 
	nop			;6934	00 	. 
	nop			;6935	00 	. 
	nop			;6936	00 	. 
	nop			;6937	00 	. 
	nop			;6938	00 	. 
	nop			;6939	00 	. 
	nop			;693a	00 	. 
	nop			;693b	00 	. 
	nop			;693c	00 	. 
	nop			;693d	00 	. 
	nop			;693e	00 	. 
	nop			;693f	00 	. 
	nop			;6940	00 	. 
	nop			;6941	00 	. 
	nop			;6942	00 	. 
	nop			;6943	00 	. 
	nop			;6944	00 	. 
	nop			;6945	00 	. 
	nop			;6946	00 	. 
	nop			;6947	00 	. 
	nop			;6948	00 	. 
	nop			;6949	00 	. 
	nop			;694a	00 	. 
	nop			;694b	00 	. 
	nop			;694c	00 	. 
	nop			;694d	00 	. 
	nop			;694e	00 	. 
	nop			;694f	00 	. 
	nop			;6950	00 	. 
	nop			;6951	00 	. 
	nop			;6952	00 	. 
	nop			;6953	00 	. 
	nop			;6954	00 	. 
	nop			;6955	00 	. 
	nop			;6956	00 	. 
	nop			;6957	00 	. 
	nop			;6958	00 	. 
	nop			;6959	00 	. 
	nop			;695a	00 	. 
	nop			;695b	00 	. 
	nop			;695c	00 	. 
	nop			;695d	00 	. 
	nop			;695e	00 	. 
	nop			;695f	00 	. 
	nop			;6960	00 	. 
	nop			;6961	00 	. 
	nop			;6962	00 	. 
	nop			;6963	00 	. 
	nop			;6964	00 	. 
	nop			;6965	00 	. 
	nop			;6966	00 	. 
	nop			;6967	00 	. 
	nop			;6968	00 	. 
	nop			;6969	00 	. 
	nop			;696a	00 	. 
	nop			;696b	00 	. 
	nop			;696c	00 	. 
	nop			;696d	00 	. 
	nop			;696e	00 	. 
	nop			;696f	00 	. 
	nop			;6970	00 	. 
	nop			;6971	00 	. 
	nop			;6972	00 	. 
	nop			;6973	00 	. 
	nop			;6974	00 	. 
	nop			;6975	00 	. 
	nop			;6976	00 	. 
	nop			;6977	00 	. 
	nop			;6978	00 	. 
	nop			;6979	00 	. 
	nop			;697a	00 	. 
	nop			;697b	00 	. 
	nop			;697c	00 	. 
	nop			;697d	00 	. 
	nop			;697e	00 	. 
	nop			;697f	00 	. 
	nop			;6980	00 	. 
	nop			;6981	00 	. 
	nop			;6982	00 	. 
	nop			;6983	00 	. 
	nop			;6984	00 	. 
	nop			;6985	00 	. 
	nop			;6986	00 	. 
	nop			;6987	00 	. 
	nop			;6988	00 	. 
	nop			;6989	00 	. 
	nop			;698a	00 	. 
	nop			;698b	00 	. 
	nop			;698c	00 	. 
	nop			;698d	00 	. 
	nop			;698e	00 	. 
	nop			;698f	00 	. 
	nop			;6990	00 	. 
	nop			;6991	00 	. 
	nop			;6992	00 	. 
	nop			;6993	00 	. 
	nop			;6994	00 	. 
	nop			;6995	00 	. 
	nop			;6996	00 	. 
	nop			;6997	00 	. 
	nop			;6998	00 	. 
	nop			;6999	00 	. 
	nop			;699a	00 	. 
	nop			;699b	00 	. 
	nop			;699c	00 	. 
	nop			;699d	00 	. 
	nop			;699e	00 	. 
	nop			;699f	00 	. 
	nop			;69a0	00 	. 
	nop			;69a1	00 	. 
	nop			;69a2	00 	. 
	nop			;69a3	00 	. 
	nop			;69a4	00 	. 
	nop			;69a5	00 	. 
	nop			;69a6	00 	. 
	nop			;69a7	00 	. 
	nop			;69a8	00 	. 
	nop			;69a9	00 	. 
	nop			;69aa	00 	. 
	nop			;69ab	00 	. 
	nop			;69ac	00 	. 
	nop			;69ad	00 	. 
	nop			;69ae	00 	. 
	nop			;69af	00 	. 
	nop			;69b0	00 	. 
	nop			;69b1	00 	. 
	nop			;69b2	00 	. 
	nop			;69b3	00 	. 
	nop			;69b4	00 	. 
	nop			;69b5	00 	. 
	nop			;69b6	00 	. 
	nop			;69b7	00 	. 
	nop			;69b8	00 	. 
	nop			;69b9	00 	. 
	nop			;69ba	00 	. 
	nop			;69bb	00 	. 
	nop			;69bc	00 	. 
	nop			;69bd	00 	. 
	nop			;69be	00 	. 
	nop			;69bf	00 	. 
	nop			;69c0	00 	. 
	nop			;69c1	00 	. 
	nop			;69c2	00 	. 
	nop			;69c3	00 	. 
	nop			;69c4	00 	. 
	nop			;69c5	00 	. 
	nop			;69c6	00 	. 
	nop			;69c7	00 	. 
	nop			;69c8	00 	. 
	nop			;69c9	00 	. 
	nop			;69ca	00 	. 
	nop			;69cb	00 	. 
	nop			;69cc	00 	. 
	nop			;69cd	00 	. 
	nop			;69ce	00 	. 
	nop			;69cf	00 	. 
	nop			;69d0	00 	. 
	nop			;69d1	00 	. 
	nop			;69d2	00 	. 
	nop			;69d3	00 	. 
	nop			;69d4	00 	. 
	nop			;69d5	00 	. 
	nop			;69d6	00 	. 
	nop			;69d7	00 	. 
	nop			;69d8	00 	. 
	nop			;69d9	00 	. 
	nop			;69da	00 	. 
	nop			;69db	00 	. 
	nop			;69dc	00 	. 
	nop			;69dd	00 	. 
	nop			;69de	00 	. 
	nop			;69df	00 	. 
	nop			;69e0	00 	. 
	nop			;69e1	00 	. 
	nop			;69e2	00 	. 
	nop			;69e3	00 	. 
	nop			;69e4	00 	. 
	nop			;69e5	00 	. 
	nop			;69e6	00 	. 
	nop			;69e7	00 	. 
	nop			;69e8	00 	. 
	nop			;69e9	00 	. 
	nop			;69ea	00 	. 
	nop			;69eb	00 	. 
	nop			;69ec	00 	. 
	nop			;69ed	00 	. 
	nop			;69ee	00 	. 
	nop			;69ef	00 	. 
	nop			;69f0	00 	. 
	nop			;69f1	00 	. 
	nop			;69f2	00 	. 
	nop			;69f3	00 	. 
	nop			;69f4	00 	. 
	nop			;69f5	00 	. 
	nop			;69f6	00 	. 
	nop			;69f7	00 	. 
	nop			;69f8	00 	. 
	nop			;69f9	00 	. 
	nop			;69fa	00 	. 
	nop			;69fb	00 	. 
	nop			;69fc	00 	. 
	nop			;69fd	00 	. 
	nop			;69fe	00 	. 
	nop			;69ff	00 	. 
	nop			;6a00	00 	. 
	nop			;6a01	00 	. 
	nop			;6a02	00 	. 
	nop			;6a03	00 	. 
	ld d,e			;6a04	53 	S 
	ld d,h			;6a05	54 	T 
	ld b,c			;6a06	41 	A 
	ld d,d			;6a07	52 	R 
	ld d,h			;6a08	54 	T 
	jr nz,l6a5ah		;6a09	20 4f 	  O 
	ld b,(hl)			;6a0b	46 	F 
	jr nz,l6a4eh		;6a0c	20 40 	  @ 
	ld d,e			;6a0e	53 	S 
	ld d,h			;6a0f	54 	T 
	ld b,h			;6a10	44 	D 
	ld b,(hl)			;6a11	46 	F 
l6a12h:
	nop			;6a12	00 	. 
	nop			;6a13	00 	. 
	nop			;6a14	00 	. 
	nop			;6a15	00 	. 
	nop			;6a16	00 	. 
	nop			;6a17	00 	. 
	nop			;6a18	00 	. 
	nop			;6a19	00 	. 
	nop			;6a1a	00 	. 
	nop			;6a1b	00 	. 
	nop			;6a1c	00 	. 
	nop			;6a1d	00 	. 
	nop			;6a1e	00 	. 
	nop			;6a1f	00 	. 
	nop			;6a20	00 	. 
	nop			;6a21	00 	. 
	ex af,af'			;6a22	08 	. 
	nop			;6a23	00 	. 
	nop			;6a24	00 	. 
	ex af,af'			;6a25	08 	. 
	nop			;6a26	00 	. 
	nop			;6a27	00 	. 
	nop			;6a28	00 	. 
	nop			;6a29	00 	. 
	ex af,af'			;6a2a	08 	. 
	ex af,af'			;6a2b	08 	. 
	ex af,af'			;6a2c	08 	. 
	ex af,af'			;6a2d	08 	. 
	ex af,af'			;6a2e	08 	. 
	ex af,af'			;6a2f	08 	. 
	ex af,af'			;6a30	08 	. 
	ex af,af'			;6a31	08 	. 
	nop			;6a32	00 	. 
	nop			;6a33	00 	. 
	nop			;6a34	00 	. 
	nop			;6a35	00 	. 
	nop			;6a36	00 	. 
	nop			;6a37	00 	. 
	nop			;6a38	00 	. 
	nop			;6a39	00 	. 
	ld (hl),012h		;6a3a	36 12 	6 . 
	ld (de),a			;6a3c	12 	. 
	nop			;6a3d	00 	. 
	nop			;6a3e	00 	. 
	nop			;6a3f	00 	. 
	nop			;6a40	00 	. 
	nop			;6a41	00 	. 
	inc h			;6a42	24 	$ 
	inc h			;6a43	24 	$ 
	inc h			;6a44	24 	$ 
	nop			;6a45	00 	. 
	nop			;6a46	00 	. 
	nop			;6a47	00 	. 
	nop			;6a48	00 	. 
	nop			;6a49	00 	. 
	nop			;6a4a	00 	. 
	inc h			;6a4b	24 	$ 
	inc h			;6a4c	24 	$ 
	inc h			;6a4d	24 	$ 
l6a4eh:
	ld a,(hl)			;6a4e	7e 	~ 
	inc h			;6a4f	24 	$ 
	inc h			;6a50	24 	$ 
	ld a,(hl)			;6a51	7e 	~ 
	ld c,b			;6a52	48 	H 
	ld c,c			;6a53	49 	I 
	ld a,008h		;6a54	3e 08 	> . 
	ex af,af'			;6a56	08 	. 
	nop			;6a57	00 	. 
	nop			;6a58	00 	. 
	nop			;6a59	00 	. 
l6a5ah:
	ex af,af'			;6a5a	08 	. 
	ex af,af'			;6a5b	08 	. 
	ld a,049h		;6a5c	3e 49 	> I 
	add hl,bc			;6a5e	09 	. 
	add hl,bc			;6a5f	09 	. 
	ld a,048h		;6a60	3e 48 	> H 
	ld h,h			;6a62	64 	d 
	sub h			;6a63	94 	. 
	sub d			;6a64	92 	. 
	ld h,d			;6a65	62 	b 
	nop			;6a66	00 	. 
	nop			;6a67	00 	. 
	nop			;6a68	00 	. 
	nop			;6a69	00 	. 
	ld b,(hl)			;6a6a	46 	F 
	ld c,c			;6a6b	49 	I 
	add hl,hl			;6a6c	29 	) 
	ld h,010h		;6a6d	26 10 	& . 
	djnz l6a79h		;6a6f	10 08 	. . 
	ex af,af'			;6a71	08 	. 
	ld d,c			;6a72	51 	Q 
	ld hl,00c52h		;6a73	21 52 0c 	! R . 
	nop			;6a76	00 	. 
	nop			;6a77	00 	. 
	nop			;6a78	00 	. 
l6a79h:
	nop			;6a79	00 	. 
	inc c			;6a7a	0c 	. 
	ld (de),a			;6a7b	12 	. 
	ld (de),a			;6a7c	12 	. 
	ld a,(bc)			;6a7d	0a 	. 
	inc b			;6a7e	04 	. 
	ld b,006h		;6a7f	06 06 	. . 
	ld c,c			;6a81	49 	I 
	nop			;6a82	00 	. 
	nop			;6a83	00 	. 
	nop			;6a84	00 	. 
	nop			;6a85	00 	. 
	nop			;6a86	00 	. 
	nop			;6a87	00 	. 
	nop			;6a88	00 	. 
	nop			;6a89	00 	. 
	jr l6aa4h		;6a8a	18 18 	. . 
	djnz l6a96h		;6a8c	10 08 	. . 
	inc b			;6a8e	04 	. 
	nop			;6a8f	00 	. 
	nop			;6a90	00 	. 
	nop			;6a91	00 	. 
	ex af,af'			;6a92	08 	. 
	ex af,af'			;6a93	08 	. 
	djnz l6ab6h		;6a94	10 20 	.   
l6a96h:
	nop			;6a96	00 	. 
	nop			;6a97	00 	. 
	nop			;6a98	00 	. 
	nop			;6a99	00 	. 
	jr nz,l6aach		;6a9a	20 10 	  . 
	ex af,af'			;6a9c	08 	. 
	ex af,af'			;6a9d	08 	. 
	inc b			;6a9e	04 	. 
	inc b			;6a9f	04 	. 
	inc b			;6aa0	04 	. 
	inc b			;6aa1	04 	. 
	ex af,af'			;6aa2	08 	. 
	ex af,af'			;6aa3	08 	. 
l6aa4h:
	inc b			;6aa4	04 	. 
	ld (bc),a			;6aa5	02 	. 
	nop			;6aa6	00 	. 
	nop			;6aa7	00 	. 
	nop			;6aa8	00 	. 
	nop			;6aa9	00 	. 
	ld (bc),a			;6aaa	02 	. 
	inc b			;6aab	04 	. 
l6aach:
	ex af,af'			;6aac	08 	. 
	ex af,af'			;6aad	08 	. 
	djnz 18		;6aae	10 10 	. . 
	djnz l6ac2h		;6ab0	10 10 	. . 
	ld hl,(00849h)		;6ab2	2a 49 08 	* I . 
	nop			;6ab5	00 	. 
l6ab6h:
	nop			;6ab6	00 	. 
	nop			;6ab7	00 	. 
	nop			;6ab8	00 	. 
	nop			;6ab9	00 	. 
	nop			;6aba	00 	. 
	nop			;6abb	00 	. 
	ex af,af'			;6abc	08 	. 
	ld c,c			;6abd	49 	I 
	ld hl,(0081ch)		;6abe	2a 1c 08 	* . . 
	inc e			;6ac1	1c 	. 
l6ac2h:
	ex af,af'			;6ac2	08 	. 
	ex af,af'			;6ac3	08 	. 
	nop			;6ac4	00 	. 
	nop			;6ac5	00 	. 
	nop			;6ac6	00 	. 
	nop			;6ac7	00 	. 
	nop			;6ac8	00 	. 
	nop			;6ac9	00 	. 
	nop			;6aca	00 	. 
	nop			;6acb	00 	. 
	nop			;6acc	00 	. 
	ex af,af'			;6acd	08 	. 
	ex af,af'			;6ace	08 	. 
	ex af,af'			;6acf	08 	. 
	ld a,a			;6ad0	7f 	 
	ex af,af'			;6ad1	08 	. 
	inc c			;6ad2	0c 	. 
	inc c			;6ad3	0c 	. 
	ex af,af'			;6ad4	08 	. 
	inc b			;6ad5	04 	. 
	ld (bc),a			;6ad6	02 	. 
	nop			;6ad7	00 	. 
	nop			;6ad8	00 	. 
	nop			;6ad9	00 	. 
	nop			;6ada	00 	. 
	nop			;6adb	00 	. 
	nop			;6adc	00 	. 
	nop			;6add	00 	. 
	nop			;6ade	00 	. 
	nop			;6adf	00 	. 
	nop			;6ae0	00 	. 
	nop			;6ae1	00 	. 
	nop			;6ae2	00 	. 
	nop			;6ae3	00 	. 
	nop			;6ae4	00 	. 
	nop			;6ae5	00 	. 
	nop			;6ae6	00 	. 
	nop			;6ae7	00 	. 
	nop			;6ae8	00 	. 
	nop			;6ae9	00 	. 
	nop			;6aea	00 	. 
	nop			;6aeb	00 	. 
	nop			;6aec	00 	. 
	nop			;6aed	00 	. 
	nop			;6aee	00 	. 
	nop			;6aef	00 	. 
	ld a,000h		;6af0	3e 00 	> . 
	nop			;6af2	00 	. 
	nop			;6af3	00 	. 
	inc c			;6af4	0c 	. 
	inc c			;6af5	0c 	. 
	nop			;6af6	00 	. 
	nop			;6af7	00 	. 
	nop			;6af8	00 	. 
	nop			;6af9	00 	. 
	nop			;6afa	00 	. 
	nop			;6afb	00 	. 
	nop			;6afc	00 	. 
	nop			;6afd	00 	. 
	nop			;6afe	00 	. 
	nop			;6aff	00 	. 
	nop			;6b00	00 	. 
	nop			;6b01	00 	. 
	inc b			;6b02	04 	. 
	ld (bc),a			;6b03	02 	. 
	ld (bc),a			;6b04	02 	. 
	ld bc,00001h		;6b05	01 01 00 	. . . 
	nop			;6b08	00 	. 
	nop			;6b09	00 	. 
	nop			;6b0a	00 	. 
	jr nz,l6b2dh		;6b0b	20 20 	    
	djnz l6b1fh		;6b0d	10 10 	. . 
	ex af,af'			;6b0f	08 	. 
	ex af,af'			;6b10	08 	. 
	inc b			;6b11	04 	. 
	ld b,l			;6b12	45 	E 
	ld b,e			;6b13	43 	C 
	ld (0001ch),hl		;6b14	22 1c 00 	" . . 
	nop			;6b17	00 	. 
	nop			;6b18	00 	. 
	nop			;6b19	00 	. 
	inc e			;6b1a	1c 	. 
	ld (l5161h),hl		;6b1b	22 61 51 	" a Q 
	ld d,c			;6b1e	51 	Q 
l6b1fh:
	ld c,c			;6b1f	49 	I 
	ld c,c			;6b20	49 	I 
	ld b,l			;6b21	45 	E 
	ex af,af'			;6b22	08 	. 
	ex af,af'			;6b23	08 	. 
	ex af,af'			;6b24	08 	. 
	ld a,000h		;6b25	3e 00 	> . 
	nop			;6b27	00 	. 
	nop			;6b28	00 	. 
	nop			;6b29	00 	. 
	ex af,af'			;6b2a	08 	. 
	inc c			;6b2b	0c 	. 
	ld a,(bc)			;6b2c	0a 	. 
l6b2dh:
	ex af,af'			;6b2d	08 	. 
	ex af,af'			;6b2e	08 	. 
	ex af,af'			;6b2f	08 	. 
	ex af,af'			;6b30	08 	. 
	ex af,af'			;6b31	08 	. 
	inc b			;6b32	04 	. 
	ld (bc),a			;6b33	02 	. 
	ld bc,0007fh		;6b34	01 7f 00 	.  . 
	nop			;6b37	00 	. 
	nop			;6b38	00 	. 
	nop			;6b39	00 	. 
	inc e			;6b3a	1c 	. 
	ld (04141h),hl		;6b3b	22 41 41 	" A A 
	ld b,b			;6b3e	40 	@ 
	jr nz,18		;6b3f	20 10 	  . 
	ex af,af'			;6b41	08 	. 
	ld b,b			;6b42	40 	@ 
	ld b,c			;6b43	41 	A 
	ld (0001ch),hl		;6b44	22 1c 00 	" . . 
	nop			;6b47	00 	. 
	nop			;6b48	00 	. 
	nop			;6b49	00 	. 
	inc e			;6b4a	1c 	. 
	ld (04041h),hl		;6b4b	22 41 40 	" A @ 
	jr nz,30		;6b4e	20 1c 	  . 
	jr nz,l6b92h		;6b50	20 40 	  @ 
	ld a,a			;6b52	7f 	 
	jr nz,34		;6b53	20 20 	    
	jr nz,l6b57h		;6b55	20 00 	  . 
l6b57h:
	nop			;6b57	00 	. 
	nop			;6b58	00 	. 
	nop			;6b59	00 	. 
	jr nc,l6b84h		;6b5a	30 28 	0 ( 
	jr z,l6b82h		;6b5c	28 24 	( $ 
	inc h			;6b5e	24 	$ 
	ld (l2121h+1),hl		;6b5f	22 22 21 	" " ! 
	ld b,b			;6b62	40 	@ 
	ld b,c			;6b63	41 	A 
	ld (0001ch),hl		;6b64	22 1c 00 	" . . 
	nop			;6b67	00 	. 
	nop			;6b68	00 	. 
	nop			;6b69	00 	. 
	ld a,a			;6b6a	7f 	 
	ld bc,00101h		;6b6b	01 01 01 	. . . 
	dec e			;6b6e	1d 	. 
	inc hl			;6b6f	23 	# 
	ld b,b			;6b70	40 	@ 
	ld b,b			;6b71	40 	@ 
	ld b,c			;6b72	41 	A 
	ld b,c			;6b73	41 	A 
	ld (0001ch),hl		;6b74	22 1c 00 	" . . 
	nop			;6b77	00 	. 
	nop			;6b78	00 	. 
	nop			;6b79	00 	. 
	djnz l6b84h		;6b7a	10 08 	. . 
	inc b			;6b7c	04 	. 
	ld (bc),a			;6b7d	02 	. 
	ld (bc),a			;6b7e	02 	. 
	dec e			;6b7f	1d 	. 
	inc hl			;6b80	23 	# 
	ld b,c			;6b81	41 	A 
l6b82h:
	inc b			;6b82	04 	. 
	inc b			;6b83	04 	. 
l6b84h:
	ld (bc),a			;6b84	02 	. 
	ld (bc),a			;6b85	02 	. 
	nop			;6b86	00 	. 
	nop			;6b87	00 	. 
	nop			;6b88	00 	. 
	nop			;6b89	00 	. 
	ld a,a			;6b8a	7f 	 
	ld b,c			;6b8b	41 	A 
	jr nz,l6baeh		;6b8c	20 20 	    
	djnz 18		;6b8e	10 10 	. . 
	ex af,af'			;6b90	08 	. 
	ex af,af'			;6b91	08 	. 
l6b92h:
	ld b,c			;6b92	41 	A 
	ld b,c			;6b93	41 	A 
	ld (0001ch),hl		;6b94	22 1c 00 	" . . 
	nop			;6b97	00 	. 
	nop			;6b98	00 	. 
	nop			;6b99	00 	. 
	inc e			;6b9a	1c 	. 
	ld (04141h),hl		;6b9b	22 41 41 	" A A 
	ld (l221ch),hl		;6b9e	22 1c 22 	" . " 
	ld b,c			;6ba1	41 	A 
	jr nz,l6bb4h		;6ba2	20 10 	  . 
	ex af,af'			;6ba4	08 	. 
	inc b			;6ba5	04 	. 
	nop			;6ba6	00 	. 
	nop			;6ba7	00 	. 
	nop			;6ba8	00 	. 
	nop			;6ba9	00 	. 
	inc e			;6baa	1c 	. 
	ld (04141h),hl		;6bab	22 41 41 	" A A 
l6baeh:
	ld b,c			;6bae	41 	A 
	ld h,d			;6baf	62 	b 
	ld e,h			;6bb0	5c 	\ 
	jr nz,l6bb3h		;6bb1	20 00 	  . 
l6bb3h:
	inc c			;6bb3	0c 	. 
l6bb4h:
	inc c			;6bb4	0c 	. 
	nop			;6bb5	00 	. 
	nop			;6bb6	00 	. 
	nop			;6bb7	00 	. 
	nop			;6bb8	00 	. 
	nop			;6bb9	00 	. 
	nop			;6bba	00 	. 
	nop			;6bbb	00 	. 
	nop			;6bbc	00 	. 
	inc c			;6bbd	0c 	. 
	inc c			;6bbe	0c 	. 
	nop			;6bbf	00 	. 
	nop			;6bc0	00 	. 
	nop			;6bc1	00 	. 
	nop			;6bc2	00 	. 
	jr l6bddh		;6bc3	18 18 	. . 
	ex af,af'			;6bc5	08 	. 
	inc b			;6bc6	04 	. 
	nop			;6bc7	00 	. 
	nop			;6bc8	00 	. 
	nop			;6bc9	00 	. 
	nop			;6bca	00 	. 
	nop			;6bcb	00 	. 
	nop			;6bcc	00 	. 
	jr l6be7h		;6bcd	18 18 	. . 
	nop			;6bcf	00 	. 
	nop			;6bd0	00 	. 
	nop			;6bd1	00 	. 
	inc b			;6bd2	04 	. 
	ex af,af'			;6bd3	08 	. 
	djnz l6bf6h		;6bd4	10 20 	.   
	ld b,b			;6bd6	40 	@ 
	nop			;6bd7	00 	. 
	nop			;6bd8	00 	. 
	nop			;6bd9	00 	. 
	ld b,b			;6bda	40 	@ 
	jr nz,l6bedh		;6bdb	20 10 	  . 
l6bddh:
	ex af,af'			;6bdd	08 	. 
	inc b			;6bde	04 	. 
	ld (bc),a			;6bdf	02 	. 
	ld bc,00002h		;6be0	01 02 00 	. . . 
	nop			;6be3	00 	. 
	nop			;6be4	00 	. 
	nop			;6be5	00 	. 
	nop			;6be6	00 	. 
l6be7h:
	nop			;6be7	00 	. 
	nop			;6be8	00 	. 
	nop			;6be9	00 	. 
	nop			;6bea	00 	. 
	nop			;6beb	00 	. 
	nop			;6bec	00 	. 
l6bedh:
	ld a,(hl)			;6bed	7e 	~ 
	nop			;6bee	00 	. 
	nop			;6bef	00 	. 
	nop			;6bf0	00 	. 
	ld a,(hl)			;6bf1	7e 	~ 
	djnz 10		;6bf2	10 08 	. . 
	inc b			;6bf4	04 	. 
	ld (bc),a			;6bf5	02 	. 
l6bf6h:
	ld bc,00000h		;6bf6	01 00 00 	. . . 
	nop			;6bf9	00 	. 
	ld bc,00402h		;6bfa	01 02 04 	. . . 
	ex af,af'			;6bfd	08 	. 
	djnz l6c20h		;6bfe	10 20 	.   
	ld b,b			;6c00	40 	@ 
	jr nz,l6c03h		;6c01	20 00 	  . 
l6c03h:
	nop			;6c03	00 	. 
	ex af,af'			;6c04	08 	. 
	ex af,af'			;6c05	08 	. 
	nop			;6c06	00 	. 
	nop			;6c07	00 	. 
	nop			;6c08	00 	. 
	nop			;6c09	00 	. 
	inc e			;6c0a	1c 	. 
	ld (04141h),hl		;6c0b	22 41 41 	" A A 
	jr nz,l6c20h		;6c0e	20 10 	  . 
	ex af,af'			;6c10	08 	. 
	ex af,af'			;6c11	08 	. 
	add hl,sp			;6c12	39 	9 
	ld bc,03c42h		;6c13	01 42 3c 	. B < 
	nop			;6c16	00 	. 
	nop			;6c17	00 	. 
	nop			;6c18	00 	. 
	nop			;6c19	00 	. 
	inc e			;6c1a	1c 	. 
	ld (l5941h),hl		;6c1b	22 41 59 	" A Y 
	ld h,l			;6c1e	65 	e 
	ld h,l			;6c1f	65 	e 
l6c20h:
	ld h,l			;6c20	65 	e 
	ld h,l			;6c21	65 	e 
	ld b,c			;6c22	41 	A 
	ld b,c			;6c23	41 	A 
	ld b,c			;6c24	41 	A 
	ld b,c			;6c25	41 	A 
	nop			;6c26	00 	. 
	nop			;6c27	00 	. 
	nop			;6c28	00 	. 
	nop			;6c29	00 	. 
	inc e			;6c2a	1c 	. 
	ld (04141h),hl		;6c2b	22 41 41 	" A A 
	ld b,c			;6c2e	41 	A 
	ld b,c			;6c2f	41 	A 
	ld a,a			;6c30	7f 	 
	ld b,c			;6c31	41 	A 
	ld b,d			;6c32	42 	B 
	ld b,d			;6c33	42 	B 
	ld (0001fh),hl		;6c34	22 1f 00 	" . . 
	nop			;6c37	00 	. 
	nop			;6c38	00 	. 
	nop			;6c39	00 	. 
	rra			;6c3a	1f 	. 
	ld (l4242h),hl		;6c3b	22 42 42 	" B B 
	ld (l221ch+2),hl		;6c3e	22 1e 22 	" . " 
	ld b,d			;6c41	42 	B 
	ld b,c			;6c42	41 	A 
	ld b,c			;6c43	41 	A 
	ld (0001ch),hl		;6c44	22 1c 00 	" . . 
	nop			;6c47	00 	. 
	nop			;6c48	00 	. 
	nop			;6c49	00 	. 
	inc e			;6c4a	1c 	. 
	ld (04141h),hl		;6c4b	22 41 41 	" A A 
	ld bc,00101h		;6c4e	01 01 01 	. . . 
	ld bc,l4242h		;6c51	01 42 42 	. B B 
	ld (0001fh),hl		;6c54	22 1f 00 	" . . 
	nop			;6c57	00 	. 
	nop			;6c58	00 	. 
	nop			;6c59	00 	. 
	rra			;6c5a	1f 	. 
	ld (l4242h),hl		;6c5b	22 42 42 	" B B 
	ld b,d			;6c5e	42 	B 
	ld b,d			;6c5f	42 	B 
	ld b,d			;6c60	42 	B 
	ld b,d			;6c61	42 	B 
	ld bc,00101h		;6c62	01 01 01 	. . . 
	ld a,a			;6c65	7f 	 
	nop			;6c66	00 	. 
	nop			;6c67	00 	. 
	nop			;6c68	00 	. 
	nop			;6c69	00 	. 
	ld a,a			;6c6a	7f 	 
	ld bc,00101h		;6c6b	01 01 01 	. . . 
	ld bc,0013fh		;6c6e	01 3f 01 	. ? . 
	ld bc,00101h		;6c71	01 01 01 	. . . 
	ld bc,00001h		;6c74	01 01 00 	. . . 
	nop			;6c77	00 	. 
	nop			;6c78	00 	. 
	nop			;6c79	00 	. 
	ld a,a			;6c7a	7f 	 
	ld bc,00101h		;6c7b	01 01 01 	. . . 
	ld bc,0013fh		;6c7e	01 3f 01 	. ? . 
	ld bc,04141h		;6c81	01 41 41 	. A A 
	ld h,d			;6c84	62 	b 
	ld e,h			;6c85	5c 	\ 
	nop			;6c86	00 	. 
	nop			;6c87	00 	. 
	nop			;6c88	00 	. 
	nop			;6c89	00 	. 
	inc e			;6c8a	1c 	. 
	ld (04141h),hl		;6c8b	22 41 41 	" A A 
	ld bc,l7901h		;6c8e	01 01 79 	. . y 
	ld b,c			;6c91	41 	A 
	ld b,c			;6c92	41 	A 
	ld b,c			;6c93	41 	A 
	ld b,c			;6c94	41 	A 
	ld b,c			;6c95	41 	A 
	nop			;6c96	00 	. 
	nop			;6c97	00 	. 
	nop			;6c98	00 	. 
	nop			;6c99	00 	. 
	ld b,c			;6c9a	41 	A 
	ld b,c			;6c9b	41 	A 
	ld b,c			;6c9c	41 	A 
	ld b,c			;6c9d	41 	A 
	ld b,c			;6c9e	41 	A 
	ld a,a			;6c9f	7f 	 
	ld b,c			;6ca0	41 	A 
	ld b,c			;6ca1	41 	A 
	ex af,af'			;6ca2	08 	. 
	ex af,af'			;6ca3	08 	. 
	ex af,af'			;6ca4	08 	. 
	ld a,000h		;6ca5	3e 00 	> . 
	nop			;6ca7	00 	. 
	nop			;6ca8	00 	. 
	nop			;6ca9	00 	. 
	ld a,008h		;6caa	3e 08 	> . 
	ex af,af'			;6cac	08 	. 
	ex af,af'			;6cad	08 	. 
	ex af,af'			;6cae	08 	. 
	ex af,af'			;6caf	08 	. 
	ex af,af'			;6cb0	08 	. 
	ex af,af'			;6cb1	08 	. 
	djnz 19		;6cb2	10 11 	. . 
	ld de,0000eh		;6cb4	11 0e 00 	. . . 
	nop			;6cb7	00 	. 
	nop			;6cb8	00 	. 
	nop			;6cb9	00 	. 
	ld a,(hl)			;6cba	7e 	~ 
	djnz 18		;6cbb	10 10 	. . 
	djnz l6ccfh		;6cbd	10 10 	. . 
	djnz l6cd1h		;6cbf	10 10 	. . 
	djnz 11		;6cc1	10 09 	. . 
	ld de,04121h		;6cc3	11 21 41 	. ! A 
	nop			;6cc6	00 	. 
	nop			;6cc7	00 	. 
	nop			;6cc8	00 	. 
	nop			;6cc9	00 	. 
	ld b,c			;6cca	41 	A 
	ld hl,00911h		;6ccb	21 11 09 	! . . 
	dec b			;6cce	05 	. 
l6ccfh:
	inc bc			;6ccf	03 	. 
	inc bc			;6cd0	03 	. 
l6cd1h:
	dec b			;6cd1	05 	. 
	ld bc,00101h		;6cd2	01 01 01 	. . . 
	ld a,a			;6cd5	7f 	 
	nop			;6cd6	00 	. 
	nop			;6cd7	00 	. 
	nop			;6cd8	00 	. 
	nop			;6cd9	00 	. 
	ld bc,00101h		;6cda	01 01 01 	. . . 
	ld bc,00101h		;6cdd	01 01 01 	. . . 
	ld bc,04101h		;6ce0	01 01 41 	. . A 
	ld b,c			;6ce3	41 	A 
	ld b,c			;6ce4	41 	A 
	ld b,c			;6ce5	41 	A 
	nop			;6ce6	00 	. 
	nop			;6ce7	00 	. 
	nop			;6ce8	00 	. 
	nop			;6ce9	00 	. 
	ld b,c			;6cea	41 	A 
	ld h,e			;6ceb	63 	c 
	ld h,e			;6cec	63 	c 
	ld d,l			;6ced	55 	U 
	ld d,l			;6cee	55 	U 
	ld c,c			;6cef	49 	I 
	ld c,c			;6cf0	49 	I 
	ld b,c			;6cf1	41 	A 
	ld d,c			;6cf2	51 	Q 
	ld h,c			;6cf3	61 	a 
	ld h,c			;6cf4	61 	a 
	ld b,c			;6cf5	41 	A 
	nop			;6cf6	00 	. 
	nop			;6cf7	00 	. 
	nop			;6cf8	00 	. 
	nop			;6cf9	00 	. 
	ld b,c			;6cfa	41 	A 
	ld b,e			;6cfb	43 	C 
	ld b,e			;6cfc	43 	C 
	ld b,l			;6cfd	45 	E 
	ld b,l			;6cfe	45 	E 
	ld c,c			;6cff	49 	I 
	ld c,c			;6d00	49 	I 
	ld d,c			;6d01	51 	Q 
	ld b,c			;6d02	41 	A 
	ld b,c			;6d03	41 	A 
	ld (0001ch),hl		;6d04	22 1c 00 	" . . 
	nop			;6d07	00 	. 
	nop			;6d08	00 	. 
	nop			;6d09	00 	. 
	inc e			;6d0a	1c 	. 
	ld (04141h),hl		;6d0b	22 41 41 	" A A 
	ld b,c			;6d0e	41 	A 
	ld b,c			;6d0f	41 	A 
	ld b,c			;6d10	41 	A 
	ld b,c			;6d11	41 	A 
	ld bc,00101h		;6d12	01 01 01 	. . . 
	ld bc,00000h		;6d15	01 00 00 	. . . 
	nop			;6d18	00 	. 
	nop			;6d19	00 	. 
	rra			;6d1a	1f 	. 
	ld hl,04141h		;6d1b	21 41 41 	! A A 
	ld b,c			;6d1e	41 	A 
	ld hl,0011fh		;6d1f	21 1f 01 	! . . 
	ld e,c			;6d22	59 	Y 
	ld h,l			;6d23	65 	e 
	ld (0005ch),hl		;6d24	22 5c 00 	" \ . 
	nop			;6d27	00 	. 
	nop			;6d28	00 	. 
	nop			;6d29	00 	. 
	inc e			;6d2a	1c 	. 
	ld (04141h),hl		;6d2b	22 41 41 	" A A 
	ld b,c			;6d2e	41 	A 
	ld b,c			;6d2f	41 	A 
	ld b,c			;6d30	41 	A 
	ld b,c			;6d31	41 	A 
	ld hl,04121h		;6d32	21 21 41 	! ! A 
	ld b,c			;6d35	41 	A 
	nop			;6d36	00 	. 
	nop			;6d37	00 	. 
	nop			;6d38	00 	. 
	nop			;6d39	00 	. 
	rra			;6d3a	1f 	. 
	ld hl,04141h		;6d3b	21 41 41 	! A A 
	ld hl,00f11h		;6d3e	21 11 0f 	! . . 
	ld de,04141h		;6d41	11 41 41 	. A A 
	ld (0001ch),hl		;6d44	22 1c 00 	" . . 
	nop			;6d47	00 	. 
	nop			;6d48	00 	. 
	nop			;6d49	00 	. 
	inc e			;6d4a	1c 	. 
	ld (04141h),hl		;6d4b	22 41 41 	" A A 
	ld (bc),a			;6d4e	02 	. 
	inc c			;6d4f	0c 	. 
	jr nc,l6d92h		;6d50	30 40 	0 @ 
	ex af,af'			;6d52	08 	. 
	ex af,af'			;6d53	08 	. 
	ex af,af'			;6d54	08 	. 
	ex af,af'			;6d55	08 	. 
	nop			;6d56	00 	. 
	nop			;6d57	00 	. 
	nop			;6d58	00 	. 
	nop			;6d59	00 	. 
	ld a,a			;6d5a	7f 	 
	ex af,af'			;6d5b	08 	. 
	ex af,af'			;6d5c	08 	. 
	ex af,af'			;6d5d	08 	. 
	ex af,af'			;6d5e	08 	. 
	ex af,af'			;6d5f	08 	. 
	ex af,af'			;6d60	08 	. 
	ex af,af'			;6d61	08 	. 
	ld b,c			;6d62	41 	A 
	ld b,c			;6d63	41 	A 
	ld (0001ch),hl		;6d64	22 1c 00 	" . . 
	nop			;6d67	00 	. 
	nop			;6d68	00 	. 
	nop			;6d69	00 	. 
	ld b,c			;6d6a	41 	A 
	ld b,c			;6d6b	41 	A 
	ld b,c			;6d6c	41 	A 
	ld b,c			;6d6d	41 	A 
	ld b,c			;6d6e	41 	A 
	ld b,c			;6d6f	41 	A 
	ld b,c			;6d70	41 	A 
	ld b,c			;6d71	41 	A 
	inc d			;6d72	14 	. 
	inc d			;6d73	14 	. 
	ex af,af'			;6d74	08 	. 
	ex af,af'			;6d75	08 	. 
	nop			;6d76	00 	. 
	nop			;6d77	00 	. 
	nop			;6d78	00 	. 
	nop			;6d79	00 	. 
	ld b,c			;6d7a	41 	A 
	ld b,c			;6d7b	41 	A 
	ld b,c			;6d7c	41 	A 
	ld b,c			;6d7d	41 	A 
	ld b,c			;6d7e	41 	A 
	ld (l2222h),hl		;6d7f	22 22 22 	" " " 
	ld d,l			;6d82	55 	U 
	ld d,l			;6d83	55 	U 
	ld (00022h),hl		;6d84	22 22 00 	" " . 
	nop			;6d87	00 	. 
	nop			;6d88	00 	. 
	nop			;6d89	00 	. 
	ld b,c			;6d8a	41 	A 
	ld b,c			;6d8b	41 	A 
	ld b,c			;6d8c	41 	A 
	ld b,c			;6d8d	41 	A 
	ld b,c			;6d8e	41 	A 
	ld c,c			;6d8f	49 	I 
	ld c,c			;6d90	49 	I 
	ld c,c			;6d91	49 	I 
l6d92h:
	ld (l4122h),hl		;6d92	22 22 41 	" " A 
	ld b,c			;6d95	41 	A 
	nop			;6d96	00 	. 
	nop			;6d97	00 	. 
	nop			;6d98	00 	. 
	nop			;6d99	00 	. 
	ld b,c			;6d9a	41 	A 
	ld b,c			;6d9b	41 	A 
	ld (01422h),hl		;6d9c	22 22 14 	" " . 
	ex af,af'			;6d9f	08 	. 
	ex af,af'			;6da0	08 	. 
	inc d			;6da1	14 	. 
	ex af,af'			;6da2	08 	. 
	ex af,af'			;6da3	08 	. 
	ex af,af'			;6da4	08 	. 
	ex af,af'			;6da5	08 	. 
	nop			;6da6	00 	. 
	nop			;6da7	00 	. 
	nop			;6da8	00 	. 
	nop			;6da9	00 	. 
	ld b,c			;6daa	41 	A 
	ld b,c			;6dab	41 	A 
	ld b,c			;6dac	41 	A 
	ld (01422h),hl		;6dad	22 22 14 	" " . 
	inc d			;6db0	14 	. 
	ex af,af'			;6db1	08 	. 
	inc b			;6db2	04 	. 
	inc b			;6db3	04 	. 
	ld (bc),a			;6db4	02 	. 
	ld a,a			;6db5	7f 	 
	nop			;6db6	00 	. 
	nop			;6db7	00 	. 
	nop			;6db8	00 	. 
	nop			;6db9	00 	. 
	ld a,a			;6dba	7f 	 
	ld b,b			;6dbb	40 	@ 
	jr nz,l6ddeh		;6dbc	20 20 	    
	djnz l6dd0h		;6dbe	10 10 	. . 
	ex af,af'			;6dc0	08 	. 
	ex af,af'			;6dc1	08 	. 
	ex af,af'			;6dc2	08 	. 
	ex af,af'			;6dc3	08 	. 
	ex af,af'			;6dc4	08 	. 
	ex af,af'			;6dc5	08 	. 
	ld a,b			;6dc6	78 	x 
	nop			;6dc7	00 	. 
	nop			;6dc8	00 	. 
	nop			;6dc9	00 	. 
	ld a,b			;6dca	78 	x 
	ex af,af'			;6dcb	08 	. 
	ex af,af'			;6dcc	08 	. 
	ex af,af'			;6dcd	08 	. 
	ex af,af'			;6dce	08 	. 
	ex af,af'			;6dcf	08 	. 
l6dd0h:
	ex af,af'			;6dd0	08 	. 
	ex af,af'			;6dd1	08 	. 
	djnz l6df4h		;6dd2	10 20 	.   
	jr nz,l6e16h		;6dd4	20 40 	  @ 
	ld b,b			;6dd6	40 	@ 
	nop			;6dd7	00 	. 
	nop			;6dd8	00 	. 
	nop			;6dd9	00 	. 
	nop			;6dda	00 	. 
	ld (bc),a			;6ddb	02 	. 
	ld (bc),a			;6ddc	02 	. 
	inc b			;6ddd	04 	. 
l6ddeh:
	inc b			;6dde	04 	. 
	ex af,af'			;6ddf	08 	. 
	ex af,af'			;6de0	08 	. 
	djnz l6debh		;6de1	10 08 	. . 
	ex af,af'			;6de3	08 	. 
	ex af,af'			;6de4	08 	. 
	ex af,af'			;6de5	08 	. 
	rrca			;6de6	0f 	. 
	nop			;6de7	00 	. 
	nop			;6de8	00 	. 
	nop			;6de9	00 	. 
	rrca			;6dea	0f 	. 
l6debh:
	ex af,af'			;6deb	08 	. 
	ex af,af'			;6dec	08 	. 
	ex af,af'			;6ded	08 	. 
	ex af,af'			;6dee	08 	. 
	ex af,af'			;6def	08 	. 
	ex af,af'			;6df0	08 	. 
	ex af,af'			;6df1	08 	. 
	nop			;6df2	00 	. 
	nop			;6df3	00 	. 
l6df4h:
	nop			;6df4	00 	. 
	nop			;6df5	00 	. 
	nop			;6df6	00 	. 
	nop			;6df7	00 	. 
	nop			;6df8	00 	. 
	nop			;6df9	00 	. 
	ex af,af'			;6dfa	08 	. 
	inc d			;6dfb	14 	. 
	ld (00041h),hl		;6dfc	22 41 00 	" A . 
	nop			;6dff	00 	. 
	nop			;6e00	00 	. 
	nop			;6e01	00 	. 
	nop			;6e02	00 	. 
	nop			;6e03	00 	. 
	nop			;6e04	00 	. 
	nop			;6e05	00 	. 
	nop			;6e06	00 	. 
	rst 38h			;6e07	ff 	. 
	nop			;6e08	00 	. 
	nop			;6e09	00 	. 
	nop			;6e0a	00 	. 
	nop			;6e0b	00 	. 
	nop			;6e0c	00 	. 
	nop			;6e0d	00 	. 
	nop			;6e0e	00 	. 
	nop			;6e0f	00 	. 
	nop			;6e10	00 	. 
	nop			;6e11	00 	. 
	nop			;6e12	00 	. 
	nop			;6e13	00 	. 
	nop			;6e14	00 	. 
	nop			;6e15	00 	. 
l6e16h:
	nop			;6e16	00 	. 
	nop			;6e17	00 	. 
	nop			;6e18	00 	. 
	nop			;6e19	00 	. 
	jr l6e34h		;6e1a	18 18 	. . 
	ex af,af'			;6e1c	08 	. 
	djnz 34		;6e1d	10 20 	.   
	nop			;6e1f	00 	. 
	nop			;6e20	00 	. 
	nop			;6e21	00 	. 
	ld b,d			;6e22	42 	B 
	ld b,d			;6e23	42 	B 
	ld b,d			;6e24	42 	B 
	cp h			;6e25	bc 	. 
	nop			;6e26	00 	. 
	nop			;6e27	00 	. 
	nop			;6e28	00 	. 
	nop			;6e29	00 	. 
	nop			;6e2a	00 	. 
	nop			;6e2b	00 	. 
	nop			;6e2c	00 	. 
	inc a			;6e2d	3c 	< 
	ld b,b			;6e2e	40 	@ 
	ld b,b			;6e2f	40 	@ 
	ld a,h			;6e30	7c 	| 
	ld b,d			;6e31	42 	B 
	ld b,d			;6e32	42 	B 
	ld b,d			;6e33	42 	B 
l6e34h:
	ld h,01ah		;6e34	26 1a 	& . 
	nop			;6e36	00 	. 
	nop			;6e37	00 	. 
	nop			;6e38	00 	. 
	nop			;6e39	00 	. 
	ld (bc),a			;6e3a	02 	. 
	ld (bc),a			;6e3b	02 	. 
	ld (bc),a			;6e3c	02 	. 
	ld a,(de)			;6e3d	1a 	. 
	ld h,042h		;6e3e	26 42 	& B 
	ld b,d			;6e40	42 	B 
	ld b,d			;6e41	42 	B 
	ld bc,l2241h		;6e42	01 41 22 	. A " 
	inc e			;6e45	1c 	. 
	nop			;6e46	00 	. 
	nop			;6e47	00 	. 
	nop			;6e48	00 	. 
	nop			;6e49	00 	. 
	nop			;6e4a	00 	. 
	nop			;6e4b	00 	. 
	nop			;6e4c	00 	. 
	inc e			;6e4d	1c 	. 
	ld (00141h),hl		;6e4e	22 41 01 	" A . 
	ld bc,l4242h		;6e51	01 42 42 	. B B 
	ld h,h			;6e54	64 	d 
	ld e,b			;6e55	58 	X 
	nop			;6e56	00 	. 
	nop			;6e57	00 	. 
	nop			;6e58	00 	. 
	nop			;6e59	00 	. 
	ld b,b			;6e5a	40 	@ 
	ld b,b			;6e5b	40 	@ 
	ld b,b			;6e5c	40 	@ 
	ld e,b			;6e5d	58 	X 
	ld h,h			;6e5e	64 	d 
	ld b,d			;6e5f	42 	B 
	ld b,d			;6e60	42 	B 
	ld b,d			;6e61	42 	B 
	ld bc,l2241h		;6e62	01 41 22 	. A " 
	inc e			;6e65	1c 	. 
	nop			;6e66	00 	. 
	nop			;6e67	00 	. 
	nop			;6e68	00 	. 
	nop			;6e69	00 	. 
	nop			;6e6a	00 	. 
	nop			;6e6b	00 	. 
	nop			;6e6c	00 	. 
	inc e			;6e6d	1c 	. 
sub_6e6eh:
	ld (04141h),hl		;6e6e	22 41 41 	" A A 
	ld a,a			;6e71	7f 	 
	ex af,af'			;6e72	08 	. 
	ex af,af'			;6e73	08 	. 
	ex af,af'			;6e74	08 	. 
	ex af,af'			;6e75	08 	. 
	nop			;6e76	00 	. 
	nop			;6e77	00 	. 
	nop			;6e78	00 	. 
	nop			;6e79	00 	. 
	jr nc,l6ec4h		;6e7a	30 48 	0 H 
	ex af,af'			;6e7c	08 	. 
	ex af,af'			;6e7d	08 	. 
	ld a,008h		;6e7e	3e 08 	> . 
	ex af,af'			;6e80	08 	. 
	ex af,af'			;6e81	08 	. 
	ld (bc),a			;6e82	02 	. 
	ld a,041h		;6e83	3e 41 	> A 
	ld b,c			;6e85	41 	A 
	ld b,c			;6e86	41 	A 
	ld a,000h		;6e87	3e 00 	> . 
	nop			;6e89	00 	. 
	nop			;6e8a	00 	. 
	nop			;6e8b	00 	. 
	ld b,b			;6e8c	40 	@ 
	ld e,h			;6e8d	5c 	\ 
	ld (l2222h),hl		;6e8e	22 22 22 	" " " 
	inc e			;6e91	1c 	. 
	ld b,d			;6e92	42 	B 
	ld b,d			;6e93	42 	B 
	ld b,d			;6e94	42 	B 
	ld b,d			;6e95	42 	B 
	nop			;6e96	00 	. 
	nop			;6e97	00 	. 
	nop			;6e98	00 	. 
	nop			;6e99	00 	. 
	ld (bc),a			;6e9a	02 	. 
	ld (bc),a			;6e9b	02 	. 
	ld (bc),a			;6e9c	02 	. 
	ld a,(l4246h)		;6e9d	3a 46 42 	: F B 
	ld b,d			;6ea0	42 	B 
	ld b,d			;6ea1	42 	B 
	ex af,af'			;6ea2	08 	. 
	ex af,af'			;6ea3	08 	. 
	ex af,af'			;6ea4	08 	. 
	ex af,af'			;6ea5	08 	. 
	nop			;6ea6	00 	. 
	nop			;6ea7	00 	. 
	nop			;6ea8	00 	. 
	nop			;6ea9	00 	. 
	ex af,af'			;6eaa	08 	. 
	nop			;6eab	00 	. 
	nop			;6eac	00 	. 
	ex af,af'			;6ead	08 	. 
	ex af,af'			;6eae	08 	. 
	ex af,af'			;6eaf	08 	. 
	ex af,af'			;6eb0	08 	. 
	ex af,af'			;6eb1	08 	. 
	djnz l6ec4h		;6eb2	10 10 	. . 
	ld (de),a			;6eb4	12 	. 
	ld (de),a			;6eb5	12 	. 
	inc c			;6eb6	0c 	. 
	nop			;6eb7	00 	. 
	nop			;6eb8	00 	. 
	nop			;6eb9	00 	. 
	djnz l6ebch		;6eba	10 00 	. . 
l6ebch:
	nop			;6ebc	00 	. 
	djnz 18		;6ebd	10 10 	. . 
	djnz l6ed1h		;6ebf	10 10 	. . 
	djnz l6ecdh		;6ec1	10 0a 	. . 
	ld (de),a			;6ec3	12 	. 
l6ec4h:
	ld (00042h),hl		;6ec4	22 42 00 	" B . 
	nop			;6ec7	00 	. 
	nop			;6ec8	00 	. 
	nop			;6ec9	00 	. 
	ld (bc),a			;6eca	02 	. 
	ld (bc),a			;6ecb	02 	. 
	ld (bc),a			;6ecc	02 	. 
l6ecdh:
	ld b,d			;6ecd	42 	B 
	ld (00a12h),hl		;6ece	22 12 0a 	" . . 
l6ed1h:
	ld b,008h		;6ed1	06 08 	. . 
	ex af,af'			;6ed3	08 	. 
	ex af,af'			;6ed4	08 	. 
	inc e			;6ed5	1c 	. 
	nop			;6ed6	00 	. 
	nop			;6ed7	00 	. 
	nop			;6ed8	00 	. 
	nop			;6ed9	00 	. 
	inc c			;6eda	0c 	. 
	ex af,af'			;6edb	08 	. 
	ex af,af'			;6edc	08 	. 
	ex af,af'			;6edd	08 	. 
	ex af,af'			;6ede	08 	. 
	ex af,af'			;6edf	08 	. 
	ex af,af'			;6ee0	08 	. 
	ex af,af'			;6ee1	08 	. 
	ld c,c			;6ee2	49 	I 
	ld c,c			;6ee3	49 	I 
	ld c,c			;6ee4	49 	I 
	ld c,c			;6ee5	49 	I 
	nop			;6ee6	00 	. 
	nop			;6ee7	00 	. 
	nop			;6ee8	00 	. 
	nop			;6ee9	00 	. 
	nop			;6eea	00 	. 
	nop			;6eeb	00 	. 
	nop			;6eec	00 	. 
	ld (hl),049h		;6eed	36 49 	6 I 
	ld c,c			;6eef	49 	I 
	ld c,c			;6ef0	49 	I 
	ld c,c			;6ef1	49 	I 
	ld b,d			;6ef2	42 	B 
	ld b,d			;6ef3	42 	B 
	ld b,d			;6ef4	42 	B 
	ld b,d			;6ef5	42 	B 
	nop			;6ef6	00 	. 
	nop			;6ef7	00 	. 
	nop			;6ef8	00 	. 
	nop			;6ef9	00 	. 
	nop			;6efa	00 	. 
	nop			;6efb	00 	. 
	nop			;6efc	00 	. 
	ld a,(l4246h)		;6efd	3a 46 42 	: F B 
	ld b,d			;6f00	42 	B 
	ld b,d			;6f01	42 	B 
	ld b,c			;6f02	41 	A 
	ld b,c			;6f03	41 	A 
	ld (0001ch),hl		;6f04	22 1c 00 	" . . 
	nop			;6f07	00 	. 
	nop			;6f08	00 	. 
	nop			;6f09	00 	. 
	nop			;6f0a	00 	. 
	nop			;6f0b	00 	. 
	nop			;6f0c	00 	. 
	inc e			;6f0d	1c 	. 
	ld (04141h),hl		;6f0e	22 41 41 	" A A 
	ld b,c			;6f11	41 	A 
	ld b,d			;6f12	42 	B 
	ld h,01ah		;6f13	26 1a 	& . 
	ld (bc),a			;6f15	02 	. 
	ld (bc),a			;6f16	02 	. 
	ld (bc),a			;6f17	02 	. 
	ld (bc),a			;6f18	02 	. 
	nop			;6f19	00 	. 
	nop			;6f1a	00 	. 
	nop			;6f1b	00 	. 
	nop			;6f1c	00 	. 
	ld a,(de)			;6f1d	1a 	. 
	ld h,042h		;6f1e	26 42 	& B 
	ld b,d			;6f20	42 	B 
	ld b,d			;6f21	42 	B 
	ld b,d			;6f22	42 	B 
	ld h,h			;6f23	64 	d 
	ld e,b			;6f24	58 	X 
	ld b,b			;6f25	40 	@ 
	ld b,b			;6f26	40 	@ 
	ld b,b			;6f27	40 	@ 
	ld b,b			;6f28	40 	@ 
	nop			;6f29	00 	. 
	nop			;6f2a	00 	. 
	nop			;6f2b	00 	. 
	nop			;6f2c	00 	. 
	ld e,b			;6f2d	58 	X 
	ld h,h			;6f2e	64 	d 
	ld b,d			;6f2f	42 	B 
	ld b,d			;6f30	42 	B 
	ld b,d			;6f31	42 	B 
	ld (bc),a			;6f32	02 	. 
	ld (bc),a			;6f33	02 	. 
	ld (bc),a			;6f34	02 	. 
	ld (bc),a			;6f35	02 	. 
	nop			;6f36	00 	. 
	nop			;6f37	00 	. 
	nop			;6f38	00 	. 
	nop			;6f39	00 	. 
	nop			;6f3a	00 	. 
	nop			;6f3b	00 	. 
	nop			;6f3c	00 	. 
	ld (0064ah),a		;6f3d	32 4a 06 	2 J . 
	ld (bc),a			;6f40	02 	. 
	ld (bc),a			;6f41	02 	. 
	ld b,b			;6f42	40 	@ 
	ld b,b			;6f43	40 	@ 
	ld b,d			;6f44	42 	B 
	inc a			;6f45	3c 	< 
	nop			;6f46	00 	. 
	nop			;6f47	00 	. 
	nop			;6f48	00 	. 
	nop			;6f49	00 	. 
	nop			;6f4a	00 	. 
	nop			;6f4b	00 	. 
	nop			;6f4c	00 	. 
	inc a			;6f4d	3c 	< 
	ld b,d			;6f4e	42 	B 
	ld (bc),a			;6f4f	02 	. 
	inc c			;6f50	0c 	. 
	jr nc,l6f5bh		;6f51	30 08 	0 . 
	ld c,b			;6f53	48 	H 
	ld c,b			;6f54	48 	H 
	jr nc,l6f57h		;6f55	30 00 	0 . 
l6f57h:
	nop			;6f57	00 	. 
	nop			;6f58	00 	. 
	nop			;6f59	00 	. 
	ex af,af'			;6f5a	08 	. 
l6f5bh:
	ex af,af'			;6f5b	08 	. 
	ex af,af'			;6f5c	08 	. 
	ld a,008h		;6f5d	3e 08 	> . 
	ex af,af'			;6f5f	08 	. 
	ex af,af'			;6f60	08 	. 
	ex af,af'			;6f61	08 	. 
	ld b,d			;6f62	42 	B 
	ld b,d			;6f63	42 	B 
	ld b,d			;6f64	42 	B 
	cp h			;6f65	bc 	. 
	nop			;6f66	00 	. 
	nop			;6f67	00 	. 
	nop			;6f68	00 	. 
	nop			;6f69	00 	. 
	nop			;6f6a	00 	. 
	nop			;6f6b	00 	. 
	nop			;6f6c	00 	. 
	ld b,d			;6f6d	42 	B 
	ld b,d			;6f6e	42 	B 
	ld b,d			;6f6f	42 	B 
	ld b,d			;6f70	42 	B 
	ld b,d			;6f71	42 	B 
	inc d			;6f72	14 	. 
	inc d			;6f73	14 	. 
	ex af,af'			;6f74	08 	. 
	ex af,af'			;6f75	08 	. 
	nop			;6f76	00 	. 
	nop			;6f77	00 	. 
	nop			;6f78	00 	. 
	nop			;6f79	00 	. 
	nop			;6f7a	00 	. 
	nop			;6f7b	00 	. 
	nop			;6f7c	00 	. 
	ld b,c			;6f7d	41 	A 
	ld b,c			;6f7e	41 	A 
	ld b,c			;6f7f	41 	A 
	ld (l5522h),hl		;6f80	22 22 55 	" " U 
	ld d,l			;6f83	55 	U 
	ld (00022h),hl		;6f84	22 22 00 	" " . 
	nop			;6f87	00 	. 
	nop			;6f88	00 	. 
	nop			;6f89	00 	. 
	nop			;6f8a	00 	. 
	nop			;6f8b	00 	. 
	nop			;6f8c	00 	. 
	ld b,c			;6f8d	41 	A 
	ld b,c			;6f8e	41 	A 
	ld b,c			;6f8f	41 	A 
	ld c,c			;6f90	49 	I 
	ld c,c			;6f91	49 	I 
	inc h			;6f92	24 	$ 
	inc h			;6f93	24 	$ 
	ld b,d			;6f94	42 	B 
	ld b,d			;6f95	42 	B 
	nop			;6f96	00 	. 
	nop			;6f97	00 	. 
	nop			;6f98	00 	. 
	nop			;6f99	00 	. 
	nop			;6f9a	00 	. 
	nop			;6f9b	00 	. 
	nop			;6f9c	00 	. 
	ld b,d			;6f9d	42 	B 
	ld b,d			;6f9e	42 	B 
	inc h			;6f9f	24 	$ 
	inc h			;6fa0	24 	$ 
	jr l6fb7h		;6fa1	18 14 	. . 
	ex af,af'			;6fa3	08 	. 
	ex af,af'			;6fa4	08 	. 
	ex af,af'			;6fa5	08 	. 
	inc b			;6fa6	04 	. 
	inc b			;6fa7	04 	. 
	ld (bc),a			;6fa8	02 	. 
	nop			;6fa9	00 	. 
	nop			;6faa	00 	. 
	nop			;6fab	00 	. 
	nop			;6fac	00 	. 
	ld b,c			;6fad	41 	A 
	ld b,c			;6fae	41 	A 
	ld (01422h),hl		;6faf	22 22 14 	" " . 
	inc b			;6fb2	04 	. 
	ld (bc),a			;6fb3	02 	. 
	ld bc,0003fh		;6fb4	01 3f 00 	. ? . 
l6fb7h:
	nop			;6fb7	00 	. 
	nop			;6fb8	00 	. 
	nop			;6fb9	00 	. 
	nop			;6fba	00 	. 
	nop			;6fbb	00 	. 
	nop			;6fbc	00 	. 
	ld a,(hl)			;6fbd	7e 	~ 
	ld b,b			;6fbe	40 	@ 
	jr nz,l6fd1h		;6fbf	20 10 	  . 
	ex af,af'			;6fc1	08 	. 
	djnz l6fd4h		;6fc2	10 10 	. . 
	djnz l6fd6h		;6fc4	10 10 	. . 
	ld h,b			;6fc6	60 	` 
	nop			;6fc7	00 	. 
	nop			;6fc8	00 	. 
	nop			;6fc9	00 	. 
	ld h,b			;6fca	60 	` 
	djnz l6fddh		;6fcb	10 10 	. . 
	djnz l6fdfh		;6fcd	10 10 	. . 
	djnz l6fddh		;6fcf	10 0c 	. . 
l6fd1h:
	djnz l6fdbh		;6fd1	10 08 	. . 
	ex af,af'			;6fd3	08 	. 
l6fd4h:
	ex af,af'			;6fd4	08 	. 
	ex af,af'			;6fd5	08 	. 
l6fd6h:
	ex af,af'			;6fd6	08 	. 
	nop			;6fd7	00 	. 
	nop			;6fd8	00 	. 
	nop			;6fd9	00 	. 
	ex af,af'			;6fda	08 	. 
l6fdbh:
	ex af,af'			;6fdb	08 	. 
	ex af,af'			;6fdc	08 	. 
l6fddh:
	ex af,af'			;6fdd	08 	. 
	ex af,af'			;6fde	08 	. 
l6fdfh:
	nop			;6fdf	00 	. 
	nop			;6fe0	00 	. 
	nop			;6fe1	00 	. 
	inc b			;6fe2	04 	. 
	inc b			;6fe3	04 	. 
	inc b			;6fe4	04 	. 
	inc b			;6fe5	04 	. 
	inc bc			;6fe6	03 	. 
	nop			;6fe7	00 	. 
	nop			;6fe8	00 	. 
	nop			;6fe9	00 	. 
	inc bc			;6fea	03 	. 
	inc b			;6feb	04 	. 
	inc b			;6fec	04 	. 
	inc b			;6fed	04 	. 
	inc b			;6fee	04 	. 
	inc b			;6fef	04 	. 
	jr l6ff6h		;6ff0	18 04 	. . 
	nop			;6ff2	00 	. 
	nop			;6ff3	00 	. 
	nop			;6ff4	00 	. 
	nop			;6ff5	00 	. 
l6ff6h:
	nop			;6ff6	00 	. 
	nop			;6ff7	00 	. 
	nop			;6ff8	00 	. 
	nop			;6ff9	00 	. 
	ld b,049h		;6ffa	06 49 	. I 
	jr nc,l6ffeh		;6ffc	30 00 	0 . 
l6ffeh:
	nop			;6ffe	00 	. 
	nop			;6fff	00 	. 
	nop			;7000	00 	. 
	nop			;7001	00 	. 
	adc a,h			;7002	8c 	. 
	ret m			;7003	f8 	. 
	nop			;7004	00 	. 
	nop			;7005	00 	. 
	nop			;7006	00 	. 
	nop			;7007	00 	. 
	nop			;7008	00 	. 
	nop			;7009	00 	. 
	nop			;700a	00 	. 
	nop			;700b	00 	. 
	nop			;700c	00 	. 
	ret m			;700d	f8 	. 
	adc a,h			;700e	8c 	. 
	ld d,d			;700f	52 	R 
	ld hl,00052h		;7010	21 52 00 	! R . 
	nop			;7013	00 	. 
	nop			;7014	00 	. 
	nop			;7015	00 	. 
	nop			;7016	00 	. 
	nop			;7017	00 	. 
	nop			;7018	00 	. 
	nop			;7019	00 	. 
	nop			;701a	00 	. 
	nop			;701b	00 	. 
	nop			;701c	00 	. 
	nop			;701d	00 	. 
	nop			;701e	00 	. 
	nop			;701f	00 	. 
	nop			;7020	00 	. 
	nop			;7021	00 	. 
	nop			;7022	00 	. 
	nop			;7023	00 	. 
	nop			;7024	00 	. 
	nop			;7025	00 	. 
	nop			;7026	00 	. 
	nop			;7027	00 	. 
	nop			;7028	00 	. 
	nop			;7029	00 	. 
	nop			;702a	00 	. 
	nop			;702b	00 	. 
	nop			;702c	00 	. 
	nop			;702d	00 	. 
	nop			;702e	00 	. 
	nop			;702f	00 	. 
	nop			;7030	00 	. 
	nop			;7031	00 	. 
	nop			;7032	00 	. 
	nop			;7033	00 	. 
	nop			;7034	00 	. 
	nop			;7035	00 	. 
	nop			;7036	00 	. 
	nop			;7037	00 	. 
	nop			;7038	00 	. 
	nop			;7039	00 	. 
	nop			;703a	00 	. 
	nop			;703b	00 	. 
	nop			;703c	00 	. 
	nop			;703d	00 	. 
	nop			;703e	00 	. 
	nop			;703f	00 	. 
	nop			;7040	00 	. 
	nop			;7041	00 	. 
	nop			;7042	00 	. 
	nop			;7043	00 	. 
	nop			;7044	00 	. 
	nop			;7045	00 	. 
	nop			;7046	00 	. 
	nop			;7047	00 	. 
	nop			;7048	00 	. 
	nop			;7049	00 	. 
	nop			;704a	00 	. 
	nop			;704b	00 	. 
	nop			;704c	00 	. 
	nop			;704d	00 	. 
	nop			;704e	00 	. 
	nop			;704f	00 	. 
	nop			;7050	00 	. 
	nop			;7051	00 	. 
	nop			;7052	00 	. 
	nop			;7053	00 	. 
	nop			;7054	00 	. 
	nop			;7055	00 	. 
	nop			;7056	00 	. 
	nop			;7057	00 	. 
	nop			;7058	00 	. 
	nop			;7059	00 	. 
	nop			;705a	00 	. 
	nop			;705b	00 	. 
	nop			;705c	00 	. 
	nop			;705d	00 	. 
	nop			;705e	00 	. 
	nop			;705f	00 	. 
	nop			;7060	00 	. 
	nop			;7061	00 	. 
	nop			;7062	00 	. 
	nop			;7063	00 	. 
	nop			;7064	00 	. 
	nop			;7065	00 	. 
	nop			;7066	00 	. 
	nop			;7067	00 	. 
	nop			;7068	00 	. 
	nop			;7069	00 	. 
	nop			;706a	00 	. 
	nop			;706b	00 	. 
	nop			;706c	00 	. 
	nop			;706d	00 	. 
	nop			;706e	00 	. 
	nop			;706f	00 	. 
	nop			;7070	00 	. 
	nop			;7071	00 	. 
	nop			;7072	00 	. 
	nop			;7073	00 	. 
	nop			;7074	00 	. 
	nop			;7075	00 	. 
	nop			;7076	00 	. 
	nop			;7077	00 	. 
	nop			;7078	00 	. 
	nop			;7079	00 	. 
	nop			;707a	00 	. 
	nop			;707b	00 	. 
	nop			;707c	00 	. 
	nop			;707d	00 	. 
	nop			;707e	00 	. 
	nop			;707f	00 	. 
	nop			;7080	00 	. 
	nop			;7081	00 	. 
	nop			;7082	00 	. 
	nop			;7083	00 	. 
	nop			;7084	00 	. 
	nop			;7085	00 	. 
	nop			;7086	00 	. 
	nop			;7087	00 	. 
	nop			;7088	00 	. 
	nop			;7089	00 	. 
	nop			;708a	00 	. 
	nop			;708b	00 	. 
	nop			;708c	00 	. 
	nop			;708d	00 	. 
	nop			;708e	00 	. 
	nop			;708f	00 	. 
	nop			;7090	00 	. 
	nop			;7091	00 	. 
	nop			;7092	00 	. 
	nop			;7093	00 	. 
	nop			;7094	00 	. 
	nop			;7095	00 	. 
	nop			;7096	00 	. 
	nop			;7097	00 	. 
	nop			;7098	00 	. 
	nop			;7099	00 	. 
	nop			;709a	00 	. 
	nop			;709b	00 	. 
	nop			;709c	00 	. 
	nop			;709d	00 	. 
	nop			;709e	00 	. 
	nop			;709f	00 	. 
	nop			;70a0	00 	. 
	nop			;70a1	00 	. 
	nop			;70a2	00 	. 
	nop			;70a3	00 	. 
	nop			;70a4	00 	. 
	nop			;70a5	00 	. 
	nop			;70a6	00 	. 
	nop			;70a7	00 	. 
	nop			;70a8	00 	. 
	nop			;70a9	00 	. 
	nop			;70aa	00 	. 
	nop			;70ab	00 	. 
	nop			;70ac	00 	. 
	nop			;70ad	00 	. 
	nop			;70ae	00 	. 
	nop			;70af	00 	. 
	nop			;70b0	00 	. 
	nop			;70b1	00 	. 
	nop			;70b2	00 	. 
	nop			;70b3	00 	. 
	nop			;70b4	00 	. 
	nop			;70b5	00 	. 
	nop			;70b6	00 	. 
	nop			;70b7	00 	. 
	nop			;70b8	00 	. 
	nop			;70b9	00 	. 
	nop			;70ba	00 	. 
	nop			;70bb	00 	. 
	nop			;70bc	00 	. 
	nop			;70bd	00 	. 
	nop			;70be	00 	. 
	nop			;70bf	00 	. 
	nop			;70c0	00 	. 
	nop			;70c1	00 	. 
	nop			;70c2	00 	. 
	nop			;70c3	00 	. 
	nop			;70c4	00 	. 
	nop			;70c5	00 	. 
	nop			;70c6	00 	. 
	nop			;70c7	00 	. 
	nop			;70c8	00 	. 
	nop			;70c9	00 	. 
	nop			;70ca	00 	. 
	nop			;70cb	00 	. 
	nop			;70cc	00 	. 
	nop			;70cd	00 	. 
	nop			;70ce	00 	. 
	nop			;70cf	00 	. 
	nop			;70d0	00 	. 
	nop			;70d1	00 	. 
	nop			;70d2	00 	. 
	nop			;70d3	00 	. 
	nop			;70d4	00 	. 
	nop			;70d5	00 	. 
	nop			;70d6	00 	. 
	nop			;70d7	00 	. 
	nop			;70d8	00 	. 
	nop			;70d9	00 	. 
	nop			;70da	00 	. 
	nop			;70db	00 	. 
	nop			;70dc	00 	. 
	nop			;70dd	00 	. 
	nop			;70de	00 	. 
	nop			;70df	00 	. 
	nop			;70e0	00 	. 
	nop			;70e1	00 	. 
	nop			;70e2	00 	. 
	nop			;70e3	00 	. 
	nop			;70e4	00 	. 
	nop			;70e5	00 	. 
	nop			;70e6	00 	. 
	nop			;70e7	00 	. 
	nop			;70e8	00 	. 
	nop			;70e9	00 	. 
	nop			;70ea	00 	. 
	nop			;70eb	00 	. 
	nop			;70ec	00 	. 
	nop			;70ed	00 	. 
	nop			;70ee	00 	. 
	nop			;70ef	00 	. 
	nop			;70f0	00 	. 
	nop			;70f1	00 	. 
	nop			;70f2	00 	. 
	nop			;70f3	00 	. 
	nop			;70f4	00 	. 
	nop			;70f5	00 	. 
	nop			;70f6	00 	. 
	nop			;70f7	00 	. 
	nop			;70f8	00 	. 
	nop			;70f9	00 	. 
	nop			;70fa	00 	. 
	nop			;70fb	00 	. 
	nop			;70fc	00 	. 
	nop			;70fd	00 	. 
	nop			;70fe	00 	. 
	nop			;70ff	00 	. 
	nop			;7100	00 	. 
	nop			;7101	00 	. 
	nop			;7102	00 	. 
	nop			;7103	00 	. 
	nop			;7104	00 	. 
	nop			;7105	00 	. 
	nop			;7106	00 	. 
	nop			;7107	00 	. 
	nop			;7108	00 	. 
	nop			;7109	00 	. 
	nop			;710a	00 	. 
	nop			;710b	00 	. 
	nop			;710c	00 	. 
	nop			;710d	00 	. 
	nop			;710e	00 	. 
	nop			;710f	00 	. 
	nop			;7110	00 	. 
	nop			;7111	00 	. 
	nop			;7112	00 	. 
	nop			;7113	00 	. 
	nop			;7114	00 	. 
	nop			;7115	00 	. 
	nop			;7116	00 	. 
	nop			;7117	00 	. 
	nop			;7118	00 	. 
	nop			;7119	00 	. 
	nop			;711a	00 	. 
	nop			;711b	00 	. 
	nop			;711c	00 	. 
	nop			;711d	00 	. 
	nop			;711e	00 	. 
	nop			;711f	00 	. 
	nop			;7120	00 	. 
	nop			;7121	00 	. 
	nop			;7122	00 	. 
	nop			;7123	00 	. 
	nop			;7124	00 	. 
	nop			;7125	00 	. 
	nop			;7126	00 	. 
	nop			;7127	00 	. 
	nop			;7128	00 	. 
	nop			;7129	00 	. 
	nop			;712a	00 	. 
	nop			;712b	00 	. 
	nop			;712c	00 	. 
	nop			;712d	00 	. 
	nop			;712e	00 	. 
	nop			;712f	00 	. 
	nop			;7130	00 	. 
	nop			;7131	00 	. 
	nop			;7132	00 	. 
	nop			;7133	00 	. 
	nop			;7134	00 	. 
	nop			;7135	00 	. 
	nop			;7136	00 	. 
	nop			;7137	00 	. 
	nop			;7138	00 	. 
	nop			;7139	00 	. 
	nop			;713a	00 	. 
	nop			;713b	00 	. 
	nop			;713c	00 	. 
	nop			;713d	00 	. 
	nop			;713e	00 	. 
	nop			;713f	00 	. 
	nop			;7140	00 	. 
	nop			;7141	00 	. 
	nop			;7142	00 	. 
	nop			;7143	00 	. 
	nop			;7144	00 	. 
	nop			;7145	00 	. 
	nop			;7146	00 	. 
	nop			;7147	00 	. 
	nop			;7148	00 	. 
	nop			;7149	00 	. 
	nop			;714a	00 	. 
	nop			;714b	00 	. 
	nop			;714c	00 	. 
	nop			;714d	00 	. 
	nop			;714e	00 	. 
	nop			;714f	00 	. 
	nop			;7150	00 	. 
	nop			;7151	00 	. 
	nop			;7152	00 	. 
	nop			;7153	00 	. 
	nop			;7154	00 	. 
	nop			;7155	00 	. 
	nop			;7156	00 	. 
	nop			;7157	00 	. 
	nop			;7158	00 	. 
	nop			;7159	00 	. 
	nop			;715a	00 	. 
	nop			;715b	00 	. 
	nop			;715c	00 	. 
	nop			;715d	00 	. 
	nop			;715e	00 	. 
	nop			;715f	00 	. 
	nop			;7160	00 	. 
	nop			;7161	00 	. 
	nop			;7162	00 	. 
	nop			;7163	00 	. 
	nop			;7164	00 	. 
	nop			;7165	00 	. 
	nop			;7166	00 	. 
	nop			;7167	00 	. 
	nop			;7168	00 	. 
	nop			;7169	00 	. 
	nop			;716a	00 	. 
	nop			;716b	00 	. 
	nop			;716c	00 	. 
	nop			;716d	00 	. 
	nop			;716e	00 	. 
	nop			;716f	00 	. 
	nop			;7170	00 	. 
	nop			;7171	00 	. 
	nop			;7172	00 	. 
	nop			;7173	00 	. 
	nop			;7174	00 	. 
	nop			;7175	00 	. 
	nop			;7176	00 	. 
	nop			;7177	00 	. 
	nop			;7178	00 	. 
	nop			;7179	00 	. 
	nop			;717a	00 	. 
	nop			;717b	00 	. 
	nop			;717c	00 	. 
	nop			;717d	00 	. 
	nop			;717e	00 	. 
	nop			;717f	00 	. 
	nop			;7180	00 	. 
	nop			;7181	00 	. 
	nop			;7182	00 	. 
	nop			;7183	00 	. 
	nop			;7184	00 	. 
	nop			;7185	00 	. 
	nop			;7186	00 	. 
	nop			;7187	00 	. 
	nop			;7188	00 	. 
	nop			;7189	00 	. 
	nop			;718a	00 	. 
	nop			;718b	00 	. 
	nop			;718c	00 	. 
	nop			;718d	00 	. 
	nop			;718e	00 	. 
	nop			;718f	00 	. 
	nop			;7190	00 	. 
	nop			;7191	00 	. 
	nop			;7192	00 	. 
	nop			;7193	00 	. 
	nop			;7194	00 	. 
	nop			;7195	00 	. 
	nop			;7196	00 	. 
	nop			;7197	00 	. 
	nop			;7198	00 	. 
	nop			;7199	00 	. 
	nop			;719a	00 	. 
	nop			;719b	00 	. 
	nop			;719c	00 	. 
	nop			;719d	00 	. 
	nop			;719e	00 	. 
	nop			;719f	00 	. 
	nop			;71a0	00 	. 
	nop			;71a1	00 	. 
	nop			;71a2	00 	. 
	nop			;71a3	00 	. 
	nop			;71a4	00 	. 
	nop			;71a5	00 	. 
	nop			;71a6	00 	. 
	nop			;71a7	00 	. 
	nop			;71a8	00 	. 
	nop			;71a9	00 	. 
	nop			;71aa	00 	. 
	nop			;71ab	00 	. 
	nop			;71ac	00 	. 
	nop			;71ad	00 	. 
	nop			;71ae	00 	. 
	nop			;71af	00 	. 
	nop			;71b0	00 	. 
	nop			;71b1	00 	. 
	nop			;71b2	00 	. 
	nop			;71b3	00 	. 
	nop			;71b4	00 	. 
	nop			;71b5	00 	. 
	nop			;71b6	00 	. 
	nop			;71b7	00 	. 
	nop			;71b8	00 	. 
	nop			;71b9	00 	. 
	nop			;71ba	00 	. 
	nop			;71bb	00 	. 
	nop			;71bc	00 	. 
	nop			;71bd	00 	. 
	nop			;71be	00 	. 
	nop			;71bf	00 	. 
	nop			;71c0	00 	. 
	nop			;71c1	00 	. 
	nop			;71c2	00 	. 
	nop			;71c3	00 	. 
	nop			;71c4	00 	. 
	nop			;71c5	00 	. 
	nop			;71c6	00 	. 
	nop			;71c7	00 	. 
	nop			;71c8	00 	. 
	nop			;71c9	00 	. 
	nop			;71ca	00 	. 
	nop			;71cb	00 	. 
	nop			;71cc	00 	. 
	nop			;71cd	00 	. 
	nop			;71ce	00 	. 
	nop			;71cf	00 	. 
	nop			;71d0	00 	. 
	nop			;71d1	00 	. 
	nop			;71d2	00 	. 
	nop			;71d3	00 	. 
	nop			;71d4	00 	. 
	nop			;71d5	00 	. 
	nop			;71d6	00 	. 
	nop			;71d7	00 	. 
	nop			;71d8	00 	. 
	nop			;71d9	00 	. 
	nop			;71da	00 	. 
	nop			;71db	00 	. 
	nop			;71dc	00 	. 
	nop			;71dd	00 	. 
	nop			;71de	00 	. 
	nop			;71df	00 	. 
	nop			;71e0	00 	. 
	nop			;71e1	00 	. 
	nop			;71e2	00 	. 
	nop			;71e3	00 	. 
	nop			;71e4	00 	. 
	nop			;71e5	00 	. 
	nop			;71e6	00 	. 
	nop			;71e7	00 	. 
	nop			;71e8	00 	. 
	nop			;71e9	00 	. 
	nop			;71ea	00 	. 
	nop			;71eb	00 	. 
	nop			;71ec	00 	. 
	nop			;71ed	00 	. 
	nop			;71ee	00 	. 
	nop			;71ef	00 	. 
	nop			;71f0	00 	. 
	nop			;71f1	00 	. 
	nop			;71f2	00 	. 
	nop			;71f3	00 	. 
	nop			;71f4	00 	. 
	nop			;71f5	00 	. 
	nop			;71f6	00 	. 
	nop			;71f7	00 	. 
	nop			;71f8	00 	. 
	nop			;71f9	00 	. 
	nop			;71fa	00 	. 
	nop			;71fb	00 	. 
	nop			;71fc	00 	. 
	nop			;71fd	00 	. 
	nop			;71fe	00 	. 
	nop			;71ff	00 	. 
	nop			;7200	00 	. 
	nop			;7201	00 	. 
	nop			;7202	00 	. 
	nop			;7203	00 	. 
	nop			;7204	00 	. 
	nop			;7205	00 	. 
	nop			;7206	00 	. 
	nop			;7207	00 	. 
	nop			;7208	00 	. 
	nop			;7209	00 	. 
	nop			;720a	00 	. 
	nop			;720b	00 	. 
	nop			;720c	00 	. 
	nop			;720d	00 	. 
	nop			;720e	00 	. 
	nop			;720f	00 	. 
	nop			;7210	00 	. 
	nop			;7211	00 	. 
	ld hl,l5121h		;7212	21 21 51 	! ! Q 
	ld c,(hl)			;7215	4e 	N 
	nop			;7216	00 	. 
	nop			;7217	00 	. 
	nop			;7218	00 	. 
	nop			;7219	00 	. 
	nop			;721a	00 	. 
	nop			;721b	00 	. 
	nop			;721c	00 	. 
	nop			;721d	00 	. 
	nop			;721e	00 	. 
	ld b,b			;721f	40 	@ 
	ld e,h			;7220	5c 	\ 
	ld (l4242h),hl		;7221	22 42 42 	" B B 
	ld (0011fh),hl		;7224	22 1f 01 	" . . 
	ld bc,00000h		;7227	01 00 00 	. . . 
	nop			;722a	00 	. 
	jr nc,l7275h		;722b	30 48 	0 H 
	ld c,b			;722d	48 	H 
	ld b,h			;722e	44 	D 
	inc h			;722f	24 	$ 
	inc a			;7230	3c 	< 
	ld c,(hl)			;7231	4e 	N 
	djnz 18		;7232	10 10 	. . 
	djnz l7246h		;7234	10 10 	. . 
	nop			;7236	00 	. 
	nop			;7237	00 	. 
	nop			;7238	00 	. 
	nop			;7239	00 	. 
	nop			;723a	00 	. 
	nop			;723b	00 	. 
	nop			;723c	00 	. 
	ld b,(hl)			;723d	46 	F 
	add hl,hl			;723e	29 	) 
	djnz l7251h		;723f	10 10 	. . 
	djnz l7264h		;7241	10 21 	. ! 
	ld hl,00e11h		;7243	21 11 0e 	! . . 
l7246h:
	nop			;7246	00 	. 
	nop			;7247	00 	. 
	nop			;7248	00 	. 
	nop			;7249	00 	. 
	djnz l7254h		;724a	10 08 	. . 
	ex af,af'			;724c	08 	. 
	ex af,af'			;724d	08 	. 
	djnz l7260h		;724e	10 10 	. . 
	inc e			;7250	1c 	. 
l7251h:
	ld (02214h),hl		;7251	22 14 22 	" . " 
l7254h:
	ld (00041h),hl		;7254	22 41 00 	" A . 
	nop			;7257	00 	. 
	nop			;7258	00 	. 
	nop			;7259	00 	. 
	ld bc,00202h		;725a	01 02 02 	. . . 
	inc b			;725d	04 	. 
	inc b			;725e	04 	. 
	ex af,af'			;725f	08 	. 
l7260h:
	ex af,af'			;7260	08 	. 
	inc d			;7261	14 	. 
	ld b,h			;7262	44 	D 
	inc h			;7263	24 	$ 
l7264h:
	inc h			;7264	24 	$ 
	ld e,d			;7265	5a 	Z 
	ld (bc),a			;7266	02 	. 
	ld bc,00001h		;7267	01 01 00 	. . . 
	nop			;726a	00 	. 
	nop			;726b	00 	. 
	nop			;726c	00 	. 
	nop			;726d	00 	. 
	nop			;726e	00 	. 
	nop			;726f	00 	. 
	ld c,b			;7270	48 	H 
	ld c,b			;7271	48 	H 
	inc h			;7272	24 	$ 
	inc h			;7273	24 	$ 
	inc h			;7274	24 	$ 
l7275h:
	inc h			;7275	24 	$ 
	nop			;7276	00 	. 
	nop			;7277	00 	. 
	nop			;7278	00 	. 
	nop			;7279	00 	. 
	nop			;727a	00 	. 
	nop			;727b	00 	. 
	nop			;727c	00 	. 
	nop			;727d	00 	. 
	ld b,(hl)			;727e	46 	F 
	dec a			;727f	3d 	= 
	inc h			;7280	24 	$ 
	inc h			;7281	24 	$ 
	ld hl,01121h		;7282	21 21 11 	! ! . 
	ld c,000h		;7285	0e 00 	. . 
	nop			;7287	00 	. 
	nop			;7288	00 	. 
	nop			;7289	00 	. 
	nop			;728a	00 	. 
	nop			;728b	00 	. 
	nop			;728c	00 	. 
	nop			;728d	00 	. 
	nop			;728e	00 	. 
	ld a,h			;728f	7c 	| 
	ld (de),a			;7290	12 	. 
	ld hl,00408h		;7291	21 08 04 	! . . 
	ld (bc),a			;7294	02 	. 
	ld a,a			;7295	7f 	 
	nop			;7296	00 	. 
	nop			;7297	00 	. 
	nop			;7298	00 	. 
	nop			;7299	00 	. 
	ld a,a			;729a	7f 	 
	ld (bc),a			;729b	02 	. 
	inc b			;729c	04 	. 
	ex af,af'			;729d	08 	. 
	djnz l72c0h		;729e	10 20 	.   
	jr nz,l72b2h		;72a0	20 10 	  . 
	ld b,d			;72a2	42 	B 
	ld b,d			;72a3	42 	B 
	add a,c			;72a4	81 	. 
	rst 38h			;72a5	ff 	. 
	nop			;72a6	00 	. 
	nop			;72a7	00 	. 
	nop			;72a8	00 	. 
	nop			;72a9	00 	. 
	nop			;72aa	00 	. 
	nop			;72ab	00 	. 
	nop			;72ac	00 	. 
	nop			;72ad	00 	. 
	jr l72c8h		;72ae	18 18 	. . 
	inc h			;72b0	24 	$ 
	inc h			;72b1	24 	$ 
l72b2h:
	ld b,c			;72b2	41 	A 
	ld b,c			;72b3	41 	A 
	ld (0001ch),hl		;72b4	22 1c 00 	" . . 
	nop			;72b7	00 	. 
	nop			;72b8	00 	. 
	nop			;72b9	00 	. 
	inc e			;72ba	1c 	. 
	ld (04141h),hl		;72bb	22 41 41 	" A A 
	ld b,c			;72be	41 	A 
	ld a,a			;72bf	7f 	 
l72c0h:
	ld b,c			;72c0	41 	A 
	ld b,c			;72c1	41 	A 
	nop			;72c2	00 	. 
	nop			;72c3	00 	. 
	nop			;72c4	00 	. 
	nop			;72c5	00 	. 
	nop			;72c6	00 	. 
	nop			;72c7	00 	. 
l72c8h:
	nop			;72c8	00 	. 
	nop			;72c9	00 	. 
	nop			;72ca	00 	. 
	ld (hl),036h		;72cb	36 36 	6 6 
	nop			;72cd	00 	. 
	nop			;72ce	00 	. 
	nop			;72cf	00 	. 
	nop			;72d0	00 	. 
	nop			;72d1	00 	. 
	ld a,03eh		;72d2	3e 3e 	> > 
	inc e			;72d4	1c 	. 
	ex af,af'			;72d5	08 	. 
	nop			;72d6	00 	. 
	nop			;72d7	00 	. 
	nop			;72d8	00 	. 
	nop			;72d9	00 	. 
	nop			;72da	00 	. 
	ld (l7777h),hl		;72db	22 77 77 	" w w 
	ld a,a			;72de	7f 	 
	ld a,a			;72df	7f 	 
	ld a,a			;72e0	7f 	 
	ld a,a			;72e1	7f 	 
	ld a,01ch		;72e2	3e 1c 	> . 
	inc e			;72e4	1c 	. 
	ex af,af'			;72e5	08 	. 
	ex af,af'			;72e6	08 	. 
	nop			;72e7	00 	. 
	nop			;72e8	00 	. 
	nop			;72e9	00 	. 
	ex af,af'			;72ea	08 	. 
	ex af,af'			;72eb	08 	. 
	inc e			;72ec	1c 	. 
	inc e			;72ed	1c 	. 
	ld a,03eh		;72ee	3e 3e 	> > 
	ld a,a			;72f0	7f 	 
	ld a,07fh		;72f1	3e 7f 	>  
	ld hl,(00808h)		;72f3	2a 08 08 	* . . 
	ld a,000h		;72f6	3e 00 	> . 
	nop			;72f8	00 	. 
	nop			;72f9	00 	. 
	inc e			;72fa	1c 	. 
	ld a,03eh		;72fb	3e 3e 	> > 
	ld a,01ch		;72fd	3e 1c 	> . 
	ld a,a			;72ff	7f 	 
	ld a,a			;7300	7f 	 
	ld a,a			;7301	7f 	 
	ld a,a			;7302	7f 	 
	ld a,008h		;7303	3e 08 	> . 
	ex af,af'			;7305	08 	. 
	inc e			;7306	1c 	. 
	nop			;7307	00 	. 
	nop			;7308	00 	. 
	nop			;7309	00 	. 
	ex af,af'			;730a	08 	. 
	inc e			;730b	1c 	. 
	ld a,03eh		;730c	3e 3e 	> > 
	ld a,a			;730e	7f 	 
	ld a,a			;730f	7f 	 
	ld a,a			;7310	7f 	 
	ld a,a			;7311	7f 	 
	ld b,b			;7312	40 	@ 
	nop			;7313	00 	. 
	ld a,(hl)			;7314	7e 	~ 
	nop			;7315	00 	. 
	nop			;7316	00 	. 
	nop			;7317	00 	. 
	nop			;7318	00 	. 
	nop			;7319	00 	. 
	nop			;731a	00 	. 
	nop			;731b	00 	. 
	ld b,b			;731c	40 	@ 
	jr nc,l732bh		;731d	30 0c 	0 . 
	ld (bc),a			;731f	02 	. 
	inc c			;7320	0c 	. 
	jr nc,l7325h		;7321	30 02 	0 . 
	nop			;7323	00 	. 
	ld a,(hl)			;7324	7e 	~ 
l7325h:
	nop			;7325	00 	. 
	nop			;7326	00 	. 
	nop			;7327	00 	. 
	nop			;7328	00 	. 
	nop			;7329	00 	. 
	nop			;732a	00 	. 
l732bh:
	nop			;732b	00 	. 
	ld (bc),a			;732c	02 	. 
	inc c			;732d	0c 	. 
	jr nc,l7370h		;732e	30 40 	0 @ 
	jr nc,l733eh		;7330	30 0c 	0 . 
	ld b,(hl)			;7332	46 	F 
	add hl,sp			;7333	39 	9 
	nop			;7334	00 	. 
	nop			;7335	00 	. 
	nop			;7336	00 	. 
	nop			;7337	00 	. 
	nop			;7338	00 	. 
	nop			;7339	00 	. 
	nop			;733a	00 	. 
	nop			;733b	00 	. 
	nop			;733c	00 	. 
	nop			;733d	00 	. 
l733eh:
	nop			;733e	00 	. 
	ld b,(hl)			;733f	46 	F 
	add hl,sp			;7340	39 	9 
	nop			;7341	00 	. 
	ld a,(hl)			;7342	7e 	~ 
	nop			;7343	00 	. 
	nop			;7344	00 	. 
	nop			;7345	00 	. 
	nop			;7346	00 	. 
	nop			;7347	00 	. 
	nop			;7348	00 	. 
	nop			;7349	00 	. 
	nop			;734a	00 	. 
	nop			;734b	00 	. 
	nop			;734c	00 	. 
	nop			;734d	00 	. 
	ld a,(hl)			;734e	7e 	~ 
	nop			;734f	00 	. 
	ld a,(hl)			;7350	7e 	~ 
	nop			;7351	00 	. 
	ex af,af'			;7352	08 	. 
	ex af,af'			;7353	08 	. 
	ex af,af'			;7354	08 	. 
	ex af,af'			;7355	08 	. 
	ex af,af'			;7356	08 	. 
	ex af,af'			;7357	08 	. 
	ex af,af'			;7358	08 	. 
	ex af,af'			;7359	08 	. 
	jr nc,l7364h		;735a	30 08 	0 . 
	ex af,af'			;735c	08 	. 
	ex af,af'			;735d	08 	. 
	ex af,af'			;735e	08 	. 
	ex af,af'			;735f	08 	. 
	ex af,af'			;7360	08 	. 
	ex af,af'			;7361	08 	. 
	ex af,af'			;7362	08 	. 
	ex af,af'			;7363	08 	. 
l7364h:
	ex af,af'			;7364	08 	. 
	ex af,af'			;7365	08 	. 
	ex af,af'			;7366	08 	. 
	ex af,af'			;7367	08 	. 
	ex af,af'			;7368	08 	. 
	ld b,008h		;7369	06 08 	. . 
	ex af,af'			;736b	08 	. 
	ex af,af'			;736c	08 	. 
	ex af,af'			;736d	08 	. 
	ex af,af'			;736e	08 	. 
	ex af,af'			;736f	08 	. 
l7370h:
	ex af,af'			;7370	08 	. 
	ex af,af'			;7371	08 	. 
	nop			;7372	00 	. 
	nop			;7373	00 	. 
	nop			;7374	00 	. 
	nop			;7375	00 	. 
	nop			;7376	00 	. 
	nop			;7377	00 	. 
	nop			;7378	00 	. 
	nop			;7379	00 	. 
	ld c,010h		;737a	0e 10 	. . 
	ex af,af'			;737c	08 	. 
	inc b			;737d	04 	. 
	ld (bc),a			;737e	02 	. 
	ld e,000h		;737f	1e 00 	. . 
	nop			;7381	00 	. 
	jr nz,l7395h		;7382	20 11 	  . 
	ld (de),a			;7384	12 	. 
	inc d			;7385	14 	. 
	ex af,af'			;7386	08 	. 
	nop			;7387	00 	. 
	nop			;7388	00 	. 
	nop			;7389	00 	. 
	add a,b			;738a	80 	. 
	add a,b			;738b	80 	. 
	add a,b			;738c	80 	. 
	ld b,b			;738d	40 	@ 
	ld b,b			;738e	40 	@ 
	ld b,b			;738f	40 	@ 
	jr nz,l73b2h		;7390	20 20 	    
	nop			;7392	00 	. 
	nop			;7393	00 	. 
	nop			;7394	00 	. 
l7395h:
	nop			;7395	00 	. 
	nop			;7396	00 	. 
	nop			;7397	00 	. 
	nop			;7398	00 	. 
	nop			;7399	00 	. 
	nop			;739a	00 	. 
	nop			;739b	00 	. 
	nop			;739c	00 	. 
	nop			;739d	00 	. 
	ld (hl),049h		;739e	36 49 	6 I 
	ld c,c			;73a0	49 	I 
	ld (hl),024h		;73a1	36 24 	6 $ 
	ld c,b			;73a3	48 	H 
	sub b			;73a4	90 	. 
	nop			;73a5	00 	. 
	nop			;73a6	00 	. 
	nop			;73a7	00 	. 
	nop			;73a8	00 	. 
	nop			;73a9	00 	. 
	nop			;73aa	00 	. 
	nop			;73ab	00 	. 
	sub b			;73ac	90 	. 
	ld c,b			;73ad	48 	H 
	inc h			;73ae	24 	$ 
	ld (de),a			;73af	12 	. 
	add hl,bc			;73b0	09 	. 
	ld (de),a			;73b1	12 	. 
l73b2h:
	inc h			;73b2	24 	$ 
	ld (de),a			;73b3	12 	. 
	add hl,bc			;73b4	09 	. 
	nop			;73b5	00 	. 
	nop			;73b6	00 	. 
	nop			;73b7	00 	. 
	nop			;73b8	00 	. 
	nop			;73b9	00 	. 
	nop			;73ba	00 	. 
	nop			;73bb	00 	. 
	add hl,bc			;73bc	09 	. 
	ld (de),a			;73bd	12 	. 
	inc h			;73be	24 	$ 
	ld c,b			;73bf	48 	H 
	sub b			;73c0	90 	. 
	ld c,b			;73c1	48 	H 
	nop			;73c2	00 	. 
	nop			;73c3	00 	. 
	ld a,a			;73c4	7f 	 
	nop			;73c5	00 	. 
	nop			;73c6	00 	. 
	nop			;73c7	00 	. 
	nop			;73c8	00 	. 
	nop			;73c9	00 	. 
	nop			;73ca	00 	. 
	ex af,af'			;73cb	08 	. 
	ex af,af'			;73cc	08 	. 
	ex af,af'			;73cd	08 	. 
	ld a,a			;73ce	7f 	 
	ex af,af'			;73cf	08 	. 
	ex af,af'			;73d0	08 	. 
	ex af,af'			;73d1	08 	. 
	nop			;73d2	00 	. 
	jr l73edh		;73d3	18 18 	. . 
	nop			;73d5	00 	. 
	nop			;73d6	00 	. 
	nop			;73d7	00 	. 
	nop			;73d8	00 	. 
	nop			;73d9	00 	. 
	nop			;73da	00 	. 
	nop			;73db	00 	. 
	jr l73f6h		;73dc	18 18 	. . 
sub_73deh:
	nop			;73de	00 	. 
	nop			;73df	00 	. 
	ld a,(hl)			;73e0	7e 	~ 
	nop			;73e1	00 	. 
	nop			;73e2	00 	. 
	nop			;73e3	00 	. 
	nop			;73e4	00 	. 
	nop			;73e5	00 	. 
	nop			;73e6	00 	. 
	nop			;73e7	00 	. 
	nop			;73e8	00 	. 
	nop			;73e9	00 	. 
	nop			;73ea	00 	. 
	jr 38		;73eb	18 24 	. $ 
l73edh:
	inc h			;73ed	24 	$ 
	jr l73f0h		;73ee	18 00 	. . 
l73f0h:
	nop			;73f0	00 	. 
	nop			;73f1	00 	. 
	inc c			;73f2	0c 	. 
	djnz l73fdh		;73f3	10 08 	. . 
	inc b			;73f5	04 	. 
l73f6h:
	inc a			;73f6	3c 	< 
	nop			;73f7	00 	. 
	nop			;73f8	00 	. 
	nop			;73f9	00 	. 
	ex af,af'			;73fa	08 	. 
	inc c			;73fb	0c 	. 
	ex af,af'			;73fc	08 	. 
l73fdh:
	ex af,af'			;73fd	08 	. 
	inc e			;73fe	1c 	. 
	nop			;73ff	00 	. 
	ld a,000h		;7400	3e 00 	> . 
	inc d			;7402	14 	. 
	inc d			;7403	14 	. 
	inc a			;7404	3c 	< 
	djnz l7417h		;7405	10 10 	. . 
	nop			;7407	00 	. 
	nop			;7408	00 	. 
	nop			;7409	00 	. 
	ex af,af'			;740a	08 	. 
	inc c			;740b	0c 	. 
	ex af,af'			;740c	08 	. 
	ex af,af'			;740d	08 	. 
	inc e			;740e	1c 	. 
	nop			;740f	00 	. 
	ld a,000h		;7410	3e 00 	> . 
	ld c,019h		;7412	0e 19 	. . 
	add hl,hl			;7414	29 	) 
	ld b,(hl)			;7415	46 	F 
	nop			;7416	00 	. 
l7417h:
	nop			;7417	00 	. 
	nop			;7418	00 	. 
	nop			;7419	00 	. 
	jr nc,l7464h		;741a	30 48 	0 H 
	ld c,b			;741c	48 	H 
	ex af,af'			;741d	08 	. 
	ex af,af'			;741e	08 	. 
	ld a,008h		;741f	3e 08 	> . 
	ex af,af'			;7421	08 	. 
	ld a,a			;7422	7f 	 
	ex af,af'			;7423	08 	. 
	ex af,af'			;7424	08 	. 
	ex af,af'			;7425	08 	. 
	nop			;7426	00 	. 
	nop			;7427	00 	. 
	nop			;7428	00 	. 
	nop			;7429	00 	. 
	ld b,c			;742a	41 	A 
	ld b,c			;742b	41 	A 
	ld (01422h),hl		;742c	22 22 14 	" " . 
	ld a,a			;742f	7f 	 
	ex af,af'			;7430	08 	. 
	ex af,af'			;7431	08 	. 
	ex af,af'			;7432	08 	. 
	ex af,af'			;7433	08 	. 
	ex af,af'			;7434	08 	. 
	ld b,000h		;7435	06 00 	. . 
	nop			;7437	00 	. 
	nop			;7438	00 	. 
	nop			;7439	00 	. 
	jr nc,l7444h		;743a	30 08 	0 . 
	ex af,af'			;743c	08 	. 
	ex af,af'			;743d	08 	. 
	ex af,af'			;743e	08 	. 
	ex af,af'			;743f	08 	. 
	inc e			;7440	1c 	. 
	ex af,af'			;7441	08 	. 
	add hl,hl			;7442	29 	) 
	ld l,c			;7443	69 	i 
l7444h:
	ld c,c			;7444	49 	I 
	ld l,c			;7445	69 	i 
	nop			;7446	00 	. 
	nop			;7447	00 	. 
	nop			;7448	00 	. 
	nop			;7449	00 	. 
	rrca			;744a	0f 	. 
	ld de,01111h		;744b	11 11 11 	. . . 
	rrca			;744e	0f 	. 
	add hl,bc			;744f	09 	. 
	dec e			;7450	1d 	. 
	ld l,c			;7451	69 	i 
	ld c,c			;7452	49 	I 
	ld a,008h		;7453	3e 08 	> . 
	ex af,af'			;7455	08 	. 
	nop			;7456	00 	. 
	nop			;7457	00 	. 
	nop			;7458	00 	. 
	nop			;7459	00 	. 
	nop			;745a	00 	. 
	ex af,af'			;745b	08 	. 
	ex af,af'			;745c	08 	. 
	ld a,049h		;745d	3e 49 	> I 
	add hl,bc			;745f	09 	. 
	add hl,bc			;7460	09 	. 
	add hl,bc			;7461	09 	. 
	ld b,c			;7462	41 	A 
	ld b,c			;7463	41 	A 
l7464h:
	ld (0001ch),hl		;7464	22 1c 00 	" . . 
	nop			;7467	00 	. 
	nop			;7468	00 	. 
	nop			;7469	00 	. 
	ex af,af'			;746a	08 	. 
	ex af,af'			;746b	08 	. 
	nop			;746c	00 	. 
	nop			;746d	00 	. 
	ex af,af'			;746e	08 	. 
	ex af,af'			;746f	08 	. 
	inc b			;7470	04 	. 
	ld b,d			;7471	42 	B 
	add hl,bc			;7472	09 	. 
	add hl,bc			;7473	09 	. 
	add hl,bc			;7474	09 	. 
	halt			;7475	76 	v 
	nop			;7476	00 	. 
	nop			;7477	00 	. 
	nop			;7478	00 	. 
	nop			;7479	00 	. 
	nop			;747a	00 	. 
	nop			;747b	00 	. 
	ex af,af'			;747c	08 	. 
	ld a,(hl)			;747d	7e 	~ 
	add hl,bc			;747e	09 	. 
	add hl,bc			;747f	09 	. 
	add hl,bc			;7480	09 	. 
	add hl,sp			;7481	39 	9 
	add hl,bc			;7482	09 	. 
	add hl,bc			;7483	09 	. 
	add hl,bc			;7484	09 	. 
	ld a,c			;7485	79 	y 
	nop			;7486	00 	. 
	nop			;7487	00 	. 
	nop			;7488	00 	. 
	nop			;7489	00 	. 
	halt			;748a	76 	v 
	add hl,bc			;748b	09 	. 
	add hl,bc			;748c	09 	. 
	add hl,bc			;748d	09 	. 
	add hl,bc			;748e	09 	. 
	add hl,bc			;748f	09 	. 
	ld a,a			;7490	7f 	 
	add hl,bc			;7491	09 	. 
	inc b			;7492	04 	. 
	nop			;7493	00 	. 
	nop			;7494	00 	. 
	nop			;7495	00 	. 
	nop			;7496	00 	. 
	nop			;7497	00 	. 
	nop			;7498	00 	. 
	nop			;7499	00 	. 
	nop			;749a	00 	. 
	nop			;749b	00 	. 
	nop			;749c	00 	. 
	nop			;749d	00 	. 
	inc b			;749e	04 	. 
	ld (bc),a			;749f	02 	. 
	defb 0fdh,002h,020h	;illegal sequence		;74a0	fd 02 20 	. .   
	nop			;74a3	00 	. 
	nop			;74a4	00 	. 
	nop			;74a5	00 	. 
	nop			;74a6	00 	. 
	nop			;74a7	00 	. 
	nop			;74a8	00 	. 
	nop			;74a9	00 	. 
	nop			;74aa	00 	. 
	nop			;74ab	00 	. 
	nop			;74ac	00 	. 
	nop			;74ad	00 	. 
	jr nz,66		;74ae	20 40 	  @ 
	cp a			;74b0	bf 	. 
	ld b,b			;74b1	40 	@ 
	ex af,af'			;74b2	08 	. 
	ex af,af'			;74b3	08 	. 
	ex af,af'			;74b4	08 	. 
	ex af,af'			;74b5	08 	. 
	nop			;74b6	00 	. 
	nop			;74b7	00 	. 
	nop			;74b8	00 	. 
	nop			;74b9	00 	. 
	ex af,af'			;74ba	08 	. 
	inc d			;74bb	14 	. 
	ld hl,(00808h)		;74bc	2a 08 08 	* . . 
	ex af,af'			;74bf	08 	. 
	ex af,af'			;74c0	08 	. 
	ex af,af'			;74c1	08 	. 
	ex af,af'			;74c2	08 	. 
	ld hl,(00814h)		;74c3	2a 14 08 	* . . 
	nop			;74c6	00 	. 
	nop			;74c7	00 	. 
	nop			;74c8	00 	. 
	nop			;74c9	00 	. 
	ex af,af'			;74ca	08 	. 
	ex af,af'			;74cb	08 	. 
	ex af,af'			;74cc	08 	. 
	ex af,af'			;74cd	08 	. 
	ex af,af'			;74ce	08 	. 
	ex af,af'			;74cf	08 	. 
	ex af,af'			;74d0	08 	. 
	ex af,af'			;74d1	08 	. 
	ccf			;74d2	3f 	? 
	ccf			;74d3	3f 	? 
	ccf			;74d4	3f 	? 
	ccf			;74d5	3f 	? 
	nop			;74d6	00 	. 
	nop			;74d7	00 	. 
	nop			;74d8	00 	. 
	nop			;74d9	00 	. 
	nop			;74da	00 	. 
	ccf			;74db	3f 	? 
	ccf			;74dc	3f 	? 
	ccf			;74dd	3f 	? 
	ccf			;74de	3f 	? 
	ccf			;74df	3f 	? 
	ccf			;74e0	3f 	? 
	ccf			;74e1	3f 	? 
	ld hl,l2121h		;74e2	21 21 21 	! ! ! 
	ccf			;74e5	3f 	? 
	nop			;74e6	00 	. 
	nop			;74e7	00 	. 
	nop			;74e8	00 	. 
	nop			;74e9	00 	. 
	nop			;74ea	00 	. 
	ccf			;74eb	3f 	? 
	ld hl,l2121h		;74ec	21 21 21 	! ! ! 
	ld hl,l2121h		;74ef	21 21 21 	! ! ! 
	ld a,a			;74f2	7f 	 
	ld a,a			;74f3	7f 	 
	ld a,01ch		;74f4	3e 1c 	> . 
	nop			;74f6	00 	. 
	nop			;74f7	00 	. 
	nop			;74f8	00 	. 
	nop			;74f9	00 	. 
	nop			;74fa	00 	. 
	inc e			;74fb	1c 	. 
	ld a,07fh		;74fc	3e 7f 	>  
	ld a,a			;74fe	7f 	 
	ld a,a			;74ff	7f 	 
	ld a,a			;7500	7f 	 
	ld a,a			;7501	7f 	 
	ld b,c			;7502	41 	A 
	ld b,c			;7503	41 	A 
	ld (0001ch),hl		;7504	22 1c 00 	" . . 
	nop			;7507	00 	. 
	nop			;7508	00 	. 
	nop			;7509	00 	. 
	nop			;750a	00 	. 
	inc e			;750b	1c 	. 
	ld (04141h),hl		;750c	22 41 41 	" A A 
	ld b,c			;750f	41 	A 
	ld b,c			;7510	41 	A 
	ld b,c			;7511	41 	A 
	ld e,c			;7512	59 	Y 
	ld b,c			;7513	41 	A 
	ld (0001ch),hl		;7514	22 1c 00 	" . . 
	nop			;7517	00 	. 
	nop			;7518	00 	. 
	nop			;7519	00 	. 
	nop			;751a	00 	. 
	inc e			;751b	1c 	. 
	ld (l5941h),hl		;751c	22 41 59 	" A Y 
	ld b,l			;751f	45 	E 
	ld b,l			;7520	45 	E 
	ld b,l			;7521	45 	E 
	ld c,b			;7522	48 	H 
	ld c,b			;7523	48 	H 
	ld c,b			;7524	48 	H 
	ld c,b			;7525	48 	H 
	nop			;7526	00 	. 
	nop			;7527	00 	. 
	nop			;7528	00 	. 
	nop			;7529	00 	. 
	ld a,(hl)			;752a	7e 	~ 
	ld c,c			;752b	49 	I 
	ld c,c			;752c	49 	I 
	ld c,c			;752d	49 	I 
	ld c,c			;752e	49 	I 
	ld a,(hl)			;752f	7e 	~ 
	ld c,b			;7530	48 	H 
	ld c,b			;7531	48 	H 
	inc e			;7532	1c 	. 
	jr nz,l7555h		;7533	20 20 	    
	ld e,000h		;7535	1e 00 	. . 
	nop			;7537	00 	. 
	nop			;7538	00 	. 
	nop			;7539	00 	. 
	inc a			;753a	3c 	< 
	ld (bc),a			;753b	02 	. 
	ld (bc),a			;753c	02 	. 
	inc e			;753d	1c 	. 
	ld (l2222h),hl		;753e	22 22 22 	" " " 
	ld (00000h),hl		;7541	22 00 00 	" . . 
	nop			;7544	00 	. 
	nop			;7545	00 	. 
	nop			;7546	00 	. 
	nop			;7547	00 	. 
	nop			;7548	00 	. 
	nop			;7549	00 	. 
	ld e,(hl)			;754a	5e 	^ 
	ld (hl),h			;754b	74 	t 
	ld d,h			;754c	54 	T 
	ld d,h			;754d	54 	T 
	ld d,h			;754e	54 	T 
	nop			;754f	00 	. 
	nop			;7550	00 	. 
	nop			;7551	00 	. 
	ex af,af'			;7552	08 	. 
	ex af,af'			;7553	08 	. 
	inc e			;7554	1c 	. 
l7555h:
	ex af,af'			;7555	08 	. 
	nop			;7556	00 	. 
	nop			;7557	00 	. 
	nop			;7558	00 	. 
	nop			;7559	00 	. 
	ex af,af'			;755a	08 	. 
	inc e			;755b	1c 	. 
	ex af,af'			;755c	08 	. 
	ld hl,(l2a7fh)		;755d	2a 7f 2a 	*  * 
	ex af,af'			;7560	08 	. 
	ex af,af'			;7561	08 	. 
	ex af,af'			;7562	08 	. 
	ex af,af'			;7563	08 	. 
	ex af,af'			;7564	08 	. 
	ld a,b			;7565	78 	x 
	nop			;7566	00 	. 
	nop			;7567	00 	. 
	nop			;7568	00 	. 
	nop			;7569	00 	. 
	nop			;756a	00 	. 
	inc a			;756b	3c 	< 
	ld (bc),a			;756c	02 	. 
	ld bc,00909h		;756d	01 09 09 	. . . 
	ld a,(bc)			;7570	0a 	. 
	inc a			;7571	3c 	< 
	nop			;7572	00 	. 
	nop			;7573	00 	. 
	nop			;7574	00 	. 
	nop			;7575	00 	. 
	nop			;7576	00 	. 
	nop			;7577	00 	. 
	nop			;7578	00 	. 
	nop			;7579	00 	. 
	nop			;757a	00 	. 
	nop			;757b	00 	. 
	nop			;757c	00 	. 
	nop			;757d	00 	. 
	nop			;757e	00 	. 
	inc e			;757f	1c 	. 
	inc e			;7580	1c 	. 
	inc e			;7581	1c 	. 
	ld e,01fh		;7582	1e 1f 	. . 
	rra			;7584	1f 	. 
	rra			;7585	1f 	. 
	ld c,000h		;7586	0e 00 	. . 
	nop			;7588	00 	. 
	nop			;7589	00 	. 
	jr nc,l75fch		;758a	30 70 	0 p 
	ret nc			;758c	d0 	. 
	sub b			;758d	90 	. 
	djnz l75a0h		;758e	10 10 	. . 
	djnz l75a2h		;7590	10 10 	. . 
	rst 8			;7592	cf 	. 
	ld c,a			;7593	4f 	O 
	ld b,(hl)			;7594	46 	F 
	ld (hl),b			;7595	70 	p 
	ld a,b			;7596	78 	x 
	ld a,b			;7597	78 	x 
	jr nc,l759ah		;7598	30 00 	0 . 
l759ah:
	nop			;759a	00 	. 
	ex af,af'			;759b	08 	. 
	jr l75c6h		;759c	18 28 	. ( 
	ld c,b			;759e	48 	H 
	ret c			;759f	d8 	. 
l75a0h:
	ld l,b			;75a0	68 	h 
	ld c,(hl)			;75a1	4e 	N 
l75a2h:
	ld b,b			;75a2	40 	@ 
	inc h			;75a3	24 	$ 
	inc d			;75a4	14 	. 
	inc c			;75a5	0c 	. 
	inc a			;75a6	3c 	< 
	nop			;75a7	00 	. 
	nop			;75a8	00 	. 
	nop			;75a9	00 	. 
	nop			;75aa	00 	. 
	ex af,af'			;75ab	08 	. 
	djnz l75ceh		;75ac	10 20 	.   
	jr nz,l75f0h		;75ae	20 40 	  @ 
	ld b,b			;75b0	40 	@ 
	ld b,b			;75b1	40 	@ 
	call p,01414h		;75b2	f4 14 14 	. . . 
	inc d			;75b5	14 	. 
	inc d			;75b6	14 	. 
	inc d			;75b7	14 	. 
	inc d			;75b8	14 	. 
	inc d			;75b9	14 	. 
	nop			;75ba	00 	. 
	nop			;75bb	00 	. 
	nop			;75bc	00 	. 
	nop			;75bd	00 	. 
	nop			;75be	00 	. 
	nop			;75bf	00 	. 
	call m,0f404h		;75c0	fc 04 f4 	. . . 
	inc d			;75c3	14 	. 
	inc d			;75c4	14 	. 
	inc d			;75c5	14 	. 
l75c6h:
	inc d			;75c6	14 	. 
	inc d			;75c7	14 	. 
	inc d			;75c8	14 	. 
	inc d			;75c9	14 	. 
	inc d			;75ca	14 	. 
	inc d			;75cb	14 	. 
	inc d			;75cc	14 	. 
	inc d			;75cd	14 	. 
l75ceh:
	inc d			;75ce	14 	. 
	inc d			;75cf	14 	. 
	call p,0fc04h		;75d0	f4 04 fc 	. . . 
	nop			;75d3	00 	. 
	nop			;75d4	00 	. 
	nop			;75d5	00 	. 
	nop			;75d6	00 	. 
	nop			;75d7	00 	. 
	nop			;75d8	00 	. 
	nop			;75d9	00 	. 
	inc d			;75da	14 	. 
	inc d			;75db	14 	. 
	inc d			;75dc	14 	. 
	inc d			;75dd	14 	. 
	inc d			;75de	14 	. 
	inc d			;75df	14 	. 
	call p,00804h		;75e0	f4 04 08 	. . . 
	ex af,af'			;75e3	08 	. 
	ex af,af'			;75e4	08 	. 
	ex af,af'			;75e5	08 	. 
	ex af,af'			;75e6	08 	. 
	ex af,af'			;75e7	08 	. 
	ex af,af'			;75e8	08 	. 
	ex af,af'			;75e9	08 	. 
	nop			;75ea	00 	. 
	nop			;75eb	00 	. 
	nop			;75ec	00 	. 
	nop			;75ed	00 	. 
	nop			;75ee	00 	. 
	nop			;75ef	00 	. 
l75f0h:
	nop			;75f0	00 	. 
	ret m			;75f1	f8 	. 
	ex af,af'			;75f2	08 	. 
	ex af,af'			;75f3	08 	. 
	ex af,af'			;75f4	08 	. 
	ex af,af'			;75f5	08 	. 
	ex af,af'			;75f6	08 	. 
	ex af,af'			;75f7	08 	. 
	ex af,af'			;75f8	08 	. 
	ex af,af'			;75f9	08 	. 
	ex af,af'			;75fa	08 	. 
	ex af,af'			;75fb	08 	. 
l75fch:
	ex af,af'			;75fc	08 	. 
	ex af,af'			;75fd	08 	. 
	ex af,af'			;75fe	08 	. 
	ex af,af'			;75ff	08 	. 
	ex af,af'			;7600	08 	. 
	ret m			;7601	f8 	. 
	nop			;7602	00 	. 
	nop			;7603	00 	. 
	nop			;7604	00 	. 
	nop			;7605	00 	. 
	nop			;7606	00 	. 
	nop			;7607	00 	. 
	nop			;7608	00 	. 
	nop			;7609	00 	. 
	ex af,af'			;760a	08 	. 
	ex af,af'			;760b	08 	. 
	ex af,af'			;760c	08 	. 
	ex af,af'			;760d	08 	. 
	ex af,af'			;760e	08 	. 
	ex af,af'			;760f	08 	. 
	ex af,af'			;7610	08 	. 
	ret m			;7611	f8 	. 
	xor 0bbh		;7612	ee bb 	. . 
	xor 0bbh		;7614	ee bb 	. . 
	xor 0bbh		;7616	ee bb 	. . 
	xor 0bbh		;7618	ee bb 	. . 
	xor 0bbh		;761a	ee bb 	. . 
	xor 0bbh		;761c	ee bb 	. . 
	xor 0bbh		;761e	ee bb 	. . 
	xor 0bbh		;7620	ee bb 	. . 
	adc a,b			;7622	88 	. 
	ld (l2288h),hl		;7623	22 88 22 	" . " 
	adc a,b			;7626	88 	. 
	ld (l2288h),hl		;7627	22 88 22 	" . " 
	adc a,b			;762a	88 	. 
	ld (l2288h),hl		;762b	22 88 22 	" . " 
	adc a,b			;762e	88 	. 
	ld (l2288h),hl		;762f	22 88 22 	" . " 
	nop			;7632	00 	. 
	nop			;7633	00 	. 
	nop			;7634	00 	. 
	nop			;7635	00 	. 
	nop			;7636	00 	. 
	nop			;7637	00 	. 
	nop			;7638	00 	. 
	nop			;7639	00 	. 
	rst 38h			;763a	ff 	. 
	rst 38h			;763b	ff 	. 
	rst 38h			;763c	ff 	. 
	rst 38h			;763d	ff 	. 
	rst 38h			;763e	ff 	. 
	rst 38h			;763f	ff 	. 
	rst 38h			;7640	ff 	. 
	rst 38h			;7641	ff 	. 
	rrca			;7642	0f 	. 
l7643h:
	rrca			;7643	0f 	. 
	rrca			;7644	0f 	. 
	rrca			;7645	0f 	. 
	rrca			;7646	0f 	. 
	rrca			;7647	0f 	. 
	rrca			;7648	0f 	. 
	rrca			;7649	0f 	. 
	rrca			;764a	0f 	. 
	rrca			;764b	0f 	. 
	rrca			;764c	0f 	. 
	rrca			;764d	0f 	. 
	rrca			;764e	0f 	. 
	rrca			;764f	0f 	. 
	rrca			;7650	0f 	. 
	rrca			;7651	0f 	. 
	ret z			;7652	c8 	. 
	inc h			;7653	24 	$ 
	inc d			;7654	14 	. 
	inc d			;7655	14 	. 
	inc d			;7656	14 	. 
	inc d			;7657	14 	. 
	inc d			;7658	14 	. 
	inc d			;7659	14 	. 
	nop			;765a	00 	. 
	nop			;765b	00 	. 
	nop			;765c	00 	. 
	nop			;765d	00 	. 
	nop			;765e	00 	. 
	nop			;765f	00 	. 
	ret po			;7660	e0 	. 
	djnz l7643h		;7661	10 e0 	. . 
	nop			;7663	00 	. 
	nop			;7664	00 	. 
	nop			;7665	00 	. 
	nop			;7666	00 	. 
	nop			;7667	00 	. 
	nop			;7668	00 	. 
	nop			;7669	00 	. 
	inc d			;766a	14 	. 
	inc d			;766b	14 	. 
	inc d			;766c	14 	. 
	inc d			;766d	14 	. 
	inc d			;766e	14 	. 
	inc h			;766f	24 	$ 
	ret z			;7670	c8 	. 
	djnz l7693h		;7671	10 20 	.   
	djnz l767dh		;7673	10 08 	. . 
	ex af,af'			;7675	08 	. 
	ex af,af'			;7676	08 	. 
	ex af,af'			;7677	08 	. 
	ex af,af'			;7678	08 	. 
	ex af,af'			;7679	08 	. 
	nop			;767a	00 	. 
	nop			;767b	00 	. 
	nop			;767c	00 	. 
l767dh:
	nop			;767d	00 	. 
	nop			;767e	00 	. 
	nop			;767f	00 	. 
	nop			;7680	00 	. 
	ret nz			;7681	c0 	. 
	nop			;7682	00 	. 
	nop			;7683	00 	. 
	nop			;7684	00 	. 
	nop			;7685	00 	. 
	nop			;7686	00 	. 
	nop			;7687	00 	. 
	nop			;7688	00 	. 
	nop			;7689	00 	. 
	ex af,af'			;768a	08 	. 
	ex af,af'			;768b	08 	. 
	ex af,af'			;768c	08 	. 
	ex af,af'			;768d	08 	. 
	ex af,af'			;768e	08 	. 
	djnz l76b1h		;768f	10 20 	.   
	ret nz			;7691	c0 	. 
	nop			;7692	00 	. 
l7693h:
	nop			;7693	00 	. 
	nop			;7694	00 	. 
	nop			;7695	00 	. 
	nop			;7696	00 	. 
	nop			;7697	00 	. 
	nop			;7698	00 	. 
	nop			;7699	00 	. 
	nop			;769a	00 	. 
	nop			;769b	00 	. 
	nop			;769c	00 	. 
	nop			;769d	00 	. 
	nop			;769e	00 	. 
	nop			;769f	00 	. 
	nop			;76a0	00 	. 
	rst 38h			;76a1	ff 	. 
	ex af,af'			;76a2	08 	. 
	ex af,af'			;76a3	08 	. 
	ex af,af'			;76a4	08 	. 
	ex af,af'			;76a5	08 	. 
	ex af,af'			;76a6	08 	. 
	ex af,af'			;76a7	08 	. 
	ex af,af'			;76a8	08 	. 
	ex af,af'			;76a9	08 	. 
	ex af,af'			;76aa	08 	. 
	ex af,af'			;76ab	08 	. 
	ex af,af'			;76ac	08 	. 
	ex af,af'			;76ad	08 	. 
	ex af,af'			;76ae	08 	. 
	ex af,af'			;76af	08 	. 
	ex af,af'			;76b0	08 	. 
l76b1h:
	ex af,af'			;76b1	08 	. 
	rst 30h			;76b2	f7 	. 
	inc d			;76b3	14 	. 
	inc d			;76b4	14 	. 
	inc d			;76b5	14 	. 
	inc d			;76b6	14 	. 
	inc d			;76b7	14 	. 
	inc d			;76b8	14 	. 
	inc d			;76b9	14 	. 
	nop			;76ba	00 	. 
	nop			;76bb	00 	. 
	nop			;76bc	00 	. 
	nop			;76bd	00 	. 
	nop			;76be	00 	. 
	nop			;76bf	00 	. 
	rst 38h			;76c0	ff 	. 
	nop			;76c1	00 	. 
	rst 30h			;76c2	f7 	. 
	inc d			;76c3	14 	. 
	inc d			;76c4	14 	. 
	inc d			;76c5	14 	. 
	inc d			;76c6	14 	. 
	inc d			;76c7	14 	. 
	inc d			;76c8	14 	. 
	inc d			;76c9	14 	. 
	inc d			;76ca	14 	. 
	inc d			;76cb	14 	. 
	inc d			;76cc	14 	. 
	inc d			;76cd	14 	. 
	inc d			;76ce	14 	. 
	inc d			;76cf	14 	. 
	rst 30h			;76d0	f7 	. 
	nop			;76d1	00 	. 
	rst 38h			;76d2	ff 	. 
	nop			;76d3	00 	. 
	nop			;76d4	00 	. 
	nop			;76d5	00 	. 
	nop			;76d6	00 	. 
	nop			;76d7	00 	. 
	nop			;76d8	00 	. 
	nop			;76d9	00 	. 
	inc d			;76da	14 	. 
	inc d			;76db	14 	. 
	inc d			;76dc	14 	. 
	inc d			;76dd	14 	. 
	inc d			;76de	14 	. 
	inc d			;76df	14 	. 
	rst 30h			;76e0	f7 	. 
	nop			;76e1	00 	. 
	ex af,af'			;76e2	08 	. 
	ex af,af'			;76e3	08 	. 
	ex af,af'			;76e4	08 	. 
	ex af,af'			;76e5	08 	. 
	ex af,af'			;76e6	08 	. 
	ex af,af'			;76e7	08 	. 
	ex af,af'			;76e8	08 	. 
	ex af,af'			;76e9	08 	. 
	nop			;76ea	00 	. 
	nop			;76eb	00 	. 
	nop			;76ec	00 	. 
	nop			;76ed	00 	. 
	nop			;76ee	00 	. 
	nop			;76ef	00 	. 
	nop			;76f0	00 	. 
	rst 38h			;76f1	ff 	. 
	ex af,af'			;76f2	08 	. 
	ex af,af'			;76f3	08 	. 
	ex af,af'			;76f4	08 	. 
	ex af,af'			;76f5	08 	. 
	ex af,af'			;76f6	08 	. 
	ex af,af'			;76f7	08 	. 
	ex af,af'			;76f8	08 	. 
	ex af,af'			;76f9	08 	. 
	ex af,af'			;76fa	08 	. 
	ex af,af'			;76fb	08 	. 
	ex af,af'			;76fc	08 	. 
	ex af,af'			;76fd	08 	. 
	ex af,af'			;76fe	08 	. 
	ex af,af'			;76ff	08 	. 
	ex af,af'			;7700	08 	. 
	rst 38h			;7701	ff 	. 
	nop			;7702	00 	. 
	nop			;7703	00 	. 
	nop			;7704	00 	. 
	nop			;7705	00 	. 
	nop			;7706	00 	. 
	nop			;7707	00 	. 
	nop			;7708	00 	. 
	nop			;7709	00 	. 
	ex af,af'			;770a	08 	. 
	ex af,af'			;770b	08 	. 
	ex af,af'			;770c	08 	. 
	ex af,af'			;770d	08 	. 
	ex af,af'			;770e	08 	. 
	ex af,af'			;770f	08 	. 
	ex af,af'			;7710	08 	. 
	rst 38h			;7711	ff 	. 
	rst 38h			;7712	ff 	. 
	rst 38h			;7713	ff 	. 
	rst 38h			;7714	ff 	. 
	rst 38h			;7715	ff 	. 
	rst 38h			;7716	ff 	. 
	rst 38h			;7717	ff 	. 
	rst 38h			;7718	ff 	. 
	rst 38h			;7719	ff 	. 
	rst 38h			;771a	ff 	. 
	rst 38h			;771b	ff 	. 
	rst 38h			;771c	ff 	. 
	rst 38h			;771d	ff 	. 
	rst 38h			;771e	ff 	. 
	rst 38h			;771f	ff 	. 
	rst 38h			;7720	ff 	. 
	rst 38h			;7721	ff 	. 
	xor d			;7722	aa 	. 
	ld d,l			;7723	55 	U 
	xor d			;7724	aa 	. 
	ld d,l			;7725	55 	U 
	xor d			;7726	aa 	. 
	ld d,l			;7727	55 	U 
	xor d			;7728	aa 	. 
	ld d,l			;7729	55 	U 
	xor d			;772a	aa 	. 
	ld d,l			;772b	55 	U 
	xor d			;772c	aa 	. 
	ld d,l			;772d	55 	U 
	xor d			;772e	aa 	. 
	ld d,l			;772f	55 	U 
	xor d			;7730	aa 	. 
	ld d,l			;7731	55 	U 
	rst 38h			;7732	ff 	. 
	rst 38h			;7733	ff 	. 
	rst 38h			;7734	ff 	. 
	rst 38h			;7735	ff 	. 
	rst 38h			;7736	ff 	. 
	rst 38h			;7737	ff 	. 
	rst 38h			;7738	ff 	. 
	rst 38h			;7739	ff 	. 
	nop			;773a	00 	. 
	nop			;773b	00 	. 
	nop			;773c	00 	. 
	nop			;773d	00 	. 
	nop			;773e	00 	. 
	nop			;773f	00 	. 
	nop			;7740	00 	. 
	nop			;7741	00 	. 
	ret p			;7742	f0 	. 
	ret p			;7743	f0 	. 
	ret p			;7744	f0 	. 
	ret p			;7745	f0 	. 
	ret p			;7746	f0 	. 
	ret p			;7747	f0 	. 
	ret p			;7748	f0 	. 
	ret p			;7749	f0 	. 
	ret p			;774a	f0 	. 
	ret p			;774b	f0 	. 
	ret p			;774c	f0 	. 
	ret p			;774d	f0 	. 
	ret p			;774e	f0 	. 
	ret p			;774f	f0 	. 
	ret p			;7750	f0 	. 
	ret p			;7751	f0 	. 
	inc de			;7752	13 	. 
	inc d			;7753	14 	. 
	inc d			;7754	14 	. 
	inc d			;7755	14 	. 
	inc d			;7756	14 	. 
	inc d			;7757	14 	. 
	inc d			;7758	14 	. 
	inc d			;7759	14 	. 
	nop			;775a	00 	. 
	nop			;775b	00 	. 
	nop			;775c	00 	. 
	nop			;775d	00 	. 
	nop			;775e	00 	. 
	nop			;775f	00 	. 
	rlca			;7760	07 	. 
	ex af,af'			;7761	08 	. 
	rlca			;7762	07 	. 
	nop			;7763	00 	. 
	nop			;7764	00 	. 
	nop			;7765	00 	. 
	nop			;7766	00 	. 
	nop			;7767	00 	. 
	nop			;7768	00 	. 
	nop			;7769	00 	. 
	inc d			;776a	14 	. 
	inc d			;776b	14 	. 
	inc d			;776c	14 	. 
	inc d			;776d	14 	. 
	inc d			;776e	14 	. 
	inc d			;776f	14 	. 
	inc de			;7770	13 	. 
	ex af,af'			;7771	08 	. 
	ld (bc),a			;7772	02 	. 
	inc b			;7773	04 	. 
	ex af,af'			;7774	08 	. 
	ex af,af'			;7775	08 	. 
	ex af,af'			;7776	08 	. 
l7777h:
	ex af,af'			;7777	08 	. 
	ex af,af'			;7778	08 	. 
	ex af,af'			;7779	08 	. 
	nop			;777a	00 	. 
	nop			;777b	00 	. 
	nop			;777c	00 	. 
	nop			;777d	00 	. 
	nop			;777e	00 	. 
	nop			;777f	00 	. 
	nop			;7780	00 	. 
	ld bc,00000h		;7781	01 00 00 	. . . 
	nop			;7784	00 	. 
	nop			;7785	00 	. 
	nop			;7786	00 	. 
	nop			;7787	00 	. 
	nop			;7788	00 	. 
	nop			;7789	00 	. 
	ex af,af'			;778a	08 	. 
	ex af,af'			;778b	08 	. 
	ex af,af'			;778c	08 	. 
	ex af,af'			;778d	08 	. 
	ex af,af'			;778e	08 	. 
	inc b			;778f	04 	. 
	ld (bc),a			;7790	02 	. 
	ld bc,000ffh		;7791	01 ff 00 	. . . 
	nop			;7794	00 	. 
	nop			;7795	00 	. 
	nop			;7796	00 	. 
	nop			;7797	00 	. 
	nop			;7798	00 	. 
	nop			;7799	00 	. 
	nop			;779a	00 	. 
	nop			;779b	00 	. 
	nop			;779c	00 	. 
	nop			;779d	00 	. 
	nop			;779e	00 	. 
	nop			;779f	00 	. 
	rst 38h			;77a0	ff 	. 
	nop			;77a1	00 	. 
	inc d			;77a2	14 	. 
	inc d			;77a3	14 	. 
	inc d			;77a4	14 	. 
	inc d			;77a5	14 	. 
	inc d			;77a6	14 	. 
	inc d			;77a7	14 	. 
	inc d			;77a8	14 	. 
	inc d			;77a9	14 	. 
	inc d			;77aa	14 	. 
	inc d			;77ab	14 	. 
	inc d			;77ac	14 	. 
	inc d			;77ad	14 	. 
	inc d			;77ae	14 	. 
	inc d			;77af	14 	. 
	inc d			;77b0	14 	. 
	inc d			;77b1	14 	. 
	rla			;77b2	17 	. 
	inc d			;77b3	14 	. 
	inc d			;77b4	14 	. 
	inc d			;77b5	14 	. 
	inc d			;77b6	14 	. 
	inc d			;77b7	14 	. 
	inc d			;77b8	14 	. 
	inc d			;77b9	14 	. 
	nop			;77ba	00 	. 
	nop			;77bb	00 	. 
	nop			;77bc	00 	. 
	nop			;77bd	00 	. 
	nop			;77be	00 	. 
	nop			;77bf	00 	. 
	rra			;77c0	1f 	. 
	djnz l77dah		;77c1	10 17 	. . 
	inc d			;77c3	14 	. 
	inc d			;77c4	14 	. 
	inc d			;77c5	14 	. 
	inc d			;77c6	14 	. 
	inc d			;77c7	14 	. 
	inc d			;77c8	14 	. 
	inc d			;77c9	14 	. 
	inc d			;77ca	14 	. 
	inc d			;77cb	14 	. 
	inc d			;77cc	14 	. 
	inc d			;77cd	14 	. 
	inc d			;77ce	14 	. 
	inc d			;77cf	14 	. 
	rla			;77d0	17 	. 
	djnz l77f2h		;77d1	10 1f 	. . 
	nop			;77d3	00 	. 
	nop			;77d4	00 	. 
	nop			;77d5	00 	. 
	nop			;77d6	00 	. 
	nop			;77d7	00 	. 
	nop			;77d8	00 	. 
	nop			;77d9	00 	. 
l77dah:
	inc d			;77da	14 	. 
	inc d			;77db	14 	. 
	inc d			;77dc	14 	. 
	inc d			;77dd	14 	. 
	inc d			;77de	14 	. 
	inc d			;77df	14 	. 
	rla			;77e0	17 	. 
	djnz l77ebh		;77e1	10 08 	. . 
	ex af,af'			;77e3	08 	. 
	ex af,af'			;77e4	08 	. 
	ex af,af'			;77e5	08 	. 
	ex af,af'			;77e6	08 	. 
	ex af,af'			;77e7	08 	. 
	ex af,af'			;77e8	08 	. 
	ex af,af'			;77e9	08 	. 
	nop			;77ea	00 	. 
l77ebh:
	nop			;77eb	00 	. 
	nop			;77ec	00 	. 
	nop			;77ed	00 	. 
	nop			;77ee	00 	. 
	nop			;77ef	00 	. 
	nop			;77f0	00 	. 
	rrca			;77f1	0f 	. 
l77f2h:
	ex af,af'			;77f2	08 	. 
	ex af,af'			;77f3	08 	. 
	ex af,af'			;77f4	08 	. 
	ex af,af'			;77f5	08 	. 
	ex af,af'			;77f6	08 	. 
	ex af,af'			;77f7	08 	. 
	ex af,af'			;77f8	08 	. 
	ex af,af'			;77f9	08 	. 
	ex af,af'			;77fa	08 	. 
	ex af,af'			;77fb	08 	. 
	ex af,af'			;77fc	08 	. 
	ex af,af'			;77fd	08 	. 
	ex af,af'			;77fe	08 	. 
	ex af,af'			;77ff	08 	. 
	ex af,af'			;7800	08 	. 
	rrca			;7801	0f 	. 
	nop			;7802	00 	. 
	nop			;7803	00 	. 
	nop			;7804	00 	. 
	nop			;7805	00 	. 
	nop			;7806	00 	. 
	nop			;7807	00 	. 
	nop			;7808	00 	. 
	nop			;7809	00 	. 
	ex af,af'			;780a	08 	. 
	ex af,af'			;780b	08 	. 
	ex af,af'			;780c	08 	. 
	ex af,af'			;780d	08 	. 
	ex af,af'			;780e	08 	. 
	ex af,af'			;780f	08 	. 
	ex af,af'			;7810	08 	. 
	rrca			;7811	0f 	. 
	ld d,e			;7812	53 	S 
	ld d,h			;7813	54 	T 
	ld b,c			;7814	41 	A 
	ld d,d			;7815	52 	R 
	ld d,h			;7816	54 	T 
	jr nz,l7868h		;7817	20 4f 	  O 
	ld b,(hl)			;7819	46 	F 
	jr nz,l785ch		;781a	20 40 	  @ 
	ld d,e			;781c	53 	S 
	ld d,h			;781d	54 	T 
	ld b,h			;781e	44 	D 
	ld b,d			;781f	42 	B 
	ld b,(hl)			;7820	46 	F 
l7821h:
	nop			;7821	00 	. 
	nop			;7822	00 	. 
	nop			;7823	00 	. 
	nop			;7824	00 	. 
	nop			;7825	00 	. 
	nop			;7826	00 	. 
	nop			;7827	00 	. 
	nop			;7828	00 	. 
	nop			;7829	00 	. 
	nop			;782a	00 	. 
	nop			;782b	00 	. 
	nop			;782c	00 	. 
	nop			;782d	00 	. 
	nop			;782e	00 	. 
	nop			;782f	00 	. 
	nop			;7830	00 	. 
	jr l7833h		;7831	18 00 	. . 
l7833h:
	nop			;7833	00 	. 
	jr l7836h		;7834	18 00 	. . 
l7836h:
	nop			;7836	00 	. 
	nop			;7837	00 	. 
	nop			;7838	00 	. 
	jr 26		;7839	18 18 	. . 
	jr l7855h		;783b	18 18 	. . 
	jr l7857h		;783d	18 18 	. . 
	jr l7859h		;783f	18 18 	. . 
	nop			;7841	00 	. 
	nop			;7842	00 	. 
	nop			;7843	00 	. 
	nop			;7844	00 	. 
	nop			;7845	00 	. 
	nop			;7846	00 	. 
	nop			;7847	00 	. 
	nop			;7848	00 	. 
	ld h,(hl)			;7849	66 	f 
	ld h,(hl)			;784a	66 	f 
	ld h,(hl)			;784b	66 	f 
	ld (00000h),hl		;784c	22 00 00 	" . . 
	nop			;784f	00 	. 
	nop			;7850	00 	. 
	ld a,a			;7851	7f 	 
	ld (hl),036h		;7852	36 36 	6 6 
	nop			;7854	00 	. 
l7855h:
	nop			;7855	00 	. 
	nop			;7856	00 	. 
l7857h:
	nop			;7857	00 	. 
	nop			;7858	00 	. 
l7859h:
	nop			;7859	00 	. 
	ld (hl),036h		;785a	36 36 	6 6 
l785ch:
	ld a,a			;785c	7f 	 
	ld a,a			;785d	7f 	 
	ld (hl),036h		;785e	36 36 	6 6 
	ld a,a			;7860	7f 	 
	ld l,h			;7861	6c 	l 
	ld l,l			;7862	6d 	m 
	ld a,a			;7863	7f 	 
	ld a,00ch		;7864	3e 0c 	> . 
	nop			;7866	00 	. 
	nop			;7867	00 	. 
l7868h:
	nop			;7868	00 	. 
	inc c			;7869	0c 	. 
	ld a,07fh		;786a	3e 7f 	>  
	ld c,l			;786c	4d 	M 
	dec c			;786d	0d 	. 
	ccf			;786e	3f 	? 
	ld a,06ch		;786f	3e 6c 	> l 
	ld l,h			;7871	6c 	l 
	or 0f6h		;7872	f6 f6 	. . 
	ld h,e			;7874	63 	c 
	nop			;7875	00 	. 
	nop			;7876	00 	. 
	nop			;7877	00 	. 
	nop			;7878	00 	. 
	ld h,(hl)			;7879	66 	f 
	ld l,a			;787a	6f 	o 
	ld l,a			;787b	6f 	o 
	ld (hl),030h		;787c	36 30 	6 0 
	jr l7898h		;787e	18 18 	. . 
	inc c			;7880	0c 	. 
	ld (hl),e			;7881	73 	s 
	ld h,e			;7882	63 	c 
	ld a,(hl)			;7883	7e 	~ 
	ld e,h			;7884	5c 	\ 
	nop			;7885	00 	. 
	nop			;7886	00 	. 
	nop			;7887	00 	. 
	nop			;7888	00 	. 
	inc e			;7889	1c 	. 
	ld (hl),036h		;788a	36 36 	6 6 
	inc e			;788c	1c 	. 
	inc c			;788d	0c 	. 
	ld e,01bh		;788e	1e 1b 	. . 
	ld e,e			;7890	5b 	[ 
	nop			;7891	00 	. 
	nop			;7892	00 	. 
	nop			;7893	00 	. 
	nop			;7894	00 	. 
	nop			;7895	00 	. 
	nop			;7896	00 	. 
	nop			;7897	00 	. 
l7898h:
	nop			;7898	00 	. 
	inc e			;7899	1c 	. 
	inc e			;789a	1c 	. 
	jr l78a9h		;789b	18 0c 	. . 
	ld b,000h		;789d	06 00 	. . 
	nop			;789f	00 	. 
	nop			;78a0	00 	. 
	jr 26		;78a1	18 18 	. . 
	jr nc,l7905h		;78a3	30 60 	0 ` 
	nop			;78a5	00 	. 
	nop			;78a6	00 	. 
	nop			;78a7	00 	. 
	nop			;78a8	00 	. 
l78a9h:
	ld h,b			;78a9	60 	` 
	jr nc,l78c4h		;78aa	30 18 	0 . 
	jr l78bah		;78ac	18 0c 	. . 
	inc c			;78ae	0c 	. 
	inc c			;78af	0c 	. 
	inc c			;78b0	0c 	. 
	inc c			;78b1	0c 	. 
	inc c			;78b2	0c 	. 
	ld b,003h		;78b3	06 03 	. . 
	nop			;78b5	00 	. 
	nop			;78b6	00 	. 
	nop			;78b7	00 	. 
	nop			;78b8	00 	. 
	inc bc			;78b9	03 	. 
l78bah:
	ld b,00ch		;78ba	06 0c 	. . 
	inc c			;78bc	0c 	. 
	jr l78d7h		;78bd	18 18 	. . 
	jr l78d9h		;78bf	18 18 	. . 
	jr l78c3h		;78c1	18 00 	. . 
l78c3h:
	nop			;78c3	00 	. 
l78c4h:
	nop			;78c4	00 	. 
	nop			;78c5	00 	. 
	nop			;78c6	00 	. 
	nop			;78c7	00 	. 
	nop			;78c8	00 	. 
	jr l7925h		;78c9	18 5a 	. Z 
	ld a,(hl)			;78cb	7e 	~ 
	inc a			;78cc	3c 	< 
	jr l790bh		;78cd	18 3c 	. < 
	ld a,(hl)			;78cf	7e 	~ 
	ld e,d			;78d0	5a 	Z 
	jr l78ebh		;78d1	18 18 	. . 
	nop			;78d3	00 	. 
	nop			;78d4	00 	. 
	nop			;78d5	00 	. 
	nop			;78d6	00 	. 
l78d7h:
	nop			;78d7	00 	. 
	nop			;78d8	00 	. 
l78d9h:
	nop			;78d9	00 	. 
	nop			;78da	00 	. 
	jr l78f5h		;78db	18 18 	. . 
	jr l795dh		;78dd	18 7e 	. ~ 
	ld a,(hl)			;78df	7e 	~ 
	jr l78feh		;78e0	18 1c 	. . 
	inc e			;78e2	1c 	. 
	jr l78f1h		;78e3	18 0c 	. . 
	ld b,000h		;78e5	06 00 	. . 
	nop			;78e7	00 	. 
	nop			;78e8	00 	. 
	nop			;78e9	00 	. 
	nop			;78ea	00 	. 
l78ebh:
	nop			;78eb	00 	. 
	nop			;78ec	00 	. 
	nop			;78ed	00 	. 
	nop			;78ee	00 	. 
	nop			;78ef	00 	. 
	nop			;78f0	00 	. 
l78f1h:
	nop			;78f1	00 	. 
	nop			;78f2	00 	. 
	nop			;78f3	00 	. 
	nop			;78f4	00 	. 
l78f5h:
	nop			;78f5	00 	. 
	nop			;78f6	00 	. 
	nop			;78f7	00 	. 
	nop			;78f8	00 	. 
	nop			;78f9	00 	. 
	nop			;78fa	00 	. 
	nop			;78fb	00 	. 
	nop			;78fc	00 	. 
	nop			;78fd	00 	. 
l78feh:
	ld a,03eh		;78fe	3e 3e 	> > 
	nop			;7900	00 	. 
l7901h:
	nop			;7901	00 	. 
	inc e			;7902	1c 	. 
	inc e			;7903	1c 	. 
	inc e			;7904	1c 	. 
l7905h:
	nop			;7905	00 	. 
	nop			;7906	00 	. 
	nop			;7907	00 	. 
	nop			;7908	00 	. 
	nop			;7909	00 	. 
	nop			;790a	00 	. 
l790bh:
	nop			;790b	00 	. 
	nop			;790c	00 	. 
	nop			;790d	00 	. 
	nop			;790e	00 	. 
	nop			;790f	00 	. 
	nop			;7910	00 	. 
	ld b,003h		;7911	06 03 	. . 
	inc bc			;7913	03 	. 
	inc bc			;7914	03 	. 
	inc bc			;7915	03 	. 
	nop			;7916	00 	. 
	nop			;7917	00 	. 
	nop			;7918	00 	. 
	ld h,b			;7919	60 	` 
	jr nc,l794ch		;791a	30 30 	0 0 
	jr l7936h		;791c	18 18 	. . 
	inc c			;791e	0c 	. 
	inc c			;791f	0c 	. 
	ld b,067h		;7920	06 67 	. g 
	ld h,a			;7922	67 	g 
	ld a,01ch		;7923	3e 1c 	> . 
l7925h:
	nop			;7925	00 	. 
	nop			;7926	00 	. 
	nop			;7927	00 	. 
	nop			;7928	00 	. 
	inc e			;7929	1c 	. 
	ld a,073h		;792a	3e 73 	> s 
	ld (hl),e			;792c	73 	s 
	ld a,e			;792d	7b 	{ 
	ld l,e			;792e	6b 	k 
	ld l,e			;792f	6b 	k 
	ld l,a			;7930	6f 	o 
	jr 26		;7931	18 18 	. . 
	inc a			;7933	3c 	< 
	inc a			;7934	3c 	< 
	nop			;7935	00 	. 
l7936h:
	nop			;7936	00 	. 
	nop			;7937	00 	. 
	nop			;7938	00 	. 
	jr l7957h		;7939	18 1c 	. . 
	ld e,018h		;793b	1e 18 	. . 
	jr l7957h		;793d	18 18 	. . 
	jr l7959h		;793f	18 18 	. . 
	ld b,003h		;7941	06 03 	. . 
	ld a,a			;7943	7f 	 
	ld a,a			;7944	7f 	 
	nop			;7945	00 	. 
	nop			;7946	00 	. 
	nop			;7947	00 	. 
	nop			;7948	00 	. 
	inc e			;7949	1c 	. 
	ld a,063h		;794a	3e 63 	> c 
l794ch:
	ld h,e			;794c	63 	c 
	ld h,b			;794d	60 	` 
	jr nc,l7968h		;794e	30 18 	0 . 
	inc c			;7950	0c 	. 
	ld h,b			;7951	60 	` 
	ld h,e			;7952	63 	c 
	ld a,01ch		;7953	3e 1c 	> . 
	nop			;7955	00 	. 
	nop			;7956	00 	. 
l7957h:
	nop			;7957	00 	. 
	nop			;7958	00 	. 
l7959h:
	inc e			;7959	1c 	. 
	ld a,063h		;795a	3e 63 	> c 
	ld h,b			;795c	60 	` 
l795dh:
	jr nc,l797bh		;795d	30 1c 	0 . 
	inc a			;795f	3c 	< 
	ld h,b			;7960	60 	` 
	ld a,a			;7961	7f 	 
	jr nc,50		;7962	30 30 	0 0 
	jr nc,l7966h		;7964	30 00 	0 . 
l7966h:
	nop			;7966	00 	. 
	nop			;7967	00 	. 
l7968h:
	nop			;7968	00 	. 
	jr nc,l79a3h		;7969	30 38 	0 8 
	jr c,l79a9h		;796b	38 3c 	8 < 
	inc (hl)			;796d	34 	4 
	ld (hl),036h		;796e	36 36 	6 6 
	ld a,a			;7970	7f 	 
	ld h,b			;7971	60 	` 
	ld h,e			;7972	63 	c 
	ccf			;7973	3f 	? 
	inc e			;7974	1c 	. 
	nop			;7975	00 	. 
	nop			;7976	00 	. 
	nop			;7977	00 	. 
	nop			;7978	00 	. 
	ld a,a			;7979	7f 	 
	ld a,a			;797a	7f 	 
l797bh:
	inc bc			;797b	03 	. 
	inc bc			;797c	03 	. 
	rra			;797d	1f 	. 
	ccf			;797e	3f 	? 
	ld h,b			;797f	60 	` 
	ld h,b			;7980	60 	` 
	ld h,e			;7981	63 	c 
	ld h,e			;7982	63 	c 
	ld a,01ch		;7983	3e 1c 	> . 
	nop			;7985	00 	. 
	nop			;7986	00 	. 
	nop			;7987	00 	. 
	nop			;7988	00 	. 
	jr nc,l79a3h		;7989	30 18 	0 . 
	inc c			;798b	0c 	. 
	ld b,006h		;798c	06 06 	. . 
	rra			;798e	1f 	. 
	ccf			;798f	3f 	? 
	ld h,e			;7990	63 	c 
	inc c			;7991	0c 	. 
	inc c			;7992	0c 	. 
	ld b,006h		;7993	06 06 	. . 
	nop			;7995	00 	. 
	nop			;7996	00 	. 
	nop			;7997	00 	. 
	nop			;7998	00 	. 
	ld a,a			;7999	7f 	 
	ld a,a			;799a	7f 	 
	ld h,e			;799b	63 	c 
	ld h,b			;799c	60 	` 
	jr nc,l79cfh		;799d	30 30 	0 0 
	jr l79b9h		;799f	18 18 	. . 
	ld h,e			;79a1	63 	c 
	ld h,e			;79a2	63 	c 
l79a3h:
	ld a,01ch		;79a3	3e 1c 	> . 
	nop			;79a5	00 	. 
	nop			;79a6	00 	. 
	nop			;79a7	00 	. 
	nop			;79a8	00 	. 
l79a9h:
	inc e			;79a9	1c 	. 
	ld a,063h		;79aa	3e 63 	> c 
	ld h,e			;79ac	63 	c 
	ld (l3e1ch),hl		;79ad	22 1c 3e 	" . > 
	ld h,e			;79b0	63 	c 
	jr nc,l79cbh		;79b1	30 18 	0 . 
	inc c			;79b3	0c 	. 
	ld b,000h		;79b4	06 00 	. . 
	nop			;79b6	00 	. 
	nop			;79b7	00 	. 
	nop			;79b8	00 	. 
l79b9h:
	inc e			;79b9	1c 	. 
	ld a,063h		;79ba	3e 63 	> c 
	ld h,e			;79bc	63 	c 
	ld h,e			;79bd	63 	c 
	ld a,(hl)			;79be	7e 	~ 
	ld a,h			;79bf	7c 	| 
	jr nc,l79c2h		;79c0	30 00 	0 . 
l79c2h:
	inc e			;79c2	1c 	. 
	inc e			;79c3	1c 	. 
	inc e			;79c4	1c 	. 
	nop			;79c5	00 	. 
	nop			;79c6	00 	. 
	nop			;79c7	00 	. 
	nop			;79c8	00 	. 
	nop			;79c9	00 	. 
	nop			;79ca	00 	. 
l79cbh:
	nop			;79cb	00 	. 
	inc e			;79cc	1c 	. 
	inc e			;79cd	1c 	. 
	inc e			;79ce	1c 	. 
l79cfh:
	nop			;79cf	00 	. 
	nop			;79d0	00 	. 
	nop			;79d1	00 	. 
	inc e			;79d2	1c 	. 
	inc e			;79d3	1c 	. 
	inc e			;79d4	1c 	. 
	ld b,006h		;79d5	06 06 	. . 
	nop			;79d7	00 	. 
	nop			;79d8	00 	. 
	nop			;79d9	00 	. 
	nop			;79da	00 	. 
	nop			;79db	00 	. 
	inc e			;79dc	1c 	. 
	inc e			;79dd	1c 	. 
	inc e			;79de	1c 	. 
	nop			;79df	00 	. 
	nop			;79e0	00 	. 
	inc c			;79e1	0c 	. 
	jr l7a14h		;79e2	18 30 	. 0 
	ld h,b			;79e4	60 	` 
	nop			;79e5	00 	. 
	nop			;79e6	00 	. 
	nop			;79e7	00 	. 
	nop			;79e8	00 	. 
	ld h,b			;79e9	60 	` 
	jr nc,26		;79ea	30 18 	0 . 
	inc c			;79ec	0c 	. 
	ld b,003h		;79ed	06 03 	. . 
	inc bc			;79ef	03 	. 
	ld b,07eh		;79f0	06 7e 	. ~ 
	nop			;79f2	00 	. 
	nop			;79f3	00 	. 
	nop			;79f4	00 	. 
	nop			;79f5	00 	. 
	nop			;79f6	00 	. 
	nop			;79f7	00 	. 
	nop			;79f8	00 	. 
	nop			;79f9	00 	. 
	nop			;79fa	00 	. 
	nop			;79fb	00 	. 
	ld a,(hl)			;79fc	7e 	~ 
	ld a,(hl)			;79fd	7e 	~ 
	nop			;79fe	00 	. 
	nop			;79ff	00 	. 
	ld a,(hl)			;7a00	7e 	~ 
	jr l7a0fh		;7a01	18 0c 	. . 
	ld b,003h		;7a03	06 03 	. . 
	nop			;7a05	00 	. 
	nop			;7a06	00 	. 
	nop			;7a07	00 	. 
	nop			;7a08	00 	. 
	inc bc			;7a09	03 	. 
	ld b,00ch		;7a0a	06 0c 	. . 
	jr l7a3eh		;7a0c	18 30 	. 0 
	ld h,b			;7a0e	60 	` 
l7a0fh:
	ld h,b			;7a0f	60 	` 
	jr nc,l7a12h		;7a10	30 00 	0 . 
l7a12h:
	nop			;7a12	00 	. 
	inc c			;7a13	0c 	. 
l7a14h:
	inc c			;7a14	0c 	. 
	nop			;7a15	00 	. 
	nop			;7a16	00 	. 
	nop			;7a17	00 	. 
	nop			;7a18	00 	. 
	inc e			;7a19	1c 	. 
	ld a,063h		;7a1a	3e 63 	> c 
	ld h,e			;7a1c	63 	c 
	jr nc,l7a37h		;7a1d	30 18 	0 . 
	inc c			;7a1f	0c 	. 
	inc c			;7a20	0c 	. 
	dec sp			;7a21	3b 	; 
	inc bc			;7a22	03 	. 
	ld a,(hl)			;7a23	7e 	~ 
	inc a			;7a24	3c 	< 
	nop			;7a25	00 	. 
	nop			;7a26	00 	. 
	nop			;7a27	00 	. 
	nop			;7a28	00 	. 
	inc e			;7a29	1c 	. 
	ld a,063h		;7a2a	3e 63 	> c 
	ld e,e			;7a2c	5b 	[ 
	ld a,e			;7a2d	7b 	{ 
	ld l,e			;7a2e	6b 	k 
	ld l,e			;7a2f	6b 	k 
	ld a,e			;7a30	7b 	{ 
	ld h,e			;7a31	63 	c 
	ld h,e			;7a32	63 	c 
	ld h,e			;7a33	63 	c 
	ld h,e			;7a34	63 	c 
	nop			;7a35	00 	. 
	nop			;7a36	00 	. 
l7a37h:
	nop			;7a37	00 	. 
	nop			;7a38	00 	. 
	inc e			;7a39	1c 	. 
	ld a,063h		;7a3a	3e 63 	> c 
	ld h,e			;7a3c	63 	c 
	ld h,e			;7a3d	63 	c 
l7a3eh:
	ld a,a			;7a3e	7f 	 
	ld a,a			;7a3f	7f 	 
	ld h,e			;7a40	63 	c 
	ld h,(hl)			;7a41	66 	f 
	ld h,(hl)			;7a42	66 	f 
	ld a,01fh		;7a43	3e 1f 	> . 
	nop			;7a45	00 	. 
	nop			;7a46	00 	. 
	nop			;7a47	00 	. 
	nop			;7a48	00 	. 
	rra			;7a49	1f 	. 
	ld a,066h		;7a4a	3e 66 	> f 
	ld h,(hl)			;7a4c	66 	f 
	ld h,01eh		;7a4d	26 1e 	& . 
	ld a,066h		;7a4f	3e 66 	> f 
	ld h,e			;7a51	63 	c 
	ld h,e			;7a52	63 	c 
	ld a,01ch		;7a53	3e 1c 	> . 
	nop			;7a55	00 	. 
	nop			;7a56	00 	. 
	nop			;7a57	00 	. 
	nop			;7a58	00 	. 
	inc e			;7a59	1c 	. 
	ld a,063h		;7a5a	3e 63 	> c 
	ld h,e			;7a5c	63 	c 
	inc bc			;7a5d	03 	. 
	inc bc			;7a5e	03 	. 
	inc bc			;7a5f	03 	. 
	inc bc			;7a60	03 	. 
	ld h,(hl)			;7a61	66 	f 
	ld h,(hl)			;7a62	66 	f 
	ld a,01fh		;7a63	3e 1f 	> . 
	nop			;7a65	00 	. 
	nop			;7a66	00 	. 
	nop			;7a67	00 	. 
	nop			;7a68	00 	. 
	rra			;7a69	1f 	. 
	ld a,066h		;7a6a	3e 66 	> f 
	ld h,(hl)			;7a6c	66 	f 
	ld h,(hl)			;7a6d	66 	f 
	ld h,(hl)			;7a6e	66 	f 
	ld h,(hl)			;7a6f	66 	f 
	ld h,(hl)			;7a70	66 	f 
	inc bc			;7a71	03 	. 
	inc bc			;7a72	03 	. 
	ld a,a			;7a73	7f 	 
	ld a,a			;7a74	7f 	 
	nop			;7a75	00 	. 
	nop			;7a76	00 	. 
	nop			;7a77	00 	. 
	nop			;7a78	00 	. 
	ld a,a			;7a79	7f 	 
	ld a,a			;7a7a	7f 	 
	inc bc			;7a7b	03 	. 
	inc bc			;7a7c	03 	. 
	inc bc			;7a7d	03 	. 
	ccf			;7a7e	3f 	? 
	ccf			;7a7f	3f 	? 
	inc bc			;7a80	03 	. 
	inc bc			;7a81	03 	. 
	inc bc			;7a82	03 	. 
	inc bc			;7a83	03 	. 
	inc bc			;7a84	03 	. 
	nop			;7a85	00 	. 
	nop			;7a86	00 	. 
	nop			;7a87	00 	. 
	nop			;7a88	00 	. 
	ld a,a			;7a89	7f 	 
	ld a,a			;7a8a	7f 	 
	inc bc			;7a8b	03 	. 
	inc bc			;7a8c	03 	. 
	inc bc			;7a8d	03 	. 
	ccf			;7a8e	3f 	? 
	ccf			;7a8f	3f 	? 
	inc bc			;7a90	03 	. 
	ld h,e			;7a91	63 	c 
	ld h,e			;7a92	63 	c 
	ld a,(hl)			;7a93	7e 	~ 
	ld e,h			;7a94	5c 	\ 
	nop			;7a95	00 	. 
	nop			;7a96	00 	. 
	nop			;7a97	00 	. 
	nop			;7a98	00 	. 
	inc e			;7a99	1c 	. 
	ld a,063h		;7a9a	3e 63 	> c 
	ld h,e			;7a9c	63 	c 
	inc bc			;7a9d	03 	. 
	inc bc			;7a9e	03 	. 
	ld a,e			;7a9f	7b 	{ 
	ld (hl),e			;7aa0	73 	s 
	ld h,e			;7aa1	63 	c 
	ld h,e			;7aa2	63 	c 
	ld h,e			;7aa3	63 	c 
	ld h,e			;7aa4	63 	c 
	nop			;7aa5	00 	. 
	nop			;7aa6	00 	. 
	nop			;7aa7	00 	. 
	nop			;7aa8	00 	. 
	ld h,e			;7aa9	63 	c 
	ld h,e			;7aaa	63 	c 
	ld h,e			;7aab	63 	c 
	ld h,e			;7aac	63 	c 
	ld h,e			;7aad	63 	c 
	ld a,a			;7aae	7f 	 
	ld a,a			;7aaf	7f 	 
	ld h,e			;7ab0	63 	c 
	jr l7acbh		;7ab1	18 18 	. . 
	inc a			;7ab3	3c 	< 
	inc a			;7ab4	3c 	< 
	nop			;7ab5	00 	. 
	nop			;7ab6	00 	. 
	nop			;7ab7	00 	. 
	nop			;7ab8	00 	. 
	inc a			;7ab9	3c 	< 
	inc a			;7aba	3c 	< 
	jr l7ad5h		;7abb	18 18 	. . 
	jr l7ad7h		;7abd	18 18 	. . 
	jr l7ad9h		;7abf	18 18 	. . 
	jr l7adeh		;7ac1	18 1b 	. . 
	rra			;7ac3	1f 	. 
	ld c,000h		;7ac4	0e 00 	. . 
	nop			;7ac6	00 	. 
	nop			;7ac7	00 	. 
	nop			;7ac8	00 	. 
	inc a			;7ac9	3c 	< 
	inc a			;7aca	3c 	< 
l7acbh:
	jr l7ae5h		;7acb	18 18 	. . 
	jr l7ae7h		;7acd	18 18 	. . 
	jr l7ae9h		;7acf	18 18 	. . 
	dec de			;7ad1	1b 	. 
	inc sp			;7ad2	33 	3 
	ld h,e			;7ad3	63 	c 
	ld h,e			;7ad4	63 	c 
l7ad5h:
	nop			;7ad5	00 	. 
	nop			;7ad6	00 	. 
l7ad7h:
	nop			;7ad7	00 	. 
	nop			;7ad8	00 	. 
l7ad9h:
	ld h,e			;7ad9	63 	c 
	ld h,e			;7ada	63 	c 
	inc sp			;7adb	33 	3 
	dec de			;7adc	1b 	. 
	rrca			;7add	0f 	. 
l7adeh:
	rlca			;7ade	07 	. 
	rlca			;7adf	07 	. 
	rrca			;7ae0	0f 	. 
	inc bc			;7ae1	03 	. 
	inc bc			;7ae2	03 	. 
	ld a,a			;7ae3	7f 	 
	ld a,a			;7ae4	7f 	 
l7ae5h:
	nop			;7ae5	00 	. 
	nop			;7ae6	00 	. 
l7ae7h:
	nop			;7ae7	00 	. 
	nop			;7ae8	00 	. 
l7ae9h:
	inc bc			;7ae9	03 	. 
	inc bc			;7aea	03 	. 
	inc bc			;7aeb	03 	. 
	inc bc			;7aec	03 	. 
	inc bc			;7aed	03 	. 
	inc bc			;7aee	03 	. 
	inc bc			;7aef	03 	. 
	inc bc			;7af0	03 	. 
	ld h,e			;7af1	63 	c 
	ld h,e			;7af2	63 	c 
	ld h,e			;7af3	63 	c 
	ld h,e			;7af4	63 	c 
	nop			;7af5	00 	. 
	nop			;7af6	00 	. 
	nop			;7af7	00 	. 
	nop			;7af8	00 	. 
	ld h,e			;7af9	63 	c 
	ld h,e			;7afa	63 	c 
	ld h,e			;7afb	63 	c 
	ld (hl),a			;7afc	77 	w 
	ld a,a			;7afd	7f 	 
	ld l,e			;7afe	6b 	k 
	ld l,e			;7aff	6b 	k 
	ld h,e			;7b00	63 	c 
	ld (hl),e			;7b01	73 	s 
	ld h,e			;7b02	63 	c 
	ld h,e			;7b03	63 	c 
	ld h,e			;7b04	63 	c 
	nop			;7b05	00 	. 
	nop			;7b06	00 	. 
	nop			;7b07	00 	. 
	nop			;7b08	00 	. 
	ld h,e			;7b09	63 	c 
	ld h,e			;7b0a	63 	c 
	ld h,e			;7b0b	63 	c 
	ld l,a			;7b0c	6f 	o 
	ld l,a			;7b0d	6f 	o 
	ld a,e			;7b0e	7b 	{ 
	ld a,e			;7b0f	7b 	{ 
	ld (hl),e			;7b10	73 	s 
	ld h,e			;7b11	63 	c 
	ld h,e			;7b12	63 	c 
	ld a,01ch		;7b13	3e 1c 	> . 
	nop			;7b15	00 	. 
	nop			;7b16	00 	. 
	nop			;7b17	00 	. 
	nop			;7b18	00 	. 
	inc e			;7b19	1c 	. 
	ld a,063h		;7b1a	3e 63 	> c 
	ld h,e			;7b1c	63 	c 
	ld h,e			;7b1d	63 	c 
	ld h,e			;7b1e	63 	c 
	ld h,e			;7b1f	63 	c 
	ld h,e			;7b20	63 	c 
	inc bc			;7b21	03 	. 
	inc bc			;7b22	03 	. 
	inc bc			;7b23	03 	. 
	inc bc			;7b24	03 	. 
	nop			;7b25	00 	. 
	nop			;7b26	00 	. 
	nop			;7b27	00 	. 
	nop			;7b28	00 	. 
	rra			;7b29	1f 	. 
	ccf			;7b2a	3f 	? 
	ld h,e			;7b2b	63 	c 
	ld h,e			;7b2c	63 	c 
	ld h,e			;7b2d	63 	c 
	ccf			;7b2e	3f 	? 
	rra			;7b2f	1f 	. 
	inc bc			;7b30	03 	. 
	ld a,a			;7b31	7f 	 
	ld h,a			;7b32	67 	g 
	ld a,05ch		;7b33	3e 5c 	> \ 
	nop			;7b35	00 	. 
	nop			;7b36	00 	. 
	nop			;7b37	00 	. 
	nop			;7b38	00 	. 
	inc e			;7b39	1c 	. 
	ld a,063h		;7b3a	3e 63 	> c 
	ld h,e			;7b3c	63 	c 
	ld h,e			;7b3d	63 	c 
	ld h,e			;7b3e	63 	c 
	ld h,e			;7b3f	63 	c 
	ld a,e			;7b40	7b 	{ 
	inc sp			;7b41	33 	3 
	inc sp			;7b42	33 	3 
	ld h,e			;7b43	63 	c 
	ld h,e			;7b44	63 	c 
	nop			;7b45	00 	. 
	nop			;7b46	00 	. 
	nop			;7b47	00 	. 
	nop			;7b48	00 	. 
	rra			;7b49	1f 	. 
	ccf			;7b4a	3f 	? 
	ld h,e			;7b4b	63 	c 
	ld h,e			;7b4c	63 	c 
	ld h,e			;7b4d	63 	c 
	ccf			;7b4e	3f 	? 
	rra			;7b4f	1f 	. 
	inc sp			;7b50	33 	3 
	ld h,e			;7b51	63 	c 
	ld h,e			;7b52	63 	c 
	ld a,01ch		;7b53	3e 1c 	> . 
	nop			;7b55	00 	. 
	nop			;7b56	00 	. 
	nop			;7b57	00 	. 
	nop			;7b58	00 	. 
	inc e			;7b59	1c 	. 
	ld a,063h		;7b5a	3e 63 	> c 
	ld h,e			;7b5c	63 	c 
	inc bc			;7b5d	03 	. 
	ld c,03ch		;7b5e	0e 3c 	. < 
	ld (hl),b			;7b60	70 	p 
	jr l7b7bh		;7b61	18 18 	. . 
	jr l7b7dh		;7b63	18 18 	. . 
	nop			;7b65	00 	. 
	nop			;7b66	00 	. 
	nop			;7b67	00 	. 
	nop			;7b68	00 	. 
	ld a,a			;7b69	7f 	 
	ld a,a			;7b6a	7f 	 
	jr l7b85h		;7b6b	18 18 	. . 
	jr l7b87h		;7b6d	18 18 	. . 
	jr l7b89h		;7b6f	18 18 	. . 
	ld h,e			;7b71	63 	c 
	ld h,e			;7b72	63 	c 
	ld a,01ch		;7b73	3e 1c 	> . 
	nop			;7b75	00 	. 
	nop			;7b76	00 	. 
	nop			;7b77	00 	. 
	nop			;7b78	00 	. 
	ld h,e			;7b79	63 	c 
	ld h,e			;7b7a	63 	c 
l7b7bh:
	ld h,e			;7b7b	63 	c 
	ld h,e			;7b7c	63 	c 
l7b7dh:
	ld h,e			;7b7d	63 	c 
	ld h,e			;7b7e	63 	c 
	ld h,e			;7b7f	63 	c 
	ld h,e			;7b80	63 	c 
	inc e			;7b81	1c 	. 
	inc e			;7b82	1c 	. 
	ex af,af'			;7b83	08 	. 
	ex af,af'			;7b84	08 	. 
l7b85h:
	nop			;7b85	00 	. 
	nop			;7b86	00 	. 
l7b87h:
	nop			;7b87	00 	. 
	nop			;7b88	00 	. 
l7b89h:
	ld h,e			;7b89	63 	c 
	ld h,e			;7b8a	63 	c 
	ld h,e			;7b8b	63 	c 
	ld h,e			;7b8c	63 	c 
	ld h,e			;7b8d	63 	c 
	ld (hl),036h		;7b8e	36 36 	6 6 
	ld (hl),07fh		;7b90	36 7f 	6  
	ld a,a			;7b92	7f 	 
	ld (hl),036h		;7b93	36 36 	6 6 
	nop			;7b95	00 	. 
	nop			;7b96	00 	. 
	nop			;7b97	00 	. 
	nop			;7b98	00 	. 
	ld h,e			;7b99	63 	c 
	ld h,e			;7b9a	63 	c 
	ld h,e			;7b9b	63 	c 
	ld h,e			;7b9c	63 	c 
	ld h,e			;7b9d	63 	c 
	ld l,e			;7b9e	6b 	k 
	ld l,e			;7b9f	6b 	k 
	ld l,e			;7ba0	6b 	k 
	ld (hl),036h		;7ba1	36 36 	6 6 
	ld h,e			;7ba3	63 	c 
	ld h,e			;7ba4	63 	c 
	nop			;7ba5	00 	. 
	nop			;7ba6	00 	. 
	nop			;7ba7	00 	. 
	nop			;7ba8	00 	. 
	ld h,e			;7ba9	63 	c 
	ld h,e			;7baa	63 	c 
	ld (hl),036h		;7bab	36 36 	6 6 
	inc e			;7bad	1c 	. 
	inc e			;7bae	1c 	. 
	inc e			;7baf	1c 	. 
	inc e			;7bb0	1c 	. 
	inc e			;7bb1	1c 	. 
	inc e			;7bb2	1c 	. 
	inc e			;7bb3	1c 	. 
	inc e			;7bb4	1c 	. 
	nop			;7bb5	00 	. 
	nop			;7bb6	00 	. 
	nop			;7bb7	00 	. 
	nop			;7bb8	00 	. 
	ld h,e			;7bb9	63 	c 
	ld h,e			;7bba	63 	c 
	ld h,e			;7bbb	63 	c 
	ld (hl),036h		;7bbc	36 36 	6 6 
	inc e			;7bbe	1c 	. 
	inc e			;7bbf	1c 	. 
	inc e			;7bc0	1c 	. 
	ld b,006h		;7bc1	06 06 	. . 
	ld a,a			;7bc3	7f 	 
	ld a,a			;7bc4	7f 	 
	nop			;7bc5	00 	. 
	nop			;7bc6	00 	. 
	nop			;7bc7	00 	. 
	nop			;7bc8	00 	. 
	ld a,a			;7bc9	7f 	 
	ld a,a			;7bca	7f 	 
	jr nc,l7bfdh		;7bcb	30 30 	0 0 
	jr l7be7h		;7bcd	18 18 	. . 
	inc c			;7bcf	0c 	. 
	inc c			;7bd0	0c 	. 
	jr l7bebh		;7bd1	18 18 	. . 
	jr l7c4dh		;7bd3	18 78 	. x 
	ld a,b			;7bd5	78 	x 
	nop			;7bd6	00 	. 
	nop			;7bd7	00 	. 
	nop			;7bd8	00 	. 
	ld a,b			;7bd9	78 	x 
	ld a,b			;7bda	78 	x 
	jr l7bf5h		;7bdb	18 18 	. . 
	jr l7bf7h		;7bdd	18 18 	. . 
	jr l7bf9h		;7bdf	18 18 	. . 
	jr nc,l7c13h		;7be1	30 30 	0 0 
	ld h,b			;7be3	60 	` 
	ld h,b			;7be4	60 	` 
	nop			;7be5	00 	. 
	nop			;7be6	00 	. 
l7be7h:
	nop			;7be7	00 	. 
	nop			;7be8	00 	. 
	inc bc			;7be9	03 	. 
	inc bc			;7bea	03 	. 
l7bebh:
	ld b,006h		;7beb	06 06 	. . 
	inc c			;7bed	0c 	. 
	inc c			;7bee	0c 	. 
	jr l7c09h		;7bef	18 18 	. . 
	inc c			;7bf1	0c 	. 
	inc c			;7bf2	0c 	. 
	inc c			;7bf3	0c 	. 
	rrca			;7bf4	0f 	. 
l7bf5h:
	rrca			;7bf5	0f 	. 
	nop			;7bf6	00 	. 
l7bf7h:
	nop			;7bf7	00 	. 
	nop			;7bf8	00 	. 
l7bf9h:
	rrca			;7bf9	0f 	. 
	rrca			;7bfa	0f 	. 
	inc c			;7bfb	0c 	. 
	inc c			;7bfc	0c 	. 
l7bfdh:
	inc c			;7bfd	0c 	. 
	inc c			;7bfe	0c 	. 
	inc c			;7bff	0c 	. 
	inc c			;7c00	0c 	. 
	nop			;7c01	00 	. 
	nop			;7c02	00 	. 
	nop			;7c03	00 	. 
	nop			;7c04	00 	. 
	nop			;7c05	00 	. 
	nop			;7c06	00 	. 
	nop			;7c07	00 	. 
	nop			;7c08	00 	. 
l7c09h:
	ex af,af'			;7c09	08 	. 
	inc e			;7c0a	1c 	. 
	ld (hl),063h		;7c0b	36 63 	6 c 
	ld b,c			;7c0d	41 	A 
	nop			;7c0e	00 	. 
	nop			;7c0f	00 	. 
	nop			;7c10	00 	. 
	nop			;7c11	00 	. 
	nop			;7c12	00 	. 
l7c13h:
	nop			;7c13	00 	. 
	nop			;7c14	00 	. 
	nop			;7c15	00 	. 
	rst 38h			;7c16	ff 	. 
	rst 38h			;7c17	ff 	. 
	nop			;7c18	00 	. 
	nop			;7c19	00 	. 
	nop			;7c1a	00 	. 
	nop			;7c1b	00 	. 
	nop			;7c1c	00 	. 
	nop			;7c1d	00 	. 
	nop			;7c1e	00 	. 
	nop			;7c1f	00 	. 
	nop			;7c20	00 	. 
	nop			;7c21	00 	. 
	nop			;7c22	00 	. 
	nop			;7c23	00 	. 
	nop			;7c24	00 	. 
	nop			;7c25	00 	. 
	nop			;7c26	00 	. 
	nop			;7c27	00 	. 
	nop			;7c28	00 	. 
	jr c,l7c63h		;7c29	38 38 	8 8 
	jr l7c5dh		;7c2b	18 30 	. 0 
	ld h,b			;7c2d	60 	` 
	nop			;7c2e	00 	. 
	nop			;7c2f	00 	. 
	nop			;7c30	00 	. 
	inc sp			;7c31	33 	3 
	inc sp			;7c32	33 	3 
	ccf			;7c33	3f 	? 
	ld e,(hl)			;7c34	5e 	^ 
	nop			;7c35	00 	. 
	nop			;7c36	00 	. 
	nop			;7c37	00 	. 
	nop			;7c38	00 	. 
	nop			;7c39	00 	. 
	nop			;7c3a	00 	. 
	nop			;7c3b	00 	. 
	ld e,03eh		;7c3c	1e 3e 	. > 
	jr nc,64		;7c3e	30 3e 	0 > 
	ccf			;7c40	3f 	? 
	ld h,(hl)			;7c41	66 	f 
	ld h,(hl)			;7c42	66 	f 
	ld a,01ah		;7c43	3e 1a 	> . 
	nop			;7c45	00 	. 
	nop			;7c46	00 	. 
	nop			;7c47	00 	. 
	nop			;7c48	00 	. 
	ld b,006h		;7c49	06 06 	. . 
	ld b,01eh		;7c4b	06 1e 	. . 
l7c4dh:
	ld a,066h		;7c4d	3e 66 	> f 
	ld h,(hl)			;7c4f	66 	f 
	ld h,(hl)			;7c50	66 	f 
	inc bc			;7c51	03 	. 
	ld h,e			;7c52	63 	c 
	ld a,01ch		;7c53	3e 1c 	> . 
	nop			;7c55	00 	. 
	nop			;7c56	00 	. 
	nop			;7c57	00 	. 
	nop			;7c58	00 	. 
	nop			;7c59	00 	. 
	nop			;7c5a	00 	. 
	nop			;7c5b	00 	. 
	inc e			;7c5c	1c 	. 
l7c5dh:
	ld a,063h		;7c5d	3e 63 	> c 
	inc bc			;7c5f	03 	. 
	inc bc			;7c60	03 	. 
	ld h,(hl)			;7c61	66 	f 
	ld h,(hl)			;7c62	66 	f 
l7c63h:
	ld a,h			;7c63	7c 	| 
	ld e,b			;7c64	58 	X 
	nop			;7c65	00 	. 
	nop			;7c66	00 	. 
	nop			;7c67	00 	. 
	nop			;7c68	00 	. 
	ld h,b			;7c69	60 	` 
	ld h,b			;7c6a	60 	` 
	ld h,b			;7c6b	60 	` 
	ld a,b			;7c6c	78 	x 
	ld a,h			;7c6d	7c 	| 
	ld h,(hl)			;7c6e	66 	f 
	ld h,(hl)			;7c6f	66 	f 
	ld h,(hl)			;7c70	66 	f 
	inc bc			;7c71	03 	. 
	ld h,e			;7c72	63 	c 
	ld a,01ch		;7c73	3e 1c 	> . 
	nop			;7c75	00 	. 
	nop			;7c76	00 	. 
	nop			;7c77	00 	. 
	nop			;7c78	00 	. 
	nop			;7c79	00 	. 
	nop			;7c7a	00 	. 
	nop			;7c7b	00 	. 
	inc e			;7c7c	1c 	. 
	ld a,063h		;7c7d	3e 63 	> c 
	ld h,e			;7c7f	63 	c 
	ld a,a			;7c80	7f 	 
	jr l7c9bh		;7c81	18 18 	. . 
	jr l7c9dh		;7c83	18 18 	. . 
	nop			;7c85	00 	. 
	nop			;7c86	00 	. 
	nop			;7c87	00 	. 
	nop			;7c88	00 	. 
	jr nc,l7d03h		;7c89	30 78 	0 x 
	jr l7ca5h		;7c8b	18 18 	. . 
	inc a			;7c8d	3c 	< 
	inc a			;7c8e	3c 	< 
	jr l7ca9h		;7c8f	18 18 	. . 
	ld b,03eh		;7c91	06 3e 	. > 
	ld a,a			;7c93	7f 	 
	ld h,e			;7c94	63 	c 
	ld a,a			;7c95	7f 	 
	ld a,000h		;7c96	3e 00 	> . 
	nop			;7c98	00 	. 
	nop			;7c99	00 	. 
	nop			;7c9a	00 	. 
l7c9bh:
	ld b,b			;7c9b	40 	@ 
	ld e,h			;7c9c	5c 	\ 
l7c9dh:
	ld a,022h		;7c9d	3e 22 	> " 
	ld a,01ch		;7c9f	3e 1c 	> . 
	inc sp			;7ca1	33 	3 
	inc sp			;7ca2	33 	3 
	inc sp			;7ca3	33 	3 
	inc sp			;7ca4	33 	3 
l7ca5h:
	nop			;7ca5	00 	. 
	nop			;7ca6	00 	. 
	nop			;7ca7	00 	. 
	nop			;7ca8	00 	. 
l7ca9h:
	inc bc			;7ca9	03 	. 
	inc bc			;7caa	03 	. 
	inc bc			;7cab	03 	. 
	rra			;7cac	1f 	. 
	ccf			;7cad	3f 	? 
	inc sp			;7cae	33 	3 
	inc sp			;7caf	33 	3 
	inc sp			;7cb0	33 	3 
	jr l7ccbh		;7cb1	18 18 	. . 
	jr 26		;7cb3	18 18 	. . 
	nop			;7cb5	00 	. 
	nop			;7cb6	00 	. 
	nop			;7cb7	00 	. 
	nop			;7cb8	00 	. 
	jr 26		;7cb9	18 18 	. . 
	nop			;7cbb	00 	. 
	jr l7cd6h		;7cbc	18 18 	. . 
	jr l7cd8h		;7cbe	18 18 	. . 
	jr l7cf2h		;7cc0	18 30 	. 0 
	jr nc,l7cfah		;7cc2	30 36 	0 6 
	ld a,01ch		;7cc4	3e 1c 	> . 
	nop			;7cc6	00 	. 
	nop			;7cc7	00 	. 
	nop			;7cc8	00 	. 
	jr nc,l7ccbh		;7cc9	30 00 	0 . 
l7ccbh:
	nop			;7ccb	00 	. 
sub_7ccch:
	jr nc,l7cfeh		;7ccc	30 30 	0 0 
	jr nc,l7d00h		;7cce	30 30 	0 0 
	jr nc,32		;7cd0	30 1e 	0 . 
	ld (hl),066h		;7cd2	36 66 	6 f 
	ld b,(hl)			;7cd4	46 	F 
	nop			;7cd5	00 	. 
l7cd6h:
	nop			;7cd6	00 	. 
	nop			;7cd7	00 	. 
l7cd8h:
	nop			;7cd8	00 	. 
	ld b,006h		;7cd9	06 06 	. . 
	ld b,(hl)			;7cdb	46 	F 
	ld h,(hl)			;7cdc	66 	f 
	ld (hl),01eh		;7cdd	36 1e 	6 . 
	ld c,00eh		;7cdf	0e 0e 	. . 
	jr l7cfbh		;7ce1	18 18 	. . 
	inc a			;7ce3	3c 	< 
	inc a			;7ce4	3c 	< 
	nop			;7ce5	00 	. 
	nop			;7ce6	00 	. 
	nop			;7ce7	00 	. 
	nop			;7ce8	00 	. 
	inc e			;7ce9	1c 	. 
	inc e			;7cea	1c 	. 
	jr l7d05h		;7ceb	18 18 	. . 
	jr l7d07h		;7ced	18 18 	. . 
	jr l7d09h		;7cef	18 18 	. . 
	ld l,e			;7cf1	6b 	k 
l7cf2h:
	ld l,e			;7cf2	6b 	k 
	ld l,e			;7cf3	6b 	k 
	ld l,e			;7cf4	6b 	k 
	nop			;7cf5	00 	. 
	nop			;7cf6	00 	. 
	nop			;7cf7	00 	. 
	nop			;7cf8	00 	. 
	nop			;7cf9	00 	. 
l7cfah:
	nop			;7cfa	00 	. 
l7cfbh:
	nop			;7cfb	00 	. 
	ld (hl),07fh		;7cfc	36 7f 	6  
l7cfeh:
	ld l,e			;7cfe	6b 	k 
	ld l,e			;7cff	6b 	k 
l7d00h:
	ld l,e			;7d00	6b 	k 
	ld h,(hl)			;7d01	66 	f 
	ld h,(hl)			;7d02	66 	f 
l7d03h:
	ld h,(hl)			;7d03	66 	f 
	ld h,(hl)			;7d04	66 	f 
l7d05h:
	nop			;7d05	00 	. 
	nop			;7d06	00 	. 
l7d07h:
	nop			;7d07	00 	. 
	nop			;7d08	00 	. 
l7d09h:
	nop			;7d09	00 	. 
	nop			;7d0a	00 	. 
	nop			;7d0b	00 	. 
	ld a,(l667eh)		;7d0c	3a 7e 66 	: ~ f 
	ld h,(hl)			;7d0f	66 	f 
	ld h,(hl)			;7d10	66 	f 
	ld h,e			;7d11	63 	c 
	ld h,e			;7d12	63 	c 
	ld a,01ch		;7d13	3e 1c 	> . 
	nop			;7d15	00 	. 
	nop			;7d16	00 	. 
	nop			;7d17	00 	. 
	nop			;7d18	00 	. 
	nop			;7d19	00 	. 
	nop			;7d1a	00 	. 
	nop			;7d1b	00 	. 
	inc e			;7d1c	1c 	. 
	ld a,063h		;7d1d	3e 63 	> c 
	ld h,e			;7d1f	63 	c 
	ld h,e			;7d20	63 	c 
	ld h,e			;7d21	63 	c 
	ld h,e			;7d22	63 	c 
	ccf			;7d23	3f 	? 
	rra			;7d24	1f 	. 
	inc bc			;7d25	03 	. 
	inc bc			;7d26	03 	. 
	inc bc			;7d27	03 	. 
	nop			;7d28	00 	. 
	nop			;7d29	00 	. 
	nop			;7d2a	00 	. 
	nop			;7d2b	00 	. 
	dec e			;7d2c	1d 	. 
	ccf			;7d2d	3f 	? 
	ld h,e			;7d2e	63 	c 
	ld h,e			;7d2f	63 	c 
	ld h,e			;7d30	63 	c 
	ld h,e			;7d31	63 	c 
	ld h,e			;7d32	63 	c 
	ld a,(hl)			;7d33	7e 	~ 
	ld a,h			;7d34	7c 	| 
	ld h,b			;7d35	60 	` 
	ld h,b			;7d36	60 	` 
	ld h,b			;7d37	60 	` 
	nop			;7d38	00 	. 
	nop			;7d39	00 	. 
	nop			;7d3a	00 	. 
	nop			;7d3b	00 	. 
	ld e,h			;7d3c	5c 	\ 
	ld a,(hl)			;7d3d	7e 	~ 
	ld h,e			;7d3e	63 	c 
	ld h,e			;7d3f	63 	c 
	ld h,e			;7d40	63 	c 
	ld b,006h		;7d41	06 06 	. . 
	ld b,006h		;7d43	06 06 	. . 
	nop			;7d45	00 	. 
	nop			;7d46	00 	. 
	nop			;7d47	00 	. 
	nop			;7d48	00 	. 
	nop			;7d49	00 	. 
	nop			;7d4a	00 	. 
	nop			;7d4b	00 	. 
	ld (hl),07eh		;7d4c	36 7e 	6 ~ 
	ld c,006h		;7d4e	0e 06 	. . 
	ld b,060h		;7d50	06 60 	. ` 
	ld h,b			;7d52	60 	` 
	ld a,(hl)			;7d53	7e 	~ 
	inc a			;7d54	3c 	< 
	nop			;7d55	00 	. 
	nop			;7d56	00 	. 
	nop			;7d57	00 	. 
	nop			;7d58	00 	. 
	nop			;7d59	00 	. 
	nop			;7d5a	00 	. 
	nop			;7d5b	00 	. 
	inc a			;7d5c	3c 	< 
	ld a,(hl)			;7d5d	7e 	~ 
	ld b,01ch		;7d5e	06 1c 	. . 
	jr c,l7d6eh		;7d60	38 0c 	8 . 
	inc l			;7d62	2c 	, 
	inc a			;7d63	3c 	< 
	jr l7d66h		;7d64	18 00 	. . 
l7d66h:
	nop			;7d66	00 	. 
	nop			;7d67	00 	. 
	nop			;7d68	00 	. 
	inc c			;7d69	0c 	. 
	inc c			;7d6a	0c 	. 
	inc c			;7d6b	0c 	. 
	ld e,01eh		;7d6c	1e 1e 	. . 
l7d6eh:
	inc c			;7d6e	0c 	. 
	inc c			;7d6f	0c 	. 
	inc c			;7d70	0c 	. 
	ld h,(hl)			;7d71	66 	f 
	ld h,(hl)			;7d72	66 	f 
	ld a,(hl)			;7d73	7e 	~ 
	cp h			;7d74	bc 	. 
	nop			;7d75	00 	. 
	nop			;7d76	00 	. 
	nop			;7d77	00 	. 
	nop			;7d78	00 	. 
	nop			;7d79	00 	. 
	nop			;7d7a	00 	. 
	nop			;7d7b	00 	. 
	ld h,(hl)			;7d7c	66 	f 
	ld h,(hl)			;7d7d	66 	f 
	ld h,(hl)			;7d7e	66 	f 
	ld h,(hl)			;7d7f	66 	f 
	ld h,(hl)			;7d80	66 	f 
	inc e			;7d81	1c 	. 
	inc e			;7d82	1c 	. 
	ex af,af'			;7d83	08 	. 
	ex af,af'			;7d84	08 	. 
	nop			;7d85	00 	. 
	nop			;7d86	00 	. 
	nop			;7d87	00 	. 
	nop			;7d88	00 	. 
	nop			;7d89	00 	. 
	nop			;7d8a	00 	. 
	nop			;7d8b	00 	. 
	ld h,e			;7d8c	63 	c 
	ld h,e			;7d8d	63 	c 
	ld h,e			;7d8e	63 	c 
	ld (hl),036h		;7d8f	36 36 	6 6 
	ld (hl),a			;7d91	77 	w 
	ld (hl),036h		;7d92	36 36 	6 6 
	ld (hl),000h		;7d94	36 00 	6 . 
	nop			;7d96	00 	. 
	nop			;7d97	00 	. 
	nop			;7d98	00 	. 
	nop			;7d99	00 	. 
	nop			;7d9a	00 	. 
	nop			;7d9b	00 	. 
	ld h,e			;7d9c	63 	c 
	ld h,e			;7d9d	63 	c 
	ld l,e			;7d9e	6b 	k 
	ld l,e			;7d9f	6b 	k 
	ld a,a			;7da0	7f 	 
	inc a			;7da1	3c 	< 
	inc a			;7da2	3c 	< 
	ld h,(hl)			;7da3	66 	f 
	ld h,(hl)			;7da4	66 	f 
	nop			;7da5	00 	. 
	nop			;7da6	00 	. 
	nop			;7da7	00 	. 
	nop			;7da8	00 	. 
	nop			;7da9	00 	. 
	nop			;7daa	00 	. 
	nop			;7dab	00 	. 
	ld h,(hl)			;7dac	66 	f 
	ld h,(hl)			;7dad	66 	f 
	ld a,(hl)			;7dae	7e 	~ 
	inc a			;7daf	3c 	< 
	jr 62		;7db0	18 3c 	. < 
	jr l7dcch		;7db2	18 18 	. . 
	jr 14		;7db4	18 0c 	. . 
	inc c			;7db6	0c 	. 
	ld b,000h		;7db7	06 00 	. . 
	nop			;7db9	00 	. 
	nop			;7dba	00 	. 
	nop			;7dbb	00 	. 
	ld h,e			;7dbc	63 	c 
	ld h,e			;7dbd	63 	c 
	halt			;7dbe	76 	v 
	ld (hl),03ch		;7dbf	36 3c 	6 < 
	ld b,003h		;7dc1	06 03 	. . 
	ccf			;7dc3	3f 	? 
	ccf			;7dc4	3f 	? 
	nop			;7dc5	00 	. 
	nop			;7dc6	00 	. 
	nop			;7dc7	00 	. 
	nop			;7dc8	00 	. 
	nop			;7dc9	00 	. 
	nop			;7dca	00 	. 
	nop			;7dcb	00 	. 
l7dcch:
	ccf			;7dcc	3f 	? 
	ccf			;7dcd	3f 	? 
	jr nc,l7de8h		;7dce	30 18 	0 . 
	inc c			;7dd0	0c 	. 
	jr nc,l7e03h		;7dd1	30 30 	0 0 
	jr nc,l7e45h		;7dd3	30 70 	0 p 
	ld h,b			;7dd5	60 	` 
	nop			;7dd6	00 	. 
	nop			;7dd7	00 	. 
	nop			;7dd8	00 	. 
	ld h,b			;7dd9	60 	` 
	ld (hl),b			;7dda	70 	p 
	jr nc,50		;7ddb	30 30 	0 0 
	jr nc,l7e0fh		;7ddd	30 30 	0 0 
	inc c			;7ddf	0c 	. 
	jr nc,l7dfah		;7de0	30 18 	0 . 
	jr 26		;7de2	18 18 	. . 
	jr 26		;7de4	18 18 	. . 
	nop			;7de6	00 	. 
	nop			;7de7	00 	. 
l7de8h:
	nop			;7de8	00 	. 
	jr l7e03h		;7de9	18 18 	. . 
	jr l7e05h		;7deb	18 18 	. . 
	jr l7defh		;7ded	18 00 	. . 
l7defh:
	nop			;7def	00 	. 
	nop			;7df0	00 	. 
	ld b,006h		;7df1	06 06 	. . 
	ld b,007h		;7df3	06 07 	. . 
	inc bc			;7df5	03 	. 
	nop			;7df6	00 	. 
	nop			;7df7	00 	. 
	nop			;7df8	00 	. 
	inc bc			;7df9	03 	. 
l7dfah:
	rlca			;7dfa	07 	. 
	ld b,006h		;7dfb	06 06 	. . 
	ld b,006h		;7dfd	06 06 	. . 
	jr l7e07h		;7dff	18 06 	. . 
	nop			;7e01	00 	. 
	nop			;7e02	00 	. 
l7e03h:
	nop			;7e03	00 	. 
	nop			;7e04	00 	. 
l7e05h:
	nop			;7e05	00 	. 
	nop			;7e06	00 	. 
l7e07h:
	nop			;7e07	00 	. 
	nop			;7e08	00 	. 
	ld b,04fh		;7e09	06 4f 	. O 
	ld a,c			;7e0b	79 	y 
	jr nc,l7e0eh		;7e0c	30 00 	0 . 
l7e0eh:
	nop			;7e0e	00 	. 
l7e0fh:
	nop			;7e0f	00 	. 
	nop			;7e10	00 	. 
	adc a,h			;7e11	8c 	. 
	ret m			;7e12	f8 	. 
	nop			;7e13	00 	. 
	nop			;7e14	00 	. 
	nop			;7e15	00 	. 
	nop			;7e16	00 	. 
	nop			;7e17	00 	. 
	nop			;7e18	00 	. 
	nop			;7e19	00 	. 
	nop			;7e1a	00 	. 
	nop			;7e1b	00 	. 
	ret m			;7e1c	f8 	. 
	adc a,h			;7e1d	8c 	. 
	ld d,d			;7e1e	52 	R 
	ld hl,l5352h		;7e1f	21 52 53 	! R S 
	ld d,h			;7e22	54 	T 
	ld b,c			;7e23	41 	A 
	ld d,d			;7e24	52 	R 
	ld d,h			;7e25	54 	T 
	jr nz,l7e77h		;7e26	20 4f 	  O 
	ld b,(hl)			;7e28	46 	F 
	jr nz,l7e6bh		;7e29	20 40 	  @ 
	ld c,c			;7e2b	49 	I 
	ld d,h			;7e2c	54 	T 
	ld c,h			;7e2d	4c 	L 
	ld b,(hl)			;7e2e	46 	F 
l7e2fh:
	nop			;7e2f	00 	. 
	nop			;7e30	00 	. 
	nop			;7e31	00 	. 
	nop			;7e32	00 	. 
	nop			;7e33	00 	. 
	nop			;7e34	00 	. 
	nop			;7e35	00 	. 
	nop			;7e36	00 	. 
	nop			;7e37	00 	. 
	nop			;7e38	00 	. 
	nop			;7e39	00 	. 
	nop			;7e3a	00 	. 
	nop			;7e3b	00 	. 
	nop			;7e3c	00 	. 
	nop			;7e3d	00 	. 
	nop			;7e3e	00 	. 
	ex af,af'			;7e3f	08 	. 
	nop			;7e40	00 	. 
	nop			;7e41	00 	. 
	inc b			;7e42	04 	. 
	nop			;7e43	00 	. 
	nop			;7e44	00 	. 
l7e45h:
	nop			;7e45	00 	. 
	nop			;7e46	00 	. 
	jr nz,l7e69h		;7e47	20 20 	    
	jr nz,l7e5bh		;7e49	20 10 	  . 
	djnz l7e5dh		;7e4b	10 10 	. . 
	djnz l7e57h		;7e4d	10 08 	. . 
	nop			;7e4f	00 	. 
	nop			;7e50	00 	. 
	nop			;7e51	00 	. 
	nop			;7e52	00 	. 
	nop			;7e53	00 	. 
	nop			;7e54	00 	. 
	nop			;7e55	00 	. 
	nop			;7e56	00 	. 
l7e57h:
	ld l,h			;7e57	6c 	l 
	inc h			;7e58	24 	$ 
	ld (de),a			;7e59	12 	. 
	nop			;7e5a	00 	. 
l7e5bh:
	nop			;7e5b	00 	. 
	nop			;7e5c	00 	. 
l7e5dh:
	nop			;7e5d	00 	. 
	nop			;7e5e	00 	. 
	inc h			;7e5f	24 	$ 
	ld (de),a			;7e60	12 	. 
	ld (de),a			;7e61	12 	. 
	nop			;7e62	00 	. 
	nop			;7e63	00 	. 
	nop			;7e64	00 	. 
	nop			;7e65	00 	. 
l7e66h:
	nop			;7e66	00 	. 
	nop			;7e67	00 	. 
	ld c,b			;7e68	48 	H 
l7e69h:
	ld c,b			;7e69	48 	H 
	inc h			;7e6a	24 	$ 
l7e6bh:
	ld a,(hl)			;7e6b	7e 	~ 
	inc h			;7e6c	24 	$ 
	inc h			;7e6d	24 	$ 
	ld a,(hl)			;7e6e	7e 	~ 
	ld c,b			;7e6f	48 	H 
	ld c,c			;7e70	49 	I 
	ld a,008h		;7e71	3e 08 	> . 
	inc b			;7e73	04 	. 
	nop			;7e74	00 	. 
	nop			;7e75	00 	. 
	nop			;7e76	00 	. 
l7e77h:
	jr nz,l7e89h		;7e77	20 10 	  . 
	ld a,h			;7e79	7c 	| 
	sub d			;7e7a	92 	. 
	ld (de),a			;7e7b	12 	. 
	ld (de),a			;7e7c	12 	. 
	inc a			;7e7d	3c 	< 
	ld d,b			;7e7e	50 	P 
	inc (hl)			;7e7f	34 	4 
	ld c,d			;7e80	4a 	J 
	ld c,d			;7e81	4a 	J 
	ld sp,00000h		;7e82	31 00 00 	1 . . 
	nop			;7e85	00 	. 
	nop			;7e86	00 	. 
	adc a,h			;7e87	8c 	. 
	ld d,d			;7e88	52 	R 
l7e89h:
	ld d,d			;7e89	52 	R 
	inc l			;7e8a	2c 	, 
	jr nz,l7ea5h		;7e8b	20 18 	  . 
	ex af,af'			;7e8d	08 	. 
	inc b			;7e8e	04 	. 
	ld d,c			;7e8f	51 	Q 
	ld hl,00c52h		;7e90	21 52 0c 	! R . 
	nop			;7e93	00 	. 
	nop			;7e94	00 	. 
	nop			;7e95	00 	. 
	nop			;7e96	00 	. 
	inc e			;7e97	1c 	. 
	ld (01222h),hl		;7e98	22 22 12 	" " . 
	inc c			;7e9b	0c 	. 
	ld b,005h		;7e9c	06 05 	. . 
	ld c,c			;7e9e	49 	I 
	nop			;7e9f	00 	. 
	nop			;7ea0	00 	. 
	nop			;7ea1	00 	. 
	nop			;7ea2	00 	. 
	nop			;7ea3	00 	. 
	nop			;7ea4	00 	. 
l7ea5h:
	nop			;7ea5	00 	. 
	nop			;7ea6	00 	. 
	jr l7ec1h		;7ea7	18 18 	. . 
	djnz l7eb3h		;7ea9	10 08 	. . 
	inc b			;7eab	04 	. 
	nop			;7eac	00 	. 
	nop			;7ead	00 	. 
	nop			;7eae	00 	. 
	ex af,af'			;7eaf	08 	. 
	ex af,af'			;7eb0	08 	. 
	djnz l7ed3h		;7eb1	10 20 	.   
l7eb3h:
	nop			;7eb3	00 	. 
	nop			;7eb4	00 	. 
	nop			;7eb5	00 	. 
	nop			;7eb6	00 	. 
	ld b,b			;7eb7	40 	@ 
	jr nz,l7ecah		;7eb8	20 10 	  . 
	djnz 10		;7eba	10 08 	. . 
	ex af,af'			;7ebc	08 	. 
	ex af,af'			;7ebd	08 	. 
	ex af,af'			;7ebe	08 	. 
	inc b			;7ebf	04 	. 
	inc b			;7ec0	04 	. 
l7ec1h:
	ld (bc),a			;7ec1	02 	. 
	ld bc,00000h		;7ec2	01 00 00 	. . . 
	nop			;7ec5	00 	. 
	nop			;7ec6	00 	. 
	ld (bc),a			;7ec7	02 	. 
	inc b			;7ec8	04 	. 
	ex af,af'			;7ec9	08 	. 
l7ecah:
	ex af,af'			;7eca	08 	. 
	ex af,af'			;7ecb	08 	. 
	ex af,af'			;7ecc	08 	. 
	ex af,af'			;7ecd	08 	. 
	ex af,af'			;7ece	08 	. 
	ld hl,(00849h)		;7ecf	2a 49 08 	* I . 
	nop			;7ed2	00 	. 
l7ed3h:
	nop			;7ed3	00 	. 
	nop			;7ed4	00 	. 
	nop			;7ed5	00 	. 
	nop			;7ed6	00 	. 
	nop			;7ed7	00 	. 
	nop			;7ed8	00 	. 
	ex af,af'			;7ed9	08 	. 
	ld c,c			;7eda	49 	I 
	ld hl,(0081ch)		;7edb	2a 1c 08 	* . . 
sub_7edeh:
	inc e			;7ede	1c 	. 
	ex af,af'			;7edf	08 	. 
	inc b			;7ee0	04 	. 
	inc b			;7ee1	04 	. 
	nop			;7ee2	00 	. 
	nop			;7ee3	00 	. 
	nop			;7ee4	00 	. 
	nop			;7ee5	00 	. 
	nop			;7ee6	00 	. 
	nop			;7ee7	00 	. 
	nop			;7ee8	00 	. 
	djnz l7efbh		;7ee9	10 10 	. . 
	ex af,af'			;7eeb	08 	. 
	ex af,af'			;7eec	08 	. 
	ld a,a			;7eed	7f 	 
	ex af,af'			;7eee	08 	. 
	inc c			;7eef	0c 	. 
	inc c			;7ef0	0c 	. 
	ex af,af'			;7ef1	08 	. 
	inc b			;7ef2	04 	. 
	ld (bc),a			;7ef3	02 	. 
	nop			;7ef4	00 	. 
	nop			;7ef5	00 	. 
	nop			;7ef6	00 	. 
	nop			;7ef7	00 	. 
	nop			;7ef8	00 	. 
	nop			;7ef9	00 	. 
	nop			;7efa	00 	. 
l7efbh:
	nop			;7efb	00 	. 
	nop			;7efc	00 	. 
	nop			;7efd	00 	. 
	nop			;7efe	00 	. 
	nop			;7eff	00 	. 
	nop			;7f00	00 	. 
	nop			;7f01	00 	. 
	nop			;7f02	00 	. 
	nop			;7f03	00 	. 
	nop			;7f04	00 	. 
	nop			;7f05	00 	. 
	nop			;7f06	00 	. 
	nop			;7f07	00 	. 
	nop			;7f08	00 	. 
	nop			;7f09	00 	. 
	nop			;7f0a	00 	. 
	nop			;7f0b	00 	. 
	nop			;7f0c	00 	. 
	ld a,000h		;7f0d	3e 00 	> . 
	nop			;7f0f	00 	. 
	nop			;7f10	00 	. 
	inc c			;7f11	0c 	. 
	inc c			;7f12	0c 	. 
	nop			;7f13	00 	. 
	nop			;7f14	00 	. 
	nop			;7f15	00 	. 
	nop			;7f16	00 	. 
	nop			;7f17	00 	. 
	nop			;7f18	00 	. 
	nop			;7f19	00 	. 
	nop			;7f1a	00 	. 
	nop			;7f1b	00 	. 
	nop			;7f1c	00 	. 
	nop			;7f1d	00 	. 
	nop			;7f1e	00 	. 
	inc b			;7f1f	04 	. 
	ld (bc),a			;7f20	02 	. 
l7f21h:
	ld (bc),a			;7f21	02 	. 
	ld bc,00001h		;7f22	01 01 00 	. . . 
	nop			;7f25	00 	. 
	nop			;7f26	00 	. 
	ld b,b			;7f27	40 	@ 
	jr nz,l7f4ah		;7f28	20 20 	    
	djnz l7f3ch		;7f2a	10 10 	. . 
	ex af,af'			;7f2c	08 	. 
	ex af,af'			;7f2d	08 	. 
	inc b			;7f2e	04 	. 
	dec h			;7f2f	25 	% 
	dec h			;7f30	25 	% 
	inc hl			;7f31	23 	# 
	ld e,000h		;7f32	1e 00 	. . 
	nop			;7f34	00 	. 
	nop			;7f35	00 	. 
	nop			;7f36	00 	. 
	ld a,b			;7f37	78 	x 
	call nz,sub_a4a4h		;7f38	c4 a4 a4 	. . . 
	ld d,d			;7f3b	52 	R 
l7f3ch:
	ld d,d			;7f3c	52 	R 
	ld c,d			;7f3d	4a 	J 
	ld c,d			;7f3e	4a 	J 
	ex af,af'			;7f3f	08 	. 
	ex af,af'			;7f40	08 	. 
	ex af,af'			;7f41	08 	. 
	ld a,000h		;7f42	3e 00 	> . 
	nop			;7f44	00 	. 
	nop			;7f45	00 	. 
	nop			;7f46	00 	. 
	jr nc,l7f71h		;7f47	30 28 	0 ( 
	inc h			;7f49	24 	$ 
l7f4ah:
	djnz l7f5ch		;7f4a	10 10 	. . 
	djnz l7f5eh		;7f4c	10 10 	. . 
	ex af,af'			;7f4e	08 	. 
	inc b			;7f4f	04 	. 
	ld (bc),a			;7f50	02 	. 
	ld b,c			;7f51	41 	A 
	ccf			;7f52	3f 	? 
	nop			;7f53	00 	. 
	nop			;7f54	00 	. 
	nop			;7f55	00 	. 
	nop			;7f56	00 	. 
	jr c,l7f9dh		;7f57	38 44 	8 D 
	add a,d			;7f59	82 	. 
	add a,d			;7f5a	82 	. 
	ld b,b			;7f5b	40 	@ 
l7f5ch:
	jr nz,l7f6eh		;7f5c	20 10 	  . 
l7f5eh:
	ex af,af'			;7f5e	08 	. 
	ld b,b			;7f5f	40 	@ 
	jr nz,l7f73h		;7f60	20 11 	  . 
	ld c,000h		;7f62	0e 00 	. . 
	nop			;7f64	00 	. 
	nop			;7f65	00 	. 
	nop			;7f66	00 	. 
	jr c,l7fadh		;7f67	38 44 	8 D 
	add a,d			;7f69	82 	. 
	add a,b			;7f6a	80 	. 
	ld b,b			;7f6b	40 	@ 
	jr c,66		;7f6c	38 40 	8 @ 
l7f6eh:
	ld b,b			;7f6e	40 	@ 
	djnz l7f81h		;7f6f	10 10 	. . 
l7f71h:
	djnz 18		;7f71	10 10 	. . 
l7f73h:
	nop			;7f73	00 	. 
	nop			;7f74	00 	. 
	nop			;7f75	00 	. 
	nop			;7f76	00 	. 
	ld h,b			;7f77	60 	` 
	ld d,b			;7f78	50 	P 
	ld c,b			;7f79	48 	H 
	inc h			;7f7a	24 	$ 
	ld (l7f21h),hl		;7f7b	22 21 7f 	" !  
	jr nz,l7fc0h		;7f7e	20 40 	  @ 
	ld b,c			;7f80	41 	A 
l7f81h:
	ld hl,0001eh		;7f81	21 1e 00 	! . . 
	nop			;7f84	00 	. 
	nop			;7f85	00 	. 
	nop			;7f86	00 	. 
	call m,00404h		;7f87	fc 04 04 	. . . 
	ld (bc),a			;7f8a	02 	. 
	ld (bc),a			;7f8b	02 	. 
	ld a,040h		;7f8c	3e 40 	> @ 
	ld b,b			;7f8e	40 	@ 
	ld b,c			;7f8f	41 	A 
	ld b,c			;7f90	41 	A 
	ld hl,0001eh		;7f91	21 1e 00 	! . . 
	nop			;7f94	00 	. 
	nop			;7f95	00 	. 
	nop			;7f96	00 	. 
	ld h,b			;7f97	60 	` 
	jr l7f9eh		;7f98	18 04 	. . 
	inc b			;7f9a	04 	. 
	ld (bc),a			;7f9b	02 	. 
	dec e			;7f9c	1d 	. 
l7f9dh:
	inc hl			;7f9d	23 	# 
l7f9eh:
	ld b,c			;7f9e	41 	A 
	djnz l7fb1h		;7f9f	10 10 	. . 
	ex af,af'			;7fa1	08 	. 
	ex af,af'			;7fa2	08 	. 
	nop			;7fa3	00 	. 
	nop			;7fa4	00 	. 
	nop			;7fa5	00 	. 
	nop			;7fa6	00 	. 
	ld a,h			;7fa7	7c 	| 
	add a,h			;7fa8	84 	. 
	add a,d			;7fa9	82 	. 
	ld b,d			;7faa	42 	B 
	ld b,b			;7fab	40 	@ 
	ld b,b			;7fac	40 	@ 
l7fadh:
	jr nz,l7fcfh		;7fad	20 20 	    
	ld b,c			;7faf	41 	A 
	ld b,c			;7fb0	41 	A 
l7fb1h:
	ld (0001ch),hl		;7fb1	22 1c 00 	" . . 
	nop			;7fb4	00 	. 
	nop			;7fb5	00 	. 
	nop			;7fb6	00 	. 
	jr c,l7ffdh		;7fb7	38 44 	8 D 
	add a,d			;7fb9	82 	. 
	add a,d			;7fba	82 	. 
	ld b,h			;7fbb	44 	D 
	inc a			;7fbc	3c 	< 
	ld (sub_2040h+1),hl		;7fbd	22 41 20 	" A   
l7fc0h:
	djnz l7fcah		;7fc0	10 08 	. . 
	ld b,000h		;7fc2	06 00 	. . 
	nop			;7fc4	00 	. 
	nop			;7fc5	00 	. 
	nop			;7fc6	00 	. 
	jr c,l800dh		;7fc7	38 44 	8 D 
	add a,d			;7fc9	82 	. 
l7fcah:
	add a,d			;7fca	82 	. 
	add a,d			;7fcb	82 	. 
	ld b,d			;7fcc	42 	B 
	ld a,h			;7fcd	7c 	| 
	ld b,b			;7fce	40 	@ 
l7fcfh:
	nop			;7fcf	00 	. 
	inc c			;7fd0	0c 	. 
	inc c			;7fd1	0c 	. 
	nop			;7fd2	00 	. 
	nop			;7fd3	00 	. 
	nop			;7fd4	00 	. 
	nop			;7fd5	00 	. 
	nop			;7fd6	00 	. 
	nop			;7fd7	00 	. 
	nop			;7fd8	00 	. 
	nop			;7fd9	00 	. 
	jr l7ff4h		;7fda	18 18 	. . 
	nop			;7fdc	00 	. 
	nop			;7fdd	00 	. 
	nop			;7fde	00 	. 
	inc c			;7fdf	0c 	. 
	inc c			;7fe0	0c 	. 
	ex af,af'			;7fe1	08 	. 
	inc b			;7fe2	04 	. 
	ld (bc),a			;7fe3	02 	. 
	nop			;7fe4	00 	. 
	nop			;7fe5	00 	. 
	nop			;7fe6	00 	. 
	nop			;7fe7	00 	. 
	nop			;7fe8	00 	. 
	nop			;7fe9	00 	. 
	jr l8004h		;7fea	18 18 	. . 
	nop			;7fec	00 	. 
	nop			;7fed	00 	. 
	nop			;7fee	00 	. 
	ld (bc),a			;7fef	02 	. 
	inc b			;7ff0	04 	. 
	ex af,af'			;7ff1	08 	. 
	djnz 34		;7ff2	10 20 	.   
l7ff4h:
	nop			;7ff4	00 	. 
	nop			;7ff5	00 	. 
	nop			;7ff6	00 	. 
	ld b,b			;7ff7	40 	@ 
	jr nz,l800ah		;7ff8	20 10 	  . 
	ex af,af'			;7ffa	08 	. 
	inc b			;7ffb	04 	. 
	ld (bc),a			;7ffc	02 	. 
l7ffdh:
	ld bc,00001h		;7ffd	01 01 00 	. . . 
	nop			;8000	00 	. 
	nop			;8001	00 	. 
	nop			;8002	00 	. 
	nop			;8003	00 	. 
l8004h:
	nop			;8004	00 	. 
	nop			;8005	00 	. 
	nop			;8006	00 	. 
	nop			;8007	00 	. 
	nop			;8008	00 	. 
	nop			;8009	00 	. 
l800ah:
	ld a,(hl)			;800a	7e 	~ 
	nop			;800b	00 	. 
	nop			;800c	00 	. 
l800dh:
	nop			;800d	00 	. 
	ld a,(hl)			;800e	7e 	~ 
	djnz l8019h		;800f	10 08 	. . 
	inc b			;8011	04 	. 
	ld (bc),a			;8012	02 	. 
	ld bc,00000h		;8013	01 00 00 	. . . 
	nop			;8016	00 	. 
	ld (bc),a			;8017	02 	. 
	inc b			;8018	04 	. 
l8019h:
	ex af,af'			;8019	08 	. 
	djnz l803ch		;801a	10 20 	.   
	ld b,b			;801c	40 	@ 
	ld b,b			;801d	40 	@ 
	jr nz,l8024h		;801e	20 04 	  . 
	nop			;8020	00 	. 
	inc b			;8021	04 	. 
	inc b			;8022	04 	. 
	nop			;8023	00 	. 
l8024h:
	nop			;8024	00 	. 
	nop			;8025	00 	. 
	nop			;8026	00 	. 
	jr c,70		;8027	38 44 	8 D 
	add a,d			;8029	82 	. 
	add a,d			;802a	82 	. 
	ld b,b			;802b	40 	@ 
	jr nz,l803eh		;802c	20 10 	  . 
	ex af,af'			;802e	08 	. 
	ld d,c			;802f	51 	Q 
	ld d,c			;8030	51 	Q 
	ld d,c			;8031	51 	Q 
	ld l,000h		;8032	2e 00 	. . 
	nop			;8034	00 	. 
	nop			;8035	00 	. 
	nop			;8036	00 	. 
	jr c,l807dh		;8037	38 44 	8 D 
	add a,d			;8039	82 	. 
	add a,b			;803a	80 	. 
	and b			;803b	a0 	. 
l803ch:
	sbc a,h			;803c	9c 	. 
	sub d			;803d	92 	. 
l803eh:
	ld d,c			;803e	51 	Q 
	ld b,d			;803f	42 	B 
	ld hl,l2121h		;8040	21 21 21 	! ! ! 
	nop			;8043	00 	. 
	nop			;8044	00 	. 
	nop			;8045	00 	. 
	nop			;8046	00 	. 
	jr nc,74		;8047	30 48 	0 H 
	adc a,b			;8049	88 	. 
	add a,h			;804a	84 	. 
	add a,h			;804b	84 	. 
	add a,h			;804c	84 	. 
	ld a,h			;804d	7c 	| 
	ld b,d			;804e	42 	B 
	ld b,d			;804f	42 	B 
	ld b,c			;8050	41 	A 
	ld hl,0001fh		;8051	21 1f 00 	! . . 
	nop			;8054	00 	. 
	nop			;8055	00 	. 
	nop			;8056	00 	. 
	ld a,044h		;8057	3e 44 	> D 
	add a,h			;8059	84 	. 
	add a,h			;805a	84 	. 
	ld b,h			;805b	44 	D 
	inc a			;805c	3c 	< 
	ld (00142h),hl		;805d	22 42 01 	" B . 
	ld b,c			;8060	41 	A 
	ld (0001ch),hl		;8061	22 1c 00 	" . . 
	nop			;8064	00 	. 
	nop			;8065	00 	. 
	nop			;8066	00 	. 
	jr c,l80adh		;8067	38 44 	8 D 
	add a,d			;8069	82 	. 
	add a,d			;806a	82 	. 
	ld bc,00101h		;806b	01 01 01 	. . . 
	ld bc,l4242h		;806e	01 42 42 	. B B 
	ld (0001fh),hl		;8071	22 1f 00 	" . . 
	nop			;8074	00 	. 
	nop			;8075	00 	. 
	nop			;8076	00 	. 
	inc a			;8077	3c 	< 
	ld c,b			;8078	48 	H 
	add a,h			;8079	84 	. 
	add a,h			;807a	84 	. 
	add a,h			;807b	84 	. 
	add a,h			;807c	84 	. 
l807dh:
	ld b,d			;807d	42 	B 
	ld b,d			;807e	42 	B 
	ld (bc),a			;807f	02 	. 
	ld bc,03f01h		;8080	01 01 3f 	. . ? 
	nop			;8083	00 	. 
	nop			;8084	00 	. 
	nop			;8085	00 	. 
	nop			;8086	00 	. 
	ret m			;8087	f8 	. 
	inc b			;8088	04 	. 
	inc b			;8089	04 	. 
	inc b			;808a	04 	. 
	inc b			;808b	04 	. 
	inc a			;808c	3c 	< 
	ld (bc),a			;808d	02 	. 
	ld (bc),a			;808e	02 	. 
	ld (bc),a			;808f	02 	. 
	ld bc,00101h		;8090	01 01 01 	. . . 
	nop			;8093	00 	. 
	nop			;8094	00 	. 
	nop			;8095	00 	. 
	nop			;8096	00 	. 
	ret m			;8097	f8 	. 
	inc b			;8098	04 	. 
	inc b			;8099	04 	. 
	inc b			;809a	04 	. 
	inc b			;809b	04 	. 
	inc a			;809c	3c 	< 
	ld (bc),a			;809d	02 	. 
	ld (bc),a			;809e	02 	. 
	ld b,c			;809f	41 	A 
	ld hl,disk_sector		;80a0	21 22 1c 	! " . 
	nop			;80a3	00 	. 
	nop			;80a4	00 	. 
	nop			;80a5	00 	. 
	nop			;80a6	00 	. 
	jr nc,l80f1h		;80a7	30 48 	0 H 
	add a,h			;80a9	84 	. 
	add a,h			;80aa	84 	. 
	ld (bc),a			;80ab	02 	. 
	ld (bc),a			;80ac	02 	. 
l80adh:
	ld (hl),d			;80ad	72 	r 
	ld b,c			;80ae	41 	A 
	ld hl,l2121h		;80af	21 21 21 	! ! ! 
	ld hl,00000h		;80b2	21 00 00 	! . . 
	nop			;80b5	00 	. 
	nop			;80b6	00 	. 
	add a,h			;80b7	84 	. 
	add a,h			;80b8	84 	. 
	add a,h			;80b9	84 	. 
	ld b,d			;80ba	42 	B 
	ld b,d			;80bb	42 	B 
	ld a,(hl)			;80bc	7e 	~ 
	ld b,d			;80bd	42 	B 
	ld hl,00808h		;80be	21 08 08 	! . . 
	ex af,af'			;80c1	08 	. 
	ld a,000h		;80c2	3e 00 	> . 
	nop			;80c4	00 	. 
	nop			;80c5	00 	. 
	nop			;80c6	00 	. 
	ret m			;80c7	f8 	. 
	jr nz,l80eah		;80c8	20 20 	    
	jr nz,18		;80ca	20 10 	  . 
	djnz 18		;80cc	10 10 	. . 
	djnz 18		;80ce	10 10 	. . 
	ld de,00e11h		;80d0	11 11 0e 	. . . 
	nop			;80d3	00 	. 
	nop			;80d4	00 	. 
	nop			;80d5	00 	. 
	nop			;80d6	00 	. 
	ret m			;80d7	f8 	. 
	ld b,b			;80d8	40 	@ 
	ld b,b			;80d9	40 	@ 
	ld b,b			;80da	40 	@ 
	jr nz,l80fdh		;80db	20 20 	    
	jr nz,l80ffh		;80dd	20 20 	    
	ld de,l2111h		;80df	11 11 21 	. . ! 
	ld hl,00000h		;80e2	21 00 00 	! . . 
	nop			;80e5	00 	. 
	nop			;80e6	00 	. 
	add a,h			;80e7	84 	. 
	ld b,h			;80e8	44 	D 
	inc h			;80e9	24 	$ 
l80eah:
	inc h			;80ea	24 	$ 
	ld (de),a			;80eb	12 	. 
	ld a,(bc)			;80ec	0a 	. 
	ld b,00ah		;80ed	06 0a 	. . 
	ld (bc),a			;80ef	02 	. 
	ld (bc),a			;80f0	02 	. 
l80f1h:
	ld (bc),a			;80f1	02 	. 
	ld a,(hl)			;80f2	7e 	~ 
	nop			;80f3	00 	. 
	nop			;80f4	00 	. 
	nop			;80f5	00 	. 
	nop			;80f6	00 	. 
	ex af,af'			;80f7	08 	. 
	ex af,af'			;80f8	08 	. 
	ex af,af'			;80f9	08 	. 
	ex af,af'			;80fa	08 	. 
	inc b			;80fb	04 	. 
	inc b			;80fc	04 	. 
l80fdh:
	inc b			;80fd	04 	. 
	inc b			;80fe	04 	. 
l80ffh:
	ld hl,l2121h		;80ff	21 21 21 	! ! ! 
	ld hl,00000h		;8102	21 00 00 	! . . 
	nop			;8105	00 	. 
	nop			;8106	00 	. 
	add a,h			;8107	84 	. 
	add a,h			;8108	84 	. 
	add a,h			;8109	84 	. 
	call nz,sub_92aah		;810a	c4 aa 92 	. . . 
	ld b,d			;810d	42 	B 
	ld b,d			;810e	42 	B 
	ld sp,02131h		;810f	31 31 21 	1 1 ! 
	ld hl,00000h		;8112	21 00 00 	! . . 
	nop			;8115	00 	. 
	nop			;8116	00 	. 
	add a,h			;8117	84 	. 
	add a,h			;8118	84 	. 
	add a,h			;8119	84 	. 
	add a,h			;811a	84 	. 
	ld c,d			;811b	4a 	J 
	ld c,d			;811c	4a 	J 
	ld c,d			;811d	4a 	J 
	ld c,d			;811e	4a 	J 
	ld hl,l2121h		;811f	21 21 21 	! ! ! 
	ld e,000h		;8122	1e 00 	. . 
	nop			;8124	00 	. 
	nop			;8125	00 	. 
	nop			;8126	00 	. 
	ld a,b			;8127	78 	x 
	add a,h			;8128	84 	. 
	add a,h			;8129	84 	. 
	add a,h			;812a	84 	. 
	ld b,d			;812b	42 	B 
	ld b,d			;812c	42 	B 
	ld b,d			;812d	42 	B 
	ld b,d			;812e	42 	B 
	ld bc,00101h		;812f	01 01 01 	. . . 
	ld bc,00000h		;8132	01 00 00 	. . . 
	nop			;8135	00 	. 
	nop			;8136	00 	. 
	ld a,044h		;8137	3e 44 	> D 
	add a,h			;8139	84 	. 
	add a,h			;813a	84 	. 
	add a,d			;813b	82 	. 
	ld b,d			;813c	42 	B 
	ld a,002h		;813d	3e 02 	> . 
	add hl,sp			;813f	39 	9 
	dec h			;8140	25 	% 
	ld (0005ch),hl		;8141	22 5c 00 	" \ . 
	nop			;8144	00 	. 
	nop			;8145	00 	. 
	nop			;8146	00 	. 
	jr c,l818dh		;8147	38 44 	8 D 
	add a,h			;8149	84 	. 
	add a,h			;814a	84 	. 
	ld b,d			;814b	42 	B 
	ld b,d			;814c	42 	B 
	ld b,d			;814d	42 	B 
	ld b,d			;814e	42 	B 
	ld hl,04121h		;814f	21 21 41 	! ! A 
	ld b,c			;8152	41 	A 
	nop			;8153	00 	. 
	nop			;8154	00 	. 
	nop			;8155	00 	. 
	nop			;8156	00 	. 
	inc a			;8157	3c 	< 
	ld b,h			;8158	44 	D 
	add a,h			;8159	84 	. 
	add a,h			;815a	84 	. 
	ld b,d			;815b	42 	B 
	ld (0121eh),hl		;815c	22 1e 12 	" . . 
	ld b,c			;815f	41 	A 
	ld b,c			;8160	41 	A 
	ld (0001ch),hl		;8161	22 1c 00 	" . . 
	nop			;8164	00 	. 
	nop			;8165	00 	. 
	nop			;8166	00 	. 
	ld (hl),b			;8167	70 	p 
	adc a,b			;8168	88 	. 
	add a,h			;8169	84 	. 
	inc b			;816a	04 	. 
	inc b			;816b	04 	. 
	ex af,af'			;816c	08 	. 
	jr nc,l81afh		;816d	30 40 	0 @ 
	inc b			;816f	04 	. 
	inc b			;8170	04 	. 
	inc b			;8171	04 	. 
	inc b			;8172	04 	. 
	nop			;8173	00 	. 
	nop			;8174	00 	. 
	nop			;8175	00 	. 
	nop			;8176	00 	. 
	cp 010h		;8177	fe 10 	. . 
	djnz l818bh		;8179	10 10 	. . 
	ex af,af'			;817b	08 	. 
	ex af,af'			;817c	08 	. 
	ex af,af'			;817d	08 	. 
	ex af,af'			;817e	08 	. 
	ld hl,l2121h		;817f	21 21 21 	! ! ! 
	ld e,000h		;8182	1e 00 	. . 
	nop			;8184	00 	. 
	nop			;8185	00 	. 
	nop			;8186	00 	. 
	add a,h			;8187	84 	. 
	add a,h			;8188	84 	. 
	add a,h			;8189	84 	. 
	add a,h			;818a	84 	. 
l818bh:
	ld b,d			;818b	42 	B 
	ld b,d			;818c	42 	B 
l818dh:
	ld b,d			;818d	42 	B 
	ld b,d			;818e	42 	B 
	inc h			;818f	24 	$ 
	inc h			;8190	24 	$ 
	jr l819bh		;8191	18 08 	. . 
	nop			;8193	00 	. 
	nop			;8194	00 	. 
	nop			;8195	00 	. 
	nop			;8196	00 	. 
	add a,d			;8197	82 	. 
	add a,d			;8198	82 	. 
	add a,d			;8199	82 	. 
	add a,d			;819a	82 	. 
l819bh:
	ld b,d			;819b	42 	B 
	ld b,d			;819c	42 	B 
	ld b,d			;819d	42 	B 
	ld b,h			;819e	44 	D 
	ld c,c			;819f	49 	I 
	add hl,hl			;81a0	29 	) 
	dec (hl)			;81a1	35 	5 
	ld (00000h),hl		;81a2	22 00 00 	" . . 
	nop			;81a5	00 	. 
	nop			;81a6	00 	. 
	add a,h			;81a7	84 	. 
	add a,h			;81a8	84 	. 
	add a,h			;81a9	84 	. 
	add a,d			;81aa	82 	. 
	add a,d			;81ab	82 	. 
	ld d,d			;81ac	52 	R 
	ld d,d			;81ad	52 	R 
	ld c,c			;81ae	49 	I 
l81afh:
	ld b,d			;81af	42 	B 
	ld b,d			;81b0	42 	B 
	ld b,c			;81b1	41 	A 
	ld b,c			;81b2	41 	A 
	nop			;81b3	00 	. 
	nop			;81b4	00 	. 
	nop			;81b5	00 	. 
	nop			;81b6	00 	. 
	add a,h			;81b7	84 	. 
	add a,h			;81b8	84 	. 
	ld b,h			;81b9	44 	D 
	ld c,b			;81ba	48 	H 
	jr z,18		;81bb	28 10 	( . 
	jr z,l81e3h		;81bd	28 24 	( $ 
	djnz l81d1h		;81bf	10 10 	. . 
	ex af,af'			;81c1	08 	. 
	ex af,af'			;81c2	08 	. 
	nop			;81c3	00 	. 
	nop			;81c4	00 	. 
	nop			;81c5	00 	. 
	nop			;81c6	00 	. 
	add a,d			;81c7	82 	. 
	add a,d			;81c8	82 	. 
	add a,h			;81c9	84 	. 
	ld b,h			;81ca	44 	D 
	ld b,h			;81cb	44 	D 
	jr z,l81f6h		;81cc	28 28 	( ( 
	djnz l81d4h		;81ce	10 04 	. . 
	ld (bc),a			;81d0	02 	. 
l81d1h:
	ld bc,0003fh		;81d1	01 3f 00 	. ? . 
l81d4h:
	nop			;81d4	00 	. 
	nop			;81d5	00 	. 
	nop			;81d6	00 	. 
	call m,sub_4080h		;81d7	fc 80 40 	. . @ 
	ld b,b			;81da	40 	@ 
	jr nz,l81edh		;81db	20 10 	  . 
	ex af,af'			;81dd	08 	. 
	ex af,af'			;81de	08 	. 
	inc b			;81df	04 	. 
	inc b			;81e0	04 	. 
	inc b			;81e1	04 	. 
	inc b			;81e2	04 	. 
l81e3h:
	inc a			;81e3	3c 	< 
	nop			;81e4	00 	. 
	nop			;81e5	00 	. 
	nop			;81e6	00 	. 
	ret p			;81e7	f0 	. 
	djnz l81fah		;81e8	10 10 	. . 
	djnz 10		;81ea	10 08 	. . 
	ex af,af'			;81ec	08 	. 
l81edh:
	ex af,af'			;81ed	08 	. 
	ex af,af'			;81ee	08 	. 
	djnz l8211h		;81ef	10 20 	.   
	jr nz,l8213h		;81f1	20 20 	    
	jr nz,l81f5h		;81f3	20 00 	  . 
l81f5h:
	nop			;81f5	00 	. 
l81f6h:
	nop			;81f6	00 	. 
	ld (bc),a			;81f7	02 	. 
	ld (bc),a			;81f8	02 	. 
	ld (bc),a			;81f9	02 	. 
l81fah:
	inc b			;81fa	04 	. 
	inc b			;81fb	04 	. 
	ex af,af'			;81fc	08 	. 
	ex af,af'			;81fd	08 	. 
	djnz l8208h		;81fe	10 08 	. . 
	ex af,af'			;8200	08 	. 
	ex af,af'			;8201	08 	. 
	ex af,af'			;8202	08 	. 
	rrca			;8203	0f 	. 
	nop			;8204	00 	. 
	nop			;8205	00 	. 
	nop			;8206	00 	. 
	inc a			;8207	3c 	< 
l8208h:
	jr nz,l822ah		;8208	20 20 	    
	jr nz,l821ch		;820a	20 10 	  . 
	djnz l821eh		;820c	10 10 	. . 
	djnz l8210h		;820e	10 00 	. . 
l8210h:
	nop			;8210	00 	. 
l8211h:
	nop			;8211	00 	. 
	nop			;8212	00 	. 
l8213h:
	nop			;8213	00 	. 
	nop			;8214	00 	. 
	nop			;8215	00 	. 
	nop			;8216	00 	. 
	djnz 42		;8217	10 28 	. ( 
	ld b,h			;8219	44 	D 
	add a,d			;821a	82 	. 
	nop			;821b	00 	. 
l821ch:
	nop			;821c	00 	. 
	nop			;821d	00 	. 
l821eh:
	nop			;821e	00 	. 
	nop			;821f	00 	. 
	nop			;8220	00 	. 
	nop			;8221	00 	. 
	nop			;8222	00 	. 
	nop			;8223	00 	. 
	rst 38h			;8224	ff 	. 
	nop			;8225	00 	. 
	nop			;8226	00 	. 
	nop			;8227	00 	. 
	nop			;8228	00 	. 
	nop			;8229	00 	. 
l822ah:
	nop			;822a	00 	. 
	nop			;822b	00 	. 
	nop			;822c	00 	. 
	nop			;822d	00 	. 
	nop			;822e	00 	. 
	nop			;822f	00 	. 
	nop			;8230	00 	. 
	nop			;8231	00 	. 
	nop			;8232	00 	. 
	nop			;8233	00 	. 
	nop			;8234	00 	. 
	nop			;8235	00 	. 
	nop			;8236	00 	. 
	jr 26		;8237	18 18 	. . 
	ex af,af'			;8239	08 	. 
	djnz 34		;823a	10 20 	.   
	nop			;823c	00 	. 
	nop			;823d	00 	. 
	nop			;823e	00 	. 
	ld hl,l2121h		;823f	21 21 21 	! ! ! 
	ld e,(hl)			;8242	5e 	^ 
	nop			;8243	00 	. 
	nop			;8244	00 	. 
	nop			;8245	00 	. 
	nop			;8246	00 	. 
	nop			;8247	00 	. 
	nop			;8248	00 	. 
	nop			;8249	00 	. 
	inc a			;824a	3c 	< 
	ld b,b			;824b	40 	@ 
	ld b,b			;824c	40 	@ 
	ld a,h			;824d	7c 	| 
	ld b,d			;824e	42 	B 
	ld hl,move_block_to_bank+2		;824f	21 21 23 	! ! # 
	dec e			;8252	1d 	. 
	nop			;8253	00 	. 
	nop			;8254	00 	. 
	nop			;8255	00 	. 
	nop			;8256	00 	. 
	inc b			;8257	04 	. 
	inc b			;8258	04 	. 
	inc b			;8259	04 	. 
	ld a,(l4246h)		;825a	3a 46 42 	: F B 
	ld b,d			;825d	42 	B 
	ld b,d			;825e	42 	B 
	ld bc,l2241h		;825f	01 41 22 	. A " 
	inc e			;8262	1c 	. 
	nop			;8263	00 	. 
	nop			;8264	00 	. 
	nop			;8265	00 	. 
	nop			;8266	00 	. 
	nop			;8267	00 	. 
	nop			;8268	00 	. 
	nop			;8269	00 	. 
	jr c,l82b0h		;826a	38 44 	8 D 
	ld b,d			;826c	42 	B 
	ld (bc),a			;826d	02 	. 
	ld bc,l2222h		;826e	01 22 22 	. " " 
	ld (0003ch),hl		;8271	22 3c 00 	" < . 
	nop			;8274	00 	. 
	nop			;8275	00 	. 
	nop			;8276	00 	. 
	add a,b			;8277	80 	. 
	add a,b			;8278	80 	. 
	add a,b			;8279	80 	. 
	cp b			;827a	b8 	. 
	ld b,h			;827b	44 	D 
	ld b,h			;827c	44 	D 
	ld b,d			;827d	42 	B 
	ld b,d			;827e	42 	B 
	ld bc,l2101h		;827f	01 01 21 	. . ! 
	ld e,000h		;8282	1e 00 	. . 
	nop			;8284	00 	. 
	nop			;8285	00 	. 
	nop			;8286	00 	. 
	nop			;8287	00 	. 
	nop			;8288	00 	. 
	nop			;8289	00 	. 
	jr c,l82d0h		;828a	38 44 	8 D 
	ld b,d			;828c	42 	B 
	ld b,d			;828d	42 	B 
	ld a,008h		;828e	3e 08 	> . 
	inc b			;8290	04 	. 
	inc b			;8291	04 	. 
	inc b			;8292	04 	. 
	nop			;8293	00 	. 
	nop			;8294	00 	. 
	nop			;8295	00 	. 
	nop			;8296	00 	. 
	ld h,b			;8297	60 	` 
	sub b			;8298	90 	. 
	djnz l82abh		;8299	10 10 	. . 
	call m,00810h		;829b	fc 10 08 	. . . 
	ex af,af'			;829e	08 	. 
	inc b			;829f	04 	. 
	ld a,041h		;82a0	3e 41 	> A 
	ld b,c			;82a2	41 	A 
	ld a,000h		;82a3	3e 00 	> . 
	nop			;82a5	00 	. 
	nop			;82a6	00 	. 
	nop			;82a7	00 	. 
	nop			;82a8	00 	. 
	add a,b			;82a9	80 	. 
	cp b			;82aa	b8 	. 
l82abh:
	ld b,h			;82ab	44 	D 
	ld b,h			;82ac	44 	D 
	inc h			;82ad	24 	$ 
	jr l82d1h		;82ae	18 21 	. ! 
l82b0h:
	ld hl,l2121h		;82b0	21 21 21 	! ! ! 
	nop			;82b3	00 	. 
	nop			;82b4	00 	. 
	nop			;82b5	00 	. 
	nop			;82b6	00 	. 
	inc b			;82b7	04 	. 
	inc b			;82b8	04 	. 
	inc b			;82b9	04 	. 
	inc a			;82ba	3c 	< 
	ld b,d			;82bb	42 	B 
	ld b,d			;82bc	42 	B 
	ld b,d			;82bd	42 	B 
	ld b,d			;82be	42 	B 
	ex af,af'			;82bf	08 	. 
	ex af,af'			;82c0	08 	. 
	ex af,af'			;82c1	08 	. 
	ex af,af'			;82c2	08 	. 
	nop			;82c3	00 	. 
	nop			;82c4	00 	. 
	nop			;82c5	00 	. 
	nop			;82c6	00 	. 
	jr nz,l82c9h		;82c7	20 00 	  . 
l82c9h:
	nop			;82c9	00 	. 
	djnz l82dch		;82ca	10 10 	. . 
	djnz l82deh		;82cc	10 10 	. . 
	ex af,af'			;82ce	08 	. 
	ex af,af'			;82cf	08 	. 
l82d0h:
	ex af,af'			;82d0	08 	. 
l82d1h:
	add hl,bc			;82d1	09 	. 
	add hl,bc			;82d2	09 	. 
	ld b,000h		;82d3	06 00 	. . 
	nop			;82d5	00 	. 
	nop			;82d6	00 	. 
	jr nz,l82d9h		;82d7	20 00 	  . 
l82d9h:
	nop			;82d9	00 	. 
	djnz l82ech		;82da	10 10 	. . 
l82dch:
	djnz l82eeh		;82dc	10 10 	. . 
l82deh:
	ex af,af'			;82de	08 	. 
	ld a,(bc)			;82df	0a 	. 
	ld (de),a			;82e0	12 	. 
	ld (00042h),hl		;82e1	22 42 00 	" B . 
	nop			;82e4	00 	. 
	nop			;82e5	00 	. 
	nop			;82e6	00 	. 
	ex af,af'			;82e7	08 	. 
	ex af,af'			;82e8	08 	. 
	adc a,b			;82e9	88 	. 
	ld c,b			;82ea	48 	H 
	inc h			;82eb	24 	$ 
l82ech:
	inc d			;82ec	14 	. 
	inc c			;82ed	0c 	. 
l82eeh:
	inc b			;82ee	04 	. 
	ex af,af'			;82ef	08 	. 
	ex af,af'			;82f0	08 	. 
	ex af,af'			;82f1	08 	. 
	inc e			;82f2	1c 	. 
	nop			;82f3	00 	. 
	nop			;82f4	00 	. 
	nop			;82f5	00 	. 
	nop			;82f6	00 	. 
	jr nc,l8319h		;82f7	30 20 	0   
	jr nz,34		;82f9	20 20 	    
	djnz l830dh		;82fb	10 10 	. . 
	djnz l830fh		;82fd	10 10 	. . 
	ld c,c			;82ff	49 	I 
	ld c,c			;8300	49 	I 
	ld c,c			;8301	49 	I 
	ld c,c			;8302	49 	I 
	nop			;8303	00 	. 
	nop			;8304	00 	. 
	nop			;8305	00 	. 
	nop			;8306	00 	. 
	nop			;8307	00 	. 
	nop			;8308	00 	. 
	nop			;8309	00 	. 
	ld l,h			;830a	6c 	l 
	sub d			;830b	92 	. 
	sub d			;830c	92 	. 
l830dh:
	sub d			;830d	92 	. 
	sub d			;830e	92 	. 
l830fh:
	ld hl,l2121h		;830f	21 21 21 	! ! ! 
	ld hl,00000h		;8312	21 00 00 	! . . 
	nop			;8315	00 	. 
	nop			;8316	00 	. 
	nop			;8317	00 	. 
	nop			;8318	00 	. 
l8319h:
	nop			;8319	00 	. 
	ld a,(l4246h)		;831a	3a 46 42 	: F B 
	ld b,d			;831d	42 	B 
	ld b,d			;831e	42 	B 
	ld b,c			;831f	41 	A 
	ld b,c			;8320	41 	A 
	ld (0001ch),hl		;8321	22 1c 00 	" . . 
	nop			;8324	00 	. 
	nop			;8325	00 	. 
	nop			;8326	00 	. 
	nop			;8327	00 	. 
	nop			;8328	00 	. 
	nop			;8329	00 	. 
	jr c,l8370h		;832a	38 44 	8 D 
	add a,d			;832c	82 	. 
	add a,d			;832d	82 	. 
	add a,c			;832e	81 	. 
	ld b,d			;832f	42 	B 
	ld b,(hl)			;8330	46 	F 
	ld a,(00101h)		;8331	3a 01 01 	: . . 
	ld bc,00001h		;8334	01 01 00 	. . . 
	nop			;8337	00 	. 
	nop			;8338	00 	. 
	nop			;8339	00 	. 
	inc (hl)			;833a	34 	4 
	ld c,b			;833b	48 	H 
	add a,h			;833c	84 	. 
	add a,h			;833d	84 	. 
	add a,d			;833e	82 	. 
	ld hl,l2e31h		;833f	21 31 2e 	! 1 . 
	djnz l8354h		;8342	10 10 	. . 
	djnz l8356h		;8344	10 10 	. . 
	nop			;8346	00 	. 
	nop			;8347	00 	. 
	nop			;8348	00 	. 
	nop			;8349	00 	. 
	ld e,b			;834a	58 	X 
	ld h,h			;834b	64 	d 
	ld b,d			;834c	42 	B 
	ld b,d			;834d	42 	B 
	ld hl,00202h		;834e	21 02 02 	! . . 
	ld (bc),a			;8351	02 	. 
	ld (bc),a			;8352	02 	. 
	nop			;8353	00 	. 
l8354h:
	nop			;8354	00 	. 
	nop			;8355	00 	. 
l8356h:
	nop			;8356	00 	. 
	nop			;8357	00 	. 
	nop			;8358	00 	. 
	nop			;8359	00 	. 
	ld h,h			;835a	64 	d 
	sub h			;835b	94 	. 
	inc c			;835c	0c 	. 
	inc b			;835d	04 	. 
	inc b			;835e	04 	. 
	ld b,b			;835f	40 	@ 
	ld b,b			;8360	40 	@ 
	ld hl,0001eh		;8361	21 1e 00 	! . . 
	nop			;8364	00 	. 
	nop			;8365	00 	. 
	nop			;8366	00 	. 
	nop			;8367	00 	. 
	nop			;8368	00 	. 
	nop			;8369	00 	. 
	ld a,b			;836a	78 	x 
	add a,h			;836b	84 	. 
	ld (bc),a			;836c	02 	. 
	ld (bc),a			;836d	02 	. 
	inc a			;836e	3c 	< 
	ld (bc),a			;836f	02 	. 
l8370h:
	ld b,d			;8370	42 	B 
	ld (0001ch),hl		;8371	22 1c 00 	" . . 
	nop			;8374	00 	. 
	nop			;8375	00 	. 
	nop			;8376	00 	. 
	ex af,af'			;8377	08 	. 
	ex af,af'			;8378	08 	. 
	ex af,af'			;8379	08 	. 
	ld a,008h		;837a	3e 08 	> . 
	inc b			;837c	04 	. 
	inc b			;837d	04 	. 
	inc b			;837e	04 	. 
	ld hl,l2121h		;837f	21 21 21 	! ! ! 
	ld e,(hl)			;8382	5e 	^ 
	nop			;8383	00 	. 
	nop			;8384	00 	. 
	nop			;8385	00 	. 
	nop			;8386	00 	. 
	nop			;8387	00 	. 
	nop			;8388	00 	. 
	nop			;8389	00 	. 
	ld b,d			;838a	42 	B 
	ld b,d			;838b	42 	B 
	ld b,d			;838c	42 	B 
	ld b,d			;838d	42 	B 
	ld hl,01424h		;838e	21 24 14 	! $ . 
	inc d			;8391	14 	. 
	ex af,af'			;8392	08 	. 
	nop			;8393	00 	. 
	nop			;8394	00 	. 
	nop			;8395	00 	. 
	nop			;8396	00 	. 
	nop			;8397	00 	. 
	nop			;8398	00 	. 
	nop			;8399	00 	. 
	add a,d			;839a	82 	. 
	add a,d			;839b	82 	. 
	ld b,d			;839c	42 	B 
	ld b,d			;839d	42 	B 
	ld (l3256h),hl		;839e	22 56 32 	" V 2 
	ld (00022h),hl		;83a1	22 22 00 	" " . 
	nop			;83a4	00 	. 
	nop			;83a5	00 	. 
	nop			;83a6	00 	. 
	nop			;83a7	00 	. 
	nop			;83a8	00 	. 
	nop			;83a9	00 	. 
	add a,d			;83aa	82 	. 
	add a,d			;83ab	82 	. 
	add a,d			;83ac	82 	. 
	ld c,d			;83ad	4a 	J 
	ld c,d			;83ae	4a 	J 
	inc d			;83af	14 	. 
	inc d			;83b0	14 	. 
	ld (00021h),hl		;83b1	22 21 00 	" ! . 
	nop			;83b4	00 	. 
	nop			;83b5	00 	. 
	nop			;83b6	00 	. 
	nop			;83b7	00 	. 
	nop			;83b8	00 	. 
	nop			;83b9	00 	. 
	ld b,d			;83ba	42 	B 
	ld (01414h),hl		;83bb	22 14 14 	" . . 
	ex af,af'			;83be	08 	. 
	inc h			;83bf	24 	$ 
	inc d			;83c0	14 	. 
	ex af,af'			;83c1	08 	. 
	ex af,af'			;83c2	08 	. 
	inc b			;83c3	04 	. 
	inc b			;83c4	04 	. 
	ld (bc),a			;83c5	02 	. 
	nop			;83c6	00 	. 
	nop			;83c7	00 	. 
	nop			;83c8	00 	. 
	nop			;83c9	00 	. 
	add a,d			;83ca	82 	. 
	add a,d			;83cb	82 	. 
	ld b,d			;83cc	42 	B 
	ld b,d			;83cd	42 	B 
	inc h			;83ce	24 	$ 
	inc b			;83cf	04 	. 
	ld (bc),a			;83d0	02 	. 
	ld bc,0003fh		;83d1	01 3f 00 	. ? . 
	nop			;83d4	00 	. 
	nop			;83d5	00 	. 
	nop			;83d6	00 	. 
	nop			;83d7	00 	. 
	nop			;83d8	00 	. 
	nop			;83d9	00 	. 
	call m,sub_2040h		;83da	fc 40 20 	. @   
	djnz l83e7h		;83dd	10 08 	. . 
	ex af,af'			;83df	08 	. 
	inc b			;83e0	04 	. 
	inc b			;83e1	04 	. 
	inc b			;83e2	04 	. 
	jr l83e5h		;83e3	18 00 	. . 
l83e5h:
	nop			;83e5	00 	. 
	nop			;83e6	00 	. 
l83e7h:
	ld h,b			;83e7	60 	` 
	djnz 18		;83e8	10 10 	. . 
	djnz l83f4h		;83ea	10 08 	. . 
	ex af,af'			;83ec	08 	. 
	ld b,008h		;83ed	06 08 	. . 
	ex af,af'			;83ef	08 	. 
	ex af,af'			;83f0	08 	. 
	ex af,af'			;83f1	08 	. 
	ex af,af'			;83f2	08 	. 
	ex af,af'			;83f3	08 	. 
l83f4h:
	nop			;83f4	00 	. 
	nop			;83f5	00 	. 
	nop			;83f6	00 	. 
	djnz l8409h		;83f7	10 10 	. . 
	djnz l840bh		;83f9	10 10 	. . 
	djnz l83fdh		;83fb	10 00 	. . 
l83fdh:
	nop			;83fd	00 	. 
	nop			;83fe	00 	. 
	inc b			;83ff	04 	. 
	ld (bc),a			;8400	02 	. 
	ld (bc),a			;8401	02 	. 
	ld (bc),a			;8402	02 	. 
	ld bc,00000h		;8403	01 00 00 	. . . 
	nop			;8406	00 	. 
	ld b,008h		;8407	06 08 	. . 
l8409h:
	ex af,af'			;8409	08 	. 
	ex af,af'			;840a	08 	. 
l840bh:
	inc b			;840b	04 	. 
	inc b			;840c	04 	. 
	jr l8413h		;840d	18 04 	. . 
	nop			;840f	00 	. 
	nop			;8410	00 	. 
	nop			;8411	00 	. 
	nop			;8412	00 	. 
l8413h:
	nop			;8413	00 	. 
	nop			;8414	00 	. 
	nop			;8415	00 	. 
	nop			;8416	00 	. 
	inc c			;8417	0c 	. 
	sub d			;8418	92 	. 
	ld h,b			;8419	60 	` 
	nop			;841a	00 	. 
	nop			;841b	00 	. 
	nop			;841c	00 	. 
	nop			;841d	00 	. 
	nop			;841e	00 	. 
	adc a,h			;841f	8c 	. 
	ret m			;8420	f8 	. 
	nop			;8421	00 	. 
	nop			;8422	00 	. 
	nop			;8423	00 	. 
	nop			;8424	00 	. 
	nop			;8425	00 	. 
	nop			;8426	00 	. 
	nop			;8427	00 	. 
	nop			;8428	00 	. 
	nop			;8429	00 	. 
	ret m			;842a	f8 	. 
	adc a,h			;842b	8c 	. 
	ld d,d			;842c	52 	R 
	ld hl,l5352h		;842d	21 52 53 	! R S 
	ld d,h			;8430	54 	T 
	ld b,c			;8431	41 	A 
	ld d,d			;8432	52 	R 
	ld d,h			;8433	54 	T 
	jr nz,l8485h		;8434	20 4f 	  O 
	ld b,(hl)			;8436	46 	F 
	jr nz,l8479h		;8437	20 40 	  @ 
	ld c,c			;8439	49 	I 
	ld d,h			;843a	54 	T 
	ld c,h			;843b	4c 	L 
	ld b,d			;843c	42 	B 
	ld b,(hl)			;843d	46 	F 
l843eh:
	nop			;843e	00 	. 
	nop			;843f	00 	. 
	nop			;8440	00 	. 
	nop			;8441	00 	. 
	nop			;8442	00 	. 
	nop			;8443	00 	. 
	nop			;8444	00 	. 
	nop			;8445	00 	. 
	nop			;8446	00 	. 
	nop			;8447	00 	. 
	nop			;8448	00 	. 
	nop			;8449	00 	. 
	nop			;844a	00 	. 
	nop			;844b	00 	. 
	nop			;844c	00 	. 
	nop			;844d	00 	. 
	jr l8450h		;844e	18 00 	. . 
l8450h:
	nop			;8450	00 	. 
	inc c			;8451	0c 	. 
	nop			;8452	00 	. 
	nop			;8453	00 	. 
	nop			;8454	00 	. 
	nop			;8455	00 	. 
	ld h,b			;8456	60 	` 
	ld h,b			;8457	60 	` 
	ld h,b			;8458	60 	` 
	jr nc,l848bh		;8459	30 30 	0 0 
	jr nc,l848dh		;845b	30 30 	0 0 
	jr l845fh		;845d	18 00 	. . 
l845fh:
	nop			;845f	00 	. 
	nop			;8460	00 	. 
	nop			;8461	00 	. 
	nop			;8462	00 	. 
	nop			;8463	00 	. 
	nop			;8464	00 	. 
	nop			;8465	00 	. 
	ld l,h			;8466	6c 	l 
	ld l,h			;8467	6c 	l 
	ld (hl),000h		;8468	36 00 	6 . 
	nop			;846a	00 	. 
	nop			;846b	00 	. 
	nop			;846c	00 	. 
	nop			;846d	00 	. 
	ld (hl),01bh		;846e	36 1b 	6 . 
	dec de			;8470	1b 	. 
	nop			;8471	00 	. 
	nop			;8472	00 	. 
	nop			;8473	00 	. 
	nop			;8474	00 	. 
	nop			;8475	00 	. 
	nop			;8476	00 	. 
	ld l,h			;8477	6c 	l 
	ld l,h			;8478	6c 	l 
l8479h:
	ld (hl),07fh		;8479	36 7f 	6  
	ld a,036h		;847b	3e 36 	> 6 
	ld a,a			;847d	7f 	 
	ld l,c			;847e	69 	i 
	ld a,a			;847f	7f 	 
	ld a,00ch		;8480	3e 0c 	> . 
	inc c			;8482	0c 	. 
	nop			;8483	00 	. 
	nop			;8484	00 	. 
l8485h:
	nop			;8485	00 	. 
	jr nc,l84b8h		;8486	30 30 	0 0 
	ld a,h			;8488	7c 	| 
	cp 096h		;8489	fe 96 	. . 
l848bh:
	ld d,03ch		;848b	16 3c 	. < 
l848dh:
	ld a,b			;848d	78 	x 
	ld (hl),07bh		;848e	36 7b 	6 { 
	ld a,e			;8490	7b 	{ 
	ld sp,00000h		;8491	31 00 00 	1 . . 
	nop			;8494	00 	. 
	nop			;8495	00 	. 
	call z,sub_7edeh		;8496	cc de 7e 	. . ~ 
	ld l,h			;8499	6c 	l 
	jr nc,l84b8h		;849a	30 1c 	0 . 
	inc c			;849c	0c 	. 
	ld b,07bh		;849d	06 7b 	. { 
	inc sp			;849f	33 	3 
	ld e,(hl)			;84a0	5e 	^ 
	inc c			;84a1	0c 	. 
	nop			;84a2	00 	. 
	nop			;84a3	00 	. 
	nop			;84a4	00 	. 
	nop			;84a5	00 	. 
	inc e			;84a6	1c 	. 
	ld a,036h		;84a7	3e 36 	> 6 
	ld e,00ch		;84a9	1e 0c 	. . 
	ld b,007h		;84ab	06 07 	. . 
	ld l,a			;84ad	6f 	o 
	nop			;84ae	00 	. 
	nop			;84af	00 	. 
	nop			;84b0	00 	. 
	nop			;84b1	00 	. 
	nop			;84b2	00 	. 
	nop			;84b3	00 	. 
	nop			;84b4	00 	. 
	nop			;84b5	00 	. 
	jr c,l84f0h		;84b6	38 38 	8 8 
l84b8h:
	jr nc,l84d2h		;84b8	30 18 	0 . 
	inc c			;84ba	0c 	. 
	nop			;84bb	00 	. 
	nop			;84bc	00 	. 
	nop			;84bd	00 	. 
	inc c			;84be	0c 	. 
	inc c			;84bf	0c 	. 
	jr l84f2h		;84c0	18 30 	. 0 
	nop			;84c2	00 	. 
	nop			;84c3	00 	. 
	nop			;84c4	00 	. 
	nop			;84c5	00 	. 
	ld h,b			;84c6	60 	` 
	jr nc,l84e1h		;84c7	30 18 	0 . 
	jr 14		;84c9	18 0c 	. . 
	inc c			;84cb	0c 	. 
	inc c			;84cc	0c 	. 
	inc c			;84cd	0c 	. 
	inc c			;84ce	0c 	. 
	inc c			;84cf	0c 	. 
	ld b,003h		;84d0	06 03 	. . 
l84d2h:
	nop			;84d2	00 	. 
	nop			;84d3	00 	. 
	nop			;84d4	00 	. 
	nop			;84d5	00 	. 
	ld b,00ch		;84d6	06 0c 	. . 
	jr l84f2h		;84d8	18 18 	. . 
	jr l84f4h		;84da	18 18 	. . 
	jr l84f6h		;84dc	18 18 	. . 
	ld a,06bh		;84de	3e 6b 	> k 
	ex af,af'			;84e0	08 	. 
l84e1h:
	nop			;84e1	00 	. 
	nop			;84e2	00 	. 
	nop			;84e3	00 	. 
	nop			;84e4	00 	. 
	nop			;84e5	00 	. 
	nop			;84e6	00 	. 
	nop			;84e7	00 	. 
	ex af,af'			;84e8	08 	. 
	ld l,e			;84e9	6b 	k 
	ld a,01ch		;84ea	3e 1c 	> . 
	ex af,af'			;84ec	08 	. 
	inc e			;84ed	1c 	. 
	inc c			;84ee	0c 	. 
	inc c			;84ef	0c 	. 
l84f0h:
	ld b,006h		;84f0	06 06 	. . 
l84f2h:
	nop			;84f2	00 	. 
	nop			;84f3	00 	. 
l84f4h:
	nop			;84f4	00 	. 
	nop			;84f5	00 	. 
l84f6h:
	nop			;84f6	00 	. 
	nop			;84f7	00 	. 
	jr nc,l852ah		;84f8	30 30 	0 0 
	jr l8514h		;84fa	18 18 	. . 
	ld a,a			;84fc	7f 	 
	ld a,a			;84fd	7f 	 
	inc e			;84fe	1c 	. 
	inc e			;84ff	1c 	. 
	jr l850eh		;8500	18 0c 	. . 
	ld b,000h		;8502	06 00 	. . 
	nop			;8504	00 	. 
	nop			;8505	00 	. 
	nop			;8506	00 	. 
	nop			;8507	00 	. 
	nop			;8508	00 	. 
	nop			;8509	00 	. 
	nop			;850a	00 	. 
	nop			;850b	00 	. 
	nop			;850c	00 	. 
	nop			;850d	00 	. 
l850eh:
	nop			;850e	00 	. 
	nop			;850f	00 	. 
	nop			;8510	00 	. 
	nop			;8511	00 	. 
	nop			;8512	00 	. 
	nop			;8513	00 	. 
l8514h:
	nop			;8514	00 	. 
	nop			;8515	00 	. 
	nop			;8516	00 	. 
	nop			;8517	00 	. 
	nop			;8518	00 	. 
	nop			;8519	00 	. 
	nop			;851a	00 	. 
	nop			;851b	00 	. 
	ld a,03eh		;851c	3e 3e 	> > 
	nop			;851e	00 	. 
	inc e			;851f	1c 	. 
	inc e			;8520	1c 	. 
	inc e			;8521	1c 	. 
	nop			;8522	00 	. 
	nop			;8523	00 	. 
	nop			;8524	00 	. 
	nop			;8525	00 	. 
	nop			;8526	00 	. 
	nop			;8527	00 	. 
	nop			;8528	00 	. 
	nop			;8529	00 	. 
l852ah:
	nop			;852a	00 	. 
	nop			;852b	00 	. 
	nop			;852c	00 	. 
	nop			;852d	00 	. 
	inc c			;852e	0c 	. 
	ld b,006h		;852f	06 06 	. . 
	inc bc			;8531	03 	. 
	inc bc			;8532	03 	. 
	nop			;8533	00 	. 
	nop			;8534	00 	. 
	nop			;8535	00 	. 
	ld b,b			;8536	40 	@ 
	ld h,b			;8537	60 	` 
	ld h,b			;8538	60 	` 
	jr nc,l856bh		;8539	30 30 	0 0 
	jr l8555h		;853b	18 18 	. . 
	inc c			;853d	0c 	. 
	scf			;853e	37 	7 
	scf			;853f	37 	7 
	ccf			;8540	3f 	? 
	ld e,000h		;8541	1e 00 	. . 
	nop			;8543	00 	. 
	nop			;8544	00 	. 
	nop			;8545	00 	. 
	ld a,b			;8546	78 	x 
	call m,0ecech		;8547	fc ec ec 	. . . 
	halt			;854a	76 	v 
	halt			;854b	76 	v 
	ld l,(hl)			;854c	6e 	n 
	ld l,(hl)			;854d	6e 	n 
	jr l8568h		;854e	18 18 	. . 
	ld a,03eh		;8550	3e 3e 	> > 
	nop			;8552	00 	. 
	nop			;8553	00 	. 
	nop			;8554	00 	. 
l8555h:
	nop			;8555	00 	. 
	ld (hl),b			;8556	70 	p 
	ld a,b			;8557	78 	x 
	ld l,h			;8558	6c 	l 
	ld h,b			;8559	60 	` 
	jr nc,l858ch		;855a	30 30 	0 0 
	jr nc,l8576h		;855c	30 18 	0 . 
	ld b,043h		;855e	06 43 	. C 
	ld a,a			;8560	7f 	 
	ccf			;8561	3f 	? 
	nop			;8562	00 	. 
	nop			;8563	00 	. 
	nop			;8564	00 	. 
	nop			;8565	00 	. 
	jr c,l85e4h		;8566	38 7c 	8 | 
l8568h:
	add a,0c6h		;8568	c6 c6 	. . 
	ld h,b			;856a	60 	` 
l856bh:
	jr nc,l8585h		;856b	30 18 	0 . 
	inc c			;856d	0c 	. 
	ld h,b			;856e	60 	` 
	ld sp,00e1fh		;856f	31 1f 0e 	1 . . 
	nop			;8572	00 	. 
	nop			;8573	00 	. 
	nop			;8574	00 	. 
	nop			;8575	00 	. 
l8576h:
	jr c,l85f4h		;8576	38 7c 	8 | 
	add a,0c0h		;8578	c6 c0 	. . 
	ld h,b			;857a	60 	` 
	jr c,l85ddh		;857b	38 60 	8 ` 
	ld h,b			;857d	60 	` 
	jr 26		;857e	18 18 	. . 
	jr 26		;8580	18 18 	. . 
	nop			;8582	00 	. 
	nop			;8583	00 	. 
	nop			;8584	00 	. 
l8585h:
	nop			;8585	00 	. 
	ld h,b			;8586	60 	` 
	ld (hl),b			;8587	70 	p 
	ld a,b			;8588	78 	x 
	inc a			;8589	3c 	< 
	ld (hl),07fh		;858a	36 7f 	6  
l858ch:
	ld a,a			;858c	7f 	 
	jr nc,l85efh		;858d	30 60 	0 ` 
	ld h,e			;858f	63 	c 
	ccf			;8590	3f 	? 
	ld e,000h		;8591	1e 00 	. . 
	nop			;8593	00 	. 
	nop			;8594	00 	. 
	nop			;8595	00 	. 
	call m,00cfch		;8596	fc fc 0c 	. . . 
	ld b,006h		;8599	06 06 	. . 
	ld a,07ch		;859b	3e 7c 	> | 
	ld h,b			;859d	60 	` 
	ld h,e			;859e	63 	c 
	ld h,e			;859f	63 	c 
	ld a,01ch		;85a0	3e 1c 	> . 
	nop			;85a2	00 	. 
	nop			;85a3	00 	. 
	nop			;85a4	00 	. 
	nop			;85a5	00 	. 
	jr nc,l85c0h		;85a6	30 18 	0 . 
	inc c			;85a8	0c 	. 
	ld b,006h		;85a9	06 06 	. . 
	rra			;85ab	1f 	. 
	ccf			;85ac	3f 	? 
	ld h,e			;85ad	63 	c 
	jr l85c8h		;85ae	18 18 	. . 
	inc c			;85b0	0c 	. 
	inc c			;85b1	0c 	. 
	nop			;85b2	00 	. 
	nop			;85b3	00 	. 
	nop			;85b4	00 	. 
	nop			;85b5	00 	. 
	call m,0c6fch		;85b6	fc fc c6 	. . . 
	add a,060h		;85b9	c6 60 	. ` 
	ld h,b			;85bb	60 	` 
	jr nc,l85eeh		;85bc	30 30 	0 0 
	ld h,e			;85be	63 	c 
	ld h,e			;85bf	63 	c 
l85c0h:
	ld a,01ch		;85c0	3e 1c 	> . 
	nop			;85c2	00 	. 
	nop			;85c3	00 	. 
	nop			;85c4	00 	. 
	nop			;85c5	00 	. 
	jr c,l8644h		;85c6	38 7c 	8 | 
l85c8h:
	add a,0c6h		;85c8	c6 c6 	. . 
	ld a,h			;85ca	7c 	| 
	inc a			;85cb	3c 	< 
	ld (hl),063h		;85cc	36 63 	6 c 
	jr nc,l85e8h		;85ce	30 18 	0 . 
	ld c,006h		;85d0	0e 06 	. . 
	nop			;85d2	00 	. 
	nop			;85d3	00 	. 
	nop			;85d4	00 	. 
	nop			;85d5	00 	. 
	jr c,l8654h		;85d6	38 7c 	8 | 
	add a,0c6h		;85d8	c6 c6 	. . 
	add a,07eh		;85da	c6 7e 	. ~ 
	ld a,h			;85dc	7c 	| 
l85ddh:
	ld h,b			;85dd	60 	` 
	inc e			;85de	1c 	. 
	inc e			;85df	1c 	. 
	inc e			;85e0	1c 	. 
	nop			;85e1	00 	. 
	nop			;85e2	00 	. 
	nop			;85e3	00 	. 
l85e4h:
	nop			;85e4	00 	. 
	nop			;85e5	00 	. 
	nop			;85e6	00 	. 
	nop			;85e7	00 	. 
l85e8h:
	nop			;85e8	00 	. 
	jr c,l8623h		;85e9	38 38 	8 8 
	jr c,l85edh		;85eb	38 00 	8 . 
l85edh:
	nop			;85ed	00 	. 
l85eeh:
	inc e			;85ee	1c 	. 
l85efh:
	inc e			;85ef	1c 	. 
	jr l85feh		;85f0	18 0c 	. . 
	ld b,000h		;85f2	06 00 	. . 
l85f4h:
	nop			;85f4	00 	. 
	nop			;85f5	00 	. 
	nop			;85f6	00 	. 
	nop			;85f7	00 	. 
	nop			;85f8	00 	. 
	jr c,l8633h		;85f9	38 38 	8 8 
	jr c,l85fdh		;85fb	38 00 	8 . 
l85fdh:
	nop			;85fd	00 	. 
l85feh:
	ld b,00ch		;85fe	06 0c 	. . 
	jr l8632h		;8600	18 30 	. 0 
	ld h,b			;8602	60 	` 
	ld b,b			;8603	40 	@ 
	nop			;8604	00 	. 
	nop			;8605	00 	. 
	ld b,b			;8606	40 	@ 
	ld h,b			;8607	60 	` 
	jr nc,26		;8608	30 18 	0 . 
	inc c			;860a	0c 	. 
	ld b,003h		;860b	06 03 	. . 
	inc bc			;860d	03 	. 
	ld a,(hl)			;860e	7e 	~ 
	nop			;860f	00 	. 
	nop			;8610	00 	. 
	nop			;8611	00 	. 
	nop			;8612	00 	. 
	nop			;8613	00 	. 
	nop			;8614	00 	. 
	nop			;8615	00 	. 
	nop			;8616	00 	. 
	nop			;8617	00 	. 
	nop			;8618	00 	. 
	ld a,(hl)			;8619	7e 	~ 
	ld a,(hl)			;861a	7e 	~ 
	nop			;861b	00 	. 
	nop			;861c	00 	. 
	ld a,(hl)			;861d	7e 	~ 
	jr nc,l8638h		;861e	30 18 	0 . 
	inc c			;8620	0c 	. 
	ld b,003h		;8621	06 03 	. . 
l8623h:
	nop			;8623	00 	. 
	nop			;8624	00 	. 
	nop			;8625	00 	. 
	ld b,00ch		;8626	06 0c 	. . 
	jr 50		;8628	18 30 	. 0 
	ld h,b			;862a	60 	` 
	ret nz			;862b	c0 	. 
	ret nz			;862c	c0 	. 
	ld h,b			;862d	60 	` 
	inc c			;862e	0c 	. 
	nop			;862f	00 	. 
	inc c			;8630	0c 	. 
	inc c			;8631	0c 	. 
l8632h:
	nop			;8632	00 	. 
l8633h:
	nop			;8633	00 	. 
	nop			;8634	00 	. 
	nop			;8635	00 	. 
	jr c,l86b4h		;8636	38 7c 	8 | 
l8638h:
	add a,0c6h		;8638	c6 c6 	. . 
	ld h,b			;863a	60 	` 
	jr nc,l8655h		;863b	30 18 	0 . 
	inc c			;863d	0c 	. 
	ld (hl),e			;863e	73 	s 
	ld (hl),e			;863f	73 	s 
	ld a,a			;8640	7f 	 
	xor (hl)			;8641	ae 	. 
	nop			;8642	00 	. 
	nop			;8643	00 	. 
l8644h:
	nop			;8644	00 	. 
	nop			;8645	00 	. 
	jr c,l86c4h		;8646	38 7c 	8 | 
	add a,0c0h		;8648	c6 c0 	. . 
	ret po			;864a	e0 	. 
	call c,sub_73deh		;864b	dc de 73 	. . s 
	ld h,(hl)			;864e	66 	f 
	inc sp			;864f	33 	3 
	inc sp			;8650	33 	3 
	inc sp			;8651	33 	3 
	nop			;8652	00 	. 
	nop			;8653	00 	. 
l8654h:
	nop			;8654	00 	. 
l8655h:
	nop			;8655	00 	. 
	jr nc,l86d0h		;8656	30 78 	0 x 
	ret c			;8658	d8 	. 
	call z,0cccch		;8659	cc cc cc 	. . . 
	ld a,h			;865c	7c 	| 
	ld h,(hl)			;865d	66 	f 
	ld h,(hl)			;865e	66 	f 
	ld h,e			;865f	63 	c 
	ccf			;8660	3f 	? 
	rra			;8661	1f 	. 
	nop			;8662	00 	. 
	nop			;8663	00 	. 
	nop			;8664	00 	. 
	nop			;8665	00 	. 
	ld a,07ch		;8666	3e 7c 	> | 
	call z,sub_7ccch		;8668	cc cc 7c 	. . | 
	inc a			;866b	3c 	< 
	ld (hl),066h		;866c	36 66 	6 f 
	inc bc			;866e	03 	. 
	ld h,e			;866f	63 	c 
	ld a,01ch		;8670	3e 1c 	> . 
	nop			;8672	00 	. 
	nop			;8673	00 	. 
	nop			;8674	00 	. 
	nop			;8675	00 	. 
	jr c,l86f4h		;8676	38 7c 	8 | 
	add a,0c6h		;8678	c6 c6 	. . 
	inc bc			;867a	03 	. 
	inc bc			;867b	03 	. 
	inc bc			;867c	03 	. 
	inc bc			;867d	03 	. 
	ld h,(hl)			;867e	66 	f 
	ld h,(hl)			;867f	66 	f 
	ld a,01fh		;8680	3e 1f 	> . 
	nop			;8682	00 	. 
	nop			;8683	00 	. 
	nop			;8684	00 	. 
	nop			;8685	00 	. 
	inc a			;8686	3c 	< 
	ld a,b			;8687	78 	x 
	call z,0cccch		;8688	cc cc cc 	. . . 
	call z,sub_6666h		;868b	cc 66 66 	. f f 
	ld b,003h		;868e	06 03 	. . 
	ccf			;8690	3f 	? 
	ccf			;8691	3f 	? 
	nop			;8692	00 	. 
	nop			;8693	00 	. 
	nop			;8694	00 	. 
	nop			;8695	00 	. 
	ret m			;8696	f8 	. 
	call m,00c0ch		;8697	fc 0c 0c 	. . . 
	inc a			;869a	3c 	< 
	inc a			;869b	3c 	< 
	ld b,006h		;869c	06 06 	. . 
	ld b,003h		;869e	06 03 	. . 
	inc bc			;86a0	03 	. 
	inc bc			;86a1	03 	. 
	nop			;86a2	00 	. 
	nop			;86a3	00 	. 
	nop			;86a4	00 	. 
	nop			;86a5	00 	. 
	ret m			;86a6	f8 	. 
	call m,00c0ch		;86a7	fc 0c 0c 	. . . 
	inc c			;86aa	0c 	. 
	inc a			;86ab	3c 	< 
	ld a,006h		;86ac	3e 06 	> . 
	ld h,e			;86ae	63 	c 
	inc sp			;86af	33 	3 
	ld a,01ch		;86b0	3e 1c 	> . 
	nop			;86b2	00 	. 
	nop			;86b3	00 	. 
l86b4h:
	nop			;86b4	00 	. 
	nop			;86b5	00 	. 
	jr nc,l8730h		;86b6	30 78 	0 x 
	call z,006cch		;86b8	cc cc 06 	. . . 
	ld b,076h		;86bb	06 76 	. v 
	ld h,e			;86bd	63 	c 
	inc sp			;86be	33 	3 
	inc sp			;86bf	33 	3 
	inc sp			;86c0	33 	3 
	inc sp			;86c1	33 	3 
	nop			;86c2	00 	. 
	nop			;86c3	00 	. 
l86c4h:
	nop			;86c4	00 	. 
	nop			;86c5	00 	. 
	call z,0cccch		;86c6	cc cc cc 	. . . 
	ld h,(hl)			;86c9	66 	f 
	ld h,(hl)			;86ca	66 	f 
	ld a,(hl)			;86cb	7e 	~ 
	ld a,(hl)			;86cc	7e 	~ 
	inc sp			;86cd	33 	3 
	jr l86e8h		;86ce	18 18 	. . 
l86d0h:
	inc a			;86d0	3c 	< 
	inc a			;86d1	3c 	< 
	nop			;86d2	00 	. 
	nop			;86d3	00 	. 
	nop			;86d4	00 	. 
	nop			;86d5	00 	. 
	ret p			;86d6	f0 	. 
	ret p			;86d7	f0 	. 
	ld h,b			;86d8	60 	` 
	ld h,b			;86d9	60 	` 
	jr nc,l870ch		;86da	30 30 	0 0 
	jr nc,l870eh		;86dc	30 30 	0 0 
	jr 29		;86de	18 1b 	. . 
	rra			;86e0	1f 	. 
	ld c,000h		;86e1	0e 00 	. . 
	nop			;86e3	00 	. 
	nop			;86e4	00 	. 
	nop			;86e5	00 	. 
	ret p			;86e6	f0 	. 
	ret p			;86e7	f0 	. 
l86e8h:
	ld h,b			;86e8	60 	` 
	ld h,b			;86e9	60 	` 
	jr nc,l871ch		;86ea	30 30 	0 0 
	jr nc,l871eh		;86ec	30 30 	0 0 
	dec de			;86ee	1b 	. 
	dec de			;86ef	1b 	. 
	inc sp			;86f0	33 	3 
	inc sp			;86f1	33 	3 
	nop			;86f2	00 	. 
	nop			;86f3	00 	. 
l86f4h:
	nop			;86f4	00 	. 
	nop			;86f5	00 	. 
	call z,sub_3c6ch		;86f6	cc 6c 3c 	. l < 
	inc a			;86f9	3c 	< 
	ld d,00eh		;86fa	16 0e 	. . 
	ld c,00eh		;86fc	0e 0e 	. . 
	ld b,006h		;86fe	06 06 	. . 
	ld a,(hl)			;8700	7e 	~ 
	ld a,(hl)			;8701	7e 	~ 
	nop			;8702	00 	. 
	nop			;8703	00 	. 
	nop			;8704	00 	. 
	nop			;8705	00 	. 
	jr l8720h		;8706	18 18 	. . 
	jr l8722h		;8708	18 18 	. . 
	inc c			;870a	0c 	. 
	inc c			;870b	0c 	. 
l870ch:
	inc c			;870c	0c 	. 
	inc c			;870d	0c 	. 
l870eh:
	inc sp			;870e	33 	3 
	inc sp			;870f	33 	3 
	inc sp			;8710	33 	3 
	inc sp			;8711	33 	3 
	nop			;8712	00 	. 
	nop			;8713	00 	. 
	nop			;8714	00 	. 
	nop			;8715	00 	. 
	call z,0fccch		;8716	cc cc fc 	. . . 
	call m,sub_56d6h		;8719	fc d6 56 	. . V 
l871ch:
	ld h,(hl)			;871c	66 	f 
	ld h,(hl)			;871d	66 	f 
l871eh:
	dec sp			;871e	3b 	; 
	dec sp			;871f	3b 	; 
l8720h:
	inc sp			;8720	33 	3 
	inc sp			;8721	33 	3 
l8722h:
	nop			;8722	00 	. 
	nop			;8723	00 	. 
	nop			;8724	00 	. 
	nop			;8725	00 	. 
	call z,0cccch		;8726	cc cc cc 	. . . 
	call z,sub_6e6eh		;8729	cc 6e 6e 	. n n 
	ld l,(hl)			;872c	6e 	n 
	ld l,(hl)			;872d	6e 	n 
	inc sp			;872e	33 	3 
	inc sp			;872f	33 	3 
l8730h:
	ccf			;8730	3f 	? 
	ld e,000h		;8731	1e 00 	. . 
	nop			;8733	00 	. 
	nop			;8734	00 	. 
	nop			;8735	00 	. 
	ld a,b			;8736	78 	x 
	call m,0cccch		;8737	fc cc cc 	. . . 
	ld h,(hl)			;873a	66 	f 
	ld h,(hl)			;873b	66 	f 
	ld h,(hl)			;873c	66 	f 
	ld h,(hl)			;873d	66 	f 
	inc bc			;873e	03 	. 
	inc bc			;873f	03 	. 
	inc bc			;8740	03 	. 
	inc bc			;8741	03 	. 
	nop			;8742	00 	. 
	nop			;8743	00 	. 
	nop			;8744	00 	. 
	nop			;8745	00 	. 
	ld a,07ch		;8746	3e 7c 	> | 
	call z,0c6cch		;8748	cc cc c6 	. . . 
	ld a,(hl)			;874b	7e 	~ 
	ld a,006h		;874c	3e 06 	> . 
	dec sp			;874e	3b 	; 
	scf			;874f	37 	7 
	ld a,(hl)			;8750	7e 	~ 
	ld e,h			;8751	5c 	\ 
	nop			;8752	00 	. 
	nop			;8753	00 	. 
	nop			;8754	00 	. 
	nop			;8755	00 	. 
	jr c,l87d4h		;8756	38 7c 	8 | 
	call z,0e6cch		;8758	cc cc e6 	. . . 
	ld h,(hl)			;875b	66 	f 
	ld h,(hl)			;875c	66 	f 
	ld h,e			;875d	63 	c 
	inc sp			;875e	33 	3 
	inc sp			;875f	33 	3 
	ld h,e			;8760	63 	c 
	ld h,e			;8761	63 	c 
	nop			;8762	00 	. 
	nop			;8763	00 	. 
	nop			;8764	00 	. 
	nop			;8765	00 	. 
	inc a			;8766	3c 	< 
	ld a,h			;8767	7c 	| 
	call z,sub_66cch		;8768	cc cc 66 	. . f 
	ld a,01eh		;876b	3e 1e 	> . 
	ld e,063h		;876d	1e 63 	. c 
	ld h,e			;876f	63 	c 
	ld a,01ch		;8770	3e 1c 	> . 
	nop			;8772	00 	. 
	nop			;8773	00 	. 
	nop			;8774	00 	. 
	nop			;8775	00 	. 
	ld (hl),b			;8776	70 	p 
	ret m			;8777	f8 	. 
	call z,00c0ch		;8778	cc 0c 0c 	. . . 
	jr l87adh		;877b	18 30 	. 0 
	ld h,b			;877d	60 	` 
	inc c			;877e	0c 	. 
	inc c			;877f	0c 	. 
	inc c			;8780	0c 	. 
	inc c			;8781	0c 	. 
	nop			;8782	00 	. 
	nop			;8783	00 	. 
	nop			;8784	00 	. 
	nop			;8785	00 	. 
	call m,030fch		;8786	fc fc 30 	. . 0 
	jr nc,l87a3h		;8789	30 18 	0 . 
	jr l87a5h		;878b	18 18 	. . 
	jr l87c2h		;878d	18 33 	. 3 
	inc sp			;878f	33 	3 
	ccf			;8790	3f 	? 
	ld e,000h		;8791	1e 00 	. . 
	nop			;8793	00 	. 
	nop			;8794	00 	. 
	nop			;8795	00 	. 
	call z,0cccch		;8796	cc cc cc 	. . . 
	call z,sub_6666h		;8799	cc 66 66 	. f f 
	ld h,(hl)			;879c	66 	f 
	ld h,(hl)			;879d	66 	f 
	inc a			;879e	3c 	< 
	inc a			;879f	3c 	< 
	jr l87aah		;87a0	18 08 	. . 
	nop			;87a2	00 	. 
l87a3h:
	nop			;87a3	00 	. 
	nop			;87a4	00 	. 
l87a5h:
	nop			;87a5	00 	. 
	add a,0c6h		;87a6	c6 c6 	. . 
	add a,0c6h		;87a8	c6 c6 	. . 
l87aah:
	ld h,(hl)			;87aa	66 	f 
	ld h,(hl)			;87ab	66 	f 
	ld h,(hl)			;87ac	66 	f 
l87adh:
	ld l,h			;87ad	6c 	l 
	ld a,a			;87ae	7f 	 
	scf			;87af	37 	7 
	inc sp			;87b0	33 	3 
	inc sp			;87b1	33 	3 
	nop			;87b2	00 	. 
	nop			;87b3	00 	. 
	nop			;87b4	00 	. 
	nop			;87b5	00 	. 
	call z,0cccch		;87b6	cc cc cc 	. . . 
	add a,0d6h		;87b9	c6 d6 	. . 
	ld d,(hl)			;87bb	56 	V 
	halt			;87bc	76 	v 
	ld a,a			;87bd	7f 	 
	ld h,(hl)			;87be	66 	f 
	ld h,(hl)			;87bf	66 	f 
	ld h,e			;87c0	63 	c 
	ld h,e			;87c1	63 	c 
l87c2h:
	nop			;87c2	00 	. 
	nop			;87c3	00 	. 
	nop			;87c4	00 	. 
	nop			;87c5	00 	. 
	call z,06ccch		;87c6	cc cc 6c 	. . l 
	ld a,b			;87c9	78 	x 
	jr c,18		;87ca	38 10 	8 . 
	jr c,l880ah		;87cc	38 3c 	8 < 
	jr nc,l8800h		;87ce	30 30 	0 0 
	jr l87eah		;87d0	18 18 	. . 
	nop			;87d2	00 	. 
	nop			;87d3	00 	. 
l87d4h:
	nop			;87d4	00 	. 
	nop			;87d5	00 	. 
	add a,0c6h		;87d6	c6 c6 	. . 
	call z,06c6ch		;87d8	cc 6c 6c 	. l l 
	jr c,l8815h		;87db	38 38 	8 8 
	jr nc,l87ebh		;87dd	30 0c 	0 . 
	ld b,03fh		;87df	06 3f 	. ? 
	ccf			;87e1	3f 	? 
	nop			;87e2	00 	. 
	nop			;87e3	00 	. 
	nop			;87e4	00 	. 
	nop			;87e5	00 	. 
	call m,0c0fch		;87e6	fc fc c0 	. . . 
	ret nz			;87e9	c0 	. 
l87eah:
	ld h,b			;87ea	60 	` 
l87ebh:
	jr nc,l8805h		;87eb	30 18 	0 . 
	jr l87f5h		;87ed	18 06 	. . 
	ld b,006h		;87ef	06 06 	. . 
	ld a,03eh		;87f1	3e 3e 	> > 
	nop			;87f3	00 	. 
	nop			;87f4	00 	. 
l87f5h:
	nop			;87f5	00 	. 
	ret p			;87f6	f0 	. 
	ret p			;87f7	f0 	. 
	jr l8812h		;87f8	18 18 	. . 
	inc c			;87fa	0c 	. 
	inc c			;87fb	0c 	. 
	inc c			;87fc	0c 	. 
	inc c			;87fd	0c 	. 
	jr nc,l8830h		;87fe	30 30 	0 0 
l8800h:
	jr nc,l8832h		;8800	30 30 	0 0 
	jr nc,l8804h		;8802	30 00 	0 . 
l8804h:
	nop			;8804	00 	. 
l8805h:
	nop			;8805	00 	. 
	ld b,006h		;8806	06 06 	. . 
	ld b,00ch		;8808	06 0c 	. . 
l880ah:
	inc c			;880a	0c 	. 
	jr l8825h		;880b	18 18 	. . 
	jr nc,14		;880d	30 0c 	0 . 
	inc c			;880f	0c 	. 
	inc c			;8810	0c 	. 
	rrca			;8811	0f 	. 
l8812h:
	rrca			;8812	0f 	. 
	nop			;8813	00 	. 
	nop			;8814	00 	. 
l8815h:
	nop			;8815	00 	. 
	inc a			;8816	3c 	< 
	inc a			;8817	3c 	< 
	jr nc,50		;8818	30 30 	0 0 
	jr l8834h		;881a	18 18 	. . 
	jr l8836h		;881c	18 18 	. . 
	nop			;881e	00 	. 
	nop			;881f	00 	. 
	nop			;8820	00 	. 
	nop			;8821	00 	. 
	nop			;8822	00 	. 
	nop			;8823	00 	. 
	nop			;8824	00 	. 
l8825h:
	nop			;8825	00 	. 
	djnz l8860h		;8826	10 38 	. 8 
	ld l,h			;8828	6c 	l 
	add a,082h		;8829	c6 82 	. . 
	nop			;882b	00 	. 
	nop			;882c	00 	. 
	nop			;882d	00 	. 
	nop			;882e	00 	. 
	nop			;882f	00 	. 
l8830h:
	nop			;8830	00 	. 
	nop			;8831	00 	. 
l8832h:
	nop			;8832	00 	. 
	rst 38h			;8833	ff 	. 
l8834h:
	rst 38h			;8834	ff 	. 
	nop			;8835	00 	. 
l8836h:
	nop			;8836	00 	. 
	nop			;8837	00 	. 
	nop			;8838	00 	. 
	nop			;8839	00 	. 
	nop			;883a	00 	. 
	nop			;883b	00 	. 
	nop			;883c	00 	. 
	nop			;883d	00 	. 
	nop			;883e	00 	. 
	nop			;883f	00 	. 
	nop			;8840	00 	. 
	nop			;8841	00 	. 
	nop			;8842	00 	. 
	nop			;8843	00 	. 
	nop			;8844	00 	. 
	nop			;8845	00 	. 
	inc e			;8846	1c 	. 
	inc e			;8847	1c 	. 
	inc c			;8848	0c 	. 
	jr l887bh		;8849	18 30 	. 0 
	nop			;884b	00 	. 
	nop			;884c	00 	. 
	nop			;884d	00 	. 
	inc sp			;884e	33 	3 
	inc sp			;884f	33 	3 
	ld a,a			;8850	7f 	 
	ld e,(hl)			;8851	5e 	^ 
	nop			;8852	00 	. 
	nop			;8853	00 	. 
	nop			;8854	00 	. 
	nop			;8855	00 	. 
	nop			;8856	00 	. 
	nop			;8857	00 	. 
	nop			;8858	00 	. 
	inc a			;8859	3c 	< 
	ld a,h			;885a	7c 	| 
	ld h,b			;885b	60 	` 
	ld a,h			;885c	7c 	| 
	ld a,(hl)			;885d	7e 	~ 
	inc sp			;885e	33 	3 
	inc sp			;885f	33 	3 
l8860h:
	ccf			;8860	3f 	? 
	dec e			;8861	1d 	. 
	nop			;8862	00 	. 
	nop			;8863	00 	. 
	nop			;8864	00 	. 
	nop			;8865	00 	. 
	inc c			;8866	0c 	. 
	inc c			;8867	0c 	. 
	inc c			;8868	0c 	. 
	inc a			;8869	3c 	< 
	ld a,(hl)			;886a	7e 	~ 
	ld h,(hl)			;886b	66 	f 
	ld h,(hl)			;886c	66 	f 
	ld h,(hl)			;886d	66 	f 
	inc bc			;886e	03 	. 
	ld h,e			;886f	63 	c 
	ld a,01ch		;8870	3e 1c 	> . 
	nop			;8872	00 	. 
	nop			;8873	00 	. 
	nop			;8874	00 	. 
	nop			;8875	00 	. 
	nop			;8876	00 	. 
	nop			;8877	00 	. 
	nop			;8878	00 	. 
	jr c,126		;8879	38 7c 	8 | 
l887bh:
	ld h,(hl)			;887b	66 	f 
	ld b,003h		;887c	06 03 	. . 
	ld (hl),036h		;887e	36 36 	6 6 
	ld a,03ch		;8880	3e 3c 	> < 
	nop			;8882	00 	. 
	nop			;8883	00 	. 
	nop			;8884	00 	. 
	nop			;8885	00 	. 
	ret nz			;8886	c0 	. 
	ret nz			;8887	c0 	. 
	ret nz			;8888	c0 	. 
	ret m			;8889	f8 	. 
	ld a,h			;888a	7c 	| 
	ld l,h			;888b	6c 	l 
	ld h,(hl)			;888c	66 	f 
	ld h,(hl)			;888d	66 	f 
	inc bc			;888e	03 	. 
	inc hl			;888f	23 	# 
	ccf			;8890	3f 	? 
	ld e,000h		;8891	1e 00 	. . 
	nop			;8893	00 	. 
	nop			;8894	00 	. 
	nop			;8895	00 	. 
	nop			;8896	00 	. 
	nop			;8897	00 	. 
	nop			;8898	00 	. 
	jr c,l8917h		;8899	38 7c 	8 | 
	ld h,(hl)			;889b	66 	f 
	ld a,(hl)			;889c	7e 	~ 
	ld a,018h		;889d	3e 18 	> . 
	inc c			;889f	0c 	. 
	inc c			;88a0	0c 	. 
	inc c			;88a1	0c 	. 
	nop			;88a2	00 	. 
	nop			;88a3	00 	. 
	nop			;88a4	00 	. 
	nop			;88a5	00 	. 
	ld h,b			;88a6	60 	` 
	ret p			;88a7	f0 	. 
	or b			;88a8	b0 	. 
	jr nc,l8927h		;88a9	30 7c 	0 | 
	ld a,h			;88ab	7c 	| 
	jr l88c6h		;88ac	18 18 	. . 
	inc c			;88ae	0c 	. 
	ld a,063h		;88af	3e 63 	> c 
	ld a,a			;88b1	7f 	 
	ld a,000h		;88b2	3e 00 	> . 
	nop			;88b4	00 	. 
	nop			;88b5	00 	. 
	nop			;88b6	00 	. 
	nop			;88b7	00 	. 
	add a,b			;88b8	80 	. 
	cp b			;88b9	b8 	. 
	ld a,h			;88ba	7c 	| 
	ld l,h			;88bb	6c 	l 
	inc a			;88bc	3c 	< 
	jr l88f2h		;88bd	18 33 	. 3 
	inc sp			;88bf	33 	3 
	inc sp			;88c0	33 	3 
	inc sp			;88c1	33 	3 
	nop			;88c2	00 	. 
	nop			;88c3	00 	. 
	nop			;88c4	00 	. 
	nop			;88c5	00 	. 
l88c6h:
	inc c			;88c6	0c 	. 
	inc c			;88c7	0c 	. 
	inc c			;88c8	0c 	. 
	inc a			;88c9	3c 	< 
	ld a,(hl)			;88ca	7e 	~ 
	ld h,(hl)			;88cb	66 	f 
	ld h,(hl)			;88cc	66 	f 
	ld h,(hl)			;88cd	66 	f 
	inc c			;88ce	0c 	. 
	inc c			;88cf	0c 	. 
	inc c			;88d0	0c 	. 
	inc c			;88d1	0c 	. 
	nop			;88d2	00 	. 
	nop			;88d3	00 	. 
	nop			;88d4	00 	. 
	nop			;88d5	00 	. 
	jr nc,l88d8h		;88d6	30 00 	0 . 
l88d8h:
	nop			;88d8	00 	. 
	jr l88f3h		;88d9	18 18 	. . 
	jr l88f5h		;88db	18 18 	. . 
	inc c			;88dd	0c 	. 
	jr l88f8h		;88de	18 18 	. . 
	dec de			;88e0	1b 	. 
	rra			;88e1	1f 	. 
	ld c,000h		;88e2	0e 00 	. . 
	nop			;88e4	00 	. 
	nop			;88e5	00 	. 
	ld h,b			;88e6	60 	` 
	nop			;88e7	00 	. 
	nop			;88e8	00 	. 
	jr nc,50		;88e9	30 30 	0 0 
	jr nc,50		;88eb	30 30 	0 0 
	jr 32		;88ed	18 1e 	. . 
	ld (hl),066h		;88ef	36 66 	6 f 
	ld b,(hl)			;88f1	46 	F 
l88f2h:
	nop			;88f2	00 	. 
l88f3h:
	nop			;88f3	00 	. 
	nop			;88f4	00 	. 
l88f5h:
	nop			;88f5	00 	. 
	jr l8910h		;88f6	18 18 	. . 
l88f8h:
	sbc a,b			;88f8	98 	. 
	ret c			;88f9	d8 	. 
	ld l,h			;88fa	6c 	l 
	inc a			;88fb	3c 	< 
	inc e			;88fc	1c 	. 
	inc c			;88fd	0c 	. 
	jr l8918h		;88fe	18 18 	. . 
	inc a			;8900	3c 	< 
	inc a			;8901	3c 	< 
	nop			;8902	00 	. 
	nop			;8903	00 	. 
	nop			;8904	00 	. 
	nop			;8905	00 	. 
	ld (hl),b			;8906	70 	p 
	ld (hl),b			;8907	70 	p 
	ld h,b			;8908	60 	` 
	ld h,b			;8909	60 	` 
	jr nc,50		;890a	30 30 	0 0 
	jr nc,50		;890c	30 30 	0 0 
	ld l,e			;890e	6b 	k 
	ld l,e			;890f	6b 	k 
l8910h:
	ld l,e			;8910	6b 	k 
	ld l,e			;8911	6b 	k 
	nop			;8912	00 	. 
	nop			;8913	00 	. 
	nop			;8914	00 	. 
	nop			;8915	00 	. 
	nop			;8916	00 	. 
l8917h:
	nop			;8917	00 	. 
l8918h:
	nop			;8918	00 	. 
	ld l,h			;8919	6c 	l 
	cp 0d6h		;891a	fe d6 	. . 
	sub 0d6h		;891c	d6 d6 	. . 
	inc sp			;891e	33 	3 
	inc sp			;891f	33 	3 
	inc sp			;8920	33 	3 
	inc sp			;8921	33 	3 
	nop			;8922	00 	. 
	nop			;8923	00 	. 
	nop			;8924	00 	. 
	nop			;8925	00 	. 
	nop			;8926	00 	. 
l8927h:
	nop			;8927	00 	. 
	nop			;8928	00 	. 
	ld a,(l667eh)		;8929	3a 7e 66 	: ~ f 
	ld h,(hl)			;892c	66 	f 
	ld h,(hl)			;892d	66 	f 
	ld h,e			;892e	63 	c 
	ld h,e			;892f	63 	c 
	ld a,01ch		;8930	3e 1c 	> . 
	nop			;8932	00 	. 
	nop			;8933	00 	. 
	nop			;8934	00 	. 
	nop			;8935	00 	. 
	nop			;8936	00 	. 
	nop			;8937	00 	. 
	nop			;8938	00 	. 
	jr c,l89b7h		;8939	38 7c 	8 | 
	add a,0c6h		;893b	c6 c6 	. . 
	jp l7e66h		;893d	c3 66 7e 	. f ~ 
	ld a,003h		;8940	3e 03 	> . 
	inc bc			;8942	03 	. 
	inc bc			;8943	03 	. 
	inc bc			;8944	03 	. 
	nop			;8945	00 	. 
	nop			;8946	00 	. 
	nop			;8947	00 	. 
	nop			;8948	00 	. 
	inc (hl)			;8949	34 	4 
	ld a,b			;894a	78 	x 
	call z,0c6cch		;894b	cc cc c6 	. . . 
	inc sp			;894e	33 	3 
	ccf			;894f	3f 	? 
	ld l,018h		;8950	2e 18 	. . 
	jr 26		;8952	18 18 	. . 
	jr l8956h		;8954	18 00 	. . 
l8956h:
	nop			;8956	00 	. 
	nop			;8957	00 	. 
	nop			;8958	00 	. 
	ld e,b			;8959	58 	X 
	ld a,h			;895a	7c 	| 
	ld h,(hl)			;895b	66 	f 
	ld h,(hl)			;895c	66 	f 
	inc sp			;895d	33 	3 
	ld b,006h		;895e	06 06 	. . 
	ld b,006h		;8960	06 06 	. . 
	nop			;8962	00 	. 
	nop			;8963	00 	. 
	nop			;8964	00 	. 
	nop			;8965	00 	. 
	nop			;8966	00 	. 
	nop			;8967	00 	. 
	nop			;8968	00 	. 
	ld l,h			;8969	6c 	l 
	call m,00c8ch		;896a	fc 8c 0c 	. . . 
	inc c			;896d	0c 	. 
	ld (hl),b			;896e	70 	p 
	ld h,c			;896f	61 	a 
	ccf			;8970	3f 	? 
	ld e,000h		;8971	1e 00 	. . 
	nop			;8973	00 	. 
	nop			;8974	00 	. 
	nop			;8975	00 	. 
	nop			;8976	00 	. 
	nop			;8977	00 	. 
	nop			;8978	00 	. 
	ld a,b			;8979	78 	x 
	call m,00e86h		;897a	fc 86 0e 	. . . 
	inc a			;897d	3c 	< 
	ld b,(hl)			;897e	46 	F 
	ld h,(hl)			;897f	66 	f 
	ld a,01ch		;8980	3e 1c 	> . 
	nop			;8982	00 	. 
	nop			;8983	00 	. 
	nop			;8984	00 	. 
	nop			;8985	00 	. 
	jr l89a0h		;8986	18 18 	. . 
	jr l89c8h		;8988	18 3e 	. > 
	ld a,00ch		;898a	3e 0c 	> . 
	inc c			;898c	0c 	. 
	inc c			;898d	0c 	. 
	inc sp			;898e	33 	3 
	inc sp			;898f	33 	3 
	ccf			;8990	3f 	? 
	ld e,(hl)			;8991	5e 	^ 
	nop			;8992	00 	. 
	nop			;8993	00 	. 
	nop			;8994	00 	. 
	nop			;8995	00 	. 
	nop			;8996	00 	. 
	nop			;8997	00 	. 
	nop			;8998	00 	. 
	ld h,(hl)			;8999	66 	f 
	ld h,(hl)			;899a	66 	f 
	ld h,(hl)			;899b	66 	f 
	ld h,(hl)			;899c	66 	f 
	inc sp			;899d	33 	3 
	inc a			;899e	3c 	< 
	inc e			;899f	1c 	. 
l89a0h:
	inc e			;89a0	1c 	. 
	ex af,af'			;89a1	08 	. 
	nop			;89a2	00 	. 
	nop			;89a3	00 	. 
	nop			;89a4	00 	. 
	nop			;89a5	00 	. 
	nop			;89a6	00 	. 
	nop			;89a7	00 	. 
	nop			;89a8	00 	. 
	add a,0c6h		;89a9	c6 c6 	. . 
	ld h,(hl)			;89ab	66 	f 
	ld h,(hl)			;89ac	66 	f 
	ld (hl),076h		;89ad	36 76 	6 v 
	ld (hl),036h		;89af	36 36 	6 6 
	ld (hl),000h		;89b1	36 00 	6 . 
	nop			;89b3	00 	. 
	nop			;89b4	00 	. 
	nop			;89b5	00 	. 
	nop			;89b6	00 	. 
l89b7h:
	nop			;89b7	00 	. 
	nop			;89b8	00 	. 
	add a,0c6h		;89b9	c6 c6 	. . 
	sub 07eh		;89bb	d6 7e 	. ~ 
	ld a,(hl)			;89bd	7e 	~ 
	inc e			;89be	1c 	. 
	inc e			;89bf	1c 	. 
	ld (hl),033h		;89c0	36 33 	6 3 
	nop			;89c2	00 	. 
	nop			;89c3	00 	. 
	nop			;89c4	00 	. 
	nop			;89c5	00 	. 
	nop			;89c6	00 	. 
	nop			;89c7	00 	. 
l89c8h:
	nop			;89c8	00 	. 
	ld h,(hl)			;89c9	66 	f 
	ld (hl),01ch		;89ca	36 1c 	6 . 
	inc e			;89cc	1c 	. 
	ex af,af'			;89cd	08 	. 
	inc a			;89ce	3c 	< 
	inc e			;89cf	1c 	. 
	jr l89eah		;89d0	18 18 	. . 
	inc c			;89d2	0c 	. 
	inc c			;89d3	0c 	. 
	ld b,000h		;89d4	06 00 	. . 
	nop			;89d6	00 	. 
	nop			;89d7	00 	. 
	nop			;89d8	00 	. 
	add a,0c6h		;89d9	c6 c6 	. . 
	ld h,(hl)			;89db	66 	f 
	ld h,(hl)			;89dc	66 	f 
	inc a			;89dd	3c 	< 
	inc c			;89de	0c 	. 
	ld b,03fh		;89df	06 3f 	. ? 
	ccf			;89e1	3f 	? 
	nop			;89e2	00 	. 
	nop			;89e3	00 	. 
	nop			;89e4	00 	. 
	nop			;89e5	00 	. 
	nop			;89e6	00 	. 
	nop			;89e7	00 	. 
	nop			;89e8	00 	. 
	ld a,h			;89e9	7c 	| 
l89eah:
	ld a,h			;89ea	7c 	| 
	ld h,b			;89eb	60 	` 
	jr nc,l8a06h		;89ec	30 18 	0 . 
	jr l89fch		;89ee	18 0c 	. . 
	inc c			;89f0	0c 	. 
	inc e			;89f1	1c 	. 
	jr l89f4h		;89f2	18 00 	. . 
l89f4h:
	nop			;89f4	00 	. 
	nop			;89f5	00 	. 
	ld h,b			;89f6	60 	` 
	ld (hl),b			;89f7	70 	p 
	jr nc,50		;89f8	30 30 	0 0 
	jr 26		;89fa	18 18 	. . 
l89fch:
	ld b,018h		;89fc	06 18 	. . 
	jr l8a18h		;89fe	18 18 	. . 
	jr l8a1ah		;8a00	18 18 	. . 
	jr l8a04h		;8a02	18 00 	. . 
l8a04h:
	nop			;8a04	00 	. 
	nop			;8a05	00 	. 
l8a06h:
	jr nc,l8a38h		;8a06	30 30 	0 0 
	jr nc,l8a3ah		;8a08	30 30 	0 0 
	jr nc,l8a0ch		;8a0a	30 00 	0 . 
l8a0ch:
	nop			;8a0c	00 	. 
	nop			;8a0d	00 	. 
	ld b,003h		;8a0e	06 03 	. . 
	inc bc			;8a10	03 	. 
	inc bc			;8a11	03 	. 
	ld bc,00000h		;8a12	01 00 00 	. . . 
	nop			;8a15	00 	. 
	ld b,00ch		;8a16	06 0c 	. . 
l8a18h:
	inc c			;8a18	0c 	. 
	inc c			;8a19	0c 	. 
l8a1ah:
	ld b,006h		;8a1a	06 06 	. . 
	jr l8a24h		;8a1c	18 06 	. . 
	nop			;8a1e	00 	. 
	nop			;8a1f	00 	. 
	nop			;8a20	00 	. 
	nop			;8a21	00 	. 
	nop			;8a22	00 	. 
	nop			;8a23	00 	. 
l8a24h:
	nop			;8a24	00 	. 
	nop			;8a25	00 	. 
	inc c			;8a26	0c 	. 
	sbc a,(hl)			;8a27	9e 	. 
	jp p,00060h		;8a28	f2 60 00 	. ` . 
	nop			;8a2b	00 	. 
	nop			;8a2c	00 	. 
	nop			;8a2d	00 	. 
	adc a,h			;8a2e	8c 	. 
	ret m			;8a2f	f8 	. 
	nop			;8a30	00 	. 
	nop			;8a31	00 	. 
	nop			;8a32	00 	. 
	nop			;8a33	00 	. 
	nop			;8a34	00 	. 
	nop			;8a35	00 	. 
	nop			;8a36	00 	. 
	nop			;8a37	00 	. 
l8a38h:
	nop			;8a38	00 	. 
	ret m			;8a39	f8 	. 
l8a3ah:
	adc a,h			;8a3a	8c 	. 
	ld d,d			;8a3b	52 	R 
	ld hl,l5352h		;8a3c	21 52 53 	! R S 
	ld d,h			;8a3f	54 	T 
	ld b,c			;8a40	41 	A 
	ld d,d			;8a41	52 	R 
	ld d,h			;8a42	54 	T 
	jr nz,81		;8a43	20 4f 	  O 
	ld b,(hl)			;8a45	46 	F 
	jr nz,l8a9bh		;8a46	20 53 	  S 
	ld d,h			;8a48	54 	T 
	ld e,c			;8a49	59 	Y 
	ld c,h			;8a4a	4c 	L 
	ld b,l			;8a4b	45 	E 
	jr nz,72		;8a4c	20 46 	  F 
	ld c,a			;8a4e	4f 	O 
	ld c,(hl)			;8a4f	4e 	N 
	ld d,h			;8a50	54 	T 
l8a51h:
	nop			;8a51	00 	. 
	nop			;8a52	00 	. 
	nop			;8a53	00 	. 
	nop			;8a54	00 	. 
	nop			;8a55	00 	. 
	nop			;8a56	00 	. 
	nop			;8a57	00 	. 
	nop			;8a58	00 	. 
	nop			;8a59	00 	. 
	nop			;8a5a	00 	. 
	nop			;8a5b	00 	. 
	nop			;8a5c	00 	. 
	nop			;8a5d	00 	. 
	nop			;8a5e	00 	. 
	nop			;8a5f	00 	. 
	nop			;8a60	00 	. 
	ex af,af'			;8a61	08 	. 
	nop			;8a62	00 	. 
	nop			;8a63	00 	. 
	ex af,af'			;8a64	08 	. 
	nop			;8a65	00 	. 
	nop			;8a66	00 	. 
	nop			;8a67	00 	. 
	nop			;8a68	00 	. 
	ex af,af'			;8a69	08 	. 
	ex af,af'			;8a6a	08 	. 
	ex af,af'			;8a6b	08 	. 
	ex af,af'			;8a6c	08 	. 
	ex af,af'			;8a6d	08 	. 
	ex af,af'			;8a6e	08 	. 
	ex af,af'			;8a6f	08 	. 
	ex af,af'			;8a70	08 	. 
	nop			;8a71	00 	. 
	nop			;8a72	00 	. 
	nop			;8a73	00 	. 
	nop			;8a74	00 	. 
	nop			;8a75	00 	. 
	nop			;8a76	00 	. 
	nop			;8a77	00 	. 
	nop			;8a78	00 	. 
	ld (hl),024h		;8a79	36 24 	6 $ 
	ld (de),a			;8a7b	12 	. 
	nop			;8a7c	00 	. 
	nop			;8a7d	00 	. 
	nop			;8a7e	00 	. 
	nop			;8a7f	00 	. 
	nop			;8a80	00 	. 
	inc h			;8a81	24 	$ 
	inc h			;8a82	24 	$ 
	inc h			;8a83	24 	$ 
	nop			;8a84	00 	. 
	nop			;8a85	00 	. 
	nop			;8a86	00 	. 
	nop			;8a87	00 	. 
	nop			;8a88	00 	. 
	nop			;8a89	00 	. 
	inc h			;8a8a	24 	$ 
	inc h			;8a8b	24 	$ 
	inc h			;8a8c	24 	$ 
	ld a,(hl)			;8a8d	7e 	~ 
	inc h			;8a8e	24 	$ 
	inc h			;8a8f	24 	$ 
	ld a,(hl)			;8a90	7e 	~ 
	jr z,l8abdh		;8a91	28 2a 	( * 
	ld hl,(0081ch)		;8a93	2a 1c 08 	* . . 
	nop			;8a96	00 	. 
	nop			;8a97	00 	. 
	nop			;8a98	00 	. 
	ex af,af'			;8a99	08 	. 
	inc e			;8a9a	1c 	. 
l8a9bh:
	ld hl,(00a2ah)		;8a9b	2a 2a 0a 	* * . 
	ld a,(bc)			;8a9e	0a 	. 
	inc e			;8a9f	1c 	. 
	jr z,l8b06h		;8aa0	28 64 	( d 
	sub d			;8aa2	92 	. 
	sub d			;8aa3	92 	. 
	ld h,c			;8aa4	61 	a 
	nop			;8aa5	00 	. 
	nop			;8aa6	00 	. 
	nop			;8aa7	00 	. 
	nop			;8aa8	00 	. 
	ld b,(hl)			;8aa9	46 	F 
	add hl,hl			;8aaa	29 	) 
	add hl,hl			;8aab	29 	) 
	ld d,010h		;8aac	16 10 	. . 
	ex af,af'			;8aae	08 	. 
	ex af,af'			;8aaf	08 	. 
	inc b			;8ab0	04 	. 
	ld d,c			;8ab1	51 	Q 
	ld hl,l4e51h		;8ab2	21 51 4e 	! Q N 
	nop			;8ab5	00 	. 
	nop			;8ab6	00 	. 
	nop			;8ab7	00 	. 
	nop			;8ab8	00 	. 
	inc c			;8ab9	0c 	. 
	ld (de),a			;8aba	12 	. 
	ld (de),a			;8abb	12 	. 
	ld a,(bc)			;8abc	0a 	. 
l8abdh:
	inc b			;8abd	04 	. 
	ld b,00ah		;8abe	06 0a 	. . 
	sub c			;8ac0	91 	. 
	nop			;8ac1	00 	. 
	nop			;8ac2	00 	. 
	nop			;8ac3	00 	. 
	nop			;8ac4	00 	. 
	nop			;8ac5	00 	. 
	nop			;8ac6	00 	. 
	nop			;8ac7	00 	. 
	nop			;8ac8	00 	. 
	jr l8ae3h		;8ac9	18 18 	. . 
	djnz l8ad5h		;8acb	10 08 	. . 
	inc b			;8acd	04 	. 
	nop			;8ace	00 	. 
	nop			;8acf	00 	. 
	nop			;8ad0	00 	. 
	djnz l8ae3h		;8ad1	10 10 	. . 
	jr nz,l8b15h		;8ad3	20 40 	  @ 
l8ad5h:
	defb 000h		;8ad5	00 	. 
	defb 000h		;8ad6	00 	. 
	defb 000h		;8ad7	00 	. 
	defb 000h		;8ad8	00 	. 
	defb 040h		;8ad9	40 	@ 
	defb 020h		;8ada	20 	  
	defb 010h		;8adb	10 	. 
	defb 010h		;8adc	10 	. 
	defb 008h		;8add	08 	. 
	defb 008h		;8ade	08 	. 
	defb 008h		;8adf	08 	. 
	defb 008h		;8ae0	08 	. 
	defb 004h		;8ae1	04 	. 
	defb 004h		;8ae2	04 	. 
l8ae3h:
	defb 002h		;8ae3	02 	. 
	defb 001h		;8ae4	01 	. 
	defb 000h		;8ae5	00 	. 
	defb 000h		;8ae6	00 	. 
	defb 000h		;8ae7	00 	. 
	defb 000h		;8ae8	00 	. 
	defb 001h		;8ae9	01 	. 
	defb 002h		;8aea	02 	. 
	defb 004h		;8aeb	04 	. 
	defb 004h		;8aec	04 	. 
	defb 008h		;8aed	08 	. 
	defb 008h		;8aee	08 	. 
	defb 008h		;8aef	08 	. 
	defb 008h		;8af0	08 	. 
	defb 000h		;8af1	00 	. 
	defb 000h		;8af2	00 	. 
	defb 000h		;8af3	00 	. 
	defb 000h		;8af4	00 	. 
	defb 000h		;8af5	00 	. 
	defb 000h		;8af6	00 	. 
	defb 000h		;8af7	00 	. 
	defb 000h		;8af8	00 	. 
	defb 008h		;8af9	08 	. 
	defb 02ah		;8afa	2a 	* 
	defb 01ch		;8afb	1c 	. 
	defb 008h		;8afc	08 	. 
	defb 01ch		;8afd	1c 	. 
	defb 02ah		;8afe	2a 	* 
	defb 008h		;8aff	08 	. 
	defb 000h		;8b00	00 	. 
	defb 008h		;8b01	08 	. 
	defb 008h		;8b02	08 	. 
	defb 000h		;8b03	00 	. 
	defb 000h		;8b04	00 	. 
	defb 000h		;8b05	00 	. 
l8b06h:
	defb 000h		;8b06	00 	. 
	defb 000h		;8b07	00 	. 
	defb 000h		;8b08	00 	. 
	defb 000h		;8b09	00 	. 
	defb 000h		;8b0a	00 	. 
	defb 000h		;8b0b	00 	. 
	defb 008h		;8b0c	08 	. 
	defb 008h		;8b0d	08 	. 
	defb 008h		;8b0e	08 	. 
	defb 03eh		;8b0f	3e 	> 
	defb 008h		;8b10	08 	. 
	defb 00ch		;8b11	0c 	. 
	defb 00ch		;8b12	0c 	. 
	defb 008h		;8b13	08 	. 
	defb 004h		;8b14	04 	. 
l8b15h:
	defb 002h		;8b15	02 	. 
	defb 000h		;8b16	00 	. 
	defb 000h		;8b17	00 	. 
	defb 000h		;8b18	00 	. 
	defb 000h		;8b19	00 	. 
	defb 000h		;8b1a	00 	. 
	defb 000h		;8b1b	00 	. 
	defb 000h		;8b1c	00 	. 
	defb 000h		;8b1d	00 	. 
	defb 000h		;8b1e	00 	. 
	defb 000h		;8b1f	00 	. 
	defb 000h		;8b20	00 	. 
	defb 000h		;8b21	00 	. 
	defb 000h		;8b22	00 	. 
	defb 000h		;8b23	00 	. 
	defb 000h		;8b24	00 	. 
	defb 000h		;8b25	00 	. 
	defb 000h		;8b26	00 	. 
	defb 000h		;8b27	00 	. 
	defb 000h		;8b28	00 	. 
	defb 000h		;8b29	00 	. 
	defb 000h		;8b2a	00 	. 
	defb 000h		;8b2b	00 	. 
	defb 000h		;8b2c	00 	. 
	defb 000h		;8b2d	00 	. 
	defb 000h		;8b2e	00 	. 
	defb 03eh		;8b2f	3e 	> 
	defb 000h		;8b30	00 	. 
	defb 000h		;8b31	00 	. 
	defb 000h		;8b32	00 	. 
	defb 00ch		;8b33	0c 	. 
	defb 00ch		;8b34	0c 	. 
	defb 000h		;8b35	00 	. 
	defb 000h		;8b36	00 	. 
	defb 000h		;8b37	00 	. 
	defb 000h		;8b38	00 	. 
	defb 000h		;8b39	00 	. 
	defb 000h		;8b3a	00 	. 
	defb 000h		;8b3b	00 	. 
	defb 000h		;8b3c	00 	. 
	defb 000h		;8b3d	00 	. 
	defb 000h		;8b3e	00 	. 
	defb 000h		;8b3f	00 	. 
	defb 000h		;8b40	00 	. 
	defb 004h		;8b41	04 	. 
	defb 002h		;8b42	02 	. 
	defb 002h		;8b43	02 	. 
	defb 001h		;8b44	01 	. 
	defb 001h		;8b45	01 	. 
	defb 000h		;8b46	00 	. 
	defb 000h		;8b47	00 	. 
	defb 000h		;8b48	00 	. 
	defb 040h		;8b49	40 	@ 
	defb 020h		;8b4a	20 	  
	defb 020h		;8b4b	20 	  
	defb 010h		;8b4c	10 	. 
	defb 010h		;8b4d	10 	. 
	defb 008h		;8b4e	08 	. 
	defb 008h		;8b4f	08 	. 
	defb 004h		;8b50	04 	. 
	defb 041h		;8b51	41 	A 
	defb 041h		;8b52	41 	A 
	defb 022h		;8b53	22 	" 
	defb 01ch		;8b54	1c 	. 
	defb 000h		;8b55	00 	. 
	defb 000h		;8b56	00 	. 
	defb 000h		;8b57	00 	. 
	defb 000h		;8b58	00 	. 
	defb 01ch		;8b59	1c 	. 
	defb 022h		;8b5a	22 	" 
	defb 041h		;8b5b	41 	A 
	defb 041h		;8b5c	41 	A 
	defb 041h		;8b5d	41 	A 
	defb 041h		;8b5e	41 	A 
	defb 041h		;8b5f	41 	A 
	defb 041h		;8b60	41 	A 
	defb 008h		;8b61	08 	. 
	defb 008h		;8b62	08 	. 
	defb 008h		;8b63	08 	. 
	defb 03eh		;8b64	3e 	> 
	defb 000h		;8b65	00 	. 
	defb 000h		;8b66	00 	. 
	defb 000h		;8b67	00 	. 
	defb 000h		;8b68	00 	. 
	defb 00eh		;8b69	0e 	. 
	defb 008h		;8b6a	08 	. 
	defb 008h		;8b6b	08 	. 
	defb 008h		;8b6c	08 	. 
	defb 008h		;8b6d	08 	. 
	defb 008h		;8b6e	08 	. 
	defb 008h		;8b6f	08 	. 
	defb 008h		;8b70	08 	. 
	defb 004h		;8b71	04 	. 
	defb 042h		;8b72	42 	B 
	defb 041h		;8b73	41 	A 
	defb 07fh		;8b74	7f 	 
	defb 000h		;8b75	00 	. 
	defb 000h		;8b76	00 	. 
	defb 000h		;8b77	00 	. 
	defb 000h		;8b78	00 	. 
	defb 01ch		;8b79	1c 	. 
	defb 022h		;8b7a	22 	" 
	defb 041h		;8b7b	41 	A 
	defb 041h		;8b7c	41 	A 
	defb 040h		;8b7d	40 	@ 
	defb 020h		;8b7e	20 	  
	defb 010h		;8b7f	10 	. 
	defb 008h		;8b80	08 	. 
	defb 041h		;8b81	41 	A 
	defb 041h		;8b82	41 	A 
	defb 022h		;8b83	22 	" 
	defb 01ch		;8b84	1c 	. 
	defb 000h		;8b85	00 	. 
	defb 000h		;8b86	00 	. 
	defb 000h		;8b87	00 	. 
	defb 000h		;8b88	00 	. 
	defb 01ch		;8b89	1c 	. 
	defb 022h		;8b8a	22 	" 
	defb 041h		;8b8b	41 	A 
	defb 041h		;8b8c	41 	A 
	defb 020h		;8b8d	20 	  
	defb 01ch		;8b8e	1c 	. 
	defb 020h		;8b8f	20 	  
	defb 040h		;8b90	40 	@ 
	defb 07fh		;8b91	7f 	 
	defb 020h		;8b92	20 	  
	defb 020h		;8b93	20 	  
	defb 070h		;8b94	70 	p 
	defb 000h		;8b95	00 	. 
	defb 000h		;8b96	00 	. 
	defb 000h		;8b97	00 	. 
	defb 000h		;8b98	00 	. 
	defb 030h		;8b99	30 	0 
	defb 028h		;8b9a	28 	( 
	defb 028h		;8b9b	28 	( 
	defb 024h		;8b9c	24 	$ 
	defb 024h		;8b9d	24 	$ 
	defb 022h		;8b9e	22 	" 
	defb 022h		;8b9f	22 	" 
	defb 021h		;8ba0	21 	! 
	defb 040h		;8ba1	40 	@ 
	defb 041h		;8ba2	41 	A 
	defb 022h		;8ba3	22 	" 
	defb 01ch		;8ba4	1c 	. 
	defb 000h		;8ba5	00 	. 
	defb 000h		;8ba6	00 	. 
	defb 000h		;8ba7	00 	. 
	defb 000h		;8ba8	00 	. 
	defb 03fh		;8ba9	3f 	? 
	defb 001h		;8baa	01 	. 
	defb 001h		;8bab	01 	. 
	defb 001h		;8bac	01 	. 
	defb 001h		;8bad	01 	. 
	defb 01fh		;8bae	1f 	. 
	defb 020h		;8baf	20 	  
	defb 040h		;8bb0	40 	@ 
	defb 041h		;8bb1	41 	A 
	defb 041h		;8bb2	41 	A 
	defb 022h		;8bb3	22 	" 
	defb 01ch		;8bb4	1c 	. 
	defb 000h		;8bb5	00 	. 
	defb 000h		;8bb6	00 	. 
	defb 000h		;8bb7	00 	. 
	defb 000h		;8bb8	00 	. 
	defb 01ch		;8bb9	1c 	. 
	defb 022h		;8bba	22 	" 
	defb 041h		;8bbb	41 	A 
	defb 001h		;8bbc	01 	. 
	defb 001h		;8bbd	01 	. 
	defb 01dh		;8bbe	1d 	. 
	defb 023h		;8bbf	23 	# 
	defb 041h		;8bc0	41 	A 
	defb 008h		;8bc1	08 	. 
	defb 008h		;8bc2	08 	. 
	defb 008h		;8bc3	08 	. 
	defb 008h		;8bc4	08 	. 
	defb 000h		;8bc5	00 	. 
	defb 000h		;8bc6	00 	. 
	defb 000h		;8bc7	00 	. 
	defb 000h		;8bc8	00 	. 
	defb 07fh		;8bc9	7f 	 
	defb 041h		;8bca	41 	A 
	defb 021h		;8bcb	21 	! 
	defb 020h		;8bcc	20 	  
	defb 020h		;8bcd	20 	  
	defb 010h		;8bce	10 	. 
	defb 010h		;8bcf	10 	. 
	defb 010h		;8bd0	10 	. 
	defb 041h		;8bd1	41 	A 
	defb 041h		;8bd2	41 	A 
	defb 022h		;8bd3	22 	" 
	defb 01ch		;8bd4	1c 	. 
	defb 000h		;8bd5	00 	. 
	defb 000h		;8bd6	00 	. 
	defb 000h		;8bd7	00 	. 
	defb 000h		;8bd8	00 	. 
	defb 01ch		;8bd9	1c 	. 
	defb 022h		;8bda	22 	" 
	defb 041h		;8bdb	41 	A 
	defb 041h		;8bdc	41 	A 
	defb 022h		;8bdd	22 	" 
	defb 01ch		;8bde	1c 	. 
	defb 022h		;8bdf	22 	" 
	defb 041h		;8be0	41 	A 
	defb 040h		;8be1	40 	@ 
	defb 041h		;8be2	41 	A 
	defb 021h		;8be3	21 	! 
	defb 01eh		;8be4	1e 	. 
	defb 000h		;8be5	00 	. 
	defb 000h		;8be6	00 	. 
	defb 000h		;8be7	00 	. 
	defb 000h		;8be8	00 	. 
	defb 01ch		;8be9	1c 	. 
	defb 022h		;8bea	22 	" 
	defb 041h		;8beb	41 	A 
	defb 041h		;8bec	41 	A 
	defb 041h		;8bed	41 	A 
	defb 062h		;8bee	62 	b 
	defb 05ch		;8bef	5c 	\ 
	defb 040h		;8bf0	40 	@ 
	defb 000h		;8bf1	00 	. 
	defb 00ch		;8bf2	0c 	. 
	defb 00ch		;8bf3	0c 	. 
	defb 000h		;8bf4	00 	. 
	defb 000h		;8bf5	00 	. 
	defb 000h		;8bf6	00 	. 
	defb 000h		;8bf7	00 	. 
	defb 000h		;8bf8	00 	. 
	defb 000h		;8bf9	00 	. 
	defb 000h		;8bfa	00 	. 
	defb 00ch		;8bfb	0c 	. 
	defb 00ch		;8bfc	0c 	. 
	defb 000h		;8bfd	00 	. 
	defb 000h		;8bfe	00 	. 
	defb 000h		;8bff	00 	. 
	defb 000h		;8c00	00 	. 
	defb 000h		;8c01	00 	. 
	defb 018h		;8c02	18 	. 
	defb 018h		;8c03	18 	. 
	defb 008h		;8c04	08 	. 
	defb 004h		;8c05	04 	. 
	defb 000h		;8c06	00 	. 
	defb 000h		;8c07	00 	. 
	defb 000h		;8c08	00 	. 
	defb 000h		;8c09	00 	. 
	defb 000h		;8c0a	00 	. 
	defb 018h		;8c0b	18 	. 
	defb 018h		;8c0c	18 	. 
	defb 000h		;8c0d	00 	. 
	defb 000h		;8c0e	00 	. 
	defb 000h		;8c0f	00 	. 
	defb 000h		;8c10	00 	. 
	defb 004h		;8c11	04 	. 
	defb 008h		;8c12	08 	. 
	defb 010h		;8c13	10 	. 
	defb 020h		;8c14	20 	  
	defb 040h		;8c15	40 	@ 
	defb 000h		;8c16	00 	. 
	defb 000h		;8c17	00 	. 
	defb 000h		;8c18	00 	. 
	defb 040h		;8c19	40 	@ 
	defb 020h		;8c1a	20 	  
	defb 010h		;8c1b	10 	. 
	defb 008h		;8c1c	08 	. 
	defb 004h		;8c1d	04 	. 
	defb 002h		;8c1e	02 	. 
	defb 001h		;8c1f	01 	. 
	defb 002h		;8c20	02 	. 
	defb 000h		;8c21	00 	. 
	defb 000h		;8c22	00 	. 
	defb 000h		;8c23	00 	. 
	defb 000h		;8c24	00 	. 
	defb 000h		;8c25	00 	. 
	defb 000h		;8c26	00 	. 
	defb 000h		;8c27	00 	. 
	defb 000h		;8c28	00 	. 
	defb 000h		;8c29	00 	. 
	defb 000h		;8c2a	00 	. 
	defb 000h		;8c2b	00 	. 
	defb 07fh		;8c2c	7f 	 
	defb 000h		;8c2d	00 	. 
	defb 000h		;8c2e	00 	. 
	defb 000h		;8c2f	00 	. 
	defb 07fh		;8c30	7f 	 
	defb 010h		;8c31	10 	. 
	defb 008h		;8c32	08 	. 
	defb 004h		;8c33	04 	. 
	defb 002h		;8c34	02 	. 
	defb 001h		;8c35	01 	. 
	defb 000h		;8c36	00 	. 
	defb 000h		;8c37	00 	. 
	defb 000h		;8c38	00 	. 
	defb 001h		;8c39	01 	. 
	defb 002h		;8c3a	02 	. 
	defb 004h		;8c3b	04 	. 
	defb 008h		;8c3c	08 	. 
	defb 010h		;8c3d	10 	. 
	defb 020h		;8c3e	20 	  
	defb 040h		;8c3f	40 	@ 
	defb 020h		;8c40	20 	  
	defb 000h		;8c41	00 	. 
	defb 000h		;8c42	00 	. 
	defb 004h		;8c43	04 	. 
	defb 004h		;8c44	04 	. 
	defb 000h		;8c45	00 	. 
	defb 000h		;8c46	00 	. 
	defb 000h		;8c47	00 	. 
	defb 000h		;8c48	00 	. 
	defb 01ch		;8c49	1c 	. 
	defb 022h		;8c4a	22 	" 
	defb 040h		;8c4b	40 	@ 
	defb 040h		;8c4c	40 	@ 
	defb 020h		;8c4d	20 	  
	defb 018h		;8c4e	18 	. 
	defb 004h		;8c4f	04 	. 
	defb 004h		;8c50	04 	. 
	defb 051h		;8c51	51 	Q 
	defb 051h		;8c52	51 	Q 
	defb 051h		;8c53	51 	Q 
	defb 02eh		;8c54	2e 	. 
	defb 000h		;8c55	00 	. 
	defb 000h		;8c56	00 	. 
	defb 000h		;8c57	00 	. 
	defb 000h		;8c58	00 	. 
	defb 01ch		;8c59	1c 	. 
	defb 022h		;8c5a	22 	" 
	defb 041h		;8c5b	41 	A 
	defb 040h		;8c5c	40 	@ 
	defb 050h		;8c5d	50 	P 
	defb 05ch		;8c5e	5c 	\ 
	defb 052h		;8c5f	52 	R 
	defb 051h		;8c60	51 	Q 
	defb 022h		;8c61	22 	" 
	defb 022h		;8c62	22 	" 
	defb 022h		;8c63	22 	" 
	defb 077h		;8c64	77 	w 
	defb 000h		;8c65	00 	. 
	defb 000h		;8c66	00 	. 
	defb 000h		;8c67	00 	. 
	defb 000h		;8c68	00 	. 
	defb 01ch		;8c69	1c 	. 
	defb 022h		;8c6a	22 	" 
	defb 022h		;8c6b	22 	" 
	defb 022h		;8c6c	22 	" 
	defb 022h		;8c6d	22 	" 
	defb 03eh		;8c6e	3e 	> 
	defb 022h		;8c6f	22 	" 
	defb 022h		;8c70	22 	" 
	defb 044h		;8c71	44 	D 
	defb 044h		;8c72	44 	D 
	defb 044h		;8c73	44 	D 
	defb 03eh		;8c74	3e 	> 
	defb 000h		;8c75	00 	. 
	defb 000h		;8c76	00 	. 
	defb 000h		;8c77	00 	. 
	defb 000h		;8c78	00 	. 
	defb 03eh		;8c79	3e 	> 
	defb 044h		;8c7a	44 	D 
	defb 044h		;8c7b	44 	D 
	defb 044h		;8c7c	44 	D 
	defb 044h		;8c7d	44 	D 
	defb 03ch		;8c7e	3c 	< 
	defb 044h		;8c7f	44 	D 
	defb 044h		;8c80	44 	D 
	defb 004h		;8c81	04 	. 
	defb 044h		;8c82	44 	D 
	defb 044h		;8c83	44 	D 
	defb 038h		;8c84	38 	8 
	defb 000h		;8c85	00 	. 
	defb 000h		;8c86	00 	. 
	defb 000h		;8c87	00 	. 
	defb 000h		;8c88	00 	. 
	defb 038h		;8c89	38 	8 
	defb 044h		;8c8a	44 	D 
	defb 044h		;8c8b	44 	D 
	defb 004h		;8c8c	04 	. 
	defb 004h		;8c8d	04 	. 
	defb 004h		;8c8e	04 	. 
	defb 004h		;8c8f	04 	. 
	defb 004h		;8c90	04 	. 
	defb 044h		;8c91	44 	D 
	defb 044h		;8c92	44 	D 
	defb 044h		;8c93	44 	D 
	defb 03eh		;8c94	3e 	> 
	defb 000h		;8c95	00 	. 
	defb 000h		;8c96	00 	. 
	defb 000h		;8c97	00 	. 
	defb 000h		;8c98	00 	. 
	defb 03eh		;8c99	3e 	> 
	defb 044h		;8c9a	44 	D 
	defb 044h		;8c9b	44 	D 
	defb 044h		;8c9c	44 	D 
	defb 044h		;8c9d	44 	D 
	defb 044h		;8c9e	44 	D 
	defb 044h		;8c9f	44 	D 
	defb 044h		;8ca0	44 	D 
	defb 004h		;8ca1	04 	. 
	defb 004h		;8ca2	04 	. 
	defb 044h		;8ca3	44 	D 
	defb 07eh		;8ca4	7e 	~ 
	defb 000h		;8ca5	00 	. 
	defb 000h		;8ca6	00 	. 
	defb 000h		;8ca7	00 	. 
	defb 000h		;8ca8	00 	. 
	defb 07eh		;8ca9	7e 	~ 
	defb 044h		;8caa	44 	D 
	defb 004h		;8cab	04 	. 
	defb 004h		;8cac	04 	. 
	defb 004h		;8cad	04 	. 
	defb 03ch		;8cae	3c 	< 
	defb 004h		;8caf	04 	. 
	defb 004h		;8cb0	04 	. 
	defb 004h		;8cb1	04 	. 
	defb 004h		;8cb2	04 	. 
	defb 004h		;8cb3	04 	. 
	defb 00eh		;8cb4	0e 	. 
	defb 000h		;8cb5	00 	. 
	defb 000h		;8cb6	00 	. 
	defb 000h		;8cb7	00 	. 
	defb 000h		;8cb8	00 	. 
	defb 07eh		;8cb9	7e 	~ 
	defb 044h		;8cba	44 	D 
	defb 004h		;8cbb	04 	. 
	defb 004h		;8cbc	04 	. 
	defb 004h		;8cbd	04 	. 
	defb 03ch		;8cbe	3c 	< 
	defb 004h		;8cbf	04 	. 
	defb 004h		;8cc0	04 	. 
	defb 022h		;8cc1	22 	" 
	defb 022h		;8cc2	22 	" 
	defb 022h		;8cc3	22 	" 
	defb 01ch		;8cc4	1c 	. 
	defb 000h		;8cc5	00 	. 
	defb 000h		;8cc6	00 	. 
	defb 000h		;8cc7	00 	. 
	defb 000h		;8cc8	00 	. 
	defb 01ch		;8cc9	1c 	. 
	defb 022h		;8cca	22 	" 
	defb 022h		;8ccb	22 	" 
	defb 022h		;8ccc	22 	" 
	defb 002h		;8ccd	02 	. 
	defb 002h		;8cce	02 	. 
	defb 032h		;8ccf	32 	2 
	defb 022h		;8cd0	22 	" 
	defb 022h		;8cd1	22 	" 
	defb 022h		;8cd2	22 	" 
	defb 022h		;8cd3	22 	" 
	defb 077h		;8cd4	77 	w 
	defb 000h		;8cd5	00 	. 
	defb 000h		;8cd6	00 	. 
	defb 000h		;8cd7	00 	. 
	defb 000h		;8cd8	00 	. 
	defb 077h		;8cd9	77 	w 
	defb 022h		;8cda	22 	" 
	defb 022h		;8cdb	22 	" 
	defb 022h		;8cdc	22 	" 
	defb 022h		;8cdd	22 	" 
	defb 03eh		;8cde	3e 	> 
	defb 022h		;8cdf	22 	" 
	defb 022h		;8ce0	22 	" 
	defb 010h		;8ce1	10 	. 
	defb 010h		;8ce2	10 	. 
	defb 010h		;8ce3	10 	. 
	defb 038h		;8ce4	38 	8 
	defb 000h		;8ce5	00 	. 
	defb 000h		;8ce6	00 	. 
	defb 000h		;8ce7	00 	. 
	defb 000h		;8ce8	00 	. 
	defb 038h		;8ce9	38 	8 
	defb 010h		;8cea	10 	. 
	defb 010h		;8ceb	10 	. 
	defb 010h		;8cec	10 	. 
	defb 010h		;8ced	10 	. 
	defb 010h		;8cee	10 	. 
	defb 010h		;8cef	10 	. 
	defb 010h		;8cf0	10 	. 
	defb 010h		;8cf1	10 	. 
	defb 010h		;8cf2	10 	. 
	defb 010h		;8cf3	10 	. 
	defb 010h		;8cf4	10 	. 
	defb 00ch		;8cf5	0c 	. 
	defb 000h		;8cf6	00 	. 
	defb 000h		;8cf7	00 	. 
	defb 000h		;8cf8	00 	. 
	defb 038h		;8cf9	38 	8 
	defb 010h		;8cfa	10 	. 
	defb 010h		;8cfb	10 	. 
	defb 010h		;8cfc	10 	. 
	defb 010h		;8cfd	10 	. 
	defb 010h		;8cfe	10 	. 
	defb 010h		;8cff	10 	. 
	defb 010h		;8d00	10 	. 
	defb 014h		;8d01	14 	. 
	defb 024h		;8d02	24 	$ 
	defb 044h		;8d03	44 	D 
	defb 066h		;8d04	66 	f 
	defb 000h		;8d05	00 	. 
	defb 000h		;8d06	00 	. 
	defb 000h		;8d07	00 	. 
	defb 000h		;8d08	00 	. 
	defb 066h		;8d09	66 	f 
	defb 044h		;8d0a	44 	D 
	defb 024h		;8d0b	24 	$ 
	defb 014h		;8d0c	14 	. 
	defb 014h		;8d0d	14 	. 
	defb 00ch		;8d0e	0c 	. 
	defb 00ch		;8d0f	0c 	. 
	defb 014h		;8d10	14 	. 
	defb 004h		;8d11	04 	. 
	defb 004h		;8d12	04 	. 
	defb 044h		;8d13	44 	D 
	defb 07eh		;8d14	7e 	~ 
	defb 000h		;8d15	00 	. 
	defb 000h		;8d16	00 	. 
	defb 000h		;8d17	00 	. 
	defb 000h		;8d18	00 	. 
	defb 00eh		;8d19	0e 	. 
	defb 004h		;8d1a	04 	. 
	defb 004h		;8d1b	04 	. 
	defb 004h		;8d1c	04 	. 
	defb 004h		;8d1d	04 	. 
	defb 004h		;8d1e	04 	. 
	defb 004h		;8d1f	04 	. 
	defb 004h		;8d20	04 	. 
	defb 022h		;8d21	22 	" 
	defb 022h		;8d22	22 	" 
	defb 022h		;8d23	22 	" 
	defb 077h		;8d24	77 	w 
	defb 000h		;8d25	00 	. 
	defb 000h		;8d26	00 	. 
	defb 000h		;8d27	00 	. 
	defb 000h		;8d28	00 	. 
	defb 063h		;8d29	63 	c 
	defb 022h		;8d2a	22 	" 
	defb 022h		;8d2b	22 	" 
	defb 036h		;8d2c	36 	6 
	defb 036h		;8d2d	36 	6 
	defb 02ah		;8d2e	2a 	* 
	defb 02ah		;8d2f	2a 	* 
	defb 022h		;8d30	22 	" 
	defb 032h		;8d31	32 	2 
	defb 022h		;8d32	22 	" 
	defb 022h		;8d33	22 	" 
	defb 023h		;8d34	23 	# 
	defb 000h		;8d35	00 	. 
	defb 000h		;8d36	00 	. 
	defb 000h		;8d37	00 	. 
	defb 000h		;8d38	00 	. 
	defb 063h		;8d39	63 	c 
	defb 022h		;8d3a	22 	" 
	defb 022h		;8d3b	22 	" 
	defb 026h		;8d3c	26 	& 
	defb 026h		;8d3d	26 	& 
	defb 02ah		;8d3e	2a 	* 
	defb 02ah		;8d3f	2a 	* 
	defb 032h		;8d40	32 	2 
	defb 022h		;8d41	22 	" 
	defb 022h		;8d42	22 	" 
	defb 022h		;8d43	22 	" 
	defb 01ch		;8d44	1c 	. 
	defb 000h		;8d45	00 	. 
	defb 000h		;8d46	00 	. 
	defb 000h		;8d47	00 	. 
	defb 000h		;8d48	00 	. 
	defb 01ch		;8d49	1c 	. 
	defb 022h		;8d4a	22 	" 
	defb 022h		;8d4b	22 	" 
	defb 022h		;8d4c	22 	" 
	defb 022h		;8d4d	22 	" 
	defb 022h		;8d4e	22 	" 
	defb 022h		;8d4f	22 	" 
	defb 022h		;8d50	22 	" 
	defb 004h		;8d51	04 	. 
	defb 004h		;8d52	04 	. 
	defb 004h		;8d53	04 	. 
	defb 00eh		;8d54	0e 	. 
	defb 000h		;8d55	00 	. 
	defb 000h		;8d56	00 	. 
	defb 000h		;8d57	00 	. 
	defb 000h		;8d58	00 	. 
	defb 03eh		;8d59	3e 	> 
	defb 044h		;8d5a	44 	D 
	defb 044h		;8d5b	44 	D 
	defb 044h		;8d5c	44 	D 
	defb 044h		;8d5d	44 	D 
	defb 03ch		;8d5e	3c 	< 
	defb 004h		;8d5f	04 	. 
	defb 004h		;8d60	04 	. 
	defb 022h		;8d61	22 	" 
	defb 02ah		;8d62	2a 	* 
	defb 032h		;8d63	32 	2 
	defb 03ch		;8d64	3c 	< 
	defb 040h		;8d65	40 	@ 
	defb 040h		;8d66	40 	@ 
	defb 000h		;8d67	00 	. 
	defb 000h		;8d68	00 	. 
	defb 01ch		;8d69	1c 	. 
	defb 022h		;8d6a	22 	" 
	defb 022h		;8d6b	22 	" 
	defb 022h		;8d6c	22 	" 
	defb 022h		;8d6d	22 	" 
	defb 022h		;8d6e	22 	" 
	defb 022h		;8d6f	22 	" 
	defb 022h		;8d70	22 	" 
	defb 024h		;8d71	24 	$ 
	defb 024h		;8d72	24 	$ 
	defb 044h		;8d73	44 	D 
	defb 04eh		;8d74	4e 	N 
	defb 000h		;8d75	00 	. 
	defb 000h		;8d76	00 	. 
	defb 000h		;8d77	00 	. 
	defb 000h		;8d78	00 	. 
	defb 03eh		;8d79	3e 	> 
	defb 044h		;8d7a	44 	D 
	defb 044h		;8d7b	44 	D 
	defb 044h		;8d7c	44 	D 
	defb 044h		;8d7d	44 	D 
	defb 03ch		;8d7e	3c 	< 
	defb 014h		;8d7f	14 	. 
	defb 014h		;8d80	14 	. 
	defb 040h		;8d81	40 	@ 
	defb 044h		;8d82	44 	D 
	defb 044h		;8d83	44 	D 
	defb 038h		;8d84	38 	8 
	defb 000h		;8d85	00 	. 
	defb 000h		;8d86	00 	. 
	defb 000h		;8d87	00 	. 
	defb 000h		;8d88	00 	. 
	defb 038h		;8d89	38 	8 
	defb 044h		;8d8a	44 	D 
	defb 044h		;8d8b	44 	D 
	defb 004h		;8d8c	04 	. 
	defb 004h		;8d8d	04 	. 
	defb 018h		;8d8e	18 	. 
	defb 020h		;8d8f	20 	  
	defb 040h		;8d90	40 	@ 
	defb 008h		;8d91	08 	. 
	defb 008h		;8d92	08 	. 
	defb 008h		;8d93	08 	. 
	defb 01ch		;8d94	1c 	. 
	defb 000h		;8d95	00 	. 
	defb 000h		;8d96	00 	. 
	defb 000h		;8d97	00 	. 
	defb 000h		;8d98	00 	. 
	defb 03eh		;8d99	3e 	> 
	defb 02ah		;8d9a	2a 	* 
	defb 008h		;8d9b	08 	. 
	defb 008h		;8d9c	08 	. 
	defb 008h		;8d9d	08 	. 
	defb 008h		;8d9e	08 	. 
	defb 008h		;8d9f	08 	. 
	defb 008h		;8da0	08 	. 
	defb 022h		;8da1	22 	" 
	defb 022h		;8da2	22 	" 
	defb 022h		;8da3	22 	" 
	defb 01ch		;8da4	1c 	. 
	defb 000h		;8da5	00 	. 
	defb 000h		;8da6	00 	. 
	defb 000h		;8da7	00 	. 
	defb 000h		;8da8	00 	. 
	defb 077h		;8da9	77 	w 
	defb 022h		;8daa	22 	" 
	defb 022h		;8dab	22 	" 
	defb 022h		;8dac	22 	" 
	defb 022h		;8dad	22 	" 
	defb 022h		;8dae	22 	" 
	defb 022h		;8daf	22 	" 
	defb 022h		;8db0	22 	" 
	defb 014h		;8db1	14 	. 
	defb 014h		;8db2	14 	. 
	defb 008h		;8db3	08 	. 
	defb 008h		;8db4	08 	. 
	defb 000h		;8db5	00 	. 
	defb 000h		;8db6	00 	. 
	defb 000h		;8db7	00 	. 
	defb 000h		;8db8	00 	. 
	defb 077h		;8db9	77 	w 
	defb 022h		;8dba	22 	" 
	defb 022h		;8dbb	22 	" 
	defb 022h		;8dbc	22 	" 
	defb 022h		;8dbd	22 	" 
	defb 022h		;8dbe	22 	" 
	defb 014h		;8dbf	14 	. 
	defb 014h		;8dc0	14 	. 
	defb 036h		;8dc1	36 	6 
	defb 036h		;8dc2	36 	6 
	defb 022h		;8dc3	22 	" 
	defb 022h		;8dc4	22 	" 
	defb 000h		;8dc5	00 	. 
	defb 000h		;8dc6	00 	. 
	defb 000h		;8dc7	00 	. 
	defb 000h		;8dc8	00 	. 
	defb 063h		;8dc9	63 	c 
	defb 022h		;8dca	22 	" 
	defb 022h		;8dcb	22 	" 
	defb 022h		;8dcc	22 	" 
	defb 022h		;8dcd	22 	" 
	defb 02ah		;8dce	2a 	* 
	defb 02ah		;8dcf	2a 	* 
	defb 02ah		;8dd0	2a 	* 
	defb 014h		;8dd1	14 	. 
	defb 022h		;8dd2	22 	" 
	defb 022h		;8dd3	22 	" 
	defb 063h		;8dd4	63 	c 
	defb 000h		;8dd5	00 	. 
	defb 000h		;8dd6	00 	. 
	defb 000h		;8dd7	00 	. 
	defb 000h		;8dd8	00 	. 
	defb 063h		;8dd9	63 	c 
	defb 022h		;8dda	22 	" 
	defb 022h		;8ddb	22 	" 
	defb 014h		;8ddc	14 	. 
	defb 014h		;8ddd	14 	. 
	defb 008h		;8dde	08 	. 
	defb 008h		;8ddf	08 	. 
	defb 014h		;8de0	14 	. 
	defb 008h		;8de1	08 	. 
	defb 008h		;8de2	08 	. 
	defb 008h		;8de3	08 	. 
	defb 01ch		;8de4	1c 	. 
	defb 000h		;8de5	00 	. 
	defb 000h		;8de6	00 	. 
	defb 000h		;8de7	00 	. 
	defb 000h		;8de8	00 	. 
	defb 077h		;8de9	77 	w 
	defb 022h		;8dea	22 	" 
	defb 022h		;8deb	22 	" 
	defb 022h		;8dec	22 	" 
	defb 014h		;8ded	14 	. 
	defb 014h		;8dee	14 	. 
	defb 014h		;8def	14 	. 
	defb 008h		;8df0	08 	. 
	defb 004h		;8df1	04 	. 
	defb 002h		;8df2	02 	. 
	defb 022h		;8df3	22 	" 
	defb 03eh		;8df4	3e 	> 
	defb 000h		;8df5	00 	. 
	defb 000h		;8df6	00 	. 
	defb 000h		;8df7	00 	. 
	defb 000h		;8df8	00 	. 
	defb 03eh		;8df9	3e 	> 
	defb 022h		;8dfa	22 	" 
	defb 020h		;8dfb	20 	  
	defb 010h		;8dfc	10 	. 
	defb 010h		;8dfd	10 	. 
	defb 008h		;8dfe	08 	. 
	defb 008h		;8dff	08 	. 
	defb 004h		;8e00	04 	. 
	defb 008h		;8e01	08 	. 
	defb 008h		;8e02	08 	. 
	defb 008h		;8e03	08 	. 
	defb 008h		;8e04	08 	. 
	defb 078h		;8e05	78 	x 
	defb 000h		;8e06	00 	. 
	defb 000h		;8e07	00 	. 
	defb 000h		;8e08	00 	. 
	defb 078h		;8e09	78 	x 
	defb 008h		;8e0a	08 	. 
	defb 008h		;8e0b	08 	. 
	defb 008h		;8e0c	08 	. 
	defb 008h		;8e0d	08 	. 
	defb 008h		;8e0e	08 	. 
	defb 008h		;8e0f	08 	. 
	defb 008h		;8e10	08 	. 
	defb 010h		;8e11	10 	. 
	defb 020h		;8e12	20 	  
	defb 020h		;8e13	20 	  
	defb 040h		;8e14	40 	@ 
	defb 040h		;8e15	40 	@ 
	defb 000h		;8e16	00 	. 
	defb 000h		;8e17	00 	. 
	defb 000h		;8e18	00 	. 
	defb 001h		;8e19	01 	. 
	defb 002h		;8e1a	02 	. 
	defb 002h		;8e1b	02 	. 
	defb 004h		;8e1c	04 	. 
	defb 004h		;8e1d	04 	. 
	defb 008h		;8e1e	08 	. 
	defb 008h		;8e1f	08 	. 
	defb 010h		;8e20	10 	. 
	defb 008h		;8e21	08 	. 
	defb 008h		;8e22	08 	. 
	defb 008h		;8e23	08 	. 
	defb 008h		;8e24	08 	. 
	defb 00fh		;8e25	0f 	. 
	defb 000h		;8e26	00 	. 
	defb 000h		;8e27	00 	. 
	defb 000h		;8e28	00 	. 
	defb 00fh		;8e29	0f 	. 
	defb 008h		;8e2a	08 	. 
	defb 008h		;8e2b	08 	. 
	defb 008h		;8e2c	08 	. 
	defb 008h		;8e2d	08 	. 
	defb 008h		;8e2e	08 	. 
	defb 008h		;8e2f	08 	. 
	defb 008h		;8e30	08 	. 
	defb 000h		;8e31	00 	. 
	defb 000h		;8e32	00 	. 
	defb 000h		;8e33	00 	. 
	defb 000h		;8e34	00 	. 
	defb 000h		;8e35	00 	. 
	defb 000h		;8e36	00 	. 
	defb 000h		;8e37	00 	. 
	defb 000h		;8e38	00 	. 
	defb 008h		;8e39	08 	. 
	defb 014h		;8e3a	14 	. 
	defb 022h		;8e3b	22 	" 
	defb 041h		;8e3c	41 	A 
	defb 000h		;8e3d	00 	. 
	defb 000h		;8e3e	00 	. 
	defb 000h		;8e3f	00 	. 
	defb 000h		;8e40	00 	. 
	defb 000h		;8e41	00 	. 
	defb 000h		;8e42	00 	. 
	defb 000h		;8e43	00 	. 
	defb 000h		;8e44	00 	. 
	defb 000h		;8e45	00 	. 
	defb 0ffh		;8e46	ff 	. 
	defb 000h		;8e47	00 	. 
	defb 000h		;8e48	00 	. 
	defb 000h		;8e49	00 	. 
	defb 000h		;8e4a	00 	. 
	defb 000h		;8e4b	00 	. 
	defb 000h		;8e4c	00 	. 
	defb 000h		;8e4d	00 	. 
	defb 000h		;8e4e	00 	. 
	defb 000h		;8e4f	00 	. 
	defb 000h		;8e50	00 	. 
	defb 000h		;8e51	00 	. 
	defb 000h		;8e52	00 	. 
	defb 000h		;8e53	00 	. 
	defb 000h		;8e54	00 	. 
	defb 000h		;8e55	00 	. 
	defb 000h		;8e56	00 	. 
	defb 000h		;8e57	00 	. 
	defb 000h		;8e58	00 	. 
	defb 018h		;8e59	18 	. 
	defb 018h		;8e5a	18 	. 
	defb 008h		;8e5b	08 	. 
	defb 010h		;8e5c	10 	. 
	defb 020h		;8e5d	20 	  
	defb 000h		;8e5e	00 	. 
	defb 000h		;8e5f	00 	. 
	defb 000h		;8e60	00 	. 
	defb 042h		;8e61	42 	B 
	defb 042h		;8e62	42 	B 
	defb 042h		;8e63	42 	B 
	defb 0bch		;8e64	bc 	. 
	defb 000h		;8e65	00 	. 
	defb 000h		;8e66	00 	. 
	defb 000h		;8e67	00 	. 
	defb 000h		;8e68	00 	. 
	defb 000h		;8e69	00 	. 
	defb 000h		;8e6a	00 	. 
	defb 000h		;8e6b	00 	. 
	defb 000h		;8e6c	00 	. 
	defb 03ch		;8e6d	3c 	< 
	defb 042h		;8e6e	42 	B 
	defb 040h		;8e6f	40 	@ 
	defb 07ch		;8e70	7c 	| 
	defb 042h		;8e71	42 	B 
	defb 042h		;8e72	42 	B 
	defb 026h		;8e73	26 	& 
	defb 01ah		;8e74	1a 	. 
	defb 000h		;8e75	00 	. 
	defb 000h		;8e76	00 	. 
	defb 000h		;8e77	00 	. 
	defb 000h		;8e78	00 	. 
	defb 003h		;8e79	03 	. 
	defb 002h		;8e7a	02 	. 
	defb 002h		;8e7b	02 	. 
	defb 002h		;8e7c	02 	. 
	defb 01ah		;8e7d	1a 	. 
	defb 026h		;8e7e	26 	& 
	defb 042h		;8e7f	42 	B 
	defb 042h		;8e80	42 	B 
	defb 002h		;8e81	02 	. 
	defb 002h		;8e82	02 	. 
	defb 044h		;8e83	44 	D 
	defb 038h		;8e84	38 	8 
	defb 000h		;8e85	00 	. 
	defb 000h		;8e86	00 	. 
	defb 000h		;8e87	00 	. 
	defb 000h		;8e88	00 	. 
	defb 000h		;8e89	00 	. 
	defb 000h		;8e8a	00 	. 
	defb 000h		;8e8b	00 	. 
	defb 000h		;8e8c	00 	. 
	defb 038h		;8e8d	38 	8 
	defb 044h		;8e8e	44 	D 
	defb 002h		;8e8f	02 	. 
	defb 002h		;8e90	02 	. 
	defb 042h		;8e91	42 	B 
	defb 042h		;8e92	42 	B 
	defb 064h		;8e93	64 	d 
	defb 0d8h		;8e94	d8 	. 
	defb 000h		;8e95	00 	. 
	defb 000h		;8e96	00 	. 
	defb 000h		;8e97	00 	. 
	defb 000h		;8e98	00 	. 
	defb 060h		;8e99	60 	` 
	defb 040h		;8e9a	40 	@ 
	defb 040h		;8e9b	40 	@ 
	defb 040h		;8e9c	40 	@ 
	defb 058h		;8e9d	58 	X 
	defb 064h		;8e9e	64 	d 
	defb 042h		;8e9f	42 	B 
	defb 042h		;8ea0	42 	B 
	defb 002h		;8ea1	02 	. 
	defb 002h		;8ea2	02 	. 
	defb 042h		;8ea3	42 	B 
	defb 03ch		;8ea4	3c 	< 
	defb 000h		;8ea5	00 	. 
	defb 000h		;8ea6	00 	. 
	defb 000h		;8ea7	00 	. 
	defb 000h		;8ea8	00 	. 
	defb 000h		;8ea9	00 	. 
	defb 000h		;8eaa	00 	. 
	defb 000h		;8eab	00 	. 
	defb 000h		;8eac	00 	. 
	defb 03ch		;8ead	3c 	< 
	defb 042h		;8eae	42 	B 
	defb 042h		;8eaf	42 	B 
	defb 03eh		;8eb0	3e 	> 
	defb 008h		;8eb1	08 	. 
	defb 008h		;8eb2	08 	. 
	defb 008h		;8eb3	08 	. 
	defb 01ch		;8eb4	1c 	. 
	defb 000h		;8eb5	00 	. 
	defb 000h		;8eb6	00 	. 
	defb 000h		;8eb7	00 	. 
	defb 000h		;8eb8	00 	. 
	defb 070h		;8eb9	70 	p 
	defb 048h		;8eba	48 	H 
	defb 008h		;8ebb	08 	. 
	defb 008h		;8ebc	08 	. 
	defb 03eh		;8ebd	3e 	> 
	defb 008h		;8ebe	08 	. 
	defb 008h		;8ebf	08 	. 
	defb 008h		;8ec0	08 	. 
	defb 01ch		;8ec1	1c 	. 
	defb 002h		;8ec2	02 	. 
	defb 004h		;8ec3	04 	. 
	defb 03ah		;8ec4	3a 	: 
	defb 041h		;8ec5	41 	A 
	defb 041h		;8ec6	41 	A 
	defb 03eh		;8ec7	3e 	> 
	defb 000h		;8ec8	00 	. 
	defb 000h		;8ec9	00 	. 
	defb 000h		;8eca	00 	. 
	defb 000h		;8ecb	00 	. 
	defb 040h		;8ecc	40 	@ 
	defb 03ch		;8ecd	3c 	< 
	defb 042h		;8ece	42 	B 
	defb 042h		;8ecf	42 	B 
	defb 022h		;8ed0	22 	" 
	defb 042h		;8ed1	42 	B 
	defb 042h		;8ed2	42 	B 
	defb 042h		;8ed3	42 	B 
	defb 0e7h		;8ed4	e7 	. 
	defb 000h		;8ed5	00 	. 
	defb 000h		;8ed6	00 	. 
	defb 000h		;8ed7	00 	. 
	defb 000h		;8ed8	00 	. 
	defb 003h		;8ed9	03 	. 
	defb 002h		;8eda	02 	. 
	defb 002h		;8edb	02 	. 
	defb 002h		;8edc	02 	. 
	defb 03ah		;8edd	3a 	: 
	defb 046h		;8ede	46 	F 
	defb 042h		;8edf	42 	B 
	defb 042h		;8ee0	42 	B 
	defb 010h		;8ee1	10 	. 
	defb 010h		;8ee2	10 	. 
	defb 010h		;8ee3	10 	. 
	defb 038h		;8ee4	38 	8 
	defb 000h		;8ee5	00 	. 
	defb 000h		;8ee6	00 	. 
	defb 000h		;8ee7	00 	. 
	defb 000h		;8ee8	00 	. 
	defb 000h		;8ee9	00 	. 
	defb 010h		;8eea	10 	. 
	defb 000h		;8eeb	00 	. 
	defb 000h		;8eec	00 	. 
	defb 018h		;8eed	18 	. 
	defb 010h		;8eee	10 	. 
	defb 010h		;8eef	10 	. 
	defb 010h		;8ef0	10 	. 
	defb 010h		;8ef1	10 	. 
	defb 010h		;8ef2	10 	. 
	defb 010h		;8ef3	10 	. 
	defb 010h		;8ef4	10 	. 
	defb 012h		;8ef5	12 	. 
	defb 00ch		;8ef6	0c 	. 
	defb 000h		;8ef7	00 	. 
	defb 000h		;8ef8	00 	. 
	defb 000h		;8ef9	00 	. 
	defb 010h		;8efa	10 	. 
	defb 000h		;8efb	00 	. 
	defb 000h		;8efc	00 	. 
	defb 018h		;8efd	18 	. 
	defb 010h		;8efe	10 	. 
	defb 010h		;8eff	10 	. 
	defb 010h		;8f00	10 	. 
	defb 012h		;8f01	12 	. 
	defb 012h		;8f02	12 	. 
	defb 022h		;8f03	22 	" 
	defb 062h		;8f04	62 	b 
	defb 000h		;8f05	00 	. 
	defb 000h		;8f06	00 	. 
	defb 000h		;8f07	00 	. 
	defb 000h		;8f08	00 	. 
	defb 003h		;8f09	03 	. 
	defb 002h		;8f0a	02 	. 
	defb 002h		;8f0b	02 	. 
	defb 002h		;8f0c	02 	. 
	defb 072h		;8f0d	72 	r 
	defb 012h		;8f0e	12 	. 
	defb 00ah		;8f0f	0a 	. 
	defb 00eh		;8f10	0e 	. 
	defb 008h		;8f11	08 	. 
	defb 008h		;8f12	08 	. 
	defb 008h		;8f13	08 	. 
	defb 01ch		;8f14	1c 	. 
	defb 000h		;8f15	00 	. 
	defb 000h		;8f16	00 	. 
	defb 000h		;8f17	00 	. 
	defb 000h		;8f18	00 	. 
	defb 00ch		;8f19	0c 	. 
	defb 008h		;8f1a	08 	. 
	defb 008h		;8f1b	08 	. 
	defb 008h		;8f1c	08 	. 
	defb 008h		;8f1d	08 	. 
	defb 008h		;8f1e	08 	. 
	defb 008h		;8f1f	08 	. 
	defb 008h		;8f20	08 	. 
	defb 049h		;8f21	49 	I 
	defb 049h		;8f22	49 	I 
	defb 049h		;8f23	49 	I 
	defb 049h		;8f24	49 	I 
	defb 000h		;8f25	00 	. 
	defb 000h		;8f26	00 	. 
	defb 000h		;8f27	00 	. 
	defb 000h		;8f28	00 	. 
	defb 000h		;8f29	00 	. 
	defb 000h		;8f2a	00 	. 
	defb 000h		;8f2b	00 	. 
	defb 000h		;8f2c	00 	. 
	defb 036h		;8f2d	36 	6 
	defb 049h		;8f2e	49 	I 
	defb 049h		;8f2f	49 	I 
	defb 049h		;8f30	49 	I 
	defb 042h		;8f31	42 	B 
	defb 042h		;8f32	42 	B 
	defb 042h		;8f33	42 	B 
	defb 042h		;8f34	42 	B 
	defb 000h		;8f35	00 	. 
	defb 000h		;8f36	00 	. 
	defb 000h		;8f37	00 	. 
	defb 000h		;8f38	00 	. 
	defb 000h		;8f39	00 	. 
	defb 000h		;8f3a	00 	. 
	defb 000h		;8f3b	00 	. 
	defb 000h		;8f3c	00 	. 
	defb 03ah		;8f3d	3a 	: 
	defb 046h		;8f3e	46 	F 
	defb 042h		;8f3f	42 	B 
	defb 042h		;8f40	42 	B 
	defb 041h		;8f41	41 	A 
	defb 041h		;8f42	41 	A 
	defb 022h		;8f43	22 	" 
	defb 01ch		;8f44	1c 	. 
	defb 000h		;8f45	00 	. 
	defb 000h		;8f46	00 	. 
	defb 000h		;8f47	00 	. 
	defb 000h		;8f48	00 	. 
	defb 000h		;8f49	00 	. 
	defb 000h		;8f4a	00 	. 
	defb 000h		;8f4b	00 	. 
	defb 000h		;8f4c	00 	. 
	defb 01ch		;8f4d	1c 	. 
	defb 022h		;8f4e	22 	" 
	defb 041h		;8f4f	41 	A 
	defb 041h		;8f50	41 	A 
	defb 042h		;8f51	42 	B 
	defb 042h		;8f52	42 	B 
	defb 026h		;8f53	26 	& 
	defb 01ah		;8f54	1a 	. 
	defb 002h		;8f55	02 	. 
	defb 002h		;8f56	02 	. 
	defb 007h		;8f57	07 	. 
	defb 000h		;8f58	00 	. 
	defb 000h		;8f59	00 	. 
	defb 000h		;8f5a	00 	. 
	defb 000h		;8f5b	00 	. 
	defb 000h		;8f5c	00 	. 
	defb 01bh		;8f5d	1b 	. 
	defb 026h		;8f5e	26 	& 
	defb 042h		;8f5f	42 	B 
	defb 042h		;8f60	42 	B 
	defb 021h		;8f61	21 	! 
	defb 021h		;8f62	21 	! 
	defb 032h		;8f63	32 	2 
	defb 02ch		;8f64	2c 	, 
	defb 020h		;8f65	20 	  
	defb 020h		;8f66	20 	  
	defb 070h		;8f67	70 	p 
	defb 000h		;8f68	00 	. 
	defb 000h		;8f69	00 	. 
	defb 000h		;8f6a	00 	. 
	defb 000h		;8f6b	00 	. 
	defb 000h		;8f6c	00 	. 
	defb 02ch		;8f6d	2c 	, 
	defb 032h		;8f6e	32 	2 
	defb 021h		;8f6f	21 	! 
	defb 021h		;8f70	21 	! 
	defb 004h		;8f71	04 	. 
	defb 004h		;8f72	04 	. 
	defb 004h		;8f73	04 	. 
	defb 00eh		;8f74	0e 	. 
	defb 000h		;8f75	00 	. 
	defb 000h		;8f76	00 	. 
	defb 000h		;8f77	00 	. 
	defb 000h		;8f78	00 	. 
	defb 000h		;8f79	00 	. 
	defb 000h		;8f7a	00 	. 
	defb 000h		;8f7b	00 	. 
	defb 000h		;8f7c	00 	. 
	defb 036h		;8f7d	36 	6 
	defb 04ch		;8f7e	4c 	L 
	defb 004h		;8f7f	04 	. 
	defb 004h		;8f80	04 	. 
	defb 040h		;8f81	40 	@ 
	defb 040h		;8f82	40 	@ 
	defb 042h		;8f83	42 	B 
	defb 03ch		;8f84	3c 	< 
	defb 000h		;8f85	00 	. 
	defb 000h		;8f86	00 	. 
	defb 000h		;8f87	00 	. 
	defb 000h		;8f88	00 	. 
	defb 000h		;8f89	00 	. 
	defb 000h		;8f8a	00 	. 
	defb 000h		;8f8b	00 	. 
	defb 000h		;8f8c	00 	. 
	defb 03ch		;8f8d	3c 	< 
	defb 042h		;8f8e	42 	B 
	defb 002h		;8f8f	02 	. 
	defb 03ch		;8f90	3c 	< 
	defb 008h		;8f91	08 	. 
	defb 008h		;8f92	08 	. 
	defb 048h		;8f93	48 	H 
	defb 030h		;8f94	30 	0 
	defb 000h		;8f95	00 	. 
	defb 000h		;8f96	00 	. 
	defb 000h		;8f97	00 	. 
	defb 000h		;8f98	00 	. 
	defb 008h		;8f99	08 	. 
	defb 008h		;8f9a	08 	. 
	defb 008h		;8f9b	08 	. 
	defb 008h		;8f9c	08 	. 
	defb 03eh		;8f9d	3e 	> 
	defb 008h		;8f9e	08 	. 
	defb 008h		;8f9f	08 	. 
	defb 008h		;8fa0	08 	. 
	defb 022h		;8fa1	22 	" 
	defb 022h		;8fa2	22 	" 
	defb 022h		;8fa3	22 	" 
	defb 05ch		;8fa4	5c 	\ 
	defb 000h		;8fa5	00 	. 
	defb 000h		;8fa6	00 	. 
	defb 000h		;8fa7	00 	. 
	defb 000h		;8fa8	00 	. 
	defb 000h		;8fa9	00 	. 
	defb 000h		;8faa	00 	. 
	defb 000h		;8fab	00 	. 
	defb 000h		;8fac	00 	. 
	defb 033h		;8fad	33 	3 
	defb 022h		;8fae	22 	" 
	defb 022h		;8faf	22 	" 
	defb 022h		;8fb0	22 	" 
	defb 014h		;8fb1	14 	. 
	defb 014h		;8fb2	14 	. 
	defb 008h		;8fb3	08 	. 
	defb 008h		;8fb4	08 	. 
	defb 000h		;8fb5	00 	. 
	defb 000h		;8fb6	00 	. 
	defb 000h		;8fb7	00 	. 
	defb 000h		;8fb8	00 	. 
	defb 000h		;8fb9	00 	. 
	defb 000h		;8fba	00 	. 
	defb 000h		;8fbb	00 	. 
	defb 000h		;8fbc	00 	. 
	defb 077h		;8fbd	77 	w 
	defb 022h		;8fbe	22 	" 
	defb 022h		;8fbf	22 	" 
	defb 022h		;8fc0	22 	" 
	defb 055h		;8fc1	55 	U 
	defb 022h		;8fc2	22 	" 
	defb 022h		;8fc3	22 	" 
	defb 022h		;8fc4	22 	" 
	defb 000h		;8fc5	00 	. 
	defb 000h		;8fc6	00 	. 
	defb 000h		;8fc7	00 	. 
	defb 000h		;8fc8	00 	. 
	defb 000h		;8fc9	00 	. 
	defb 000h		;8fca	00 	. 
	defb 000h		;8fcb	00 	. 
	defb 000h		;8fcc	00 	. 
	defb 041h		;8fcd	41 	A 
	defb 041h		;8fce	41 	A 
	defb 049h		;8fcf	49 	I 
	defb 049h		;8fd0	49 	I 
	defb 014h		;8fd1	14 	. 
	defb 022h		;8fd2	22 	" 
	defb 022h		;8fd3	22 	" 
	defb 063h		;8fd4	63 	c 
	defb 000h		;8fd5	00 	. 
	defb 000h		;8fd6	00 	. 
	defb 000h		;8fd7	00 	. 
	defb 000h		;8fd8	00 	. 
	defb 000h		;8fd9	00 	. 
	defb 000h		;8fda	00 	. 
	defb 000h		;8fdb	00 	. 
	defb 000h		;8fdc	00 	. 
	defb 063h		;8fdd	63 	c 
	defb 022h		;8fde	22 	" 
	defb 014h		;8fdf	14 	. 
	defb 008h		;8fe0	08 	. 
	defb 014h		;8fe1	14 	. 
	defb 014h		;8fe2	14 	. 
	defb 008h		;8fe3	08 	. 
	defb 008h		;8fe4	08 	. 
	defb 004h		;8fe5	04 	. 
	defb 004h		;8fe6	04 	. 
	defb 006h		;8fe7	06 	. 
	defb 000h		;8fe8	00 	. 
	defb 000h		;8fe9	00 	. 
	defb 000h		;8fea	00 	. 
	defb 000h		;8feb	00 	. 
	defb 000h		;8fec	00 	. 
	defb 063h		;8fed	63 	c 
	defb 022h		;8fee	22 	" 
	defb 022h		;8fef	22 	" 
	defb 022h		;8ff0	22 	" 
	defb 008h		;8ff1	08 	. 
	defb 004h		;8ff2	04 	. 
	defb 042h		;8ff3	42 	B 
	defb 07eh		;8ff4	7e 	~ 
	defb 000h		;8ff5	00 	. 
	defb 000h		;8ff6	00 	. 
	defb 000h		;8ff7	00 	. 
	defb 000h		;8ff8	00 	. 
	defb 000h		;8ff9	00 	. 
	defb 000h		;8ffa	00 	. 
	defb 000h		;8ffb	00 	. 
	defb 000h		;8ffc	00 	. 
	defb 07eh		;8ffd	7e 	~ 
	defb 042h		;8ffe	42 	B 
	defb 020h		;8fff	20 	  
	defb 010h		;9000	10 	. 
	defb 010h		;9001	10 	. 
	defb 010h		;9002	10 	. 
	defb 010h		;9003	10 	. 
	defb 010h		;9004	10 	. 
	defb 060h		;9005	60 	` 
	defb 000h		;9006	00 	. 
	defb 000h		;9007	00 	. 
	defb 000h		;9008	00 	. 
	defb 060h		;9009	60 	` 
	defb 010h		;900a	10 	. 
	defb 010h		;900b	10 	. 
	defb 010h		;900c	10 	. 
	defb 010h		;900d	10 	. 
	defb 010h		;900e	10 	. 
	defb 00ch		;900f	0c 	. 
	defb 010h		;9010	10 	. 
	defb 008h		;9011	08 	. 
	defb 008h		;9012	08 	. 
	defb 008h		;9013	08 	. 
	defb 008h		;9014	08 	. 
	defb 008h		;9015	08 	. 
	defb 000h		;9016	00 	. 
	defb 000h		;9017	00 	. 
	defb 000h		;9018	00 	. 
	defb 008h		;9019	08 	. 
	defb 008h		;901a	08 	. 
	defb 008h		;901b	08 	. 
	defb 008h		;901c	08 	. 
	defb 008h		;901d	08 	. 
	defb 000h		;901e	00 	. 
	defb 000h		;901f	00 	. 
	defb 000h		;9020	00 	. 
	defb 004h		;9021	04 	. 
	defb 004h		;9022	04 	. 
	defb 004h		;9023	04 	. 
	defb 004h		;9024	04 	. 
	defb 003h		;9025	03 	. 
	defb 000h		;9026	00 	. 
	defb 000h		;9027	00 	. 
	defb 000h		;9028	00 	. 
	defb 003h		;9029	03 	. 
	defb 004h		;902a	04 	. 
	defb 004h		;902b	04 	. 
	defb 004h		;902c	04 	. 
	defb 004h		;902d	04 	. 
	defb 004h		;902e	04 	. 
	defb 018h		;902f	18 	. 
	defb 004h		;9030	04 	. 
	defb 000h		;9031	00 	. 
	defb 000h		;9032	00 	. 
	defb 000h		;9033	00 	. 
	defb 000h		;9034	00 	. 
	defb 000h		;9035	00 	. 
	defb 000h		;9036	00 	. 
	defb 000h		;9037	00 	. 
	defb 000h		;9038	00 	. 
	defb 006h		;9039	06 	. 
	defb 049h		;903a	49 	I 
	defb 030h		;903b	30 	0 
	defb 000h		;903c	00 	. 
	defb 000h		;903d	00 	. 
	defb 000h		;903e	00 	. 
	defb 000h		;903f	00 	. 
	defb 000h		;9040	00 	. 
	defb 08ch		;9041	8c 	. 
	defb 0f8h		;9042	f8 	. 
	defb 000h		;9043	00 	. 
	defb 000h		;9044	00 	. 
	defb 000h		;9045	00 	. 
	defb 000h		;9046	00 	. 
	defb 000h		;9047	00 	. 
	defb 000h		;9048	00 	. 
	defb 000h		;9049	00 	. 
	defb 000h		;904a	00 	. 
	defb 000h		;904b	00 	. 
	defb 0f8h		;904c	f8 	. 
	defb 08ch		;904d	8c 	. 
	defb 052h		;904e	52 	R 
	defb 021h		;904f	21 	! 
	defb 052h		;9050	52 	R 
l9051h:
	defb 000h		;9051	00 	. 
	defb 000h		;9052	00 	. 
	defb 000h		;9053	00 	. 
	defb 000h		;9054	00 	. 
	defb 000h		;9055	00 	. 
	defb 000h		;9056	00 	. 
	defb 000h		;9057	00 	. 
	defb 000h		;9058	00 	. 
	defb 000h		;9059	00 	. 
	defb 000h		;905a	00 	. 
	defb 000h		;905b	00 	. 
	defb 000h		;905c	00 	. 
	defb 000h		;905d	00 	. 
	defb 000h		;905e	00 	. 
	defb 000h		;905f	00 	. 
	defb 000h		;9060	00 	. 
	defb 018h		;9061	18 	. 
	defb 000h		;9062	00 	. 
	defb 018h		;9063	18 	. 
	defb 018h		;9064	18 	. 
	defb 000h		;9065	00 	. 
	defb 000h		;9066	00 	. 
	defb 000h		;9067	00 	. 
	defb 000h		;9068	00 	. 
	defb 018h		;9069	18 	. 
	defb 018h		;906a	18 	. 
	defb 018h		;906b	18 	. 
	defb 018h		;906c	18 	. 
	defb 018h		;906d	18 	. 
	defb 018h		;906e	18 	. 
	defb 018h		;906f	18 	. 
	defb 018h		;9070	18 	. 
	defb 000h		;9071	00 	. 
	defb 000h		;9072	00 	. 
	defb 000h		;9073	00 	. 
	defb 000h		;9074	00 	. 
	defb 000h		;9075	00 	. 
	defb 000h		;9076	00 	. 
	defb 000h		;9077	00 	. 
	defb 000h		;9078	00 	. 
	defb 036h		;9079	36 	6 
	defb 036h		;907a	36 	6 
	defb 012h		;907b	12 	. 
	defb 012h		;907c	12 	. 
	defb 000h		;907d	00 	. 
	defb 000h		;907e	00 	. 
	defb 000h		;907f	00 	. 
	defb 000h		;9080	00 	. 
	defb 06ch		;9081	6c 	l 
	defb 06ch		;9082	6c 	l 
	defb 06ch		;9083	6c 	l 
	defb 000h		;9084	00 	. 
	defb 000h		;9085	00 	. 
	defb 000h		;9086	00 	. 
	defb 000h		;9087	00 	. 
	defb 000h		;9088	00 	. 
	defb 000h		;9089	00 	. 
	defb 06ch		;908a	6c 	l 
	defb 06ch		;908b	6c 	l 
	defb 06ch		;908c	6c 	l 
	defb 0feh		;908d	fe 	. 
	defb 06ch		;908e	6c 	l 
	defb 06ch		;908f	6c 	l 
	defb 0feh		;9090	fe 	. 
	defb 068h		;9091	68 	h 
	defb 068h		;9092	68 	h 
	defb 06bh		;9093	6b 	k 
	defb 03eh		;9094	3e 	> 
	defb 008h		;9095	08 	. 
	defb 000h		;9096	00 	. 
	defb 000h		;9097	00 	. 
	defb 000h		;9098	00 	. 
	defb 008h		;9099	08 	. 
	defb 03ch		;909a	3c 	< 
	defb 07eh		;909b	7e 	~ 
	defb 06ah		;909c	6a 	j 
	defb 00ah		;909d	0a 	. 
	defb 01eh		;909e	1e 	. 
	defb 03ch		;909f	3c 	< 
	defb 068h		;90a0	68 	h 
	defb 06ch		;90a1	6c 	l 
	defb 0f6h		;90a2	f6 	. 
	defb 0f6h		;90a3	f6 	. 
	defb 063h		;90a4	63 	c 
	defb 000h		;90a5	00 	. 
	defb 000h		;90a6	00 	. 
	defb 000h		;90a7	00 	. 
	defb 000h		;90a8	00 	. 
	defb 0c6h		;90a9	c6 	. 
	defb 06fh		;90aa	6f 	o 
	defb 06fh		;90ab	6f 	o 
	defb 036h		;90ac	36 	6 
	defb 030h		;90ad	30 	0 
	defb 018h		;90ae	18 	. 
	defb 018h		;90af	18 	. 
	defb 00ch		;90b0	0c 	. 
	defb 05bh		;90b1	5b 	[ 
	defb 033h		;90b2	33 	3 
	defb 07fh		;90b3	7f 	 
	defb 04eh		;90b4	4e 	N 
	defb 000h		;90b5	00 	. 
	defb 000h		;90b6	00 	. 
	defb 000h		;90b7	00 	. 
	defb 000h		;90b8	00 	. 
	defb 01ch		;90b9	1c 	. 
	defb 036h		;90ba	36 	6 
	defb 036h		;90bb	36 	6 
	defb 01eh		;90bc	1e 	. 
	defb 00ch		;90bd	0c 	. 
	defb 00eh		;90be	0e 	. 
	defb 00ah		;90bf	0a 	. 
	defb 0dbh		;90c0	db 	. 
	defb 000h		;90c1	00 	. 
	defb 000h		;90c2	00 	. 
	defb 000h		;90c3	00 	. 
	defb 000h		;90c4	00 	. 
	defb 000h		;90c5	00 	. 
	defb 000h		;90c6	00 	. 
	defb 000h		;90c7	00 	. 
	defb 000h		;90c8	00 	. 
	defb 038h		;90c9	38 	8 
	defb 038h		;90ca	38 	8 
	defb 030h		;90cb	30 	0 
	defb 018h		;90cc	18 	. 
	defb 00ch		;90cd	0c 	. 
	defb 000h		;90ce	00 	. 
	defb 000h		;90cf	00 	. 
	defb 000h		;90d0	00 	. 
	defb 018h		;90d1	18 	. 
	defb 018h		;90d2	18 	. 
	defb 030h		;90d3	30 	0 
	defb 060h		;90d4	60 	` 
	defb 000h		;90d5	00 	. 
	defb 000h		;90d6	00 	. 
	defb 000h		;90d7	00 	. 
	defb 000h		;90d8	00 	. 
	defb 060h		;90d9	60 	` 
	defb 030h		;90da	30 	0 
	defb 018h		;90db	18 	. 
	defb 018h		;90dc	18 	. 
	defb 00ch		;90dd	0c 	. 
	defb 00ch		;90de	0c 	. 
	defb 00ch		;90df	0c 	. 
	defb 00ch		;90e0	0c 	. 
	defb 00ch		;90e1	0c 	. 
	defb 00ch		;90e2	0c 	. 
	defb 006h		;90e3	06 	. 
	defb 003h		;90e4	03 	. 
	defb 000h		;90e5	00 	. 
	defb 000h		;90e6	00 	. 
	defb 000h		;90e7	00 	. 
	defb 000h		;90e8	00 	. 
	defb 003h		;90e9	03 	. 
	defb 006h		;90ea	06 	. 
	defb 00ch		;90eb	0c 	. 
	defb 00ch		;90ec	0c 	. 
	defb 018h		;90ed	18 	. 
	defb 018h		;90ee	18 	. 
	defb 018h		;90ef	18 	. 
	defb 018h		;90f0	18 	. 
	defb 000h		;90f1	00 	. 
	defb 000h		;90f2	00 	. 
	defb 000h		;90f3	00 	. 
	defb 000h		;90f4	00 	. 
	defb 000h		;90f5	00 	. 
	defb 000h		;90f6	00 	. 
	defb 000h		;90f7	00 	. 
	defb 000h		;90f8	00 	. 
	defb 008h		;90f9	08 	. 
	defb 03eh		;90fa	3e 	> 
	defb 01ch		;90fb	1c 	. 
	defb 01ch		;90fc	1c 	. 
	defb 01ch		;90fd	1c 	. 
	defb 03eh		;90fe	3e 	> 
	defb 008h		;90ff	08 	. 
	defb 000h		;9100	00 	. 
	defb 018h		;9101	18 	. 
	defb 018h		;9102	18 	. 
	defb 000h		;9103	00 	. 
	defb 000h		;9104	00 	. 
	defb 000h		;9105	00 	. 
	defb 000h		;9106	00 	. 
	defb 000h		;9107	00 	. 
	defb 000h		;9108	00 	. 
	defb 000h		;9109	00 	. 
	defb 000h		;910a	00 	. 
	defb 000h		;910b	00 	. 
	defb 018h		;910c	18 	. 
	defb 018h		;910d	18 	. 
	defb 018h		;910e	18 	. 
	defb 07eh		;910f	7e 	~ 
	defb 07eh		;9110	7e 	~ 
	defb 01ch		;9111	1c 	. 
	defb 01ch		;9112	1c 	. 
	defb 018h		;9113	18 	. 
	defb 00ch		;9114	0c 	. 
	defb 006h		;9115	06 	. 
	defb 000h		;9116	00 	. 
	defb 000h		;9117	00 	. 
	defb 000h		;9118	00 	. 
	defb 000h		;9119	00 	. 
	defb 000h		;911a	00 	. 
	defb 000h		;911b	00 	. 
	defb 000h		;911c	00 	. 
	defb 000h		;911d	00 	. 
	defb 000h		;911e	00 	. 
	defb 000h		;911f	00 	. 
	defb 000h		;9120	00 	. 
	defb 000h		;9121	00 	. 
	defb 000h		;9122	00 	. 
	defb 000h		;9123	00 	. 
	defb 000h		;9124	00 	. 
	defb 000h		;9125	00 	. 
	defb 000h		;9126	00 	. 
	defb 000h		;9127	00 	. 
	defb 000h		;9128	00 	. 
	defb 000h		;9129	00 	. 
	defb 000h		;912a	00 	. 
	defb 000h		;912b	00 	. 
	defb 000h		;912c	00 	. 
	defb 000h		;912d	00 	. 
	defb 000h		;912e	00 	. 
	defb 03eh		;912f	3e 	> 
	defb 03eh		;9130	3e 	> 
	defb 000h		;9131	00 	. 
	defb 01ch		;9132	1c 	. 
	defb 01ch		;9133	1c 	. 
	defb 01ch		;9134	1c 	. 
	defb 000h		;9135	00 	. 
	defb 000h		;9136	00 	. 
	defb 000h		;9137	00 	. 
	defb 000h		;9138	00 	. 
	defb 000h		;9139	00 	. 
	defb 000h		;913a	00 	. 
	defb 000h		;913b	00 	. 
	defb 000h		;913c	00 	. 
	defb 000h		;913d	00 	. 
	defb 000h		;913e	00 	. 
	defb 000h		;913f	00 	. 
	defb 000h		;9140	00 	. 
	defb 006h		;9141	06 	. 
	defb 006h		;9142	06 	. 
	defb 003h		;9143	03 	. 
	defb 003h		;9144	03 	. 
	defb 003h		;9145	03 	. 
	defb 000h		;9146	00 	. 
	defb 000h		;9147	00 	. 
	defb 000h		;9148	00 	. 
	defb 060h		;9149	60 	` 
	defb 060h		;914a	60 	` 
	defb 030h		;914b	30 	0 
	defb 030h		;914c	30 	0 
	defb 018h		;914d	18 	. 
	defb 018h		;914e	18 	. 
	defb 00ch		;914f	0c 	. 
	defb 00ch		;9150	0c 	. 
	defb 063h		;9151	63 	c 
	defb 063h		;9152	63 	c 
	defb 03eh		;9153	3e 	> 
	defb 01ch		;9154	1c 	. 
	defb 000h		;9155	00 	. 
	defb 000h		;9156	00 	. 
	defb 000h		;9157	00 	. 
	defb 000h		;9158	00 	. 
	defb 01ch		;9159	1c 	. 
	defb 03eh		;915a	3e 	> 
	defb 063h		;915b	63 	c 
	defb 063h		;915c	63 	c 
	defb 063h		;915d	63 	c 
	defb 063h		;915e	63 	c 
	defb 063h		;915f	63 	c 
	defb 063h		;9160	63 	c 
	defb 018h		;9161	18 	. 
	defb 018h		;9162	18 	. 
	defb 07eh		;9163	7e 	~ 
	defb 07eh		;9164	7e 	~ 
	defb 000h		;9165	00 	. 
	defb 000h		;9166	00 	. 
	defb 000h		;9167	00 	. 
	defb 000h		;9168	00 	. 
	defb 01eh		;9169	1e 	. 
	defb 01eh		;916a	1e 	. 
	defb 018h		;916b	18 	. 
	defb 018h		;916c	18 	. 
	defb 018h		;916d	18 	. 
	defb 018h		;916e	18 	. 
	defb 018h		;916f	18 	. 
	defb 018h		;9170	18 	. 
	defb 006h		;9171	06 	. 
	defb 063h		;9172	63 	c 
	defb 07fh		;9173	7f 	 
	defb 07fh		;9174	7f 	 
	defb 000h		;9175	00 	. 
	defb 000h		;9176	00 	. 
	defb 000h		;9177	00 	. 
	defb 000h		;9178	00 	. 
	defb 01ch		;9179	1c 	. 
	defb 03eh		;917a	3e 	> 
	defb 063h		;917b	63 	c 
	defb 063h		;917c	63 	c 
	defb 060h		;917d	60 	` 
	defb 030h		;917e	30 	0 
	defb 018h		;917f	18 	. 
	defb 00ch		;9180	0c 	. 
	defb 063h		;9181	63 	c 
	defb 063h		;9182	63 	c 
	defb 03eh		;9183	3e 	> 
	defb 01ch		;9184	1c 	. 
	defb 000h		;9185	00 	. 
	defb 000h		;9186	00 	. 
	defb 000h		;9187	00 	. 
	defb 000h		;9188	00 	. 
	defb 01ch		;9189	1c 	. 
	defb 03eh		;918a	3e 	> 
	defb 063h		;918b	63 	c 
	defb 063h		;918c	63 	c 
	defb 030h		;918d	30 	0 
	defb 01ch		;918e	1c 	. 
	defb 03ch		;918f	3c 	< 
	defb 060h		;9190	60 	` 
	defb 07fh		;9191	7f 	 
	defb 030h		;9192	30 	0 
	defb 030h		;9193	30 	0 
	defb 078h		;9194	78 	x 
	defb 000h		;9195	00 	. 
	defb 000h		;9196	00 	. 
	defb 000h		;9197	00 	. 
	defb 000h		;9198	00 	. 
	defb 030h		;9199	30 	0 
	defb 038h		;919a	38 	8 
	defb 03ch		;919b	3c 	< 
	defb 034h		;919c	34 	4 
	defb 036h		;919d	36 	6 
	defb 032h		;919e	32 	2 
	defb 033h		;919f	33 	3 
	defb 07fh		;91a0	7f 	 
	defb 060h		;91a1	60 	` 
	defb 063h		;91a2	63 	c 
	defb 03eh		;91a3	3e 	> 
	defb 01ch		;91a4	1c 	. 
	defb 000h		;91a5	00 	. 
	defb 000h		;91a6	00 	. 
	defb 000h		;91a7	00 	. 
	defb 000h		;91a8	00 	. 
	defb 03fh		;91a9	3f 	? 
	defb 03fh		;91aa	3f 	? 
	defb 001h		;91ab	01 	. 
	defb 001h		;91ac	01 	. 
	defb 001h		;91ad	01 	. 
	defb 01fh		;91ae	1f 	. 
	defb 03fh		;91af	3f 	? 
	defb 060h		;91b0	60 	` 
	defb 063h		;91b1	63 	c 
	defb 063h		;91b2	63 	c 
	defb 03eh		;91b3	3e 	> 
	defb 01ch		;91b4	1c 	. 
	defb 000h		;91b5	00 	. 
	defb 000h		;91b6	00 	. 
	defb 000h		;91b7	00 	. 
	defb 000h		;91b8	00 	. 
	defb 01ch		;91b9	1c 	. 
	defb 03eh		;91ba	3e 	> 
	defb 063h		;91bb	63 	c 
	defb 003h		;91bc	03 	. 
	defb 003h		;91bd	03 	. 
	defb 01fh		;91be	1f 	. 
	defb 03fh		;91bf	3f 	? 
	defb 063h		;91c0	63 	c 
	defb 00ch		;91c1	0c 	. 
	defb 00ch		;91c2	0c 	. 
	defb 00ch		;91c3	0c 	. 
	defb 00ch		;91c4	0c 	. 
	defb 000h		;91c5	00 	. 
	defb 000h		;91c6	00 	. 
	defb 000h		;91c7	00 	. 
	defb 000h		;91c8	00 	. 
	defb 07fh		;91c9	7f 	 
	defb 07fh		;91ca	7f 	 
	defb 033h		;91cb	33 	3 
	defb 030h		;91cc	30 	0 
	defb 030h		;91cd	30 	0 
	defb 018h		;91ce	18 	. 
	defb 018h		;91cf	18 	. 
	defb 018h		;91d0	18 	. 
	defb 063h		;91d1	63 	c 
	defb 063h		;91d2	63 	c 
	defb 03eh		;91d3	3e 	> 
	defb 01ch		;91d4	1c 	. 
	defb 000h		;91d5	00 	. 
	defb 000h		;91d6	00 	. 
	defb 000h		;91d7	00 	. 
	defb 000h		;91d8	00 	. 
	defb 01ch		;91d9	1c 	. 
	defb 03eh		;91da	3e 	> 
	defb 063h		;91db	63 	c 
	defb 063h		;91dc	63 	c 
	defb 03eh		;91dd	3e 	> 
	defb 01ch		;91de	1c 	. 
	defb 03eh		;91df	3e 	> 
	defb 063h		;91e0	63 	c 
	defb 060h		;91e1	60 	` 
	defb 063h		;91e2	63 	c 
	defb 03fh		;91e3	3f 	? 
	defb 01eh		;91e4	1e 	. 
	defb 000h		;91e5	00 	. 
	defb 000h		;91e6	00 	. 
	defb 000h		;91e7	00 	. 
	defb 000h		;91e8	00 	. 
	defb 01ch		;91e9	1c 	. 
	defb 03eh		;91ea	3e 	> 
	defb 063h		;91eb	63 	c 
	defb 063h		;91ec	63 	c 
	defb 063h		;91ed	63 	c 
	defb 07eh		;91ee	7e 	~ 
	defb 07ch		;91ef	7c 	| 
	defb 060h		;91f0	60 	` 
	defb 01ch		;91f1	1c 	. 
	defb 01ch		;91f2	1c 	. 
	defb 01ch		;91f3	1c 	. 
	defb 000h		;91f4	00 	. 
	defb 000h		;91f5	00 	. 
	defb 000h		;91f6	00 	. 
	defb 000h		;91f7	00 	. 
	defb 000h		;91f8	00 	. 
	defb 000h		;91f9	00 	. 
	defb 000h		;91fa	00 	. 
	defb 000h		;91fb	00 	. 
	defb 01ch		;91fc	1c 	. 
	defb 01ch		;91fd	1c 	. 
	defb 01ch		;91fe	1c 	. 
	defb 000h		;91ff	00 	. 
	defb 000h		;9200	00 	. 
	defb 038h		;9201	38 	8 
	defb 038h		;9202	38 	8 
	defb 038h		;9203	38 	8 
	defb 018h		;9204	18 	. 
	defb 00ch		;9205	0c 	. 
	defb 000h		;9206	00 	. 
	defb 000h		;9207	00 	. 
	defb 000h		;9208	00 	. 
	defb 000h		;9209	00 	. 
	defb 000h		;920a	00 	. 
	defb 000h		;920b	00 	. 
	defb 038h		;920c	38 	8 
	defb 038h		;920d	38 	8 
	defb 038h		;920e	38 	8 
	defb 000h		;920f	00 	. 
	defb 000h		;9210	00 	. 
	defb 006h		;9211	06 	. 
	defb 00ch		;9212	0c 	. 
	defb 018h		;9213	18 	. 
	defb 030h		;9214	30 	0 
	defb 060h		;9215	60 	` 
	defb 000h		;9216	00 	. 
	defb 000h		;9217	00 	. 
	defb 000h		;9218	00 	. 
	defb 060h		;9219	60 	` 
	defb 030h		;921a	30 	0 
	defb 018h		;921b	18 	. 
	defb 00ch		;921c	0c 	. 
	defb 006h		;921d	06 	. 
	defb 003h		;921e	03 	. 
	defb 001h		;921f	01 	. 
	defb 003h		;9220	03 	. 
	defb 07eh		;9221	7e 	~ 
	defb 07eh		;9222	7e 	~ 
	defb 000h		;9223	00 	. 
	defb 000h		;9224	00 	. 
	defb 000h		;9225	00 	. 
	defb 000h		;9226	00 	. 
	defb 000h		;9227	00 	. 
	defb 000h		;9228	00 	. 
	defb 000h		;9229	00 	. 
	defb 000h		;922a	00 	. 
	defb 000h		;922b	00 	. 
	defb 000h		;922c	00 	. 
	defb 07eh		;922d	7e 	~ 
	defb 07eh		;922e	7e 	~ 
	defb 000h		;922f	00 	. 
	defb 000h		;9230	00 	. 
	defb 030h		;9231	30 	0 
	defb 018h		;9232	18 	. 
	defb 00ch		;9233	0c 	. 
	defb 006h		;9234	06 	. 
	defb 003h		;9235	03 	. 
	defb 000h		;9236	00 	. 
	defb 000h		;9237	00 	. 
	defb 000h		;9238	00 	. 
	defb 003h		;9239	03 	. 
	defb 006h		;923a	06 	. 
	defb 00ch		;923b	0c 	. 
	defb 018h		;923c	18 	. 
	defb 030h		;923d	30 	0 
	defb 060h		;923e	60 	` 
	defb 060h		;923f	60 	` 
	defb 060h		;9240	60 	` 
	defb 000h		;9241	00 	. 
	defb 000h		;9242	00 	. 
	defb 00ch		;9243	0c 	. 
	defb 00ch		;9244	0c 	. 
	defb 000h		;9245	00 	. 
	defb 000h		;9246	00 	. 
	defb 000h		;9247	00 	. 
	defb 000h		;9248	00 	. 
	defb 01ch		;9249	1c 	. 
	defb 03eh		;924a	3e 	> 
	defb 060h		;924b	60 	` 
	defb 060h		;924c	60 	` 
	defb 038h		;924d	38 	8 
	defb 01ch		;924e	1c 	. 
	defb 00ch		;924f	0c 	. 
	defb 00ch		;9250	0c 	. 
	defb 07bh		;9251	7b 	{ 
	defb 07bh		;9252	7b 	{ 
	defb 05fh		;9253	5f 	_ 
	defb 06eh		;9254	6e 	n 
	defb 000h		;9255	00 	. 
	defb 000h		;9256	00 	. 
	defb 000h		;9257	00 	. 
	defb 000h		;9258	00 	. 
	defb 01ch		;9259	1c 	. 
	defb 03eh		;925a	3e 	> 
	defb 063h		;925b	63 	c 
	defb 063h		;925c	63 	c 
	defb 060h		;925d	60 	` 
	defb 06ch		;925e	6c 	l 
	defb 05eh		;925f	5e 	^ 
	defb 07bh		;9260	7b 	{ 
	defb 036h		;9261	36 	6 
	defb 036h		;9262	36 	6 
	defb 036h		;9263	36 	6 
	defb 077h		;9264	77 	w 
	defb 000h		;9265	00 	. 
	defb 000h		;9266	00 	. 
	defb 000h		;9267	00 	. 
	defb 000h		;9268	00 	. 
	defb 01ch		;9269	1c 	. 
	defb 03eh		;926a	3e 	> 
	defb 036h		;926b	36 	6 
	defb 036h		;926c	36 	6 
	defb 036h		;926d	36 	6 
	defb 03eh		;926e	3e 	> 
	defb 03eh		;926f	3e 	> 
	defb 036h		;9270	36 	6 
	defb 066h		;9271	66 	f 
	defb 066h		;9272	66 	f 
	defb 03eh		;9273	3e 	> 
	defb 01fh		;9274	1f 	. 
	defb 000h		;9275	00 	. 
	defb 000h		;9276	00 	. 
	defb 000h		;9277	00 	. 
	defb 000h		;9278	00 	. 
	defb 03fh		;9279	3f 	? 
	defb 07eh		;927a	7e 	~ 
	defb 066h		;927b	66 	f 
	defb 066h		;927c	66 	f 
	defb 03eh		;927d	3e 	> 
	defb 01eh		;927e	1e 	. 
	defb 03eh		;927f	3e 	> 
	defb 066h		;9280	66 	f 
	defb 006h		;9281	06 	. 
	defb 066h		;9282	66 	f 
	defb 07ch		;9283	7c 	| 
	defb 038h		;9284	38 	8 
	defb 000h		;9285	00 	. 
	defb 000h		;9286	00 	. 
	defb 000h		;9287	00 	. 
	defb 000h		;9288	00 	. 
	defb 038h		;9289	38 	8 
	defb 07ch		;928a	7c 	| 
	defb 066h		;928b	66 	f 
	defb 006h		;928c	06 	. 
	defb 006h		;928d	06 	. 
	defb 006h		;928e	06 	. 
	defb 006h		;928f	06 	. 
	defb 006h		;9290	06 	. 
	defb 066h		;9291	66 	f 
	defb 066h		;9292	66 	f 
	defb 03eh		;9293	3e 	> 
	defb 01fh		;9294	1f 	. 
	defb 000h		;9295	00 	. 
	defb 000h		;9296	00 	. 
	defb 000h		;9297	00 	. 
	defb 000h		;9298	00 	. 
	defb 01fh		;9299	1f 	. 
	defb 03eh		;929a	3e 	> 
	defb 066h		;929b	66 	f 
	defb 066h		;929c	66 	f 
	defb 066h		;929d	66 	f 
	defb 066h		;929e	66 	f 
	defb 066h		;929f	66 	f 
	defb 066h		;92a0	66 	f 
	defb 006h		;92a1	06 	. 
	defb 046h		;92a2	46 	F 
	defb 07eh		;92a3	7e 	~ 
	defb 07fh		;92a4	7f 	 
	defb 000h		;92a5	00 	. 
	defb 000h		;92a6	00 	. 
	defb 000h		;92a7	00 	. 
	defb 000h		;92a8	00 	. 
	defb 07fh		;92a9	7f 	 
sub_92aah:
	defb 07eh		;92aa	7e 	~ 
	defb 046h		;92ab	46 	F 
	defb 006h		;92ac	06 	. 
	defb 006h		;92ad	06 	. 
	defb 01eh		;92ae	1e 	. 
	defb 01eh		;92af	1e 	. 
	defb 006h		;92b0	06 	. 
	defb 006h		;92b1	06 	. 
	defb 006h		;92b2	06 	. 
	defb 006h		;92b3	06 	. 
	defb 00fh		;92b4	0f 	. 
	defb 000h		;92b5	00 	. 
	defb 000h		;92b6	00 	. 
	defb 000h		;92b7	00 	. 
	defb 000h		;92b8	00 	. 
	defb 07fh		;92b9	7f 	 
	defb 07eh		;92ba	7e 	~ 
	defb 046h		;92bb	46 	F 
	defb 006h		;92bc	06 	. 
	defb 006h		;92bd	06 	. 
	defb 01eh		;92be	1e 	. 
	defb 01eh		;92bf	1e 	. 
	defb 006h		;92c0	06 	. 
	defb 066h		;92c1	66 	f 
	defb 066h		;92c2	66 	f 
	defb 07ch		;92c3	7c 	| 
	defb 038h		;92c4	38 	8 
	defb 000h		;92c5	00 	. 
	defb 000h		;92c6	00 	. 
	defb 000h		;92c7	00 	. 
	defb 000h		;92c8	00 	. 
	defb 038h		;92c9	38 	8 
	defb 07ch		;92ca	7c 	| 
	defb 066h		;92cb	66 	f 
	defb 066h		;92cc	66 	f 
	defb 006h		;92cd	06 	. 
	defb 006h		;92ce	06 	. 
	defb 076h		;92cf	76 	v 
	defb 066h		;92d0	66 	f 
	defb 036h		;92d1	36 	6 
	defb 036h		;92d2	36 	6 
	defb 036h		;92d3	36 	6 
	defb 077h		;92d4	77 	w 
	defb 000h		;92d5	00 	. 
	defb 000h		;92d6	00 	. 
	defb 000h		;92d7	00 	. 
	defb 000h		;92d8	00 	. 
	defb 077h		;92d9	77 	w 
	defb 036h		;92da	36 	6 
	defb 036h		;92db	36 	6 
	defb 036h		;92dc	36 	6 
	defb 036h		;92dd	36 	6 
	defb 03eh		;92de	3e 	> 
	defb 03eh		;92df	3e 	> 
	defb 036h		;92e0	36 	6 
	defb 018h		;92e1	18 	. 
	defb 018h		;92e2	18 	. 
	defb 018h		;92e3	18 	. 
	defb 03ch		;92e4	3c 	< 
	defb 000h		;92e5	00 	. 
	defb 000h		;92e6	00 	. 
	defb 000h		;92e7	00 	. 
	defb 000h		;92e8	00 	. 
	defb 03ch		;92e9	3c 	< 
	defb 018h		;92ea	18 	. 
	defb 018h		;92eb	18 	. 
	defb 018h		;92ec	18 	. 
	defb 018h		;92ed	18 	. 
	defb 018h		;92ee	18 	. 
	defb 018h		;92ef	18 	. 
	defb 018h		;92f0	18 	. 
	defb 018h		;92f1	18 	. 
	defb 018h		;92f2	18 	. 
	defb 018h		;92f3	18 	. 
	defb 018h		;92f4	18 	. 
	defb 00eh		;92f5	0e 	. 
	defb 000h		;92f6	00 	. 
	defb 000h		;92f7	00 	. 
	defb 000h		;92f8	00 	. 
	defb 03ch		;92f9	3c 	< 
	defb 018h		;92fa	18 	. 
	defb 018h		;92fb	18 	. 
	defb 018h		;92fc	18 	. 
	defb 018h		;92fd	18 	. 
	defb 018h		;92fe	18 	. 
	defb 018h		;92ff	18 	. 
	defb 018h		;9300	18 	. 
	defb 03ch		;9301	3c 	< 
	defb 06ch		;9302	6c 	l 
	defb 0cch		;9303	cc 	. 
	defb 0eeh		;9304	ee 	. 
	defb 000h		;9305	00 	. 
	defb 000h		;9306	00 	. 
	defb 000h		;9307	00 	. 
	defb 000h		;9308	00 	. 
	defb 0eeh		;9309	ee 	. 
	defb 0cch		;930a	cc 	. 
	defb 06ch		;930b	6c 	l 
	defb 03ch		;930c	3c 	< 
	defb 01ch		;930d	1c 	. 
	defb 00ch		;930e	0c 	. 
	defb 00ch		;930f	0c 	. 
	defb 01ch		;9310	1c 	. 
	defb 00ch		;9311	0c 	. 
	defb 04ch		;9312	4c 	L 
	defb 07ch		;9313	7c 	| 
	defb 07eh		;9314	7e 	~ 
	defb 000h		;9315	00 	. 
	defb 000h		;9316	00 	. 
	defb 000h		;9317	00 	. 
	defb 000h		;9318	00 	. 
	defb 01eh		;9319	1e 	. 
	defb 00ch		;931a	0c 	. 
	defb 00ch		;931b	0c 	. 
	defb 00ch		;931c	0c 	. 
	defb 00ch		;931d	0c 	. 
	defb 00ch		;931e	0c 	. 
	defb 00ch		;931f	0c 	. 
	defb 00ch		;9320	0c 	. 
	defb 036h		;9321	36 	6 
	defb 036h		;9322	36 	6 
	defb 036h		;9323	36 	6 
	defb 077h		;9324	77 	w 
	defb 000h		;9325	00 	. 
	defb 000h		;9326	00 	. 
	defb 000h		;9327	00 	. 
	defb 000h		;9328	00 	. 
	defb 077h		;9329	77 	w 
	defb 036h		;932a	36 	6 
	defb 03eh		;932b	3e 	> 
	defb 03eh		;932c	3e 	> 
	defb 03eh		;932d	3e 	> 
	defb 03eh		;932e	3e 	> 
	defb 036h		;932f	36 	6 
	defb 036h		;9330	36 	6 
	defb 066h		;9331	66 	f 
	defb 066h		;9332	66 	f 
	defb 066h		;9333	66 	f 
	defb 067h		;9334	67 	g 
	defb 000h		;9335	00 	. 
	defb 000h		;9336	00 	. 
	defb 000h		;9337	00 	. 
	defb 000h		;9338	00 	. 
	defb 0e7h		;9339	e7 	. 
	defb 066h		;933a	66 	f 
	defb 066h		;933b	66 	f 
	defb 066h		;933c	66 	f 
	defb 06eh		;933d	6e 	n 
	defb 06eh		;933e	6e 	n 
	defb 076h		;933f	76 	v 
	defb 076h		;9340	76 	v 
	defb 066h		;9341	66 	f 
	defb 066h		;9342	66 	f 
	defb 07eh		;9343	7e 	~ 
	defb 03ch		;9344	3c 	< 
	defb 000h		;9345	00 	. 
	defb 000h		;9346	00 	. 
	defb 000h		;9347	00 	. 
	defb 000h		;9348	00 	. 
	defb 03ch		;9349	3c 	< 
	defb 07eh		;934a	7e 	~ 
	defb 066h		;934b	66 	f 
	defb 066h		;934c	66 	f 
	defb 066h		;934d	66 	f 
	defb 066h		;934e	66 	f 
	defb 066h		;934f	66 	f 
	defb 066h		;9350	66 	f 
	defb 006h		;9351	06 	. 
	defb 006h		;9352	06 	. 
	defb 006h		;9353	06 	. 
	defb 00fh		;9354	0f 	. 
	defb 000h		;9355	00 	. 
	defb 000h		;9356	00 	. 
	defb 000h		;9357	00 	. 
	defb 000h		;9358	00 	. 
	defb 01fh		;9359	1f 	. 
	defb 03eh		;935a	3e 	> 
	defb 066h		;935b	66 	f 
	defb 066h		;935c	66 	f 
	defb 03eh		;935d	3e 	> 
	defb 01eh		;935e	1e 	. 
	defb 006h		;935f	06 	. 
	defb 006h		;9360	06 	. 
	defb 066h		;9361	66 	f 
	defb 076h		;9362	76 	v 
	defb 07eh		;9363	7e 	~ 
	defb 03ch		;9364	3c 	< 
	defb 060h		;9365	60 	` 
	defb 040h		;9366	40 	@ 
	defb 000h		;9367	00 	. 
	defb 000h		;9368	00 	. 
	defb 03ch		;9369	3c 	< 
	defb 07eh		;936a	7e 	~ 
	defb 066h		;936b	66 	f 
	defb 066h		;936c	66 	f 
	defb 066h		;936d	66 	f 
	defb 066h		;936e	66 	f 
	defb 066h		;936f	66 	f 
	defb 066h		;9370	66 	f 
	defb 036h		;9371	36 	6 
	defb 036h		;9372	36 	6 
	defb 066h		;9373	66 	f 
	defb 067h		;9374	67 	g 
	defb 000h		;9375	00 	. 
	defb 000h		;9376	00 	. 
	defb 000h		;9377	00 	. 
	defb 000h		;9378	00 	. 
	defb 01fh		;9379	1f 	. 
	defb 03eh		;937a	3e 	> 
	defb 066h		;937b	66 	f 
	defb 066h		;937c	66 	f 
	defb 03eh		;937d	3e 	> 
	defb 01eh		;937e	1e 	. 
	defb 00eh		;937f	0e 	. 
	defb 01eh		;9380	1e 	. 
	defb 060h		;9381	60 	` 
	defb 066h		;9382	66 	f 
	defb 07eh		;9383	7e 	~ 
	defb 03ch		;9384	3c 	< 
	defb 000h		;9385	00 	. 
	defb 000h		;9386	00 	. 
	defb 000h		;9387	00 	. 
	defb 000h		;9388	00 	. 
	defb 03ch		;9389	3c 	< 
	defb 07eh		;938a	7e 	~ 
	defb 066h		;938b	66 	f 
	defb 006h		;938c	06 	. 
	defb 006h		;938d	06 	. 
	defb 01ch		;938e	1c 	. 
	defb 038h		;938f	38 	8 
	defb 060h		;9390	60 	` 
	defb 018h		;9391	18 	. 
	defb 018h		;9392	18 	. 
	defb 018h		;9393	18 	. 
	defb 03ch		;9394	3c 	< 
	defb 000h		;9395	00 	. 
	defb 000h		;9396	00 	. 
	defb 000h		;9397	00 	. 
	defb 000h		;9398	00 	. 
	defb 0ffh		;9399	ff 	. 
	defb 0ffh		;939a	ff 	. 
	defb 099h		;939b	99 	. 
	defb 018h		;939c	18 	. 
	defb 018h		;939d	18 	. 
	defb 018h		;939e	18 	. 
	defb 018h		;939f	18 	. 
	defb 018h		;93a0	18 	. 
	defb 066h		;93a1	66 	f 
	defb 066h		;93a2	66 	f 
	defb 07eh		;93a3	7e 	~ 
	defb 03ch		;93a4	3c 	< 
	defb 000h		;93a5	00 	. 
	defb 000h		;93a6	00 	. 
	defb 000h		;93a7	00 	. 
	defb 000h		;93a8	00 	. 
	defb 066h		;93a9	66 	f 
	defb 066h		;93aa	66 	f 
	defb 066h		;93ab	66 	f 
	defb 066h		;93ac	66 	f 
	defb 066h		;93ad	66 	f 
	defb 066h		;93ae	66 	f 
	defb 066h		;93af	66 	f 
	defb 066h		;93b0	66 	f 
	defb 01ch		;93b1	1c 	. 
	defb 01ch		;93b2	1c 	. 
	defb 008h		;93b3	08 	. 
	defb 008h		;93b4	08 	. 
	defb 000h		;93b5	00 	. 
	defb 000h		;93b6	00 	. 
	defb 000h		;93b7	00 	. 
	defb 000h		;93b8	00 	. 
	defb 077h		;93b9	77 	w 
	defb 036h		;93ba	36 	6 
	defb 036h		;93bb	36 	6 
	defb 036h		;93bc	36 	6 
	defb 036h		;93bd	36 	6 
	defb 036h		;93be	36 	6 
	defb 01ch		;93bf	1c 	. 
	defb 01ch		;93c0	1c 	. 
	defb 036h		;93c1	36 	6 
	defb 036h		;93c2	36 	6 
	defb 036h		;93c3	36 	6 
	defb 036h		;93c4	36 	6 
	defb 000h		;93c5	00 	. 
	defb 000h		;93c6	00 	. 
	defb 000h		;93c7	00 	. 
	defb 000h		;93c8	00 	. 
	defb 077h		;93c9	77 	w 
	defb 022h		;93ca	22 	" 
	defb 022h		;93cb	22 	" 
	defb 02ah		;93cc	2a 	* 
	defb 02ah		;93cd	2a 	* 
	defb 03eh		;93ce	3e 	> 
	defb 03eh		;93cf	3e 	> 
	defb 036h		;93d0	36 	6 
	defb 014h		;93d1	14 	. 
	defb 036h		;93d2	36 	6 
	defb 036h		;93d3	36 	6 
	defb 077h		;93d4	77 	w 
	defb 000h		;93d5	00 	. 
	defb 000h		;93d6	00 	. 
	defb 000h		;93d7	00 	. 
	defb 000h		;93d8	00 	. 
	defb 077h		;93d9	77 	w 
	defb 036h		;93da	36 	6 
	defb 036h		;93db	36 	6 
	defb 014h		;93dc	14 	. 
	defb 014h		;93dd	14 	. 
	defb 01ch		;93de	1c 	. 
	defb 01ch		;93df	1c 	. 
	defb 014h		;93e0	14 	. 
	defb 018h		;93e1	18 	. 
	defb 018h		;93e2	18 	. 
	defb 018h		;93e3	18 	. 
	defb 03ch		;93e4	3c 	< 
	defb 000h		;93e5	00 	. 
	defb 000h		;93e6	00 	. 
	defb 000h		;93e7	00 	. 
	defb 000h		;93e8	00 	. 
	defb 0e7h		;93e9	e7 	. 
	defb 066h		;93ea	66 	f 
	defb 066h		;93eb	66 	f 
	defb 066h		;93ec	66 	f 
	defb 03ch		;93ed	3c 	< 
	defb 03ch		;93ee	3c 	< 
	defb 03ch		;93ef	3c 	< 
	defb 018h		;93f0	18 	. 
	defb 00ch		;93f1	0c 	. 
	defb 04ch		;93f2	4c 	L 
	defb 07eh		;93f3	7e 	~ 
	defb 07eh		;93f4	7e 	~ 
	defb 000h		;93f5	00 	. 
	defb 000h		;93f6	00 	. 
	defb 000h		;93f7	00 	. 
	defb 000h		;93f8	00 	. 
	defb 07eh		;93f9	7e 	~ 
	defb 07eh		;93fa	7e 	~ 
	defb 062h		;93fb	62 	b 
	defb 060h		;93fc	60 	` 
	defb 030h		;93fd	30 	0 
	defb 030h		;93fe	30 	0 
	defb 018h		;93ff	18 	. 
	defb 018h		;9400	18 	. 
	defb 018h		;9401	18 	. 
	defb 018h		;9402	18 	. 
	defb 018h		;9403	18 	. 
	defb 078h		;9404	78 	x 
	defb 078h		;9405	78 	x 
	defb 000h		;9406	00 	. 
	defb 000h		;9407	00 	. 
	defb 000h		;9408	00 	. 
	defb 078h		;9409	78 	x 
	defb 078h		;940a	78 	x 
	defb 018h		;940b	18 	. 
	defb 018h		;940c	18 	. 
	defb 018h		;940d	18 	. 
	defb 018h		;940e	18 	. 
	defb 018h		;940f	18 	. 
	defb 018h		;9410	18 	. 
	defb 018h		;9411	18 	. 
	defb 030h		;9412	30 	0 
	defb 030h		;9413	30 	0 
	defb 060h		;9414	60 	` 
	defb 060h		;9415	60 	` 
	defb 000h		;9416	00 	. 
	defb 000h		;9417	00 	. 
	defb 000h		;9418	00 	. 
	defb 003h		;9419	03 	. 
	defb 003h		;941a	03 	. 
	defb 003h		;941b	03 	. 
	defb 006h		;941c	06 	. 
	defb 006h		;941d	06 	. 
	defb 00ch		;941e	0c 	. 
	defb 00ch		;941f	0c 	. 
	defb 018h		;9420	18 	. 
	defb 00ch		;9421	0c 	. 
	defb 00ch		;9422	0c 	. 
	defb 00ch		;9423	0c 	. 
	defb 00fh		;9424	0f 	. 
	defb 00fh		;9425	0f 	. 
	defb 000h		;9426	00 	. 
	defb 000h		;9427	00 	. 
	defb 000h		;9428	00 	. 
	defb 00fh		;9429	0f 	. 
	defb 00fh		;942a	0f 	. 
	defb 00ch		;942b	0c 	. 
	defb 00ch		;942c	0c 	. 
	defb 00ch		;942d	0c 	. 
	defb 00ch		;942e	0c 	. 
	defb 00ch		;942f	0c 	. 
	defb 00ch		;9430	0c 	. 
	defb 000h		;9431	00 	. 
	defb 000h		;9432	00 	. 
	defb 000h		;9433	00 	. 
	defb 000h		;9434	00 	. 
	defb 000h		;9435	00 	. 
	defb 000h		;9436	00 	. 
	defb 000h		;9437	00 	. 
	defb 000h		;9438	00 	. 
	defb 018h		;9439	18 	. 
	defb 03ch		;943a	3c 	< 
	defb 066h		;943b	66 	f 
	defb 0c3h		;943c	c3 	. 
	defb 000h		;943d	00 	. 
	defb 000h		;943e	00 	. 
	defb 000h		;943f	00 	. 
	defb 000h		;9440	00 	. 
	defb 000h		;9441	00 	. 
	defb 000h		;9442	00 	. 
	defb 000h		;9443	00 	. 
	defb 000h		;9444	00 	. 
	defb 000h		;9445	00 	. 
	defb 0ffh		;9446	ff 	. 
	defb 0ffh		;9447	ff 	. 
	defb 000h		;9448	00 	. 
	defb 000h		;9449	00 	. 
	defb 000h		;944a	00 	. 
	defb 000h		;944b	00 	. 
	defb 000h		;944c	00 	. 
	defb 000h		;944d	00 	. 
	defb 000h		;944e	00 	. 
	defb 000h		;944f	00 	. 
	defb 000h		;9450	00 	. 
	defb 000h		;9451	00 	. 
	defb 000h		;9452	00 	. 
	defb 000h		;9453	00 	. 
	defb 000h		;9454	00 	. 
	defb 000h		;9455	00 	. 
	defb 000h		;9456	00 	. 
	defb 000h		;9457	00 	. 
	defb 000h		;9458	00 	. 
	defb 01ch		;9459	1c 	. 
	defb 01ch		;945a	1c 	. 
	defb 00ch		;945b	0c 	. 
	defb 018h		;945c	18 	. 
	defb 030h		;945d	30 	0 
	defb 000h		;945e	00 	. 
	defb 000h		;945f	00 	. 
	defb 000h		;9460	00 	. 
	defb 07eh		;9461	7e 	~ 
	defb 066h		;9462	66 	f 
	defb 0feh		;9463	fe 	. 
	defb 0bch		;9464	bc 	. 
	defb 000h		;9465	00 	. 
	defb 000h		;9466	00 	. 
	defb 000h		;9467	00 	. 
	defb 000h		;9468	00 	. 
	defb 000h		;9469	00 	. 
	defb 000h		;946a	00 	. 
	defb 000h		;946b	00 	. 
	defb 000h		;946c	00 	. 
	defb 03ch		;946d	3c 	< 
	defb 07eh		;946e	7e 	~ 
	defb 060h		;946f	60 	` 
	defb 07ch		;9470	7c 	| 
	defb 066h		;9471	66 	f 
	defb 066h		;9472	66 	f 
	defb 03eh		;9473	3e 	> 
	defb 01ah		;9474	1a 	. 
	defb 000h		;9475	00 	. 
	defb 000h		;9476	00 	. 
	defb 000h		;9477	00 	. 
	defb 000h		;9478	00 	. 
	defb 007h		;9479	07 	. 
	defb 007h		;947a	07 	. 
	defb 006h		;947b	06 	. 
	defb 006h		;947c	06 	. 
	defb 01eh		;947d	1e 	. 
	defb 03eh		;947e	3e 	> 
	defb 066h		;947f	66 	f 
	defb 066h		;9480	66 	f 
	defb 006h		;9481	06 	. 
	defb 046h		;9482	46 	F 
	defb 07ch		;9483	7c 	| 
	defb 038h		;9484	38 	8 
	defb 000h		;9485	00 	. 
	defb 000h		;9486	00 	. 
	defb 000h		;9487	00 	. 
	defb 000h		;9488	00 	. 
	defb 000h		;9489	00 	. 
	defb 000h		;948a	00 	. 
	defb 000h		;948b	00 	. 
	defb 000h		;948c	00 	. 
	defb 038h		;948d	38 	8 
	defb 07ch		;948e	7c 	| 
	defb 046h		;948f	46 	F 
	defb 006h		;9490	06 	. 
	defb 066h		;9491	66 	f 
	defb 066h		;9492	66 	f 
	defb 0fch		;9493	fc 	. 
	defb 0d8h		;9494	d8 	. 
	defb 000h		;9495	00 	. 
	defb 000h		;9496	00 	. 
	defb 000h		;9497	00 	. 
	defb 000h		;9498	00 	. 
	defb 070h		;9499	70 	p 
	defb 060h		;949a	60 	` 
	defb 060h		;949b	60 	` 
	defb 060h		;949c	60 	` 
	defb 078h		;949d	78 	x 
	defb 07ch		;949e	7c 	| 
	defb 066h		;949f	66 	f 
	defb 066h		;94a0	66 	f 
	defb 006h		;94a1	06 	. 
	defb 046h		;94a2	46 	F 
	defb 07eh		;94a3	7e 	~ 
	defb 03ch		;94a4	3c 	< 
	defb 000h		;94a5	00 	. 
	defb 000h		;94a6	00 	. 
	defb 000h		;94a7	00 	. 
	defb 000h		;94a8	00 	. 
	defb 000h		;94a9	00 	. 
	defb 000h		;94aa	00 	. 
	defb 000h		;94ab	00 	. 
	defb 000h		;94ac	00 	. 
	defb 03ch		;94ad	3c 	< 
	defb 066h		;94ae	66 	f 
	defb 066h		;94af	66 	f 
	defb 03eh		;94b0	3e 	> 
	defb 018h		;94b1	18 	. 
	defb 018h		;94b2	18 	. 
	defb 018h		;94b3	18 	. 
	defb 03ch		;94b4	3c 	< 
	defb 000h		;94b5	00 	. 
	defb 000h		;94b6	00 	. 
	defb 000h		;94b7	00 	. 
	defb 000h		;94b8	00 	. 
	defb 070h		;94b9	70 	p 
	defb 078h		;94ba	78 	x 
	defb 018h		;94bb	18 	. 
	defb 018h		;94bc	18 	. 
	defb 07eh		;94bd	7e 	~ 
	defb 07eh		;94be	7e 	~ 
	defb 018h		;94bf	18 	. 
	defb 018h		;94c0	18 	. 
	defb 01ch		;94c1	1c 	. 
	defb 006h		;94c2	06 	. 
	defb 01eh		;94c3	1e 	. 
	defb 03eh		;94c4	3e 	> 
	defb 063h		;94c5	63 	c 
	defb 07fh		;94c6	7f 	 
	defb 03eh		;94c7	3e 	> 
	defb 000h		;94c8	00 	. 
	defb 000h		;94c9	00 	. 
	defb 000h		;94ca	00 	. 
	defb 000h		;94cb	00 	. 
	defb 000h		;94cc	00 	. 
	defb 0bch		;94cd	bc 	. 
	defb 07eh		;94ce	7e 	~ 
	defb 066h		;94cf	66 	f 
	defb 03eh		;94d0	3e 	> 
	defb 066h		;94d1	66 	f 
	defb 066h		;94d2	66 	f 
	defb 066h		;94d3	66 	f 
	defb 0e7h		;94d4	e7 	. 
	defb 000h		;94d5	00 	. 
	defb 000h		;94d6	00 	. 
	defb 000h		;94d7	00 	. 
	defb 000h		;94d8	00 	. 
	defb 007h		;94d9	07 	. 
	defb 006h		;94da	06 	. 
	defb 006h		;94db	06 	. 
	defb 006h		;94dc	06 	. 
	defb 03eh		;94dd	3e 	> 
	defb 07eh		;94de	7e 	~ 
	defb 066h		;94df	66 	f 
	defb 066h		;94e0	66 	f 
	defb 018h		;94e1	18 	. 
	defb 018h		;94e2	18 	. 
	defb 018h		;94e3	18 	. 
	defb 03ch		;94e4	3c 	< 
	defb 000h		;94e5	00 	. 
	defb 000h		;94e6	00 	. 
	defb 000h		;94e7	00 	. 
	defb 000h		;94e8	00 	. 
	defb 000h		;94e9	00 	. 
	defb 018h		;94ea	18 	. 
	defb 018h		;94eb	18 	. 
	defb 000h		;94ec	00 	. 
	defb 01ch		;94ed	1c 	. 
	defb 018h		;94ee	18 	. 
	defb 018h		;94ef	18 	. 
	defb 018h		;94f0	18 	. 
	defb 018h		;94f1	18 	. 
	defb 018h		;94f2	18 	. 
	defb 018h		;94f3	18 	. 
	defb 01ah		;94f4	1a 	. 
	defb 01eh		;94f5	1e 	. 
	defb 00ch		;94f6	0c 	. 
	defb 000h		;94f7	00 	. 
	defb 000h		;94f8	00 	. 
	defb 000h		;94f9	00 	. 
	defb 018h		;94fa	18 	. 
	defb 018h		;94fb	18 	. 
	defb 000h		;94fc	00 	. 
	defb 01ch		;94fd	1c 	. 
	defb 01ch		;94fe	1c 	. 
	defb 018h		;94ff	18 	. 
	defb 018h		;9500	18 	. 
	defb 036h		;9501	36 	6 
	defb 036h		;9502	36 	6 
	defb 066h		;9503	66 	f 
	defb 066h		;9504	66 	f 
	defb 000h		;9505	00 	. 
	defb 000h		;9506	00 	. 
	defb 000h		;9507	00 	. 
	defb 000h		;9508	00 	. 
	defb 007h		;9509	07 	. 
	defb 006h		;950a	06 	. 
	defb 006h		;950b	06 	. 
	defb 006h		;950c	06 	. 
	defb 076h		;950d	76 	v 
	defb 076h		;950e	76 	v 
	defb 01eh		;950f	1e 	. 
	defb 01eh		;9510	1e 	. 
	defb 018h		;9511	18 	. 
	defb 018h		;9512	18 	. 
	defb 018h		;9513	18 	. 
	defb 03ch		;9514	3c 	< 
	defb 000h		;9515	00 	. 
	defb 000h		;9516	00 	. 
	defb 000h		;9517	00 	. 
	defb 000h		;9518	00 	. 
	defb 01ch		;9519	1c 	. 
	defb 018h		;951a	18 	. 
	defb 018h		;951b	18 	. 
	defb 018h		;951c	18 	. 
	defb 018h		;951d	18 	. 
	defb 018h		;951e	18 	. 
	defb 018h		;951f	18 	. 
	defb 018h		;9520	18 	. 
	defb 06bh		;9521	6b 	k 
	defb 06bh		;9522	6b 	k 
	defb 06bh		;9523	6b 	k 
	defb 06bh		;9524	6b 	k 
	defb 000h		;9525	00 	. 
	defb 000h		;9526	00 	. 
	defb 000h		;9527	00 	. 
	defb 000h		;9528	00 	. 
	defb 000h		;9529	00 	. 
	defb 000h		;952a	00 	. 
	defb 000h		;952b	00 	. 
	defb 000h		;952c	00 	. 
	defb 036h		;952d	36 	6 
	defb 07fh		;952e	7f 	 
	defb 06bh		;952f	6b 	k 
	defb 06bh		;9530	6b 	k 
	defb 066h		;9531	66 	f 
	defb 066h		;9532	66 	f 
	defb 066h		;9533	66 	f 
	defb 066h		;9534	66 	f 
	defb 000h		;9535	00 	. 
	defb 000h		;9536	00 	. 
	defb 000h		;9537	00 	. 
	defb 000h		;9538	00 	. 
	defb 000h		;9539	00 	. 
	defb 000h		;953a	00 	. 
	defb 000h		;953b	00 	. 
	defb 000h		;953c	00 	. 
	defb 03ah		;953d	3a 	: 
	defb 07eh		;953e	7e 	~ 
	defb 066h		;953f	66 	f 
	defb 066h		;9540	66 	f 
	defb 063h		;9541	63 	c 
	defb 063h		;9542	63 	c 
	defb 03eh		;9543	3e 	> 
	defb 01ch		;9544	1c 	. 
	defb 000h		;9545	00 	. 
	defb 000h		;9546	00 	. 
	defb 000h		;9547	00 	. 
	defb 000h		;9548	00 	. 
	defb 000h		;9549	00 	. 
	defb 000h		;954a	00 	. 
	defb 000h		;954b	00 	. 
	defb 000h		;954c	00 	. 
	defb 01ch		;954d	1c 	. 
	defb 03eh		;954e	3e 	> 
	defb 063h		;954f	63 	c 
	defb 063h		;9550	63 	c 
	defb 066h		;9551	66 	f 
	defb 066h		;9552	66 	f 
	defb 03eh		;9553	3e 	> 
	defb 01eh		;9554	1e 	. 
	defb 006h		;9555	06 	. 
	defb 006h		;9556	06 	. 
	defb 00fh		;9557	0f 	. 
	defb 000h		;9558	00 	. 
	defb 000h		;9559	00 	. 
	defb 000h		;955a	00 	. 
	defb 000h		;955b	00 	. 
	defb 000h		;955c	00 	. 
	defb 01bh		;955d	1b 	. 
	defb 03eh		;955e	3e 	> 
	defb 066h		;955f	66 	f 
	defb 066h		;9560	66 	f 
	defb 033h		;9561	33 	3 
	defb 033h		;9562	33 	3 
	defb 03eh		;9563	3e 	> 
	defb 03ch		;9564	3c 	< 
	defb 030h		;9565	30 	0 
	defb 030h		;9566	30 	0 
	defb 078h		;9567	78 	x 
	defb 000h		;9568	00 	. 
	defb 000h		;9569	00 	. 
	defb 000h		;956a	00 	. 
	defb 000h		;956b	00 	. 
	defb 000h		;956c	00 	. 
	defb 02ch		;956d	2c 	, 
	defb 03eh		;956e	3e 	> 
	defb 033h		;956f	33 	3 
	defb 033h		;9570	33 	3 
	defb 00ch		;9571	0c 	. 
	defb 00ch		;9572	0c 	. 
	defb 00ch		;9573	0c 	. 
	defb 01eh		;9574	1e 	. 
	defb 000h		;9575	00 	. 
	defb 000h		;9576	00 	. 
	defb 000h		;9577	00 	. 
	defb 000h		;9578	00 	. 
	defb 000h		;9579	00 	. 
	defb 000h		;957a	00 	. 
	defb 000h		;957b	00 	. 
	defb 000h		;957c	00 	. 
	defb 076h		;957d	76 	v 
	defb 07ch		;957e	7c 	| 
	defb 01ch		;957f	1c 	. 
	defb 00ch		;9580	0c 	. 
	defb 07ch		;9581	7c 	| 
	defb 060h		;9582	60 	` 
	defb 07eh		;9583	7e 	~ 
	defb 03ch		;9584	3c 	< 
	defb 000h		;9585	00 	. 
	defb 000h		;9586	00 	. 
	defb 000h		;9587	00 	. 
	defb 000h		;9588	00 	. 
	defb 000h		;9589	00 	. 
	defb 000h		;958a	00 	. 
	defb 000h		;958b	00 	. 
	defb 000h		;958c	00 	. 
	defb 03ch		;958d	3c 	< 
	defb 07eh		;958e	7e 	~ 
	defb 006h		;958f	06 	. 
	defb 03ch		;9590	3c 	< 
	defb 018h		;9591	18 	. 
	defb 058h		;9592	58 	X 
	defb 078h		;9593	78 	x 
	defb 030h		;9594	30 	0 
	defb 000h		;9595	00 	. 
	defb 000h		;9596	00 	. 
	defb 000h		;9597	00 	. 
	defb 000h		;9598	00 	. 
	defb 018h		;9599	18 	. 
	defb 018h		;959a	18 	. 
	defb 018h		;959b	18 	. 
	defb 018h		;959c	18 	. 
	defb 07eh		;959d	7e 	~ 
	defb 07eh		;959e	7e 	~ 
	defb 018h		;959f	18 	. 
	defb 018h		;95a0	18 	. 
	defb 066h		;95a1	66 	f 
	defb 066h		;95a2	66 	f 
	defb 07eh		;95a3	7e 	~ 
	defb 0dch		;95a4	dc 	. 
	defb 000h		;95a5	00 	. 
	defb 000h		;95a6	00 	. 
	defb 000h		;95a7	00 	. 
	defb 000h		;95a8	00 	. 
	defb 000h		;95a9	00 	. 
	defb 000h		;95aa	00 	. 
	defb 000h		;95ab	00 	. 
	defb 000h		;95ac	00 	. 
	defb 077h		;95ad	77 	w 
	defb 066h		;95ae	66 	f 
	defb 066h		;95af	66 	f 
	defb 066h		;95b0	66 	f 
	defb 01ch		;95b1	1c 	. 
	defb 01ch		;95b2	1c 	. 
	defb 008h		;95b3	08 	. 
	defb 008h		;95b4	08 	. 
	defb 000h		;95b5	00 	. 
	defb 000h		;95b6	00 	. 
	defb 000h		;95b7	00 	. 
	defb 000h		;95b8	00 	. 
	defb 000h		;95b9	00 	. 
	defb 000h		;95ba	00 	. 
	defb 000h		;95bb	00 	. 
	defb 000h		;95bc	00 	. 
	defb 077h		;95bd	77 	w 
	defb 036h		;95be	36 	6 
	defb 036h		;95bf	36 	6 
	defb 036h		;95c0	36 	6 
	defb 07fh		;95c1	7f 	 
	defb 036h		;95c2	36 	6 
	defb 036h		;95c3	36 	6 
	defb 036h		;95c4	36 	6 
	defb 000h		;95c5	00 	. 
	defb 000h		;95c6	00 	. 
	defb 000h		;95c7	00 	. 
	defb 000h		;95c8	00 	. 
	defb 000h		;95c9	00 	. 
	defb 000h		;95ca	00 	. 
	defb 000h		;95cb	00 	. 
	defb 000h		;95cc	00 	. 
	defb 063h		;95cd	63 	c 
	defb 063h		;95ce	63 	c 
	defb 06bh		;95cf	6b 	k 
	defb 06bh		;95d0	6b 	k 
	defb 01ch		;95d1	1c 	. 
	defb 036h		;95d2	36 	6 
	defb 036h		;95d3	36 	6 
	defb 077h		;95d4	77 	w 
	defb 000h		;95d5	00 	. 
	defb 000h		;95d6	00 	. 
	defb 000h		;95d7	00 	. 
	defb 000h		;95d8	00 	. 
	defb 000h		;95d9	00 	. 
	defb 000h		;95da	00 	. 
	defb 000h		;95db	00 	. 
	defb 000h		;95dc	00 	. 
	defb 077h		;95dd	77 	w 
	defb 036h		;95de	36 	6 
	defb 01ch		;95df	1c 	. 
	defb 008h		;95e0	08 	. 
	defb 014h		;95e1	14 	. 
	defb 01ch		;95e2	1c 	. 
	defb 008h		;95e3	08 	. 
	defb 00ch		;95e4	0c 	. 
	defb 00ch		;95e5	0c 	. 
	defb 00ch		;95e6	0c 	. 
	defb 00eh		;95e7	0e 	. 
	defb 000h		;95e8	00 	. 
	defb 000h		;95e9	00 	. 
	defb 000h		;95ea	00 	. 
	defb 000h		;95eb	00 	. 
	defb 000h		;95ec	00 	. 
	defb 077h		;95ed	77 	w 
	defb 036h		;95ee	36 	6 
	defb 036h		;95ef	36 	6 
	defb 036h		;95f0	36 	6 
	defb 018h		;95f1	18 	. 
	defb 00ch		;95f2	0c 	. 
	defb 07eh		;95f3	7e 	~ 
	defb 07eh		;95f4	7e 	~ 
	defb 000h		;95f5	00 	. 
	defb 000h		;95f6	00 	. 
	defb 000h		;95f7	00 	. 
	defb 000h		;95f8	00 	. 
	defb 000h		;95f9	00 	. 
	defb 000h		;95fa	00 	. 
	defb 000h		;95fb	00 	. 
	defb 000h		;95fc	00 	. 
	defb 07eh		;95fd	7e 	~ 
	defb 07eh		;95fe	7e 	~ 
	defb 060h		;95ff	60 	` 
	defb 030h		;9600	30 	0 
	defb 030h		;9601	30 	0 
	defb 030h		;9602	30 	0 
	defb 030h		;9603	30 	0 
	defb 070h		;9604	70 	p 
	defb 060h		;9605	60 	` 
	defb 000h		;9606	00 	. 
	defb 000h		;9607	00 	. 
	defb 000h		;9608	00 	. 
	defb 060h		;9609	60 	` 
	defb 070h		;960a	70 	p 
	defb 030h		;960b	30 	0 
	defb 030h		;960c	30 	0 
	defb 030h		;960d	30 	0 
	defb 030h		;960e	30 	0 
	defb 00ch		;960f	0c 	. 
	defb 030h		;9610	30 	0 
	defb 018h		;9611	18 	. 
	defb 018h		;9612	18 	. 
	defb 018h		;9613	18 	. 
	defb 018h		;9614	18 	. 
	defb 018h		;9615	18 	. 
	defb 000h		;9616	00 	. 
	defb 000h		;9617	00 	. 
	defb 000h		;9618	00 	. 
	defb 018h		;9619	18 	. 
	defb 018h		;961a	18 	. 
	defb 018h		;961b	18 	. 
	defb 018h		;961c	18 	. 
	defb 018h		;961d	18 	. 
	defb 000h		;961e	00 	. 
	defb 000h		;961f	00 	. 
	defb 000h		;9620	00 	. 
	defb 006h		;9621	06 	. 
	defb 006h		;9622	06 	. 
	defb 006h		;9623	06 	. 
	defb 007h		;9624	07 	. 
	defb 003h		;9625	03 	. 
	defb 000h		;9626	00 	. 
	defb 000h		;9627	00 	. 
	defb 000h		;9628	00 	. 
	defb 003h		;9629	03 	. 
	defb 007h		;962a	07 	. 
	defb 006h		;962b	06 	. 
	defb 006h		;962c	06 	. 
	defb 006h		;962d	06 	. 
	defb 006h		;962e	06 	. 
	defb 018h		;962f	18 	. 
	defb 006h		;9630	06 	. 
	defb 000h		;9631	00 	. 
	defb 000h		;9632	00 	. 
	defb 000h		;9633	00 	. 
	defb 000h		;9634	00 	. 
	defb 000h		;9635	00 	. 
	defb 000h		;9636	00 	. 
	defb 000h		;9637	00 	. 
	defb 000h		;9638	00 	. 
	defb 006h		;9639	06 	. 
	defb 04fh		;963a	4f 	O 
	defb 079h		;963b	79 	y 
	defb 030h		;963c	30 	0 
	defb 000h		;963d	00 	. 
	defb 000h		;963e	00 	. 
	defb 000h		;963f	00 	. 
	defb 000h		;9640	00 	. 
	defb 08ch		;9641	8c 	. 
	defb 0f8h		;9642	f8 	. 
	defb 000h		;9643	00 	. 
	defb 000h		;9644	00 	. 
	defb 000h		;9645	00 	. 
	defb 000h		;9646	00 	. 
	defb 000h		;9647	00 	. 
	defb 000h		;9648	00 	. 
	defb 000h		;9649	00 	. 
	defb 000h		;964a	00 	. 
	defb 000h		;964b	00 	. 
	defb 0f8h		;964c	f8 	. 
	defb 08ch		;964d	8c 	. 
	defb 052h		;964e	52 	R 
	defb 021h		;964f	21 	! 
	defb 052h		;9650	52 	R 
	defb 045h		;9651	45 	E 
	defb 04eh		;9652	4e 	N 
	defb 044h		;9653	44 	D 
	defb 020h		;9654	20 	  
	defb 04fh		;9655	4f 	O 
	defb 046h		;9656	46 	F 
	defb 020h		;9657	20 	  
	defb 053h		;9658	53 	S 
	defb 054h		;9659	54 	T 
	defb 059h		;965a	59 	Y 
	defb 04ch		;965b	4c 	L 
	defb 045h		;965c	45 	E 
	defb 020h		;965d	20 	  
	defb 042h		;965e	42 	B 
	defb 04fh		;965f	4f 	O 
	defb 04ch		;9660	4c 	L 
	defb 044h		;9661	44 	D 
	defb 020h		;9662	20 	  
	defb 046h		;9663	46 	F 
	defb 04fh		;9664	4f 	O 
	defb 04eh		;9665	4e 	N 
	defb 054h		;9666	54 	T 
l9667h:
	defb 060h		;9667	60 	` 
	defb 000h		;9668	00 	. 
l9669h:
	defb 0a0h		;9669	a0 	. 
	defb 020h		;966a	20 	  
	defb 0a1h		;966b	a1 	. 
	defb 020h		;966c	20 	  
	defb 0a2h		;966d	a2 	. 
	defb 020h		;966e	20 	  
	defb 0a3h		;966f	a3 	. 
	defb 020h		;9670	20 	  
	defb 0a4h		;9671	a4 	. 
	defb 020h		;9672	20 	  
	defb 0a5h		;9673	a5 	. 
	defb 020h		;9674	20 	  
	defb 0a6h		;9675	a6 	. 
	defb 020h		;9676	20 	  
	defb 0a7h		;9677	a7 	. 
	defb 020h		;9678	20 	  
	defb 0a8h		;9679	a8 	. 
	defb 020h		;967a	20 	  
	defb 0a9h		;967b	a9 	. 
	defb 020h		;967c	20 	  
	defb 0aah		;967d	aa 	. 
	defb 020h		;967e	20 	  
	defb 0abh		;967f	ab 	. 
	defb 020h		;9680	20 	  
	defb 0ach		;9681	ac 	. 
	defb 020h		;9682	20 	  
	defb 0adh		;9683	ad 	. 
	defb 020h		;9684	20 	  
	defb 0aeh		;9685	ae 	. 
	defb 020h		;9686	20 	  
	defb 0afh		;9687	af 	. 
	defb 020h		;9688	20 	  
	defb 0b0h		;9689	b0 	. 
	defb 020h		;968a	20 	  
	defb 0b1h		;968b	b1 	. 
	defb 020h		;968c	20 	  
	defb 0b2h		;968d	b2 	. 
	defb 020h		;968e	20 	  
	defb 0b3h		;968f	b3 	. 
	defb 020h		;9690	20 	  
	defb 0b4h		;9691	b4 	. 
	defb 021h		;9692	21 	! 
	defb 0b5h		;9693	b5 	. 
	defb 021h		;9694	21 	! 
	defb 0b6h		;9695	b6 	. 
	defb 020h		;9696	20 	  
	defb 0b7h		;9697	b7 	. 
	defb 020h		;9698	20 	  
	defb 0b8h		;9699	b8 	. 
	defb 020h		;969a	20 	  
	defb 0b9h		;969b	b9 	. 
	defb 020h		;969c	20 	  
	defb 0bah		;969d	ba 	. 
	defb 020h		;969e	20 	  
	defb 0bbh		;969f	bb 	. 
	defb 020h		;96a0	20 	  
	defb 0bch		;96a1	bc 	. 
	defb 02fh		;96a2	2f 	/ 
	defb 0bdh		;96a3	bd 	. 
	defb 020h		;96a4	20 	  
	defb 0beh		;96a5	be 	. 
	defb 020h		;96a6	20 	  
	defb 0bfh		;96a7	bf 	. 
	defb 020h		;96a8	20 	  
	defb 0c0h		;96a9	c0 	. 
	defb 020h		;96aa	20 	  
	defb 0c1h		;96ab	c1 	. 
	defb 020h		;96ac	20 	  
	defb 0c2h		;96ad	c2 	. 
	defb 020h		;96ae	20 	  
	defb 0c3h		;96af	c3 	. 
	defb 020h		;96b0	20 	  
	defb 0c4h		;96b1	c4 	. 
	defb 020h		;96b2	20 	  
	defb 0c5h		;96b3	c5 	. 
	defb 03fh		;96b4	3f 	? 
	defb 0c6h		;96b5	c6 	. 
	defb 020h		;96b6	20 	  
	defb 0c7h		;96b7	c7 	. 
	defb 020h		;96b8	20 	  
	defb 0c8h		;96b9	c8 	. 
	defb 020h		;96ba	20 	  
	defb 0c9h		;96bb	c9 	. 
	defb 020h		;96bc	20 	  
	defb 0cah		;96bd	ca 	. 
	defb 020h		;96be	20 	  
	defb 0cbh		;96bf	cb 	. 
	defb 020h		;96c0	20 	  
	defb 0cch		;96c1	cc 	. 
	defb 02ah		;96c2	2a 	* 
	defb 0cdh		;96c3	cd 	. 
	defb 04fh		;96c4	4f 	O 
	defb 0ceh		;96c5	ce 	. 
	defb 02ah		;96c6	2a 	* 
	defb 0cfh		;96c7	cf 	. 
	defb 04fh		;96c8	4f 	O 
	defb 0d0h		;96c9	d0 	. 
	defb 063h		;96ca	63 	c 
	defb 0d1h		;96cb	d1 	. 
	defb 020h		;96cc	20 	  
	defb 0d2h		;96cd	d2 	. 
	defb 020h		;96ce	20 	  
	defb 0d3h		;96cf	d3 	. 
	defb 020h		;96d0	20 	  
	defb 0d4h		;96d1	d4 	. 
	defb 020h		;96d2	20 	  
	defb 0d5h		;96d3	d5 	. 
	defb 020h		;96d4	20 	  
	defb 0d6h		;96d5	d6 	. 
	defb 020h		;96d6	20 	  
	defb 0d7h		;96d7	d7 	. 
	defb 020h		;96d8	20 	  
	defb 0d8h		;96d9	d8 	. 
	defb 020h		;96da	20 	  
	defb 0d9h		;96db	d9 	. 
	defb 020h		;96dc	20 	  
	defb 0dah		;96dd	da 	. 
	defb 02ch		;96de	2c 	, 
	defb 0dbh		;96df	db 	. 
	defb 021h		;96e0	21 	! 
	defb 0dch		;96e1	dc 	. 
	defb 027h		;96e2	27 	' 
	defb 0ddh		;96e3	dd 	. 
	defb 02ch		;96e4	2c 	, 
	defb 0deh		;96e5	de 	. 
	defb 021h		;96e6	21 	! 
	defb 0dfh		;96e7	df 	. 
	defb 027h		;96e8	27 	' 
	defb 0e0h		;96e9	e0 	. 
	defb 02ah		;96ea	2a 	* 
	defb 0e1h		;96eb	e1 	. 
	defb 02ah		;96ec	2a 	* 
	defb 0e2h		;96ed	e2 	. 
	defb 02ah		;96ee	2a 	* 
	defb 0e3h		;96ef	e3 	. 
	defb 02ah		;96f0	2a 	* 
	defb 0e4h		;96f1	e4 	. 
	defb 02ch		;96f2	2c 	, 
	defb 0e5h		;96f3	e5 	. 
	defb 027h		;96f4	27 	' 
	defb 0e6h		;96f5	e6 	. 
	defb 027h		;96f6	27 	' 
	defb 0e7h		;96f7	e7 	. 
	defb 027h		;96f8	27 	' 
	defb 0e8h		;96f9	e8 	. 
	defb 02dh		;96fa	2d 	- 
	defb 0e9h		;96fb	e9 	. 
	defb 021h		;96fc	21 	! 
	defb 0eah		;96fd	ea 	. 
	defb 02dh		;96fe	2d 	- 
	defb 0ebh		;96ff	eb 	. 
	defb 02bh		;9700	2b 	+ 
	defb 0ech		;9701	ec 	. 
	defb 02dh		;9702	2d 	- 
	defb 0edh		;9703	ed 	. 
	defb 02dh		;9704	2d 	- 
	defb 0eeh		;9705	ee 	. 
	defb 02bh		;9706	2b 	+ 
	defb 0efh		;9707	ef 	. 
	defb 02dh		;9708	2d 	- 
	defb 0f0h		;9709	f0 	. 
	defb 02ah		;970a	2a 	* 
	defb 0f1h		;970b	f1 	. 
	defb 02ah		;970c	2a 	* 
	defb 0f2h		;970d	f2 	. 
	defb 02ah		;970e	2a 	* 
	defb 0f3h		;970f	f3 	. 
	defb 02ah		;9710	2a 	* 
	defb 0f4h		;9711	f4 	. 
	defb 02ch		;9712	2c 	, 
	defb 0f5h		;9713	f5 	. 
	defb 027h		;9714	27 	' 
	defb 0f6h		;9715	f6 	. 
	defb 02ch		;9716	2c 	, 
	defb 0f7h		;9717	f7 	. 
	defb 027h		;9718	27 	' 
	defb 0f8h		;9719	f8 	. 
	defb 02dh		;971a	2d 	- 
	defb 0f9h		;971b	f9 	. 
	defb 021h		;971c	21 	! 
	defb 0fah		;971d	fa 	. 
	defb 02ch		;971e	2c 	, 
	defb 0fbh		;971f	fb 	. 
	defb 021h		;9720	21 	! 
	defb 0fch		;9721	fc 	. 
	defb 027h		;9722	27 	' 
	defb 0fdh		;9723	fd 	. 
	defb 02ch		;9724	2c 	, 
	defb 0feh		;9725	fe 	. 
	defb 021h		;9726	21 	! 
	defb 0ffh		;9727	ff 	. 
	defb 027h		;9728	27 	' 
l9729h:
	defb 000h		;9729	00 	. 
l972ah:
	defb 001h		;972a	01 	. 
	defb 00ch		;972b	0c 	. 
l972ch:
	defb 001h		;972c	01 	. 
	defb 00dh		;972d	0d 	. 
l972eh:
	defb 002h		;972e	02 	. 
	defb 00dh		;972f	0d 	. 
	defb 00ah		;9730	0a 	. 
l9731h:
	defb 003h		;9731	03 	. 
	defb 01bh		;9732	1b 	. 
	defb 033h		;9733	33 	3 
	defb 018h		;9734	18 	. 
l9735h:
	defb 002h		;9735	02 	. 
	defb 01bh		;9736	1b 	. 
	defb 040h		;9737	40 	@ 
l9738h:
	defb 000h		;9738	00 	. 
l9739h:
	defb 000h		;9739	00 	. 
l973ah:
	defb 050h		;973a	50 	P 
l973bh:
	defb 018h		;973b	18 	. 
l973ch:
	defb 005h		;973c	05 	. 
	defb 01bh		;973d	1b 	. 
	defb 02ah		;973e	2a 	* 
l973fh:
	defb 004h		;973f	04 	. 
l9740h:
	defb 000h		;9740	00 	. 
	defb 000h		;9741	00 	. 
l9742h:
	defb 000h		;9742	00 	. 
	defb 000h		;9743	00 	. 
l9744h:
	defb 000h		;9744	00 	. 
	defb 000h		;9745	00 	. 
	defb 000h		;9746	00 	. 
	defb 000h		;9747	00 	. 
	defb 000h		;9748	00 	. 
	defb 000h		;9749	00 	. 
	defb 000h		;974a	00 	. 
	defb 000h		;974b	00 	. 
	defb 000h		;974c	00 	. 
	defb 000h		;974d	00 	. 
	defb 000h		;974e	00 	. 
	defb 000h		;974f	00 	. 
	defb 000h		;9750	00 	. 
	defb 000h		;9751	00 	. 
	defb 000h		;9752	00 	. 
	defb 000h		;9753	00 	. 
	defb 000h		;9754	00 	. 
	defb 000h		;9755	00 	. 
	defb 000h		;9756	00 	. 
	defb 000h		;9757	00 	. 
	defb 000h		;9758	00 	. 
	defb 000h		;9759	00 	. 
	defb 000h		;975a	00 	. 
	defb 000h		;975b	00 	. 
l975ch:
	defb 05eh		;975c	5e 	^ 
	defb 097h		;975d	97 	. 
l975eh:
	defb 000h		;975e	00 	. 
	defb 000h		;975f	00 	. 
	defb 000h		;9760	00 	. 
	defb 000h		;9761	00 	. 
	defb 000h		;9762	00 	. 
	defb 000h		;9763	00 	. 
	defb 000h		;9764	00 	. 
	defb 000h		;9765	00 	. 
	defb 000h		;9766	00 	. 
	defb 000h		;9767	00 	. 
	defb 000h		;9768	00 	. 
	defb 000h		;9769	00 	. 
	defb 000h		;976a	00 	. 
	defb 000h		;976b	00 	. 
	defb 000h		;976c	00 	. 
	defb 000h		;976d	00 	. 
	defb 000h		;976e	00 	. 
	defb 000h		;976f	00 	. 
	defb 000h		;9770	00 	. 
	defb 000h		;9771	00 	. 
	defb 000h		;9772	00 	. 
	defb 000h		;9773	00 	. 
	defb 000h		;9774	00 	. 
	defb 000h		;9775	00 	. 
	defb 000h		;9776	00 	. 
	defb 000h		;9777	00 	. 
	defb 000h		;9778	00 	. 
	defb 000h		;9779	00 	. 
	defb 000h		;977a	00 	. 
	defb 000h		;977b	00 	. 
	defb 000h		;977c	00 	. 
	defb 000h		;977d	00 	. 
	defb 000h		;977e	00 	. 
	defb 000h		;977f	00 	. 
	defb 000h		;9780	00 	. 
	defb 000h		;9781	00 	. 
	defb 000h		;9782	00 	. 
	defb 000h		;9783	00 	. 
	defb 000h		;9784	00 	. 
	defb 000h		;9785	00 	. 
	defb 000h		;9786	00 	. 
	defb 000h		;9787	00 	. 
	defb 000h		;9788	00 	. 
	defb 000h		;9789	00 	. 
	defb 000h		;978a	00 	. 
	defb 000h		;978b	00 	. 
	defb 000h		;978c	00 	. 
	defb 000h		;978d	00 	. 
	defb 000h		;978e	00 	. 
	defb 000h		;978f	00 	. 
	defb 000h		;9790	00 	. 
	defb 000h		;9791	00 	. 
	defb 000h		;9792	00 	. 
	defb 000h		;9793	00 	. 
	defb 000h		;9794	00 	. 
	defb 000h		;9795	00 	. 
	defb 000h		;9796	00 	. 
	defb 000h		;9797	00 	. 
	defb 000h		;9798	00 	. 
	defb 000h		;9799	00 	. 
	defb 000h		;979a	00 	. 
	defb 000h		;979b	00 	. 
	defb 000h		;979c	00 	. 
	defb 000h		;979d	00 	. 
	defb 000h		;979e	00 	. 
	defb 000h		;979f	00 	. 
	defb 000h		;97a0	00 	. 
	defb 000h		;97a1	00 	. 
	defb 000h		;97a2	00 	. 
	defb 000h		;97a3	00 	. 
	defb 000h		;97a4	00 	. 
	defb 000h		;97a5	00 	. 
	defb 000h		;97a6	00 	. 
	defb 000h		;97a7	00 	. 
	defb 000h		;97a8	00 	. 
	defb 000h		;97a9	00 	. 
	defb 000h		;97aa	00 	. 
	defb 000h		;97ab	00 	. 
	defb 000h		;97ac	00 	. 
	defb 000h		;97ad	00 	. 
	defb 000h		;97ae	00 	. 
	defb 000h		;97af	00 	. 
	defb 000h		;97b0	00 	. 
	defb 000h		;97b1	00 	. 
	defb 000h		;97b2	00 	. 
	defb 000h		;97b3	00 	. 
	defb 000h		;97b4	00 	. 
	defb 000h		;97b5	00 	. 
	defb 000h		;97b6	00 	. 
	defb 000h		;97b7	00 	. 
	defb 000h		;97b8	00 	. 
	defb 000h		;97b9	00 	. 
	defb 000h		;97ba	00 	. 
	defb 000h		;97bb	00 	. 
	defb 000h		;97bc	00 	. 
	defb 000h		;97bd	00 	. 
	defb 000h		;97be	00 	. 
	defb 000h		;97bf	00 	. 
	defb 000h		;97c0	00 	. 
	defb 000h		;97c1	00 	. 
	defb 000h		;97c2	00 	. 
	defb 000h		;97c3	00 	. 
	defb 000h		;97c4	00 	. 
	defb 000h		;97c5	00 	. 
	defb 000h		;97c6	00 	. 
	defb 000h		;97c7	00 	. 
	defb 000h		;97c8	00 	. 
	defb 000h		;97c9	00 	. 
	defb 000h		;97ca	00 	. 
	defb 000h		;97cb	00 	. 
	defb 000h		;97cc	00 	. 
	defb 000h		;97cd	00 	. 
	defb 000h		;97ce	00 	. 
	defb 000h		;97cf	00 	. 
	defb 000h		;97d0	00 	. 
	defb 000h		;97d1	00 	. 
	defb 000h		;97d2	00 	. 
	defb 000h		;97d3	00 	. 
	defb 000h		;97d4	00 	. 
	defb 000h		;97d5	00 	. 
	defb 000h		;97d6	00 	. 
	defb 000h		;97d7	00 	. 
	defb 000h		;97d8	00 	. 
	defb 000h		;97d9	00 	. 
	defb 000h		;97da	00 	. 
	defb 000h		;97db	00 	. 
	defb 000h		;97dc	00 	. 
	defb 000h		;97dd	00 	. 
	defb 000h		;97de	00 	. 
	defb 000h		;97df	00 	. 
	defb 000h		;97e0	00 	. 
	defb 000h		;97e1	00 	. 
	defb 000h		;97e2	00 	. 
	defb 000h		;97e3	00 	. 
	defb 000h		;97e4	00 	. 
	defb 000h		;97e5	00 	. 
	defb 000h		;97e6	00 	. 
	defb 000h		;97e7	00 	. 
	defb 000h		;97e8	00 	. 
	defb 000h		;97e9	00 	. 
	defb 000h		;97ea	00 	. 
	defb 000h		;97eb	00 	. 
	defb 000h		;97ec	00 	. 
	defb 000h		;97ed	00 	. 
	defb 000h		;97ee	00 	. 
	defb 000h		;97ef	00 	. 
	defb 000h		;97f0	00 	. 
	defb 000h		;97f1	00 	. 
	defb 000h		;97f2	00 	. 
	defb 000h		;97f3	00 	. 
	defb 000h		;97f4	00 	. 
	defb 000h		;97f5	00 	. 
	defb 000h		;97f6	00 	. 
	defb 000h		;97f7	00 	. 
	defb 000h		;97f8	00 	. 
	defb 000h		;97f9	00 	. 
	defb 000h		;97fa	00 	. 
	defb 000h		;97fb	00 	. 
	defb 000h		;97fc	00 	. 
	defb 000h		;97fd	00 	. 
l97feh:
	defb 002h		;97fe	02 	. 
	defb 098h		;97ff	98 	. 
l9800h:
	defb 082h		;9800	82 	. 
	defb 09ah		;9801	9a 	. 
l9802h:
	defb 000h		;9802	00 	. 
l9803h:
	defb 000h		;9803	00 	. 
	defb 000h		;9804	00 	. 
	defb 000h		;9805	00 	. 
	defb 000h		;9806	00 	. 
	defb 000h		;9807	00 	. 
	defb 000h		;9808	00 	. 
	defb 000h		;9809	00 	. 
	defb 000h		;980a	00 	. 
	defb 000h		;980b	00 	. 
	defb 000h		;980c	00 	. 
	defb 000h		;980d	00 	. 
	defb 000h		;980e	00 	. 
	defb 000h		;980f	00 	. 
	defb 000h		;9810	00 	. 
	defb 000h		;9811	00 	. 
	defb 000h		;9812	00 	. 
	defb 000h		;9813	00 	. 
	defb 000h		;9814	00 	. 
	defb 000h		;9815	00 	. 
	defb 000h		;9816	00 	. 
	defb 000h		;9817	00 	. 
	defb 000h		;9818	00 	. 
	defb 000h		;9819	00 	. 
	defb 000h		;981a	00 	. 
	defb 000h		;981b	00 	. 
	defb 000h		;981c	00 	. 
	defb 000h		;981d	00 	. 
	defb 000h		;981e	00 	. 
	defb 000h		;981f	00 	. 
	defb 000h		;9820	00 	. 
	defb 000h		;9821	00 	. 
	defb 000h		;9822	00 	. 
	defb 000h		;9823	00 	. 
	defb 000h		;9824	00 	. 
	defb 000h		;9825	00 	. 
	defb 000h		;9826	00 	. 
	defb 000h		;9827	00 	. 
	defb 000h		;9828	00 	. 
	defb 000h		;9829	00 	. 
	defb 000h		;982a	00 	. 
	defb 000h		;982b	00 	. 
	defb 000h		;982c	00 	. 
	defb 000h		;982d	00 	. 
	defb 000h		;982e	00 	. 
	defb 000h		;982f	00 	. 
	defb 000h		;9830	00 	. 
	defb 000h		;9831	00 	. 
	defb 000h		;9832	00 	. 
	defb 000h		;9833	00 	. 
	defb 000h		;9834	00 	. 
	defb 000h		;9835	00 	. 
	defb 000h		;9836	00 	. 
	defb 000h		;9837	00 	. 
	defb 000h		;9838	00 	. 
	defb 000h		;9839	00 	. 
	defb 000h		;983a	00 	. 
	defb 000h		;983b	00 	. 
	defb 000h		;983c	00 	. 
	defb 000h		;983d	00 	. 
	defb 000h		;983e	00 	. 
	defb 000h		;983f	00 	. 
	defb 000h		;9840	00 	. 
	defb 000h		;9841	00 	. 
	defb 000h		;9842	00 	. 
	defb 000h		;9843	00 	. 
	defb 000h		;9844	00 	. 
	defb 000h		;9845	00 	. 
	defb 000h		;9846	00 	. 
	defb 000h		;9847	00 	. 
	defb 000h		;9848	00 	. 
	defb 000h		;9849	00 	. 
	defb 000h		;984a	00 	. 
	defb 000h		;984b	00 	. 
	defb 000h		;984c	00 	. 
	defb 000h		;984d	00 	. 
	defb 000h		;984e	00 	. 
	defb 000h		;984f	00 	. 
	defb 000h		;9850	00 	. 
	defb 000h		;9851	00 	. 
	defb 000h		;9852	00 	. 
	defb 000h		;9853	00 	. 
	defb 000h		;9854	00 	. 
	defb 000h		;9855	00 	. 
	defb 000h		;9856	00 	. 
	defb 000h		;9857	00 	. 
	defb 000h		;9858	00 	. 
	defb 000h		;9859	00 	. 
	defb 000h		;985a	00 	. 
	defb 000h		;985b	00 	. 
	defb 000h		;985c	00 	. 
	defb 000h		;985d	00 	. 
	defb 000h		;985e	00 	. 
	defb 000h		;985f	00 	. 
	defb 000h		;9860	00 	. 
	defb 000h		;9861	00 	. 
	defb 000h		;9862	00 	. 
	defb 000h		;9863	00 	. 
	defb 000h		;9864	00 	. 
	defb 000h		;9865	00 	. 
	defb 000h		;9866	00 	. 
	defb 000h		;9867	00 	. 
	defb 000h		;9868	00 	. 
	defb 000h		;9869	00 	. 
	defb 000h		;986a	00 	. 
	defb 000h		;986b	00 	. 
	defb 000h		;986c	00 	. 
	defb 000h		;986d	00 	. 
	defb 000h		;986e	00 	. 
	defb 000h		;986f	00 	. 
	defb 000h		;9870	00 	. 
	defb 000h		;9871	00 	. 
	defb 000h		;9872	00 	. 
	defb 000h		;9873	00 	. 
	defb 000h		;9874	00 	. 
	defb 000h		;9875	00 	. 
	defb 000h		;9876	00 	. 
	defb 000h		;9877	00 	. 
	defb 000h		;9878	00 	. 
	defb 000h		;9879	00 	. 
	defb 000h		;987a	00 	. 
	defb 000h		;987b	00 	. 
	defb 000h		;987c	00 	. 
	defb 000h		;987d	00 	. 
	defb 000h		;987e	00 	. 
	defb 000h		;987f	00 	. 
	defb 000h		;9880	00 	. 
	defb 000h		;9881	00 	. 
	defb 000h		;9882	00 	. 
	defb 000h		;9883	00 	. 
	defb 000h		;9884	00 	. 
	defb 000h		;9885	00 	. 
	defb 000h		;9886	00 	. 
	defb 000h		;9887	00 	. 
	defb 000h		;9888	00 	. 
	defb 000h		;9889	00 	. 
	defb 000h		;988a	00 	. 
	defb 000h		;988b	00 	. 
	defb 000h		;988c	00 	. 
	defb 000h		;988d	00 	. 
	defb 000h		;988e	00 	. 
	defb 000h		;988f	00 	. 
	defb 000h		;9890	00 	. 
	defb 000h		;9891	00 	. 
	defb 000h		;9892	00 	. 
	defb 000h		;9893	00 	. 
	defb 000h		;9894	00 	. 
	defb 000h		;9895	00 	. 
	defb 000h		;9896	00 	. 
	defb 000h		;9897	00 	. 
	defb 000h		;9898	00 	. 
	defb 000h		;9899	00 	. 
	defb 000h		;989a	00 	. 
	defb 000h		;989b	00 	. 
	defb 000h		;989c	00 	. 
	defb 000h		;989d	00 	. 
	defb 000h		;989e	00 	. 
	defb 000h		;989f	00 	. 
	defb 000h		;98a0	00 	. 
	defb 000h		;98a1	00 	. 
	defb 000h		;98a2	00 	. 
	defb 000h		;98a3	00 	. 
	defb 000h		;98a4	00 	. 
	defb 000h		;98a5	00 	. 
	defb 000h		;98a6	00 	. 
	defb 000h		;98a7	00 	. 
	defb 000h		;98a8	00 	. 
	defb 000h		;98a9	00 	. 
	defb 000h		;98aa	00 	. 
	defb 000h		;98ab	00 	. 
	defb 000h		;98ac	00 	. 
	defb 000h		;98ad	00 	. 
	defb 000h		;98ae	00 	. 
	defb 000h		;98af	00 	. 
	defb 000h		;98b0	00 	. 
	defb 000h		;98b1	00 	. 
	defb 000h		;98b2	00 	. 
	defb 000h		;98b3	00 	. 
	defb 000h		;98b4	00 	. 
	defb 000h		;98b5	00 	. 
	defb 000h		;98b6	00 	. 
	defb 000h		;98b7	00 	. 
	defb 000h		;98b8	00 	. 
	defb 000h		;98b9	00 	. 
	defb 000h		;98ba	00 	. 
	defb 000h		;98bb	00 	. 
	defb 000h		;98bc	00 	. 
	defb 000h		;98bd	00 	. 
	defb 000h		;98be	00 	. 
	defb 000h		;98bf	00 	. 
	defb 000h		;98c0	00 	. 
	defb 000h		;98c1	00 	. 
	defb 000h		;98c2	00 	. 
	defb 000h		;98c3	00 	. 
	defb 000h		;98c4	00 	. 
	defb 000h		;98c5	00 	. 
	defb 000h		;98c6	00 	. 
	defb 000h		;98c7	00 	. 
	defb 000h		;98c8	00 	. 
	defb 000h		;98c9	00 	. 
	defb 000h		;98ca	00 	. 
	defb 000h		;98cb	00 	. 
	defb 000h		;98cc	00 	. 
	defb 000h		;98cd	00 	. 
	defb 000h		;98ce	00 	. 
	defb 000h		;98cf	00 	. 
	defb 000h		;98d0	00 	. 
	defb 000h		;98d1	00 	. 
	defb 000h		;98d2	00 	. 
	defb 000h		;98d3	00 	. 
	defb 000h		;98d4	00 	. 
	defb 000h		;98d5	00 	. 
	defb 000h		;98d6	00 	. 
	defb 000h		;98d7	00 	. 
	defb 000h		;98d8	00 	. 
	defb 000h		;98d9	00 	. 
	defb 000h		;98da	00 	. 
	defb 000h		;98db	00 	. 
	defb 000h		;98dc	00 	. 
	defb 000h		;98dd	00 	. 
	defb 000h		;98de	00 	. 
	defb 000h		;98df	00 	. 
	defb 000h		;98e0	00 	. 
	defb 000h		;98e1	00 	. 
	defb 000h		;98e2	00 	. 
	defb 000h		;98e3	00 	. 
	defb 000h		;98e4	00 	. 
	defb 000h		;98e5	00 	. 
	defb 000h		;98e6	00 	. 
	defb 000h		;98e7	00 	. 
	defb 000h		;98e8	00 	. 
	defb 000h		;98e9	00 	. 
	defb 000h		;98ea	00 	. 
	defb 000h		;98eb	00 	. 
	defb 000h		;98ec	00 	. 
	defb 000h		;98ed	00 	. 
	defb 000h		;98ee	00 	. 
	defb 000h		;98ef	00 	. 
	defb 000h		;98f0	00 	. 
	defb 000h		;98f1	00 	. 
	defb 000h		;98f2	00 	. 
	defb 000h		;98f3	00 	. 
	defb 000h		;98f4	00 	. 
	defb 000h		;98f5	00 	. 
	defb 000h		;98f6	00 	. 
	defb 000h		;98f7	00 	. 
	defb 000h		;98f8	00 	. 
	defb 000h		;98f9	00 	. 
	defb 000h		;98fa	00 	. 
	defb 000h		;98fb	00 	. 
	defb 000h		;98fc	00 	. 
	defb 000h		;98fd	00 	. 
	defb 000h		;98fe	00 	. 
	defb 000h		;98ff	00 	. 
	defb 000h		;9900	00 	. 
	defb 000h		;9901	00 	. 
	defb 000h		;9902	00 	. 
	defb 000h		;9903	00 	. 
	defb 000h		;9904	00 	. 
	defb 000h		;9905	00 	. 
	defb 000h		;9906	00 	. 
	defb 000h		;9907	00 	. 
	defb 000h		;9908	00 	. 
	defb 000h		;9909	00 	. 
	defb 000h		;990a	00 	. 
	defb 000h		;990b	00 	. 
	defb 000h		;990c	00 	. 
	defb 000h		;990d	00 	. 
	defb 000h		;990e	00 	. 
	defb 000h		;990f	00 	. 
	defb 000h		;9910	00 	. 
	defb 000h		;9911	00 	. 
	defb 000h		;9912	00 	. 
	defb 000h		;9913	00 	. 
	defb 000h		;9914	00 	. 
	defb 000h		;9915	00 	. 
	defb 000h		;9916	00 	. 
	defb 000h		;9917	00 	. 
	defb 000h		;9918	00 	. 
	defb 000h		;9919	00 	. 
	defb 000h		;991a	00 	. 
	defb 000h		;991b	00 	. 
	defb 000h		;991c	00 	. 
	defb 000h		;991d	00 	. 
	defb 000h		;991e	00 	. 
	defb 000h		;991f	00 	. 
	defb 000h		;9920	00 	. 
	defb 000h		;9921	00 	. 
	defb 000h		;9922	00 	. 
	defb 000h		;9923	00 	. 
	defb 000h		;9924	00 	. 
	defb 000h		;9925	00 	. 
	defb 000h		;9926	00 	. 
	defb 000h		;9927	00 	. 
	defb 000h		;9928	00 	. 
	defb 000h		;9929	00 	. 
	defb 000h		;992a	00 	. 
	defb 000h		;992b	00 	. 
	defb 000h		;992c	00 	. 
	defb 000h		;992d	00 	. 
	defb 000h		;992e	00 	. 
	defb 000h		;992f	00 	. 
	defb 000h		;9930	00 	. 
	defb 000h		;9931	00 	. 
	defb 000h		;9932	00 	. 
	defb 000h		;9933	00 	. 
	defb 000h		;9934	00 	. 
	defb 000h		;9935	00 	. 
	defb 000h		;9936	00 	. 
	defb 000h		;9937	00 	. 
	defb 000h		;9938	00 	. 
	defb 000h		;9939	00 	. 
	defb 000h		;993a	00 	. 
	defb 000h		;993b	00 	. 
	defb 000h		;993c	00 	. 
	defb 000h		;993d	00 	. 
	defb 000h		;993e	00 	. 
	defb 000h		;993f	00 	. 
	defb 000h		;9940	00 	. 
	defb 000h		;9941	00 	. 
	defb 000h		;9942	00 	. 
	defb 000h		;9943	00 	. 
	defb 000h		;9944	00 	. 
	defb 000h		;9945	00 	. 
	defb 000h		;9946	00 	. 
	defb 000h		;9947	00 	. 
	defb 000h		;9948	00 	. 
	defb 000h		;9949	00 	. 
	defb 000h		;994a	00 	. 
	defb 000h		;994b	00 	. 
	defb 000h		;994c	00 	. 
	defb 000h		;994d	00 	. 
	defb 000h		;994e	00 	. 
	defb 000h		;994f	00 	. 
	defb 000h		;9950	00 	. 
	defb 000h		;9951	00 	. 
	defb 000h		;9952	00 	. 
	defb 000h		;9953	00 	. 
	defb 000h		;9954	00 	. 
	defb 000h		;9955	00 	. 
	defb 000h		;9956	00 	. 
	defb 000h		;9957	00 	. 
	defb 000h		;9958	00 	. 
	defb 000h		;9959	00 	. 
	defb 000h		;995a	00 	. 
	defb 000h		;995b	00 	. 
	defb 000h		;995c	00 	. 
	defb 000h		;995d	00 	. 
	defb 000h		;995e	00 	. 
	defb 000h		;995f	00 	. 
	defb 000h		;9960	00 	. 
	defb 000h		;9961	00 	. 
	defb 000h		;9962	00 	. 
	defb 000h		;9963	00 	. 
	defb 000h		;9964	00 	. 
	defb 000h		;9965	00 	. 
	defb 000h		;9966	00 	. 
	defb 000h		;9967	00 	. 
	defb 000h		;9968	00 	. 
	defb 000h		;9969	00 	. 
	defb 000h		;996a	00 	. 
	defb 000h		;996b	00 	. 
	defb 000h		;996c	00 	. 
	defb 000h		;996d	00 	. 
	defb 000h		;996e	00 	. 
	defb 000h		;996f	00 	. 
	defb 000h		;9970	00 	. 
	defb 000h		;9971	00 	. 
	defb 000h		;9972	00 	. 
	defb 000h		;9973	00 	. 
	defb 000h		;9974	00 	. 
	defb 000h		;9975	00 	. 
	defb 000h		;9976	00 	. 
	defb 000h		;9977	00 	. 
	defb 000h		;9978	00 	. 
	defb 000h		;9979	00 	. 
	defb 000h		;997a	00 	. 
	defb 000h		;997b	00 	. 
	defb 000h		;997c	00 	. 
	defb 000h		;997d	00 	. 
	defb 000h		;997e	00 	. 
	defb 000h		;997f	00 	. 
	defb 000h		;9980	00 	. 
	defb 000h		;9981	00 	. 
	defb 000h		;9982	00 	. 
	defb 000h		;9983	00 	. 
	defb 000h		;9984	00 	. 
	defb 000h		;9985	00 	. 
	defb 000h		;9986	00 	. 
	defb 000h		;9987	00 	. 
	defb 000h		;9988	00 	. 
	defb 000h		;9989	00 	. 
	defb 000h		;998a	00 	. 
	defb 000h		;998b	00 	. 
	defb 000h		;998c	00 	. 
	defb 000h		;998d	00 	. 
	defb 000h		;998e	00 	. 
	defb 000h		;998f	00 	. 
	defb 000h		;9990	00 	. 
	defb 000h		;9991	00 	. 
	defb 000h		;9992	00 	. 
	defb 000h		;9993	00 	. 
	defb 000h		;9994	00 	. 
	defb 000h		;9995	00 	. 
	defb 000h		;9996	00 	. 
	defb 000h		;9997	00 	. 
	defb 000h		;9998	00 	. 
	defb 000h		;9999	00 	. 
	defb 000h		;999a	00 	. 
	defb 000h		;999b	00 	. 
	defb 000h		;999c	00 	. 
	defb 000h		;999d	00 	. 
	defb 000h		;999e	00 	. 
	defb 000h		;999f	00 	. 
	defb 000h		;99a0	00 	. 
	defb 000h		;99a1	00 	. 
	defb 000h		;99a2	00 	. 
	defb 000h		;99a3	00 	. 
	defb 000h		;99a4	00 	. 
	defb 000h		;99a5	00 	. 
	defb 000h		;99a6	00 	. 
	defb 000h		;99a7	00 	. 
	defb 000h		;99a8	00 	. 
	defb 000h		;99a9	00 	. 
	defb 000h		;99aa	00 	. 
	defb 000h		;99ab	00 	. 
	defb 000h		;99ac	00 	. 
	defb 000h		;99ad	00 	. 
	defb 000h		;99ae	00 	. 
	defb 000h		;99af	00 	. 
	defb 000h		;99b0	00 	. 
	defb 000h		;99b1	00 	. 
	defb 000h		;99b2	00 	. 
	defb 000h		;99b3	00 	. 
	defb 000h		;99b4	00 	. 
	defb 000h		;99b5	00 	. 
	defb 000h		;99b6	00 	. 
	defb 000h		;99b7	00 	. 
	defb 000h		;99b8	00 	. 
	defb 000h		;99b9	00 	. 
	defb 000h		;99ba	00 	. 
	defb 000h		;99bb	00 	. 
	defb 000h		;99bc	00 	. 
	defb 000h		;99bd	00 	. 
	defb 000h		;99be	00 	. 
	defb 000h		;99bf	00 	. 
	defb 000h		;99c0	00 	. 
	defb 000h		;99c1	00 	. 
	defb 000h		;99c2	00 	. 
	defb 000h		;99c3	00 	. 
	defb 000h		;99c4	00 	. 
	defb 000h		;99c5	00 	. 
	defb 000h		;99c6	00 	. 
	defb 000h		;99c7	00 	. 
	defb 000h		;99c8	00 	. 
	defb 000h		;99c9	00 	. 
	defb 000h		;99ca	00 	. 
	defb 000h		;99cb	00 	. 
	defb 000h		;99cc	00 	. 
	defb 000h		;99cd	00 	. 
	defb 000h		;99ce	00 	. 
	defb 000h		;99cf	00 	. 
	defb 000h		;99d0	00 	. 
	defb 000h		;99d1	00 	. 
	defb 000h		;99d2	00 	. 
	defb 000h		;99d3	00 	. 
	defb 000h		;99d4	00 	. 
	defb 000h		;99d5	00 	. 
	defb 000h		;99d6	00 	. 
	defb 000h		;99d7	00 	. 
	defb 000h		;99d8	00 	. 
	defb 000h		;99d9	00 	. 
	defb 000h		;99da	00 	. 
	defb 000h		;99db	00 	. 
	defb 000h		;99dc	00 	. 
	defb 000h		;99dd	00 	. 
	defb 000h		;99de	00 	. 
	defb 000h		;99df	00 	. 
	defb 000h		;99e0	00 	. 
	defb 000h		;99e1	00 	. 
	defb 000h		;99e2	00 	. 
	defb 000h		;99e3	00 	. 
	defb 000h		;99e4	00 	. 
	defb 000h		;99e5	00 	. 
	defb 000h		;99e6	00 	. 
	defb 000h		;99e7	00 	. 
	defb 000h		;99e8	00 	. 
	defb 000h		;99e9	00 	. 
	defb 000h		;99ea	00 	. 
	defb 000h		;99eb	00 	. 
	defb 000h		;99ec	00 	. 
	defb 000h		;99ed	00 	. 
	defb 000h		;99ee	00 	. 
	defb 000h		;99ef	00 	. 
	defb 000h		;99f0	00 	. 
	defb 000h		;99f1	00 	. 
	defb 000h		;99f2	00 	. 
	defb 000h		;99f3	00 	. 
	defb 000h		;99f4	00 	. 
	defb 000h		;99f5	00 	. 
	defb 000h		;99f6	00 	. 
	defb 000h		;99f7	00 	. 
	defb 000h		;99f8	00 	. 
	defb 000h		;99f9	00 	. 
	defb 000h		;99fa	00 	. 
	defb 000h		;99fb	00 	. 
	defb 000h		;99fc	00 	. 
	defb 000h		;99fd	00 	. 
	defb 000h		;99fe	00 	. 
	defb 000h		;99ff	00 	. 
	defb 000h		;9a00	00 	. 
	defb 000h		;9a01	00 	. 
	defb 000h		;9a02	00 	. 
	defb 000h		;9a03	00 	. 
	defb 000h		;9a04	00 	. 
	defb 000h		;9a05	00 	. 
	defb 000h		;9a06	00 	. 
	defb 000h		;9a07	00 	. 
	defb 000h		;9a08	00 	. 
	defb 000h		;9a09	00 	. 
	defb 000h		;9a0a	00 	. 
	defb 000h		;9a0b	00 	. 
	defb 000h		;9a0c	00 	. 
	defb 000h		;9a0d	00 	. 
	defb 000h		;9a0e	00 	. 
	defb 000h		;9a0f	00 	. 
	defb 000h		;9a10	00 	. 
	defb 000h		;9a11	00 	. 
	defb 000h		;9a12	00 	. 
	defb 000h		;9a13	00 	. 
	defb 000h		;9a14	00 	. 
	defb 000h		;9a15	00 	. 
	defb 000h		;9a16	00 	. 
	defb 000h		;9a17	00 	. 
	defb 000h		;9a18	00 	. 
	defb 000h		;9a19	00 	. 
	defb 000h		;9a1a	00 	. 
	defb 000h		;9a1b	00 	. 
	defb 000h		;9a1c	00 	. 
	defb 000h		;9a1d	00 	. 
	defb 000h		;9a1e	00 	. 
	defb 000h		;9a1f	00 	. 
	defb 000h		;9a20	00 	. 
	defb 000h		;9a21	00 	. 
	defb 000h		;9a22	00 	. 
	defb 000h		;9a23	00 	. 
	defb 000h		;9a24	00 	. 
	defb 000h		;9a25	00 	. 
	defb 000h		;9a26	00 	. 
	defb 000h		;9a27	00 	. 
	defb 000h		;9a28	00 	. 
	defb 000h		;9a29	00 	. 
	defb 000h		;9a2a	00 	. 
	defb 000h		;9a2b	00 	. 
	defb 000h		;9a2c	00 	. 
	defb 000h		;9a2d	00 	. 
	defb 000h		;9a2e	00 	. 
	defb 000h		;9a2f	00 	. 
	defb 000h		;9a30	00 	. 
	defb 000h		;9a31	00 	. 
	defb 000h		;9a32	00 	. 
	defb 000h		;9a33	00 	. 
	defb 000h		;9a34	00 	. 
	defb 000h		;9a35	00 	. 
	defb 000h		;9a36	00 	. 
	defb 000h		;9a37	00 	. 
	defb 000h		;9a38	00 	. 
	defb 000h		;9a39	00 	. 
	defb 000h		;9a3a	00 	. 
	defb 000h		;9a3b	00 	. 
	defb 000h		;9a3c	00 	. 
	defb 000h		;9a3d	00 	. 
	defb 000h		;9a3e	00 	. 
	defb 000h		;9a3f	00 	. 
	defb 000h		;9a40	00 	. 
	defb 000h		;9a41	00 	. 
	defb 000h		;9a42	00 	. 
	defb 000h		;9a43	00 	. 
	defb 000h		;9a44	00 	. 
	defb 000h		;9a45	00 	. 
	defb 000h		;9a46	00 	. 
	defb 000h		;9a47	00 	. 
	defb 000h		;9a48	00 	. 
	defb 000h		;9a49	00 	. 
	defb 000h		;9a4a	00 	. 
	defb 000h		;9a4b	00 	. 
	defb 000h		;9a4c	00 	. 
	defb 000h		;9a4d	00 	. 
	defb 000h		;9a4e	00 	. 
	defb 000h		;9a4f	00 	. 
	defb 000h		;9a50	00 	. 
	defb 000h		;9a51	00 	. 
	defb 000h		;9a52	00 	. 
	defb 000h		;9a53	00 	. 
	defb 000h		;9a54	00 	. 
	defb 000h		;9a55	00 	. 
	defb 000h		;9a56	00 	. 
	defb 000h		;9a57	00 	. 
	defb 000h		;9a58	00 	. 
	defb 000h		;9a59	00 	. 
	defb 000h		;9a5a	00 	. 
	defb 000h		;9a5b	00 	. 
	defb 000h		;9a5c	00 	. 
	defb 000h		;9a5d	00 	. 
	defb 000h		;9a5e	00 	. 
	defb 000h		;9a5f	00 	. 
	defb 000h		;9a60	00 	. 
	defb 000h		;9a61	00 	. 
	defb 000h		;9a62	00 	. 
	defb 000h		;9a63	00 	. 
	defb 000h		;9a64	00 	. 
	defb 000h		;9a65	00 	. 
	defb 000h		;9a66	00 	. 
	defb 000h		;9a67	00 	. 
	defb 000h		;9a68	00 	. 
	defb 000h		;9a69	00 	. 
	defb 000h		;9a6a	00 	. 
	defb 000h		;9a6b	00 	. 
	defb 000h		;9a6c	00 	. 
	defb 000h		;9a6d	00 	. 
	defb 000h		;9a6e	00 	. 
	defb 000h		;9a6f	00 	. 
	defb 000h		;9a70	00 	. 
	defb 000h		;9a71	00 	. 
	defb 000h		;9a72	00 	. 
	defb 000h		;9a73	00 	. 
	defb 000h		;9a74	00 	. 
	defb 000h		;9a75	00 	. 
	defb 000h		;9a76	00 	. 
	defb 000h		;9a77	00 	. 
	defb 000h		;9a78	00 	. 
	defb 000h		;9a79	00 	. 
	defb 000h		;9a7a	00 	. 
	defb 000h		;9a7b	00 	. 
	defb 000h		;9a7c	00 	. 
	defb 000h		;9a7d	00 	. 
	defb 000h		;9a7e	00 	. 
	defb 000h		;9a7f	00 	. 
	defb 000h		;9a80	00 	. 
l9a81h:
	defb 000h		;9a81	00 	. 
l9a82h:
	defb 000h		;9a82	00 	. 
	defb 000h		;9a83	00 	. 
	defb 000h		;9a84	00 	. 
	defb 000h		;9a85	00 	. 
	defb 000h		;9a86	00 	. 
	defb 000h		;9a87	00 	. 
	defb 000h		;9a88	00 	. 
	defb 000h		;9a89	00 	. 
	defb 000h		;9a8a	00 	. 
	defb 000h		;9a8b	00 	. 
	defb 000h		;9a8c	00 	. 
	defb 000h		;9a8d	00 	. 
	defb 000h		;9a8e	00 	. 
	defb 000h		;9a8f	00 	. 
	defb 000h		;9a90	00 	. 
	defb 000h		;9a91	00 	. 
	defb 000h		;9a92	00 	. 
	defb 000h		;9a93	00 	. 
	defb 000h		;9a94	00 	. 
	defb 000h		;9a95	00 	. 
	defb 000h		;9a96	00 	. 
	defb 000h		;9a97	00 	. 
	defb 000h		;9a98	00 	. 
	defb 000h		;9a99	00 	. 
	defb 000h		;9a9a	00 	. 
	defb 000h		;9a9b	00 	. 
	defb 000h		;9a9c	00 	. 
	defb 000h		;9a9d	00 	. 
	defb 000h		;9a9e	00 	. 
	defb 000h		;9a9f	00 	. 
	defb 000h		;9aa0	00 	. 
	defb 000h		;9aa1	00 	. 
	defb 000h		;9aa2	00 	. 
	defb 000h		;9aa3	00 	. 
	defb 000h		;9aa4	00 	. 
	defb 000h		;9aa5	00 	. 
	defb 000h		;9aa6	00 	. 
	defb 000h		;9aa7	00 	. 
	defb 000h		;9aa8	00 	. 
	defb 000h		;9aa9	00 	. 
	defb 000h		;9aaa	00 	. 
	defb 000h		;9aab	00 	. 
	defb 000h		;9aac	00 	. 
	defb 000h		;9aad	00 	. 
	defb 000h		;9aae	00 	. 
	defb 000h		;9aaf	00 	. 
	defb 000h		;9ab0	00 	. 
	defb 000h		;9ab1	00 	. 
	defb 000h		;9ab2	00 	. 
	defb 000h		;9ab3	00 	. 
	defb 000h		;9ab4	00 	. 
	defb 000h		;9ab5	00 	. 
	defb 000h		;9ab6	00 	. 
	defb 000h		;9ab7	00 	. 
	defb 000h		;9ab8	00 	. 
	defb 000h		;9ab9	00 	. 
	defb 000h		;9aba	00 	. 
	defb 000h		;9abb	00 	. 
	defb 000h		;9abc	00 	. 
	defb 000h		;9abd	00 	. 
	defb 000h		;9abe	00 	. 
	defb 000h		;9abf	00 	. 
	defb 000h		;9ac0	00 	. 
	defb 000h		;9ac1	00 	. 
	defb 000h		;9ac2	00 	. 
	defb 000h		;9ac3	00 	. 
	defb 000h		;9ac4	00 	. 
	defb 000h		;9ac5	00 	. 
	defb 000h		;9ac6	00 	. 
	defb 000h		;9ac7	00 	. 
	defb 000h		;9ac8	00 	. 
	defb 000h		;9ac9	00 	. 
	defb 000h		;9aca	00 	. 
	defb 000h		;9acb	00 	. 
	defb 000h		;9acc	00 	. 
	defb 000h		;9acd	00 	. 
	defb 000h		;9ace	00 	. 
	defb 000h		;9acf	00 	. 
	defb 000h		;9ad0	00 	. 
	defb 000h		;9ad1	00 	. 
	defb 000h		;9ad2	00 	. 
	defb 000h		;9ad3	00 	. 
	defb 000h		;9ad4	00 	. 
	defb 000h		;9ad5	00 	. 
	defb 000h		;9ad6	00 	. 
	defb 000h		;9ad7	00 	. 
	defb 000h		;9ad8	00 	. 
	defb 000h		;9ad9	00 	. 
	defb 000h		;9ada	00 	. 
	defb 000h		;9adb	00 	. 
	defb 000h		;9adc	00 	. 
	defb 000h		;9add	00 	. 
	defb 000h		;9ade	00 	. 
	defb 000h		;9adf	00 	. 
	defb 000h		;9ae0	00 	. 
	defb 000h		;9ae1	00 	. 
	defb 000h		;9ae2	00 	. 
	defb 000h		;9ae3	00 	. 
	defb 000h		;9ae4	00 	. 
	defb 000h		;9ae5	00 	. 
	defb 000h		;9ae6	00 	. 
	defb 000h		;9ae7	00 	. 
	defb 000h		;9ae8	00 	. 
	defb 000h		;9ae9	00 	. 
	defb 000h		;9aea	00 	. 
	defb 000h		;9aeb	00 	. 
	defb 000h		;9aec	00 	. 
	defb 000h		;9aed	00 	. 
	defb 000h		;9aee	00 	. 
	defb 000h		;9aef	00 	. 
	defb 000h		;9af0	00 	. 
	defb 000h		;9af1	00 	. 
	defb 000h		;9af2	00 	. 
	defb 000h		;9af3	00 	. 
	defb 000h		;9af4	00 	. 
	defb 000h		;9af5	00 	. 
	defb 000h		;9af6	00 	. 
	defb 000h		;9af7	00 	. 
	defb 000h		;9af8	00 	. 
	defb 000h		;9af9	00 	. 
	defb 000h		;9afa	00 	. 
	defb 000h		;9afb	00 	. 
	defb 000h		;9afc	00 	. 
	defb 000h		;9afd	00 	. 
	defb 000h		;9afe	00 	. 
	defb 000h		;9aff	00 	. 
	defb 000h		;9b00	00 	. 
	defb 000h		;9b01	00 	. 
	defb 000h		;9b02	00 	. 
	defb 000h		;9b03	00 	. 
	defb 000h		;9b04	00 	. 
	defb 000h		;9b05	00 	. 
	defb 000h		;9b06	00 	. 
	defb 000h		;9b07	00 	. 
	defb 000h		;9b08	00 	. 
	defb 000h		;9b09	00 	. 
	defb 000h		;9b0a	00 	. 
	defb 000h		;9b0b	00 	. 
	defb 000h		;9b0c	00 	. 
	defb 000h		;9b0d	00 	. 
	defb 000h		;9b0e	00 	. 
	defb 000h		;9b0f	00 	. 
	defb 000h		;9b10	00 	. 
	defb 000h		;9b11	00 	. 
	defb 000h		;9b12	00 	. 
	defb 000h		;9b13	00 	. 
	defb 000h		;9b14	00 	. 
	defb 000h		;9b15	00 	. 
	defb 000h		;9b16	00 	. 
	defb 000h		;9b17	00 	. 
	defb 000h		;9b18	00 	. 
	defb 000h		;9b19	00 	. 
	defb 000h		;9b1a	00 	. 
	defb 000h		;9b1b	00 	. 
	defb 000h		;9b1c	00 	. 
	defb 000h		;9b1d	00 	. 
	defb 000h		;9b1e	00 	. 
	defb 000h		;9b1f	00 	. 
	defb 000h		;9b20	00 	. 
	defb 000h		;9b21	00 	. 
	defb 000h		;9b22	00 	. 
	defb 000h		;9b23	00 	. 
	defb 000h		;9b24	00 	. 
	defb 000h		;9b25	00 	. 
	defb 000h		;9b26	00 	. 
	defb 000h		;9b27	00 	. 
	defb 000h		;9b28	00 	. 
	defb 000h		;9b29	00 	. 
	defb 000h		;9b2a	00 	. 
	defb 000h		;9b2b	00 	. 
	defb 000h		;9b2c	00 	. 
	defb 000h		;9b2d	00 	. 
	defb 000h		;9b2e	00 	. 
	defb 000h		;9b2f	00 	. 
	defb 000h		;9b30	00 	. 
	defb 000h		;9b31	00 	. 
	defb 000h		;9b32	00 	. 
	defb 000h		;9b33	00 	. 
	defb 000h		;9b34	00 	. 
	defb 000h		;9b35	00 	. 
	defb 000h		;9b36	00 	. 
	defb 000h		;9b37	00 	. 
	defb 000h		;9b38	00 	. 
	defb 000h		;9b39	00 	. 
	defb 000h		;9b3a	00 	. 
	defb 000h		;9b3b	00 	. 
	defb 000h		;9b3c	00 	. 
	defb 000h		;9b3d	00 	. 
	defb 000h		;9b3e	00 	. 
	defb 000h		;9b3f	00 	. 
	defb 000h		;9b40	00 	. 
	defb 000h		;9b41	00 	. 
	defb 000h		;9b42	00 	. 
	defb 000h		;9b43	00 	. 
	defb 000h		;9b44	00 	. 
	defb 000h		;9b45	00 	. 
	defb 000h		;9b46	00 	. 
	defb 000h		;9b47	00 	. 
	defb 000h		;9b48	00 	. 
	defb 000h		;9b49	00 	. 
	defb 000h		;9b4a	00 	. 
	defb 000h		;9b4b	00 	. 
	defb 000h		;9b4c	00 	. 
	defb 000h		;9b4d	00 	. 
	defb 000h		;9b4e	00 	. 
	defb 000h		;9b4f	00 	. 
	defb 000h		;9b50	00 	. 
	defb 000h		;9b51	00 	. 
	defb 000h		;9b52	00 	. 
	defb 000h		;9b53	00 	. 
	defb 000h		;9b54	00 	. 
	defb 000h		;9b55	00 	. 
	defb 000h		;9b56	00 	. 
	defb 000h		;9b57	00 	. 
	defb 000h		;9b58	00 	. 
	defb 000h		;9b59	00 	. 
	defb 000h		;9b5a	00 	. 
	defb 000h		;9b5b	00 	. 
	defb 000h		;9b5c	00 	. 
	defb 000h		;9b5d	00 	. 
	defb 000h		;9b5e	00 	. 
	defb 000h		;9b5f	00 	. 
	defb 000h		;9b60	00 	. 
	defb 000h		;9b61	00 	. 
	defb 000h		;9b62	00 	. 
	defb 000h		;9b63	00 	. 
	defb 000h		;9b64	00 	. 
	defb 000h		;9b65	00 	. 
	defb 000h		;9b66	00 	. 
	defb 000h		;9b67	00 	. 
	defb 000h		;9b68	00 	. 
	defb 000h		;9b69	00 	. 
	defb 000h		;9b6a	00 	. 
	defb 000h		;9b6b	00 	. 
	defb 000h		;9b6c	00 	. 
	defb 000h		;9b6d	00 	. 
	defb 000h		;9b6e	00 	. 
	defb 000h		;9b6f	00 	. 
	defb 000h		;9b70	00 	. 
	defb 000h		;9b71	00 	. 
	defb 000h		;9b72	00 	. 
	defb 000h		;9b73	00 	. 
	defb 000h		;9b74	00 	. 
	defb 000h		;9b75	00 	. 
	defb 000h		;9b76	00 	. 
	defb 000h		;9b77	00 	. 
	defb 000h		;9b78	00 	. 
	defb 000h		;9b79	00 	. 
	defb 000h		;9b7a	00 	. 
	defb 000h		;9b7b	00 	. 
	defb 000h		;9b7c	00 	. 
	defb 000h		;9b7d	00 	. 
	defb 000h		;9b7e	00 	. 
	defb 000h		;9b7f	00 	. 
	defb 000h		;9b80	00 	. 
	defb 000h		;9b81	00 	. 
	defb 000h		;9b82	00 	. 
	defb 000h		;9b83	00 	. 
	defb 000h		;9b84	00 	. 
	defb 000h		;9b85	00 	. 
	defb 000h		;9b86	00 	. 
	defb 000h		;9b87	00 	. 
	defb 000h		;9b88	00 	. 
	defb 000h		;9b89	00 	. 
	defb 000h		;9b8a	00 	. 
	defb 000h		;9b8b	00 	. 
	defb 000h		;9b8c	00 	. 
	defb 000h		;9b8d	00 	. 
	defb 000h		;9b8e	00 	. 
	defb 000h		;9b8f	00 	. 
	defb 000h		;9b90	00 	. 
	defb 000h		;9b91	00 	. 
	defb 000h		;9b92	00 	. 
	defb 000h		;9b93	00 	. 
	defb 000h		;9b94	00 	. 
	defb 000h		;9b95	00 	. 
	defb 000h		;9b96	00 	. 
	defb 000h		;9b97	00 	. 
	defb 000h		;9b98	00 	. 
	defb 000h		;9b99	00 	. 
	defb 000h		;9b9a	00 	. 
	defb 000h		;9b9b	00 	. 
	defb 000h		;9b9c	00 	. 
	defb 000h		;9b9d	00 	. 
	defb 000h		;9b9e	00 	. 
	defb 000h		;9b9f	00 	. 
	defb 000h		;9ba0	00 	. 
	defb 000h		;9ba1	00 	. 
	defb 000h		;9ba2	00 	. 
	defb 000h		;9ba3	00 	. 
	defb 000h		;9ba4	00 	. 
	defb 000h		;9ba5	00 	. 
	defb 000h		;9ba6	00 	. 
	defb 000h		;9ba7	00 	. 
	defb 000h		;9ba8	00 	. 
	defb 000h		;9ba9	00 	. 
	defb 000h		;9baa	00 	. 
	defb 000h		;9bab	00 	. 
	defb 000h		;9bac	00 	. 
	defb 000h		;9bad	00 	. 
	defb 000h		;9bae	00 	. 
	defb 000h		;9baf	00 	. 
	defb 000h		;9bb0	00 	. 
	defb 000h		;9bb1	00 	. 
	defb 000h		;9bb2	00 	. 
	defb 000h		;9bb3	00 	. 
	defb 000h		;9bb4	00 	. 
	defb 000h		;9bb5	00 	. 
	defb 000h		;9bb6	00 	. 
	defb 000h		;9bb7	00 	. 
	defb 000h		;9bb8	00 	. 
	defb 000h		;9bb9	00 	. 
	defb 000h		;9bba	00 	. 
	defb 000h		;9bbb	00 	. 
	defb 000h		;9bbc	00 	. 
	defb 000h		;9bbd	00 	. 
	defb 000h		;9bbe	00 	. 
	defb 000h		;9bbf	00 	. 
	defb 000h		;9bc0	00 	. 
	defb 000h		;9bc1	00 	. 
	defb 000h		;9bc2	00 	. 
	defb 000h		;9bc3	00 	. 
	defb 000h		;9bc4	00 	. 
	defb 000h		;9bc5	00 	. 
	defb 000h		;9bc6	00 	. 
	defb 000h		;9bc7	00 	. 
	defb 000h		;9bc8	00 	. 
	defb 000h		;9bc9	00 	. 
	defb 000h		;9bca	00 	. 
	defb 000h		;9bcb	00 	. 
	defb 000h		;9bcc	00 	. 
	defb 000h		;9bcd	00 	. 
	defb 000h		;9bce	00 	. 
	defb 000h		;9bcf	00 	. 
	defb 000h		;9bd0	00 	. 
	defb 000h		;9bd1	00 	. 
	defb 000h		;9bd2	00 	. 
	defb 000h		;9bd3	00 	. 
	defb 000h		;9bd4	00 	. 
	defb 000h		;9bd5	00 	. 
	defb 000h		;9bd6	00 	. 
	defb 000h		;9bd7	00 	. 
	defb 000h		;9bd8	00 	. 
	defb 000h		;9bd9	00 	. 
	defb 000h		;9bda	00 	. 
	defb 000h		;9bdb	00 	. 
	defb 000h		;9bdc	00 	. 
	defb 000h		;9bdd	00 	. 
	defb 000h		;9bde	00 	. 
	defb 000h		;9bdf	00 	. 
	defb 000h		;9be0	00 	. 
	defb 000h		;9be1	00 	. 
	defb 000h		;9be2	00 	. 
	defb 000h		;9be3	00 	. 
	defb 000h		;9be4	00 	. 
	defb 000h		;9be5	00 	. 
	defb 000h		;9be6	00 	. 
	defb 000h		;9be7	00 	. 
	defb 000h		;9be8	00 	. 
	defb 000h		;9be9	00 	. 
	defb 000h		;9bea	00 	. 
	defb 000h		;9beb	00 	. 
	defb 000h		;9bec	00 	. 
	defb 000h		;9bed	00 	. 
	defb 000h		;9bee	00 	. 
	defb 000h		;9bef	00 	. 
	defb 000h		;9bf0	00 	. 
	defb 000h		;9bf1	00 	. 
	defb 000h		;9bf2	00 	. 
	defb 000h		;9bf3	00 	. 
	defb 000h		;9bf4	00 	. 
	defb 000h		;9bf5	00 	. 
	defb 000h		;9bf6	00 	. 
	defb 000h		;9bf7	00 	. 
	defb 000h		;9bf8	00 	. 
	defb 000h		;9bf9	00 	. 
	defb 000h		;9bfa	00 	. 
	defb 000h		;9bfb	00 	. 
	defb 000h		;9bfc	00 	. 
	defb 000h		;9bfd	00 	. 
	defb 000h		;9bfe	00 	. 
	defb 000h		;9bff	00 	. 
	defb 000h		;9c00	00 	. 
	defb 000h		;9c01	00 	. 
	defb 000h		;9c02	00 	. 
	defb 000h		;9c03	00 	. 
	defb 000h		;9c04	00 	. 
	defb 000h		;9c05	00 	. 
	defb 000h		;9c06	00 	. 
	defb 000h		;9c07	00 	. 
	defb 000h		;9c08	00 	. 
	defb 000h		;9c09	00 	. 
	defb 000h		;9c0a	00 	. 
	defb 000h		;9c0b	00 	. 
	defb 000h		;9c0c	00 	. 
	defb 000h		;9c0d	00 	. 
	defb 000h		;9c0e	00 	. 
	defb 000h		;9c0f	00 	. 
	defb 000h		;9c10	00 	. 
	defb 000h		;9c11	00 	. 
	defb 000h		;9c12	00 	. 
	defb 000h		;9c13	00 	. 
	defb 000h		;9c14	00 	. 
	defb 000h		;9c15	00 	. 
	defb 000h		;9c16	00 	. 
	defb 000h		;9c17	00 	. 
	defb 000h		;9c18	00 	. 
	defb 000h		;9c19	00 	. 
	defb 000h		;9c1a	00 	. 
	defb 000h		;9c1b	00 	. 
	defb 000h		;9c1c	00 	. 
	defb 000h		;9c1d	00 	. 
	defb 000h		;9c1e	00 	. 
	defb 000h		;9c1f	00 	. 
	defb 000h		;9c20	00 	. 
	defb 000h		;9c21	00 	. 
	defb 000h		;9c22	00 	. 
	defb 000h		;9c23	00 	. 
	defb 000h		;9c24	00 	. 
	defb 000h		;9c25	00 	. 
	defb 000h		;9c26	00 	. 
	defb 000h		;9c27	00 	. 
	defb 000h		;9c28	00 	. 
	defb 000h		;9c29	00 	. 
	defb 000h		;9c2a	00 	. 
	defb 000h		;9c2b	00 	. 
	defb 000h		;9c2c	00 	. 
	defb 000h		;9c2d	00 	. 
	defb 000h		;9c2e	00 	. 
	defb 000h		;9c2f	00 	. 
	defb 000h		;9c30	00 	. 
	defb 000h		;9c31	00 	. 
	defb 000h		;9c32	00 	. 
	defb 000h		;9c33	00 	. 
	defb 000h		;9c34	00 	. 
	defb 000h		;9c35	00 	. 
	defb 000h		;9c36	00 	. 
	defb 000h		;9c37	00 	. 
	defb 000h		;9c38	00 	. 
	defb 000h		;9c39	00 	. 
	defb 000h		;9c3a	00 	. 
	defb 000h		;9c3b	00 	. 
	defb 000h		;9c3c	00 	. 
	defb 000h		;9c3d	00 	. 
	defb 000h		;9c3e	00 	. 
	defb 000h		;9c3f	00 	. 
	defb 000h		;9c40	00 	. 
	defb 000h		;9c41	00 	. 
	defb 000h		;9c42	00 	. 
	defb 000h		;9c43	00 	. 
	defb 000h		;9c44	00 	. 
	defb 000h		;9c45	00 	. 
	defb 000h		;9c46	00 	. 
	defb 000h		;9c47	00 	. 
	defb 000h		;9c48	00 	. 
	defb 000h		;9c49	00 	. 
	defb 000h		;9c4a	00 	. 
	defb 000h		;9c4b	00 	. 
	defb 000h		;9c4c	00 	. 
	defb 000h		;9c4d	00 	. 
	defb 000h		;9c4e	00 	. 
	defb 000h		;9c4f	00 	. 
	defb 000h		;9c50	00 	. 
	defb 000h		;9c51	00 	. 
	defb 000h		;9c52	00 	. 
	defb 000h		;9c53	00 	. 
	defb 000h		;9c54	00 	. 
	defb 000h		;9c55	00 	. 
	defb 000h		;9c56	00 	. 
	defb 000h		;9c57	00 	. 
	defb 000h		;9c58	00 	. 
	defb 000h		;9c59	00 	. 
	defb 000h		;9c5a	00 	. 
	defb 000h		;9c5b	00 	. 
	defb 000h		;9c5c	00 	. 
	defb 000h		;9c5d	00 	. 
	defb 000h		;9c5e	00 	. 
	defb 000h		;9c5f	00 	. 
	defb 000h		;9c60	00 	. 
	defb 000h		;9c61	00 	. 
	defb 000h		;9c62	00 	. 
	defb 000h		;9c63	00 	. 
	defb 000h		;9c64	00 	. 
	defb 000h		;9c65	00 	. 
	defb 000h		;9c66	00 	. 
	defb 000h		;9c67	00 	. 
	defb 000h		;9c68	00 	. 
	defb 000h		;9c69	00 	. 
	defb 000h		;9c6a	00 	. 
	defb 000h		;9c6b	00 	. 
	defb 000h		;9c6c	00 	. 
	defb 000h		;9c6d	00 	. 
	defb 000h		;9c6e	00 	. 
	defb 000h		;9c6f	00 	. 
	defb 000h		;9c70	00 	. 
	defb 000h		;9c71	00 	. 
	defb 000h		;9c72	00 	. 
	defb 000h		;9c73	00 	. 
	defb 000h		;9c74	00 	. 
	defb 000h		;9c75	00 	. 
	defb 000h		;9c76	00 	. 
	defb 000h		;9c77	00 	. 
	defb 000h		;9c78	00 	. 
	defb 000h		;9c79	00 	. 
	defb 000h		;9c7a	00 	. 
	defb 000h		;9c7b	00 	. 
	defb 000h		;9c7c	00 	. 
	defb 000h		;9c7d	00 	. 
	defb 000h		;9c7e	00 	. 
	defb 000h		;9c7f	00 	. 
	defb 000h		;9c80	00 	. 
	defb 000h		;9c81	00 	. 
	defb 000h		;9c82	00 	. 
	defb 000h		;9c83	00 	. 
	defb 000h		;9c84	00 	. 
	defb 000h		;9c85	00 	. 
	defb 000h		;9c86	00 	. 
	defb 000h		;9c87	00 	. 
	defb 000h		;9c88	00 	. 
	defb 000h		;9c89	00 	. 
	defb 000h		;9c8a	00 	. 
	defb 000h		;9c8b	00 	. 
	defb 000h		;9c8c	00 	. 
	defb 000h		;9c8d	00 	. 
	defb 000h		;9c8e	00 	. 
	defb 000h		;9c8f	00 	. 
	defb 000h		;9c90	00 	. 
	defb 000h		;9c91	00 	. 
	defb 000h		;9c92	00 	. 
	defb 000h		;9c93	00 	. 
	defb 000h		;9c94	00 	. 
	defb 000h		;9c95	00 	. 
	defb 000h		;9c96	00 	. 
	defb 000h		;9c97	00 	. 
	defb 000h		;9c98	00 	. 
	defb 000h		;9c99	00 	. 
	defb 000h		;9c9a	00 	. 
	defb 000h		;9c9b	00 	. 
	defb 000h		;9c9c	00 	. 
	defb 000h		;9c9d	00 	. 
	defb 000h		;9c9e	00 	. 
	defb 000h		;9c9f	00 	. 
	defb 000h		;9ca0	00 	. 
	defb 000h		;9ca1	00 	. 
	defb 000h		;9ca2	00 	. 
	defb 000h		;9ca3	00 	. 
	defb 000h		;9ca4	00 	. 
	defb 000h		;9ca5	00 	. 
	defb 000h		;9ca6	00 	. 
	defb 000h		;9ca7	00 	. 
	defb 000h		;9ca8	00 	. 
	defb 000h		;9ca9	00 	. 
	defb 000h		;9caa	00 	. 
	defb 000h		;9cab	00 	. 
	defb 000h		;9cac	00 	. 
	defb 000h		;9cad	00 	. 
	defb 000h		;9cae	00 	. 
	defb 000h		;9caf	00 	. 
	defb 000h		;9cb0	00 	. 
	defb 000h		;9cb1	00 	. 
	defb 000h		;9cb2	00 	. 
	defb 000h		;9cb3	00 	. 
	defb 000h		;9cb4	00 	. 
	defb 000h		;9cb5	00 	. 
	defb 000h		;9cb6	00 	. 
	defb 000h		;9cb7	00 	. 
	defb 000h		;9cb8	00 	. 
	defb 000h		;9cb9	00 	. 
	defb 000h		;9cba	00 	. 
	defb 000h		;9cbb	00 	. 
	defb 000h		;9cbc	00 	. 
	defb 000h		;9cbd	00 	. 
	defb 000h		;9cbe	00 	. 
	defb 000h		;9cbf	00 	. 
	defb 000h		;9cc0	00 	. 
	defb 000h		;9cc1	00 	. 
	defb 000h		;9cc2	00 	. 
	defb 000h		;9cc3	00 	. 
	defb 000h		;9cc4	00 	. 
	defb 000h		;9cc5	00 	. 
	defb 000h		;9cc6	00 	. 
	defb 000h		;9cc7	00 	. 
	defb 000h		;9cc8	00 	. 
	defb 000h		;9cc9	00 	. 
	defb 000h		;9cca	00 	. 
	defb 000h		;9ccb	00 	. 
	defb 000h		;9ccc	00 	. 
	defb 000h		;9ccd	00 	. 
	defb 000h		;9cce	00 	. 
	defb 000h		;9ccf	00 	. 
	defb 000h		;9cd0	00 	. 
	defb 000h		;9cd1	00 	. 
	defb 000h		;9cd2	00 	. 
	defb 000h		;9cd3	00 	. 
	defb 000h		;9cd4	00 	. 
	defb 000h		;9cd5	00 	. 
	defb 000h		;9cd6	00 	. 
	defb 000h		;9cd7	00 	. 
	defb 000h		;9cd8	00 	. 
	defb 000h		;9cd9	00 	. 
	defb 000h		;9cda	00 	. 
	defb 000h		;9cdb	00 	. 
	defb 000h		;9cdc	00 	. 
	defb 000h		;9cdd	00 	. 
	defb 000h		;9cde	00 	. 
	defb 000h		;9cdf	00 	. 
	defb 000h		;9ce0	00 	. 
	defb 000h		;9ce1	00 	. 
	defb 000h		;9ce2	00 	. 
	defb 000h		;9ce3	00 	. 
	defb 000h		;9ce4	00 	. 
	defb 000h		;9ce5	00 	. 
	defb 000h		;9ce6	00 	. 
	defb 000h		;9ce7	00 	. 
	defb 000h		;9ce8	00 	. 
	defb 000h		;9ce9	00 	. 
	defb 000h		;9cea	00 	. 
	defb 000h		;9ceb	00 	. 
	defb 000h		;9cec	00 	. 
	defb 000h		;9ced	00 	. 
	defb 000h		;9cee	00 	. 
	defb 000h		;9cef	00 	. 
	defb 000h		;9cf0	00 	. 
	defb 000h		;9cf1	00 	. 
	defb 000h		;9cf2	00 	. 
	defb 000h		;9cf3	00 	. 
	defb 000h		;9cf4	00 	. 
	defb 000h		;9cf5	00 	. 
	defb 000h		;9cf6	00 	. 
	defb 000h		;9cf7	00 	. 
	defb 000h		;9cf8	00 	. 
	defb 000h		;9cf9	00 	. 
	defb 000h		;9cfa	00 	. 
	defb 000h		;9cfb	00 	. 
	defb 000h		;9cfc	00 	. 
	defb 000h		;9cfd	00 	. 
	defb 000h		;9cfe	00 	. 
	defb 000h		;9cff	00 	. 
	defb 000h		;9d00	00 	. 
l9d01h:
	defb 000h		;9d01	00 	. 
sub_9d02h:
	ld hl,0f3d3h		;9d02	21 d3 f3 	! . . 
	res 0,(hl)		;9d05	cb 86 	. . 
	ld a,(0f3d4h)		;9d07	3a d4 f3 	: . . 
	and a			;9d0a	a7 	. 
	ret nz			;9d0b	c0 	. 
	dec a			;9d0c	3d 	= 
	ld (0f3d4h),a		;9d0d	32 d4 f3 	2 . . 
	ld a,(sys_page_keyboard)		;9d10	3a 66 2c 	: f , 
	ld b,a			;9d13	47 	G 
	ld a,(sys_page_printer)		;9d14	3a 74 2c 	: t , 
	and a			;9d17	a7 	. 
	jp z,l9d5dh		;9d18	ca 5d 9d 	. ] . 
	cp 003h		;9d1b	fe 03 	. . 
	call m,sub_9d72h		;9d1d	fc 72 9d 	. r . 
	call m,sub_9d8ah		;9d20	fc 8a 9d 	. . . 
	cp 009h		;9d23	fe 09 	. . 
	jp z,l9d30h		;9d25	ca 30 9d 	. 0 . 
	cp 007h		;9d28	fe 07 	. . 
	call p,sub_9d72h		;9d2a	f4 72 9d 	. r . 
	call p,sub_9d8ah		;9d2d	f4 8a 9d 	. . . 
l9d30h:
	ld a,(l2c33h)		;9d30	3a 33 2c 	: 3 , 
	and a			;9d33	a7 	. 
	jp nz,l9d5dh		;9d34	c2 5d 9d 	. ] . 
	call nz,sub_9d62h		;9d37	c4 62 9d 	. b . 
	ld a,b			;9d3a	78 	x 
	ld (l9729h),a		;9d3b	32 29 97 	2 ) . 
	bit 5,a		;9d3e	cb 6f 	. o 
	ld a,018h		;9d40	3e 18 	> . 
	jp nz,l9d46h		;9d42	c2 46 9d 	. F . 
	inc a			;9d45	3c 	< 
l9d46h:
	ld (l973bh),a		;9d46	32 3b 97 	2 ; . 
	call sub_9fd0h		;9d49	cd d0 9f 	. . . 
	call sub_1c50h		;9d4c	cd 50 1c 	. P . 
	push hl			;9d4f	e5 	. 
	call sub_9d90h		;9d50	cd 90 9d 	. . . 
	pop hl			;9d53	e1 	. 
	call sub_1c53h		;9d54	cd 53 1c 	. S . 
	call sub_9fedh		;9d57	cd ed 9f 	. . . 
	call sub_9fddh		;9d5a	cd dd 9f 	. . . 
l9d5dh:
	sub a			;9d5d	97 	. 
	ld (0f3d4h),a		;9d5e	32 d4 f3 	2 . . 
	ret			;9d61	c9 	. 
sub_9d62h:
	call sub_9d8ah		;9d62	cd 8a 9d 	. . . 
	call sub_9d87h		;9d65	cd 87 9d 	. . . 
	call sub_9d8dh		;9d68	cd 8d 9d 	. . . 
	bit 0,b		;9d6b	cb 40 	. @ 
	ret nz			;9d6d	c0 	. 
	pop hl			;9d6e	e1 	. 
	jp l9d5dh		;9d6f	c3 5d 9d 	. ] . 
sub_9d72h:
	set 0,b		;9d72	cb c0 	. . 
	ret			;9d74	c9 	. 
	set 1,b		;9d75	cb c8 	. . 
	ret			;9d77	c9 	. 
	set 2,b		;9d78	cb d0 	. . 
	ret			;9d7a	c9 	. 
	set 3,b		;9d7b	cb d8 	. . 
	ret			;9d7d	c9 	. 
	set 4,b		;9d7e	cb e0 	. . 
	ret			;9d80	c9 	. 
	res 0,b		;9d81	cb 80 	. . 
	ret			;9d83	c9 	. 
	res 1,b		;9d84	cb 88 	. . 
	ret			;9d86	c9 	. 
sub_9d87h:
	res 2,b		;9d87	cb 90 	. . 
	ret			;9d89	c9 	. 
sub_9d8ah:
	res 3,b		;9d8a	cb 98 	. . 
	ret			;9d8c	c9 	. 
sub_9d8dh:
	res 4,b		;9d8d	cb a0 	. . 
	ret			;9d8f	c9 	. 
sub_9d90h:
	sub a			;9d90	97 	. 
	ld (l9739h),a		;9d91	32 39 97 	2 9 . 
l9d94h:
	call sub_9f89h		;9d94	cd 89 9f 	. . . 
	sub a			;9d97	97 	. 
	ld (l9738h),a		;9d98	32 38 97 	2 8 . 
l9d9bh:
	ld hl,(l9738h)		;9d9b	2a 38 97 	* 8 . 
	call sub_1c56h		;9d9e	cd 56 1c 	. V . 
	call sub_9dc4h		;9da1	cd c4 9d 	. . . 
	ld hl,l973ah		;9da4	21 3a 97 	! : . 
	ld a,(l9738h)		;9da7	3a 38 97 	: 8 . 
	inc a			;9daa	3c 	< 
	ld (l9738h),a		;9dab	32 38 97 	2 8 . 
	cp (hl)			;9dae	be 	. 
	jp nz,l9d9bh		;9daf	c2 9b 9d 	. . . 
	call sub_9e41h		;9db2	cd 41 9e 	. A . 
	ld hl,l973bh		;9db5	21 3b 97 	! ; . 
	ld a,(l9739h)		;9db8	3a 39 97 	: 9 . 
	inc a			;9dbb	3c 	< 
	ld (l9739h),a		;9dbc	32 39 97 	2 9 . 
	cp (hl)			;9dbf	be 	. 
	jp nz,l9d94h		;9dc0	c2 94 9d 	. . . 
	ret			;9dc3	c9 	. 
sub_9dc4h:
	push hl			;9dc4	e5 	. 
	ld d,020h		;9dc5	16 20 	.   
	sub a			;9dc7	97 	. 
	or b			;9dc8	b0 	. 
	jp nz,l9dcdh		;9dc9	c2 cd 9d 	. . . 
	ld b,d			;9dcc	42 	B 
l9dcdh:
	ld a,(l9729h)		;9dcd	3a 29 97 	: ) . 
	ld e,a			;9dd0	5f 	_ 
	bit 2,e		;9dd1	cb 53 	. S 
	jr z,l9ddbh		;9dd3	28 06 	( . 
	bit 2,c		;9dd5	cb 51 	. Q 
	jp nz,l9ddbh		;9dd7	c2 db 9d 	. . . 
	ld b,d			;9dda	42 	B 
l9ddbh:
	bit 4,e		;9ddb	cb 63 	. c 
	jr z,l9de4h		;9ddd	28 05 	( . 
	bit 6,c		;9ddf	cb 71 	. q 
	jr z,l9de4h		;9de1	28 01 	( . 
	ld b,d			;9de3	42 	B 
l9de4h:
	bit 0,e		;9de4	cb 43 	. C 
	jr z,l9e0ah		;9de6	28 22 	( " 
	bit 7,b		;9de8	cb 78 	. x 
	jp nz,l9df3h		;9dea	c2 f3 9d 	. . . 
	ld a,b			;9ded	78 	x 
	cp 07fh		;9dee	fe 7f 	.  
	jp m,l9e0ah		;9df0	fa 0a 9e 	. . . 
l9df3h:
	push bc			;9df3	c5 	. 
	ld a,b			;9df4	78 	x 
	ld bc,(l9667h)		;9df5	ed 4b 67 96 	. K g . 
	ld hl,l9669h		;9df9	21 69 96 	! i . 
l9dfch:
	cpi		;9dfc	ed a1 	. . 
	jr z,l9e08h		;9dfe	28 08 	( . 
	inc hl			;9e00	23 	# 
	jp pe,l9dfch		;9e01	ea fc 9d 	. . . 
	pop bc			;9e04	c1 	. 
	ld b,d			;9e05	42 	B 
	jr l9e0ah		;9e06	18 02 	. . 
l9e08h:
	pop bc			;9e08	c1 	. 
	ld b,(hl)			;9e09	46 	F 
l9e0ah:
	ld hl,(l975ch)		;9e0a	2a 5c 97 	* \ . 
	ld (hl),b			;9e0d	70 	p 
	inc hl			;9e0e	23 	# 
	ld (hl),c			;9e0f	71 	q 
	inc hl			;9e10	23 	# 
	ld (l975ch),hl		;9e11	22 5c 97 	" \ . 
	pop hl			;9e14	e1 	. 
	bit 0,e		;9e15	cb 43 	. C 
	jp nz,l9e40h		;9e17	c2 40 9e 	. @ . 
	bit 3,c		;9e1a	cb 59 	. Y 
	jp nz,l9e24h		;9e1c	c2 24 9e 	. $ . 
	ld a,b			;9e1f	78 	x 
	cp d			;9e20	ba 	. 
	jp z,l9e2fh		;9e21	ca 2f 9e 	. / . 
l9e24h:
	ld de,(l97feh)		;9e24	ed 5b fe 97 	. [ . . 
	ld bc,(l9800h)		;9e28	ed 4b 00 98 	. K . . 
	call sub_9fa6h		;9e2c	cd a6 9f 	. . . 
l9e2fh:
	ld de,00008h		;9e2f	11 08 00 	. . . 
	ld hl,(l97feh)		;9e32	2a fe 97 	* . . 
	add hl,de			;9e35	19 	. 
	ld (l97feh),hl		;9e36	22 fe 97 	" . . 
	ld hl,(l9800h)		;9e39	2a 00 98 	* . . 
	add hl,de			;9e3c	19 	. 
	ld (l9800h),hl		;9e3d	22 00 98 	" . . 
l9e40h:
	ret			;9e40	c9 	. 
sub_9e41h:
	ld a,(l9729h)		;9e41	3a 29 97 	: ) . 
	bit 0,a		;9e44	cb 47 	. G 
	jp nz,l9f6dh		;9e46	c2 6d 9f 	. m . 
	bit 3,a		;9e49	cb 5f 	. _ 
	jp nz,l9e5bh		;9e4b	c2 5b 9e 	. [ . 
	call sub_9each		;9e4e	cd ac 9e 	. . . 
	call sub_a00eh		;9e51	cd 0e a0 	. . . 
	call sub_9ebch		;9e54	cd bc 9e 	. . . 
	call sub_a00eh		;9e57	cd 0e a0 	. . . 
	ret			;9e5a	c9 	. 
l9e5bh:
	call sub_9each		;9e5b	cd ac 9e 	. . . 
	call sub_9e7ah		;9e5e	cd 7a 9e 	. z . 
	call sub_9each		;9e61	cd ac 9e 	. . . 
	call sub_9each		;9e64	cd ac 9e 	. . . 
	call sub_a00eh		;9e67	cd 0e a0 	. . . 
	call sub_9ebch		;9e6a	cd bc 9e 	. . . 
	call sub_9e81h		;9e6d	cd 81 9e 	. . . 
	call sub_9ebch		;9e70	cd bc 9e 	. . . 
	call sub_9ebch		;9e73	cd bc 9e 	. . . 
	call sub_a00eh		;9e76	cd 0e a0 	. . . 
	ret			;9e79	c9 	. 
sub_9e7ah:
	ld ix,l9802h		;9e7a	dd 21 02 98 	. ! . . 
	jp l9e85h		;9e7e	c3 85 9e 	. . . 
sub_9e81h:
	ld ix,l9a82h		;9e81	dd 21 82 9a 	. ! . . 
l9e85h:
	ld iy,l975eh		;9e85	fd 21 5e 97 	. ! ^ . 
	ld c,050h		;9e89	0e 50 	. P 
l9e8bh:
	ld b,008h		;9e8b	06 08 	. . 
	inc iy		;9e8d	fd 23 	. # 
	ld a,(iy+000h)		;9e8f	fd 7e 00 	. ~ . 
	inc iy		;9e92	fd 23 	. # 
	ld e,a			;9e94	5f 	_ 
	sub a			;9e95	97 	. 
l9e96h:
	bit 3,e		;9e96	cb 5b 	. [ 
	jp nz,l9ea0h		;9e98	c2 a0 9e 	. . . 
	bit 2,e		;9e9b	cb 53 	. S 
	jp nz,l9ea3h		;9e9d	c2 a3 9e 	. . . 
l9ea0h:
	ld (ix+000h),a		;9ea0	dd 77 00 	. w . 
l9ea3h:
	inc ix		;9ea3	dd 23 	. # 
	djnz l9e96h		;9ea5	10 ef 	. . 
	dec c			;9ea7	0d 	. 
	jp nz,l9e8bh		;9ea8	c2 8b 9e 	. . . 
	ret			;9eab	c9 	. 
sub_9each:
	ld hl,l9a81h		;9eac	21 81 9a 	! . . 
	call sub_9f7eh		;9eaf	cd 7e 9f 	. ~ . 
	ld hl,l9802h		;9eb2	21 02 98 	! . . 
	call nz,sub_9ecch		;9eb5	c4 cc 9e 	. . . 
	call sub_a007h		;9eb8	cd 07 a0 	. . . 
	ret			;9ebb	c9 	. 
sub_9ebch:
	ld hl,l9d01h		;9ebc	21 01 9d 	! . . 
	call sub_9f7eh		;9ebf	cd 7e 9f 	. ~ . 
	ld hl,l9a82h		;9ec2	21 82 9a 	! . . 
	call nz,sub_9ecch		;9ec5	c4 cc 9e 	. . . 
	call sub_a007h		;9ec8	cd 07 a0 	. . . 
	ret			;9ecb	c9 	. 
sub_9ecch:
	inc bc			;9ecc	03 	. 
	ld (l9740h),bc		;9ecd	ed 43 40 97 	. C @ . 
	push hl			;9ed1	e5 	. 
	ld a,(sys_page_printer)		;9ed2	3a 74 2c 	: t , 
	cp 009h		;9ed5	fe 09 	. . 
	jp nz,l9ee2h		;9ed7	c2 e2 9e 	. . . 
	ld a,(l9729h)		;9eda	3a 29 97 	: ) . 
	bit 6,a		;9edd	cb 77 	. w 
	jp nz,l9ef9h		;9edf	c2 f9 9e 	. . . 
l9ee2h:
	ld hl,l973ch		;9ee2	21 3c 97 	! < . 
	call sub_9ffah		;9ee5	cd fa 9f 	. . . 
	pop hl			;9ee8	e1 	. 
	ld bc,(l9740h)		;9ee9	ed 4b 40 97 	. K @ . 
l9eedh:
	ld a,(hl)			;9eed	7e 	~ 
	inc hl			;9eee	23 	# 
	call sub_a015h		;9eef	cd 15 a0 	. . . 
	dec bc			;9ef2	0b 	. 
	ld a,b			;9ef3	78 	x 
	or c			;9ef4	b1 	. 
	jp nz,l9eedh		;9ef5	c2 ed 9e 	. . . 
	ret			;9ef8	c9 	. 
l9ef9h:
	ld hl,l973fh		;9ef9	21 3f 97 	! ? . 
	ld a,(hl)			;9efc	7e 	~ 
	ld (l9f2ch),a		;9efd	32 2c 9f 	2 , . 
	ld (hl),027h		;9f00	36 27 	6 ' 
	ld de,(l9740h)		;9f02	ed 5b 40 97 	. [ @ . 
	ld hl,(l9740h)		;9f06	2a 40 97 	* @ . 
	add hl,de			;9f09	19 	. 
	ld (l9740h),hl		;9f0a	22 40 97 	" @ . 
	push de			;9f0d	d5 	. 
	ld hl,l973ch		;9f0e	21 3c 97 	! < . 
	call sub_9ffah		;9f11	cd fa 9f 	. . . 
	pop de			;9f14	d1 	. 
	pop hl			;9f15	e1 	. 
l9f16h:
	ld a,(hl)			;9f16	7e 	~ 
	inc hl			;9f17	23 	# 
	push hl			;9f18	e5 	. 
	push de			;9f19	d5 	. 
	call sub_9f2dh		;9f1a	cd 2d 9f 	. - . 
	pop de			;9f1d	d1 	. 
	pop hl			;9f1e	e1 	. 
	dec de			;9f1f	1b 	. 
	ld a,e			;9f20	7b 	{ 
	or d			;9f21	b2 	. 
	jp nz,l9f16h		;9f22	c2 16 9f 	. . . 
	ld a,(l9f2ch)		;9f25	3a 2c 9f 	: , . 
	ld (l973fh),a		;9f28	32 3f 97 	2 ? . 
	ret			;9f2b	c9 	. 
l9f2ch:
	defb 000h		;9f2c	00 	. 
sub_9f2dh:
	ld hl,l9744h		;9f2d	21 44 97 	! D . 
	ld d,a			;9f30	57 	W 
	ld c,080h		;9f31	0e 80 	. . 
l9f33h:
	ld a,d			;9f33	7a 	z 
	and c			;9f34	a1 	. 
	jp z,l9f3dh		;9f35	ca 3d 9f 	. = . 
	ld a,001h		;9f38	3e 01 	> . 
	jp l9f3eh		;9f3a	c3 3e 9f 	. > . 
l9f3dh:
	sub a			;9f3d	97 	. 
l9f3eh:
	ld (hl),a			;9f3e	77 	w 
	inc hl			;9f3f	23 	# 
	ld (hl),a			;9f40	77 	w 
	inc hl			;9f41	23 	# 
	ld (hl),a			;9f42	77 	w 
	inc hl			;9f43	23 	# 
	rrc c		;9f44	cb 09 	. . 
	jr nc,l9f33h		;9f46	30 eb 	0 . 
	ld e,002h		;9f48	1e 02 	. . 
l9f4ah:
	ld hl,l9744h		;9f4a	21 44 97 	! D . 
	ld b,003h		;9f4d	06 03 	. . 
l9f4fh:
	ld c,080h		;9f4f	0e 80 	. . 
	ld d,000h		;9f51	16 00 	. . 
l9f53h:
	ld a,(hl)			;9f53	7e 	~ 
	inc hl			;9f54	23 	# 
	cp 000h		;9f55	fe 00 	. . 
	jp z,l9f5dh		;9f57	ca 5d 9f 	. ] . 
	ld a,d			;9f5a	7a 	z 
	or c			;9f5b	b1 	. 
	ld d,a			;9f5c	57 	W 
l9f5dh:
	rrc c		;9f5d	cb 09 	. . 
	jp nc,l9f53h		;9f5f	d2 53 9f 	. S . 
	ld a,d			;9f62	7a 	z 
	call sub_a015h		;9f63	cd 15 a0 	. . . 
	djnz l9f4fh		;9f66	10 e7 	. . 
	dec e			;9f68	1d 	. 
	jp nz,l9f4ah		;9f69	c2 4a 9f 	. J . 
	ret			;9f6c	c9 	. 
l9f6dh:
	ld hl,l975eh		;9f6d	21 5e 97 	! ^ . 
	ld b,050h		;9f70	06 50 	. P 
l9f72h:
	ld a,(hl)			;9f72	7e 	~ 
	inc hl			;9f73	23 	# 
	inc hl			;9f74	23 	# 
	call sub_a015h		;9f75	cd 15 a0 	. . . 
	djnz l9f72h		;9f78	10 f8 	. . 
	call sub_a00eh		;9f7a	cd 0e a0 	. . . 
	ret			;9f7d	c9 	. 
sub_9f7eh:
	ld bc,00280h		;9f7e	01 80 02 	. . . 
	sub a			;9f81	97 	. 
l9f82h:
	cpd		;9f82	ed a9 	. . 
	ret nz			;9f84	c0 	. 
	jp pe,l9f82h		;9f85	ea 82 9f 	. . . 
	ret			;9f88	c9 	. 
sub_9f89h:
	ld hl,l975eh		;9f89	21 5e 97 	! ^ . 
	ld (l975ch),hl		;9f8c	22 5c 97 	" \ . 
	ld hl,l9a82h		;9f8f	21 82 9a 	! . . 
	ld (l9800h),hl		;9f92	22 00 98 	" . . 
	ld hl,l9802h		;9f95	21 02 98 	! . . 
	ld (l97feh),hl		;9f98	22 fe 97 	" . . 
	ld de,l9803h		;9f9b	11 03 98 	. . . 
	ld bc,004ffh		;9f9e	01 ff 04 	. . . 
	ld (hl),000h		;9fa1	36 00 	6 . 
	ldir		;9fa3	ed b0 	. . 
	ret			;9fa5	c9 	. 
sub_9fa6h:
	push de			;9fa6	d5 	. 
	push bc			;9fa7	c5 	. 
	ld b,002h		;9fa8	06 02 	. . 
l9faah:
	pop ix		;9faa	dd e1 	. . 
	ld (l9742h),hl		;9fac	22 42 97 	" B . 
	ld c,001h		;9faf	0e 01 	. . 
l9fb1h:
	ld d,080h		;9fb1	16 80 	. . 
	ld hl,(l9742h)		;9fb3	2a 42 97 	* B . 
	ld e,000h		;9fb6	1e 00 	. . 
l9fb8h:
	ld a,(hl)			;9fb8	7e 	~ 
	inc hl			;9fb9	23 	# 
	and c			;9fba	a1 	. 
	jr z,l9fc0h		;9fbb	28 03 	( . 
	ld a,e			;9fbd	7b 	{ 
	or d			;9fbe	b2 	. 
	ld e,a			;9fbf	5f 	_ 
l9fc0h:
	rrc d		;9fc0	cb 0a 	. . 
	jr nc,l9fb8h		;9fc2	30 f4 	0 . 
	ld (ix+000h),e		;9fc4	dd 73 00 	. s . 
	inc ix		;9fc7	dd 23 	. # 
	rlc c		;9fc9	cb 01 	. . 
	jr nc,l9fb1h		;9fcb	30 e4 	0 . 
	djnz l9faah		;9fcd	10 db 	. . 
	ret			;9fcf	c9 	. 
sub_9fd0h:
	ld a,(l9729h)		;9fd0	3a 29 97 	: ) . 
	bit 0,a		;9fd3	cb 47 	. G 
	ret nz			;9fd5	c0 	. 
	ld hl,l9731h		;9fd6	21 31 97 	! 1 . 
	call sub_9ffah		;9fd9	cd fa 9f 	. . . 
	ret			;9fdc	c9 	. 
sub_9fddh:
	ld a,(l9729h)		;9fdd	3a 29 97 	: ) . 
	bit 0,a		;9fe0	cb 47 	. G 
	ret nz			;9fe2	c0 	. 
	bit 1,a		;9fe3	cb 4f 	. O 
	ret z			;9fe5	c8 	. 
	ld hl,l9735h		;9fe6	21 35 97 	! 5 . 
	call sub_9ffah		;9fe9	cd fa 9f 	. . . 
	ret			;9fec	c9 	. 
sub_9fedh:
	ld a,(l9729h)		;9fed	3a 29 97 	: ) . 
	bit 1,a		;9ff0	cb 4f 	. O 
	ret z			;9ff2	c8 	. 
	ld hl,l972ah		;9ff3	21 2a 97 	! * . 
	call sub_9ffah		;9ff6	cd fa 9f 	. . . 
	ret			;9ff9	c9 	. 
sub_9ffah:
	ld b,(hl)			;9ffa	46 	F 
	inc hl			;9ffb	23 	# 
	sub a			;9ffc	97 	. 
	or b			;9ffd	b0 	. 
	ret z			;9ffe	c8 	. 
l9fffh:
	ld a,(hl)			;9fff	7e 	~ 
	inc hl			;a000	23 	# 
	call sub_a015h		;a001	cd 15 a0 	. . . 
	djnz l9fffh		;a004	10 f9 	. . 
	ret			;a006	c9 	. 
sub_a007h:
	ld hl,l972ch		;a007	21 2c 97 	! , . 
	call sub_9ffah		;a00a	cd fa 9f 	. . . 
	ret			;a00d	c9 	. 
sub_a00eh:
	ld hl,l972eh		;a00e	21 2e 97 	! . . 
	call sub_9ffah		;a011	cd fa 9f 	. . . 
	ret			;a014	c9 	. 
sub_a015h:
	push hl			;a015	e5 	. 
	push de			;a016	d5 	. 
	push bc			;a017	c5 	. 
	ld c,a			;a018	4f 	O 
	call bios2_list		;a019	cd 14 1a 	. . . 
	pop bc			;a01c	c1 	. 
	pop de			;a01d	d1 	. 
	pop hl			;a01e	e1 	. 
	ret			;a01f	c9 	. 
sub_a020h:
	di			;a020	f3 	. 
	call sub_a028h		;a021	cd 28 a0 	. ( . 
	ei			;a024	fb 	. 
	nop			;a025	00 	. 
	nop			;a026	00 	. 
	ret			;a027	c9 	. 
sub_a028h:
	ld hl,00000h		;a028	21 00 00 	! . . 
	ld (la2fch),hl		;a02b	22 fc a2 	" . . 
	xor a			;a02e	af 	. 
	ld (0f582h),a		;a02f	32 82 f5 	2 . . 
	ret			;a032	c9 	. 
	di			;a033	f3 	. 
	call sub_a03bh		;a034	cd 3b a0 	. ; . 
	ei			;a037	fb 	. 
	nop			;a038	00 	. 
	nop			;a039	00 	. 
	ret			;a03a	c9 	. 
sub_a03bh:
	push hl			;a03b	e5 	. 
	push af			;a03c	f5 	. 
	ld a,(0f582h)		;a03d	3a 82 f5 	: . . 
	cp 080h		;a040	fe 80 	. . 
	jr z,la061h		;a042	28 1d 	( . 
	inc a			;a044	3c 	< 
	ld (0f582h),a		;a045	32 82 f5 	2 . . 
	ld hl,la2ffh		;a048	21 ff a2 	! . . 
	ld a,(la2fch)		;a04b	3a fc a2 	: . . 
	ld d,000h		;a04e	16 00 	. . 
	ld e,a			;a050	5f 	_ 
	add hl,de			;a051	19 	. 
	inc a			;a052	3c 	< 
	cp 080h		;a053	fe 80 	. . 
	jr nz,la059h		;a055	20 02 	  . 
	ld a,000h		;a057	3e 00 	> . 
la059h:
	ld (la2fch),a		;a059	32 fc a2 	2 . . 
	pop af			;a05c	f1 	. 
	ld (hl),a			;a05d	77 	w 
	xor a			;a05e	af 	. 
	jr la064h		;a05f	18 03 	. . 
la061h:
	pop af			;a061	f1 	. 
	ld a,0ffh		;a062	3e ff 	> . 
la064h:
	pop hl			;a064	e1 	. 
	ret			;a065	c9 	. 
sub_a066h:
	ld b,a			;a066	47 	G 
	ld a,(0f582h)		;a067	3a 82 f5 	: . . 
	add a,b			;a06a	80 	. 
	cp 080h		;a06b	fe 80 	. . 
	jr nc,la07bh		;a06d	30 0c 	0 . 
la06fh:
	ld a,(hl)			;a06f	7e 	~ 
	call sub_a03bh		;a070	cd 3b a0 	. ; . 
	inc hl			;a073	23 	# 
	djnz la06fh		;a074	10 f9 	. . 
	xor a			;a076	af 	. 
	jr la07bh		;a077	18 02 	. . 
	ld a,0ffh		;a079	3e ff 	> . 
la07bh:
	ret			;a07b	c9 	. 
sub_a07ch:
	push hl			;a07c	e5 	. 
	push bc			;a07d	c5 	. 
	ld c,a			;a07e	4f 	O 
	ld a,(l2fedh)		;a07f	3a ed 2f 	: . / 
	or a			;a082	b7 	. 
	jp z,la0d9h		;a083	ca d9 a0 	. . . 
	ld a,c			;a086	79 	y 
	cp 07fh		;a087	fe 7f 	.  
	jr c,la091h		;a089	38 06 	8 . 
	call sub_a202h		;a08b	cd 02 a2 	. . . 
	jp la0e5h		;a08e	c3 e5 a0 	. . . 
la091h:
	ld hl,la2feh		;a091	21 fe a2 	! . . 
	cp (hl)			;a094	be 	. 
	jr nz,la0abh		;a095	20 14 	  . 
	ld hl,la2fbh		;a097	21 fb a2 	! . . 
	ld a,(hl)			;a09a	7e 	~ 
	xor 008h		;a09b	ee 08 	. . 
	ld (hl),a			;a09d	77 	w 
	and 008h		;a09e	e6 08 	. . 
	ld a,046h		;a0a0	3e 46 	> F 
	jr z,la0a5h		;a0a2	28 01 	( . 
	inc a			;a0a4	3c 	< 
la0a5h:
	call sub_a239h		;a0a5	cd 39 a2 	. 9 . 
	jp la0e5h		;a0a8	c3 e5 a0 	. . . 
la0abh:
	call sub_a1a5h		;a0ab	cd a5 a1 	. . . 
	cp 0ffh		;a0ae	fe ff 	. . 
	jp z,la0e5h		;a0b0	ca e5 a0 	. . . 
	call sub_a143h		;a0b3	cd 43 a1 	. C . 
	cp 0ffh		;a0b6	fe ff 	. . 
	jp z,la0e5h		;a0b8	ca e5 a0 	. . . 
	call sub_a1ddh		;a0bb	cd dd a1 	. . . 
	call sub_a0f5h		;a0be	cd f5 a0 	. . . 
	ld b,000h		;a0c1	06 00 	. . 
	add hl,bc			;a0c3	09 	. 
	ld a,(hl)			;a0c4	7e 	~ 
	or a			;a0c5	b7 	. 
	jr z,la0ebh		;a0c6	28 23 	( # 
	cp 018h		;a0c8	fe 18 	. . 
	jr nz,la0d1h		;a0ca	20 05 	  . 
	push af			;a0cc	f5 	. 
	call sub_a028h		;a0cd	cd 28 a0 	. ( . 
	pop af			;a0d0	f1 	. 
la0d1h:
	call sub_a134h		;a0d1	cd 34 a1 	. 4 . 
	call sub_a03bh		;a0d4	cd 3b a0 	. ; . 
	jr la0ebh		;a0d7	18 12 	. . 
la0d9h:
	ld a,0ffh		;a0d9	3e ff 	> . 
	ld (l2fedh),a		;a0db	32 ed 2f 	2 . / 
	ld (l2fefh),a		;a0de	32 ef 2f 	2 . / 
	ld a,00dh		;a0e1	3e 0d 	> . 
	out (039h),a		;a0e3	d3 39 	. 9 
la0e5h:
	ld a,0a0h		;a0e5	3e a0 	> . 
	call sub_a239h		;a0e7	cd 39 a2 	. 9 . 
	xor a			;a0ea	af 	. 
la0ebh:
	push af			;a0eb	f5 	. 
	ld a,014h		;a0ec	3e 14 	> . 
	ld (l2fech),a		;a0ee	32 ec 2f 	2 . / 
	pop af			;a0f1	f1 	. 
	pop bc			;a0f2	c1 	. 
	pop hl			;a0f3	e1 	. 
	ret			;a0f4	c9 	. 
sub_a0f5h:
	ld hl,la2fbh		;a0f5	21 fb a2 	! . . 
	ld a,(sys_page_shift_lock)		;a0f8	3a 71 2c 	: q , 
	or a			;a0fb	b7 	. 
	ld a,(hl)			;a0fc	7e 	~ 
	jr z,la11ah		;a0fd	28 1b 	( . 
	bit 3,a		;a0ff	cb 5f 	. _ 
	jr z,la11ah		;a101	28 17 	( . 
	bit 2,a		;a103	cb 57 	. W 
	jr nz,la11ah		;a105	20 13 	  . 
	push af			;a107	f5 	. 
	ld a,c			;a108	79 	y 
	ld hl,la129h		;a109	21 29 a1 	! ) . 
	ld bc,0000bh		;a10c	01 0b 00 	. . . 
	cpir		;a10f	ed b1 	. . 
	ld c,a			;a111	4f 	O 
	jr z,la119h		;a112	28 05 	( . 
	pop af			;a114	f1 	. 
	or 001h		;a115	f6 01 	. . 
	jr la11ah		;a117	18 01 	. . 
la119h:
	pop af			;a119	f1 	. 
la11ah:
	and 007h		;a11a	e6 07 	. . 
	add a,a			;a11c	87 	. 
	ld e,a			;a11d	5f 	_ 
	ld d,000h		;a11e	16 00 	. . 
	ld hl,la2d9h		;a120	21 d9 a2 	! . . 
	add hl,de			;a123	19 	. 
	ld a,(hl)			;a124	7e 	~ 
	inc hl			;a125	23 	# 
	ld h,(hl)			;a126	66 	f 
	ld l,a			;a127	6f 	o 
	ret			;a128	c9 	. 
la129h:
	defb 03ch		;a129	3c 	< 
	defb 03dh		;a12a	3d 	= 
	defb 03eh		;a12b	3e 	> 
	defb 03fh		;a12c	3f 	? 
	defb 05eh		;a12d	5e 	^ 
	defb 05fh		;a12e	5f 	_ 
	defb 06eh		;a12f	6e 	n 
	defb 06fh		;a130	6f 	o 
	defb 041h		;a131	41 	A 
	defb 074h		;a132	74 	t 
	defb 078h		;a133	78 	x 
sub_a134h:
	ld hl,la2fbh		;a134	21 fb a2 	! . . 
	bit 3,(hl)		;a137	cb 5e 	. ^ 
	ret z			;a139	c8 	. 
	cp 061h		;a13a	fe 61 	. a 
	ret c			;a13c	d8 	. 
	cp 07bh		;a13d	fe 7b 	. { 
	ret nc			;a13f	d0 	. 
	xor 020h		;a140	ee 20 	.   
	ret			;a142	c9 	. 
sub_a143h:
	ld hl,l2506h		;a143	21 06 25 	! . % 
	ld a,(hl)			;a146	7e 	~ 
	inc hl			;a147	23 	# 
	ld h,(hl)			;a148	66 	f 
	ld l,a			;a149	6f 	o 
	ld de,00004h		;a14a	11 04 00 	. . . 
	ld a,023h		;a14d	3e 23 	> # 
	ld b,a			;a14f	47 	G 
la150h:
	ld a,c			;a150	79 	y 
	cp (hl)			;a151	be 	. 
	jr z,la159h		;a152	28 05 	( . 
la154h:
	add hl,de			;a154	19 	. 
	djnz la150h		;a155	10 f9 	. . 
	xor a			;a157	af 	. 
	ret			;a158	c9 	. 
la159h:
	push hl			;a159	e5 	. 
	ld de,la2fbh		;a15a	11 fb a2 	. . . 
	ld a,(de)			;a15d	1a 	. 
	and 007h		;a15e	e6 07 	. . 
	ld d,a			;a160	57 	W 
	inc hl			;a161	23 	# 
	ld a,(hl)			;a162	7e 	~ 
	and 007h		;a163	e6 07 	. . 
	cp d			;a165	ba 	. 
	jr z,la16eh		;a166	28 06 	( . 
la168h:
	pop hl			;a168	e1 	. 
	ld de,00004h		;a169	11 04 00 	. . . 
	jr la154h		;a16c	18 e6 	. . 
la16eh:
	inc hl			;a16e	23 	# 
	ld e,(hl)			;a16f	5e 	^ 
	inc hl			;a170	23 	# 
	ld d,(hl)			;a171	56 	V 
	ld hl,l2508h		;a172	21 08 25 	! . % 
	ld a,(hl)			;a175	7e 	~ 
	inc hl			;a176	23 	# 
	ld h,(hl)			;a177	66 	f 
	ld l,a			;a178	6f 	o 
	add hl,de			;a179	19 	. 
	ld a,(hl)			;a17a	7e 	~ 
	bit 7,a		;a17b	cb 7f 	.  
	jr z,la168h		;a17d	28 e9 	( . 
	pop de			;a17f	d1 	. 
	bit 5,a		;a180	cb 6f 	. o 
	jr z,la185h		;a182	28 01 	( . 
	inc a			;a184	3c 	< 
la185h:
	and 01fh		;a185	e6 1f 	. . 
	ld b,a			;a187	47 	G 
	ld a,(0f582h)		;a188	3a 82 f5 	: . . 
	add a,b			;a18b	80 	. 
	cp 080h		;a18c	fe 80 	. . 
	jr nc,la1a2h		;a18e	30 12 	0 . 
	ld a,(hl)			;a190	7e 	~ 
	push af			;a191	f5 	. 
	and 01fh		;a192	e6 1f 	. . 
	inc hl			;a194	23 	# 
	call sub_a066h		;a195	cd 66 a0 	. f . 
	pop af			;a198	f1 	. 
	bit 5,a		;a199	cb 6f 	. o 
	jr z,la1a2h		;a19b	28 05 	( . 
	ld a,00dh		;a19d	3e 0d 	> . 
	call sub_a03bh		;a19f	cd 3b a0 	. ; . 
la1a2h:
	ld a,0ffh		;a1a2	3e ff 	> . 
	ret			;a1a4	c9 	. 
sub_a1a5h:
	ld hl,la244h		;a1a5	21 44 a2 	! D . 
	ld de,00004h		;a1a8	11 04 00 	. . . 
	ld a,008h		;a1ab	3e 08 	> . 
	ld b,a			;a1ad	47 	G 
la1aeh:
	ld a,c			;a1ae	79 	y 
	cp (hl)			;a1af	be 	. 
	jr z,la1b7h		;a1b0	28 05 	( . 
la1b2h:
	add hl,de			;a1b2	19 	. 
	djnz la1aeh		;a1b3	10 f9 	. . 
la1b5h:
	xor a			;a1b5	af 	. 
	ret			;a1b6	c9 	. 
la1b7h:
	ld de,la2fbh		;a1b7	11 fb a2 	. . . 
	ld a,(de)			;a1ba	1a 	. 
	and 007h		;a1bb	e6 07 	. . 
	ld d,a			;a1bd	57 	W 
	inc hl			;a1be	23 	# 
	ld a,(hl)			;a1bf	7e 	~ 
	and 007h		;a1c0	e6 07 	. . 
	cp d			;a1c2	ba 	. 
	jr z,la1cbh		;a1c3	28 06 	( . 
	dec hl			;a1c5	2b 	+ 
	ld de,00004h		;a1c6	11 04 00 	. . . 
	jr la1b2h		;a1c9	18 e7 	. . 
la1cbh:
	ld a,(hl)			;a1cb	7e 	~ 
	bit 7,a		;a1cc	cb 7f 	.  
	jr nz,la1b5h		;a1ce	20 e5 	  . 
	inc hl			;a1d0	23 	# 
	ld a,(hl)			;a1d1	7e 	~ 
	inc hl			;a1d2	23 	# 
	ld h,(hl)			;a1d3	66 	f 
	ld l,a			;a1d4	6f 	o 
	ld de,la1dah		;a1d5	11 da a1 	. . . 
	push de			;a1d8	d5 	. 
	jp (hl)			;a1d9	e9 	. 
la1dah:
	ld a,0ffh		;a1da	3e ff 	> . 
	ret			;a1dc	c9 	. 
sub_a1ddh:
	ld a,(sys_page_typamatic)		;a1dd	3a 67 2c 	: g , 
	or a			;a1e0	b7 	. 
	ld a,0a0h		;a1e1	3e a0 	> . 
	jr z,la1e7h		;a1e3	28 02 	( . 
	ld a,0a1h		;a1e5	3e a1 	> . 
la1e7h:
	call sub_a239h		;a1e7	cd 39 a2 	. 9 . 
	ret			;a1ea	c9 	. 
	ld a,0c0h		;a1eb	3e c0 	> . 
	jp sub_a239h		;a1ed	c3 39 a2 	. 9 . 
	ld a,0c1h		;a1f0	3e c1 	> . 
	jp sub_a239h		;a1f2	c3 39 a2 	. 9 . 
	in a,(030h)		;a1f5	db 30 	. 0 
	and 0f0h		;a1f7	e6 f0 	. . 
	push af			;a1f9	f5 	. 
	set 0,a		;a1fa	cb c7 	. . 
	out (018h),a		;a1fc	d3 18 	. . 
	pop af			;a1fe	f1 	. 
	out (018h),a		;a1ff	d3 18 	. . 
	ret			;a201	c9 	. 
sub_a202h:
	ld hl,la2fbh		;a202	21 fb a2 	! . . 
	sub 084h		;a205	d6 84 	. . 
	jr z,la22ah		;a207	28 21 	( ! 
	dec a			;a209	3d 	= 
	jr z,la227h		;a20a	28 1b 	( . 
	dec a			;a20c	3d 	= 
	jr z,la22ah		;a20d	28 1b 	( . 
	dec a			;a20f	3d 	= 
	jr z,la227h		;a210	28 15 	( . 
	sub 003h		;a212	d6 03 	. . 
	jr z,la230h		;a214	28 1a 	( . 
	dec a			;a216	3d 	= 
	jr z,la22dh		;a217	28 14 	( . 
	dec a			;a219	3d 	= 
	jr z,la236h		;a21a	28 1a 	( . 
	dec a			;a21c	3d 	= 
	jr z,la233h		;a21d	28 14 	( . 
	dec a			;a21f	3d 	= 
	jr z,la230h		;a220	28 0e 	( . 
	dec a			;a222	3d 	= 
	jr z,la22dh		;a223	28 08 	( . 
	xor a			;a225	af 	. 
	ret			;a226	c9 	. 
la227h:
	set 0,(hl)		;a227	cb c6 	. . 
	ret			;a229	c9 	. 
la22ah:
	res 0,(hl)		;a22a	cb 86 	. . 
	ret			;a22c	c9 	. 
la22dh:
	set 1,(hl)		;a22d	cb ce 	. . 
	ret			;a22f	c9 	. 
la230h:
	res 1,(hl)		;a230	cb 8e 	. . 
	ret			;a232	c9 	. 
la233h:
	set 2,(hl)		;a233	cb d6 	. . 
	ret			;a235	c9 	. 
la236h:
	res 2,(hl)		;a236	cb 96 	. . 
	ret			;a238	c9 	. 
sub_a239h:
	push af			;a239	f5 	. 
la23ah:
	in a,(012h)		;a23a	db 12 	. . 
	and 004h		;a23c	e6 04 	. . 
	jr z,la23ah		;a23e	28 fa 	( . 
	pop af			;a240	f1 	. 
	out (010h),a		;a241	d3 10 	. . 
	ret			;a243	c9 	. 
la244h:
	ld c,000h		;a244	0e 00 	. . 
	ld h,h			;a246	64 	d 
	and d			;a247	a2 	. 
	rrca			;a248	0f 	. 
	nop			;a249	00 	. 
	ld l,e			;a24a	6b 	k 
	and d			;a24b	a2 	. 
	rra			;a24c	1f 	. 
	add a,b			;a24d	80 	. 
	ld (hl),h			;a24e	74 	t 
	and d			;a24f	a2 	. 
	ld e,000h		;a250	1e 00 	. . 
	ld (hl),l			;a252	75 	u 
	and d			;a253	a2 	. 
	ld (hl),e			;a254	73 	s 
	ld (bc),a			;a255	02 	. 
	add a,e			;a256	83 	. 
	and d			;a257	a2 	. 
	ld (hl),e			;a258	73 	s 
	ld b,08ch		;a259	06 8c 	. . 
	and d			;a25b	a2 	. 
	ld (hl),d			;a25c	72 	r 
	add a,d			;a25d	82 	. 
	or d			;a25e	b2 	. 
	and d			;a25f	a2 	. 
	dec b			;a260	05 	. 
	ld (bc),a			;a261	02 	. 
	adc a,0a2h		;a262	ce a2 	. . 
	ld a,(l508dh)		;a264	3a 8d 50 	: . P 
	xor 001h		;a267	ee 01 	. . 
	jr la27ch		;a269	18 11 	. . 
	ld a,(l508dh)		;a26b	3a 8d 50 	: . P 
	xor 002h		;a26e	ee 02 	. . 
	and 003h		;a270	e6 03 	. . 
	jr la27ch		;a272	18 08 	. . 
	ret			;a274	c9 	. 
	ld a,(l508dh)		;a275	3a 8d 50 	: . P 
	xor 004h		;a278	ee 04 	. . 
	and 005h		;a27a	e6 05 	. . 
la27ch:
	ld (l508dh),a		;a27c	32 8d 50 	2 . P 
	call sub_43dah		;a27f	cd da 43 	. . C 
	ret			;a282	c9 	. 
	ld a,(0f3d3h)		;a283	3a d3 f3 	: . . 
	xor 002h		;a286	ee 02 	. . 
	ld (0f3d3h),a		;a288	32 d3 f3 	2 . . 
	ret			;a28b	c9 	. 
	ld a,0e0h		;a28c	3e e0 	> . 
	call sub_a239h		;a28e	cd 39 a2 	. 9 . 
	xor a			;a291	af 	. 
	call sub_a239h		;a292	cd 39 a2 	. 9 . 
	call sub_a239h		;a295	cd 39 a2 	. 9 . 
	xor a			;a298	af 	. 
	out (020h),a		;a299	d3 20 	.   
	out (04dh),a		;a29b	d3 4d 	. M 
	ld hl,la2abh		;a29d	21 ab a2 	! . . 
	ld de,0ff00h		;a2a0	11 00 ff 	. . . 
	ld bc,00010h		;a2a3	01 10 00 	. . . 
	ldir		;a2a6	ed b0 	. . 
	jp p,0ff00h		;a2a8	f2 00 ff 	. . . 
la2abh:
	xor a			;a2ab	af 	. 
	out (01ch),a		;a2ac	d3 1c 	. . 
	nop			;a2ae	00 	. 
	jp p,00000h		;a2af	f2 00 00 	. . . 
	ret			;a2b2	c9 	. 
	ld hl,la2bah		;a2b3	21 ba a2 	! . . 
	call print_string		;a2b6	cd 66 33 	. f 3 
	ret			;a2b9	c9 	. 
la2bah:
	defb 01ah		;a2ba	1a 	. 
	defb 053h		;a2bb	53 	S 
	defb 059h		;a2bc	59 	Y 
	defb 053h		;a2bd	53 	S 
	defb 054h		;a2be	54 	T 
	defb 045h		;a2bf	45 	E 
	defb 04dh		;a2c0	4d 	M 
	defb 020h		;a2c1	20 	  
	defb 053h		;a2c2	53 	S 
	defb 054h		;a2c3	54 	T 
	defb 041h		;a2c4	41 	A 
	defb 054h		;a2c5	54 	T 
	defb 055h		;a2c6	55 	U 
	defb 053h		;a2c7	53 	S 
	defb 020h		;a2c8	20 	  
	defb 02ah		;a2c9	2a 	* 
	defb 02ah		;a2ca	2a 	* 
	defb 00dh		;a2cb	0d 	. 
	defb 00ah		;a2cc	0a 	. 
	defb 000h		;a2cd	00 	. 
	ld a,(0f3d4h)		;a2ce	3a d4 f3 	: . . 
	or a			;a2d1	b7 	. 
	ret nz			;a2d2	c0 	. 
	ld hl,0f3d3h		;a2d3	21 d3 f3 	! . . 
	set 0,(hl)		;a2d6	cb c6 	. . 
	ret			;a2d8	c9 	. 
la2d9h:
	ld a,a			;a2d9	7f 	 
	and e			;a2da	a3 	. 
	rst 38h			;a2db	ff 	. 
	and e			;a2dc	a3 	. 
	ld a,a			;a2dd	7f 	 
	and h			;a2de	a4 	. 
	rst 38h			;a2df	ff 	. 
	and h			;a2e0	a4 	. 
	ld a,a			;a2e1	7f 	 
	and l			;a2e2	a5 	. 
	rst 38h			;a2e3	ff 	. 
	and l			;a2e4	a5 	. 
	ld a,a			;a2e5	7f 	 
	and l			;a2e6	a5 	. 
	rst 38h			;a2e7	ff 	. 
	and l			;a2e8	a5 	. 
sub_a2e9h:
	and 007h		;a2e9	e6 07 	. . 
	sla a		;a2eb	cb 27 	. ' 
	or 041h		;a2ed	f6 41 	. A 
	out (010h),a		;a2ef	d3 10 	. . 
	ret			;a2f1	c9 	. 
sub_a2f2h:
	and 007h		;a2f2	e6 07 	. . 
	sla a		;a2f4	cb 27 	. ' 
	or 040h		;a2f6	f6 40 	. @ 
	out (010h),a		;a2f8	d3 10 	. . 
	ret			;a2fa	c9 	. 
la2fbh:
	defb 000h		;a2fb	00 	. 
la2fch:
	defb 000h		;a2fc	00 	. 
la2fdh:
	defb 000h		;a2fd	00 	. 
la2feh:
	defb 042h		;a2fe	42 	B 
la2ffh:
	defb 000h		;a2ff	00 	. 
	defb 000h		;a300	00 	. 
	defb 000h		;a301	00 	. 
	defb 000h		;a302	00 	. 
	defb 000h		;a303	00 	. 
	defb 000h		;a304	00 	. 
	defb 000h		;a305	00 	. 
	defb 000h		;a306	00 	. 
	defb 000h		;a307	00 	. 
	defb 000h		;a308	00 	. 
	defb 000h		;a309	00 	. 
	defb 000h		;a30a	00 	. 
	defb 000h		;a30b	00 	. 
	defb 000h		;a30c	00 	. 
	defb 000h		;a30d	00 	. 
	defb 000h		;a30e	00 	. 
	defb 000h		;a30f	00 	. 
	defb 000h		;a310	00 	. 
	defb 000h		;a311	00 	. 
	defb 000h		;a312	00 	. 
	defb 000h		;a313	00 	. 
	defb 000h		;a314	00 	. 
	defb 000h		;a315	00 	. 
	defb 000h		;a316	00 	. 
	defb 000h		;a317	00 	. 
	defb 000h		;a318	00 	. 
	defb 000h		;a319	00 	. 
	defb 000h		;a31a	00 	. 
	defb 000h		;a31b	00 	. 
	defb 000h		;a31c	00 	. 
	defb 000h		;a31d	00 	. 
	defb 000h		;a31e	00 	. 
	defb 000h		;a31f	00 	. 
	defb 000h		;a320	00 	. 
	defb 000h		;a321	00 	. 
	defb 000h		;a322	00 	. 
	defb 000h		;a323	00 	. 
	defb 000h		;a324	00 	. 
	defb 000h		;a325	00 	. 
	defb 000h		;a326	00 	. 
	defb 000h		;a327	00 	. 
	defb 000h		;a328	00 	. 
	defb 000h		;a329	00 	. 
	defb 000h		;a32a	00 	. 
	defb 000h		;a32b	00 	. 
	defb 000h		;a32c	00 	. 
	defb 000h		;a32d	00 	. 
	defb 000h		;a32e	00 	. 
	defb 000h		;a32f	00 	. 
	defb 000h		;a330	00 	. 
	defb 000h		;a331	00 	. 
	defb 000h		;a332	00 	. 
	defb 000h		;a333	00 	. 
	defb 000h		;a334	00 	. 
	defb 000h		;a335	00 	. 
	defb 000h		;a336	00 	. 
	defb 000h		;a337	00 	. 
	defb 000h		;a338	00 	. 
	defb 000h		;a339	00 	. 
	defb 000h		;a33a	00 	. 
	defb 000h		;a33b	00 	. 
	defb 000h		;a33c	00 	. 
	defb 000h		;a33d	00 	. 
	defb 000h		;a33e	00 	. 
	defb 000h		;a33f	00 	. 
	defb 000h		;a340	00 	. 
	defb 000h		;a341	00 	. 
	defb 000h		;a342	00 	. 
	defb 000h		;a343	00 	. 
	defb 000h		;a344	00 	. 
	defb 000h		;a345	00 	. 
	defb 000h		;a346	00 	. 
	defb 000h		;a347	00 	. 
	defb 000h		;a348	00 	. 
	defb 000h		;a349	00 	. 
	defb 000h		;a34a	00 	. 
	defb 000h		;a34b	00 	. 
	defb 000h		;a34c	00 	. 
	defb 000h		;a34d	00 	. 
	defb 000h		;a34e	00 	. 
	defb 000h		;a34f	00 	. 
	defb 000h		;a350	00 	. 
	defb 000h		;a351	00 	. 
	defb 000h		;a352	00 	. 
	defb 000h		;a353	00 	. 
	defb 000h		;a354	00 	. 
	defb 000h		;a355	00 	. 
	defb 000h		;a356	00 	. 
	defb 000h		;a357	00 	. 
	defb 000h		;a358	00 	. 
	defb 000h		;a359	00 	. 
	defb 000h		;a35a	00 	. 
	defb 000h		;a35b	00 	. 
	defb 000h		;a35c	00 	. 
	defb 000h		;a35d	00 	. 
	defb 000h		;a35e	00 	. 
	defb 000h		;a35f	00 	. 
	defb 000h		;a360	00 	. 
	defb 000h		;a361	00 	. 
	defb 000h		;a362	00 	. 
	defb 000h		;a363	00 	. 
	defb 000h		;a364	00 	. 
	defb 000h		;a365	00 	. 
	defb 000h		;a366	00 	. 
	defb 000h		;a367	00 	. 
	defb 000h		;a368	00 	. 
	defb 000h		;a369	00 	. 
	defb 000h		;a36a	00 	. 
	defb 000h		;a36b	00 	. 
	defb 000h		;a36c	00 	. 
	defb 000h		;a36d	00 	. 
	defb 000h		;a36e	00 	. 
	defb 000h		;a36f	00 	. 
	defb 000h		;a370	00 	. 
	defb 000h		;a371	00 	. 
	defb 000h		;a372	00 	. 
	defb 000h		;a373	00 	. 
	defb 000h		;a374	00 	. 
	defb 000h		;a375	00 	. 
	defb 000h		;a376	00 	. 
	defb 000h		;a377	00 	. 
	defb 000h		;a378	00 	. 
	defb 000h		;a379	00 	. 
	defb 000h		;a37a	00 	. 
	defb 000h		;a37b	00 	. 
	defb 000h		;a37c	00 	. 
	defb 000h		;a37d	00 	. 
	defb 000h		;a37e	00 	. 
la37fh:
	defb 000h		;a37f	00 	. 
	defb 000h		;a380	00 	. 
	defb 000h		;a381	00 	. 
	defb 000h		;a382	00 	. 
	defb 000h		;a383	00 	. 
	defb 000h		;a384	00 	. 
	defb 000h		;a385	00 	. 
	defb 000h		;a386	00 	. 
	defb 000h		;a387	00 	. 
	defb 000h		;a388	00 	. 
	defb 000h		;a389	00 	. 
	defb 000h		;a38a	00 	. 
	defb 000h		;a38b	00 	. 
	defb 000h		;a38c	00 	. 
	defb 000h		;a38d	00 	. 
	defb 000h		;a38e	00 	. 
	defb 000h		;a38f	00 	. 
	defb 000h		;a390	00 	. 
	defb 000h		;a391	00 	. 
	defb 000h		;a392	00 	. 
	defb 000h		;a393	00 	. 
	defb 00dh		;a394	0d 	. 
	defb 02eh		;a395	2e 	. 
	defb 030h		;a396	30 	0 
	defb 03dh		;a397	3d 	= 
	defb 036h		;a398	36 	6 
	defb 035h		;a399	35 	5 
	defb 034h		;a39a	34 	4 
	defb 02dh		;a39b	2d 	- 
	defb 000h		;a39c	00 	. 
	defb 000h		;a39d	00 	. 
	defb 000h		;a39e	00 	. 
	defb 000h		;a39f	00 	. 
	defb 000h		;a3a0	00 	. 
	defb 000h		;a3a1	00 	. 
	defb 000h		;a3a2	00 	. 
	defb 000h		;a3a3	00 	. 
	defb 033h		;a3a4	33 	3 
	defb 032h		;a3a5	32 	2 
	defb 031h		;a3a6	31 	1 
	defb 02bh		;a3a7	2b 	+ 
	defb 039h		;a3a8	39 	9 
	defb 038h		;a3a9	38 	8 
	defb 037h		;a3aa	37 	7 
	defb 02dh		;a3ab	2d 	- 
	defb 02ah		;a3ac	2a 	* 
	defb 02fh		;a3ad	2f 	/ 
	defb 000h		;a3ae	00 	. 
	defb 000h		;a3af	00 	. 
	defb 000h		;a3b0	00 	. 
	defb 020h		;a3b1	20 	  
	defb 07ah		;a3b2	7a 	z 
	defb 078h		;a3b3	78 	x 
	defb 063h		;a3b4	63 	c 
	defb 076h		;a3b5	76 	v 
	defb 062h		;a3b6	62 	b 
	defb 06eh		;a3b7	6e 	n 
	defb 06dh		;a3b8	6d 	m 
	defb 02ch		;a3b9	2c 	, 
	defb 02eh		;a3ba	2e 	. 
	defb 00bh		;a3bb	0b 	. 
	defb 008h		;a3bc	08 	. 
	defb 00ch		;a3bd	0c 	. 
	defb 00ah		;a3be	0a 	. 
	defb 000h		;a3bf	00 	. 
	defb 000h		;a3c0	00 	. 
	defb 000h		;a3c1	00 	. 
	defb 061h		;a3c2	61 	a 
	defb 073h		;a3c3	73 	s 
	defb 064h		;a3c4	64 	d 
	defb 066h		;a3c5	66 	f 
	defb 067h		;a3c6	67 	g 
	defb 068h		;a3c7	68 	h 
	defb 06ah		;a3c8	6a 	j 
	defb 06bh		;a3c9	6b 	k 
	defb 06ch		;a3ca	6c 	l 
	defb 03bh		;a3cb	3b 	; 
	defb 027h		;a3cc	27 	' 
	defb 00dh		;a3cd	0d 	. 
	defb 02fh		;a3ce	2f 	/ 
	defb 000h		;a3cf	00 	. 
	defb 071h		;a3d0	71 	q 
	defb 077h		;a3d1	77 	w 
	defb 065h		;a3d2	65 	e 
	defb 072h		;a3d3	72 	r 
	defb 074h		;a3d4	74 	t 
	defb 079h		;a3d5	79 	y 
	defb 075h		;a3d6	75 	u 
	defb 069h		;a3d7	69 	i 
	defb 06fh		;a3d8	6f 	o 
	defb 070h		;a3d9	70 	p 
	defb 0beh		;a3da	be 	. 
	defb 03ch		;a3db	3c 	< 
	defb 03eh		;a3dc	3e 	> 
	defb 000h		;a3dd	00 	. 
	defb 01eh		;a3de	1e 	. 
	defb 000h		;a3df	00 	. 
	defb 032h		;a3e0	32 	2 
	defb 033h		;a3e1	33 	3 
	defb 034h		;a3e2	34 	4 
	defb 035h		;a3e3	35 	5 
	defb 036h		;a3e4	36 	6 
	defb 037h		;a3e5	37 	7 
	defb 038h		;a3e6	38 	8 
	defb 039h		;a3e7	39 	9 
	defb 030h		;a3e8	30 	0 
	defb 02dh		;a3e9	2d 	- 
	defb 03dh		;a3ea	3d 	= 
	defb 05ch		;a3eb	5c 	\ 
	defb 008h		;a3ec	08 	. 
	defb 07fh		;a3ed	7f 	 
	defb 00ah		;a3ee	0a 	. 
	defb 000h		;a3ef	00 	. 
	defb 000h		;a3f0	00 	. 
	defb 000h		;a3f1	00 	. 
	defb 000h		;a3f2	00 	. 
	defb 01bh		;a3f3	1b 	. 
	defb 0bbh		;a3f4	bb 	. 
	defb 031h		;a3f5	31 	1 
	defb 009h		;a3f6	09 	. 
	defb 000h		;a3f7	00 	. 
	defb 000h		;a3f8	00 	. 
	defb 000h		;a3f9	00 	. 
	defb 000h		;a3fa	00 	. 
	defb 000h		;a3fb	00 	. 
	defb 000h		;a3fc	00 	. 
	defb 000h		;a3fd	00 	. 
	defb 000h		;a3fe	00 	. 
	defb 000h		;a3ff	00 	. 
	defb 000h		;a400	00 	. 
	defb 000h		;a401	00 	. 
	defb 000h		;a402	00 	. 
	defb 000h		;a403	00 	. 
	defb 000h		;a404	00 	. 
	defb 000h		;a405	00 	. 
	defb 000h		;a406	00 	. 
	defb 000h		;a407	00 	. 
	defb 000h		;a408	00 	. 
	defb 000h		;a409	00 	. 
	defb 000h		;a40a	00 	. 
	defb 000h		;a40b	00 	. 
	defb 000h		;a40c	00 	. 
	defb 000h		;a40d	00 	. 
	defb 000h		;a40e	00 	. 
	defb 000h		;a40f	00 	. 
	defb 000h		;a410	00 	. 
	defb 000h		;a411	00 	. 
	defb 000h		;a412	00 	. 
	defb 000h		;a413	00 	. 
	defb 00dh		;a414	0d 	. 
	defb 02eh		;a415	2e 	. 
	defb 030h		;a416	30 	0 
	defb 03dh		;a417	3d 	= 
	defb 036h		;a418	36 	6 
	defb 035h		;a419	35 	5 
	defb 034h		;a41a	34 	4 
	defb 02dh		;a41b	2d 	- 
	defb 000h		;a41c	00 	. 
	defb 000h		;a41d	00 	. 
	defb 000h		;a41e	00 	. 
	defb 000h		;a41f	00 	. 
	defb 000h		;a420	00 	. 
	defb 000h		;a421	00 	. 
	defb 000h		;a422	00 	. 
	defb 000h		;a423	00 	. 
	defb 033h		;a424	33 	3 
	defb 032h		;a425	32 	2 
	defb 031h		;a426	31 	1 
	defb 02bh		;a427	2b 	+ 
	defb 039h		;a428	39 	9 
	defb 038h		;a429	38 	8 
	defb 037h		;a42a	37 	7 
	defb 02dh		;a42b	2d 	- 
	defb 02ah		;a42c	2a 	* 
	defb 02fh		;a42d	2f 	/ 
	defb 000h		;a42e	00 	. 
	defb 000h		;a42f	00 	. 
	defb 000h		;a430	00 	. 
	defb 020h		;a431	20 	  
	defb 05ah		;a432	5a 	Z 
	defb 058h		;a433	58 	X 
	defb 043h		;a434	43 	C 
	defb 056h		;a435	56 	V 
	defb 042h		;a436	42 	B 
	defb 04eh		;a437	4e 	N 
	defb 04dh		;a438	4d 	M 
	defb 02ch		;a439	2c 	, 
	defb 02eh		;a43a	2e 	. 
	defb 012h		;a43b	12 	. 
	defb 001h		;a43c	01 	. 
	defb 006h		;a43d	06 	. 
	defb 003h		;a43e	03 	. 
	defb 000h		;a43f	00 	. 
	defb 000h		;a440	00 	. 
	defb 000h		;a441	00 	. 
	defb 041h		;a442	41 	A 
	defb 053h		;a443	53 	S 
	defb 044h		;a444	44 	D 
	defb 046h		;a445	46 	F 
	defb 047h		;a446	47 	G 
	defb 048h		;a447	48 	H 
	defb 04ah		;a448	4a 	J 
	defb 04bh		;a449	4b 	K 
	defb 04ch		;a44a	4c 	L 
	defb 03ah		;a44b	3a 	: 
	defb 022h		;a44c	22 	" 
	defb 00dh		;a44d	0d 	. 
	defb 03fh		;a44e	3f 	? 
	defb 000h		;a44f	00 	. 
	defb 051h		;a450	51 	Q 
	defb 057h		;a451	57 	W 
	defb 045h		;a452	45 	E 
	defb 052h		;a453	52 	R 
	defb 054h		;a454	54 	T 
	defb 059h		;a455	59 	Y 
	defb 055h		;a456	55 	U 
	defb 049h		;a457	49 	I 
	defb 04fh		;a458	4f 	O 
	defb 050h		;a459	50 	P 
	defb 0bfh		;a45a	bf 	. 
	defb 05bh		;a45b	5b 	[ 
	defb 05dh		;a45c	5d 	] 
	defb 000h		;a45d	00 	. 
	defb 01eh		;a45e	1e 	. 
	defb 000h		;a45f	00 	. 
	defb 040h		;a460	40 	@ 
	defb 023h		;a461	23 	# 
	defb 024h		;a462	24 	$ 
	defb 025h		;a463	25 	% 
	defb 0c4h		;a464	c4 	. 
	defb 026h		;a465	26 	& 
	defb 02ah		;a466	2a 	* 
	defb 028h		;a467	28 	( 
	defb 029h		;a468	29 	) 
	defb 05fh		;a469	5f 	_ 
	defb 02bh		;a46a	2b 	+ 
	defb 0bdh		;a46b	bd 	. 
	defb 008h		;a46c	08 	. 
	defb 07fh		;a46d	7f 	 
	defb 00ah		;a46e	0a 	. 
	defb 000h		;a46f	00 	. 
	defb 000h		;a470	00 	. 
	defb 000h		;a471	00 	. 
	defb 000h		;a472	00 	. 
	defb 01bh		;a473	1b 	. 
	defb 05eh		;a474	5e 	^ 
	defb 021h		;a475	21 	! 
	defb 009h		;a476	09 	. 
	defb 000h		;a477	00 	. 
	defb 000h		;a478	00 	. 
	defb 000h		;a479	00 	. 
	defb 000h		;a47a	00 	. 
	defb 000h		;a47b	00 	. 
	defb 000h		;a47c	00 	. 
	defb 000h		;a47d	00 	. 
	defb 000h		;a47e	00 	. 
	defb 000h		;a47f	00 	. 
	defb 000h		;a480	00 	. 
	defb 000h		;a481	00 	. 
	defb 000h		;a482	00 	. 
	defb 000h		;a483	00 	. 
	defb 000h		;a484	00 	. 
	defb 000h		;a485	00 	. 
	defb 000h		;a486	00 	. 
	defb 000h		;a487	00 	. 
	defb 000h		;a488	00 	. 
	defb 000h		;a489	00 	. 
	defb 000h		;a48a	00 	. 
	defb 000h		;a48b	00 	. 
	defb 000h		;a48c	00 	. 
	defb 000h		;a48d	00 	. 
	defb 000h		;a48e	00 	. 
	defb 000h		;a48f	00 	. 
	defb 000h		;a490	00 	. 
	defb 000h		;a491	00 	. 
	defb 000h		;a492	00 	. 
	defb 000h		;a493	00 	. 
	defb 00dh		;a494	0d 	. 
	defb 02eh		;a495	2e 	. 
	defb 030h		;a496	30 	0 
	defb 03dh		;a497	3d 	= 
	defb 036h		;a498	36 	6 
	defb 035h		;a499	35 	5 
	defb 034h		;a49a	34 	4 
	defb 02dh		;a49b	2d 	- 
	defb 000h		;a49c	00 	. 
	defb 000h		;a49d	00 	. 
	defb 000h		;a49e	00 	. 
	defb 000h		;a49f	00 	. 
	defb 000h		;a4a0	00 	. 
	defb 000h		;a4a1	00 	. 
	defb 000h		;a4a2	00 	. 
	defb 000h		;a4a3	00 	. 
sub_a4a4h:
	defb 033h		;a4a4	33 	3 
	defb 032h		;a4a5	32 	2 
	defb 031h		;a4a6	31 	1 
	defb 02bh		;a4a7	2b 	+ 
	defb 039h		;a4a8	39 	9 
	defb 038h		;a4a9	38 	8 
	defb 037h		;a4aa	37 	7 
	defb 02dh		;a4ab	2d 	- 
	defb 02ah		;a4ac	2a 	* 
	defb 02fh		;a4ad	2f 	/ 
	defb 000h		;a4ae	00 	. 
	defb 000h		;a4af	00 	. 
	defb 000h		;a4b0	00 	. 
	defb 020h		;a4b1	20 	  
	defb 01ah		;a4b2	1a 	. 
	defb 018h		;a4b3	18 	. 
	defb 003h		;a4b4	03 	. 
	defb 016h		;a4b5	16 	. 
	defb 002h		;a4b6	02 	. 
	defb 00eh		;a4b7	0e 	. 
	defb 00dh		;a4b8	0d 	. 
	defb 00ch		;a4b9	0c 	. 
	defb 00eh		;a4ba	0e 	. 
	defb 00bh		;a4bb	0b 	. 
	defb 008h		;a4bc	08 	. 
	defb 00ch		;a4bd	0c 	. 
	defb 00ah		;a4be	0a 	. 
	defb 000h		;a4bf	00 	. 
	defb 000h		;a4c0	00 	. 
	defb 000h		;a4c1	00 	. 
	defb 001h		;a4c2	01 	. 
	defb 013h		;a4c3	13 	. 
	defb 004h		;a4c4	04 	. 
	defb 006h		;a4c5	06 	. 
	defb 007h		;a4c6	07 	. 
	defb 008h		;a4c7	08 	. 
	defb 00ah		;a4c8	0a 	. 
	defb 00bh		;a4c9	0b 	. 
	defb 00ch		;a4ca	0c 	. 
	defb 01bh		;a4cb	1b 	. 
	defb 007h		;a4cc	07 	. 
	defb 00dh		;a4cd	0d 	. 
	defb 00fh		;a4ce	0f 	. 
	defb 000h		;a4cf	00 	. 
	defb 011h		;a4d0	11 	. 
	defb 017h		;a4d1	17 	. 
	defb 005h		;a4d2	05 	. 
	defb 012h		;a4d3	12 	. 
	defb 014h		;a4d4	14 	. 
	defb 019h		;a4d5	19 	. 
	defb 015h		;a4d6	15 	. 
	defb 009h		;a4d7	09 	. 
	defb 00fh		;a4d8	0f 	. 
	defb 010h		;a4d9	10 	. 
	defb 000h		;a4da	00 	. 
	defb 01ch		;a4db	1c 	. 
	defb 01eh		;a4dc	1e 	. 
	defb 000h		;a4dd	00 	. 
	defb 01eh		;a4de	1e 	. 
	defb 000h		;a4df	00 	. 
	defb 012h		;a4e0	12 	. 
	defb 013h		;a4e1	13 	. 
	defb 014h		;a4e2	14 	. 
	defb 015h		;a4e3	15 	. 
	defb 016h		;a4e4	16 	. 
	defb 017h		;a4e5	17 	. 
	defb 018h		;a4e6	18 	. 
	defb 019h		;a4e7	19 	. 
	defb 010h		;a4e8	10 	. 
	defb 00dh		;a4e9	0d 	. 
	defb 01dh		;a4ea	1d 	. 
	defb 01ch		;a4eb	1c 	. 
	defb 008h		;a4ec	08 	. 
	defb 07fh		;a4ed	7f 	 
	defb 00ah		;a4ee	0a 	. 
	defb 000h		;a4ef	00 	. 
	defb 000h		;a4f0	00 	. 
	defb 000h		;a4f1	00 	. 
	defb 000h		;a4f2	00 	. 
	defb 01bh		;a4f3	1b 	. 
	defb 000h		;a4f4	00 	. 
	defb 011h		;a4f5	11 	. 
	defb 009h		;a4f6	09 	. 
	defb 000h		;a4f7	00 	. 
	defb 000h		;a4f8	00 	. 
	defb 000h		;a4f9	00 	. 
	defb 000h		;a4fa	00 	. 
	defb 000h		;a4fb	00 	. 
	defb 000h		;a4fc	00 	. 
	defb 000h		;a4fd	00 	. 
	defb 000h		;a4fe	00 	. 
	defb 000h		;a4ff	00 	. 
	defb 000h		;a500	00 	. 
	defb 000h		;a501	00 	. 
	defb 000h		;a502	00 	. 
	defb 000h		;a503	00 	. 
	defb 000h		;a504	00 	. 
	defb 000h		;a505	00 	. 
	defb 000h		;a506	00 	. 
	defb 000h		;a507	00 	. 
	defb 000h		;a508	00 	. 
	defb 000h		;a509	00 	. 
	defb 000h		;a50a	00 	. 
	defb 000h		;a50b	00 	. 
	defb 000h		;a50c	00 	. 
	defb 000h		;a50d	00 	. 
	defb 000h		;a50e	00 	. 
	defb 000h		;a50f	00 	. 
	defb 000h		;a510	00 	. 
	defb 000h		;a511	00 	. 
	defb 000h		;a512	00 	. 
	defb 000h		;a513	00 	. 
	defb 00dh		;a514	0d 	. 
	defb 02eh		;a515	2e 	. 
	defb 030h		;a516	30 	0 
	defb 03dh		;a517	3d 	= 
	defb 036h		;a518	36 	6 
	defb 035h		;a519	35 	5 
	defb 034h		;a51a	34 	4 
	defb 02dh		;a51b	2d 	- 
	defb 000h		;a51c	00 	. 
	defb 000h		;a51d	00 	. 
	defb 000h		;a51e	00 	. 
	defb 000h		;a51f	00 	. 
	defb 000h		;a520	00 	. 
	defb 000h		;a521	00 	. 
	defb 000h		;a522	00 	. 
	defb 000h		;a523	00 	. 
	defb 033h		;a524	33 	3 
	defb 032h		;a525	32 	2 
	defb 031h		;a526	31 	1 
	defb 02bh		;a527	2b 	+ 
	defb 039h		;a528	39 	9 
	defb 038h		;a529	38 	8 
	defb 037h		;a52a	37 	7 
	defb 02dh		;a52b	2d 	- 
	defb 02ah		;a52c	2a 	* 
	defb 02fh		;a52d	2f 	/ 
	defb 000h		;a52e	00 	. 
	defb 000h		;a52f	00 	. 
	defb 000h		;a530	00 	. 
	defb 020h		;a531	20 	  
	defb 01ah		;a532	1a 	. 
	defb 018h		;a533	18 	. 
	defb 003h		;a534	03 	. 
	defb 016h		;a535	16 	. 
	defb 002h		;a536	02 	. 
	defb 00eh		;a537	0e 	. 
	defb 00dh		;a538	0d 	. 
	defb 00ch		;a539	0c 	. 
	defb 00eh		;a53a	0e 	. 
	defb 012h		;a53b	12 	. 
	defb 001h		;a53c	01 	. 
	defb 006h		;a53d	06 	. 
	defb 003h		;a53e	03 	. 
	defb 000h		;a53f	00 	. 
	defb 000h		;a540	00 	. 
	defb 000h		;a541	00 	. 
	defb 001h		;a542	01 	. 
	defb 013h		;a543	13 	. 
	defb 004h		;a544	04 	. 
	defb 006h		;a545	06 	. 
	defb 007h		;a546	07 	. 
	defb 008h		;a547	08 	. 
	defb 00ah		;a548	0a 	. 
	defb 00bh		;a549	0b 	. 
	defb 00ch		;a54a	0c 	. 
	defb 01ah		;a54b	1a 	. 
	defb 002h		;a54c	02 	. 
	defb 00dh		;a54d	0d 	. 
	defb 00fh		;a54e	0f 	. 
	defb 000h		;a54f	00 	. 
	defb 011h		;a550	11 	. 
	defb 017h		;a551	17 	. 
	defb 005h		;a552	05 	. 
	defb 012h		;a553	12 	. 
	defb 014h		;a554	14 	. 
	defb 019h		;a555	19 	. 
	defb 015h		;a556	15 	. 
	defb 009h		;a557	09 	. 
	defb 00fh		;a558	0f 	. 
	defb 010h		;a559	10 	. 
	defb 000h		;a55a	00 	. 
	defb 01bh		;a55b	1b 	. 
	defb 01dh		;a55c	1d 	. 
	defb 000h		;a55d	00 	. 
	defb 01eh		;a55e	1e 	. 
	defb 000h		;a55f	00 	. 
	defb 000h		;a560	00 	. 
	defb 003h		;a561	03 	. 
	defb 004h		;a562	04 	. 
	defb 005h		;a563	05 	. 
	defb 000h		;a564	00 	. 
	defb 006h		;a565	06 	. 
	defb 00ah		;a566	0a 	. 
	defb 008h		;a567	08 	. 
	defb 009h		;a568	09 	. 
	defb 01fh		;a569	1f 	. 
	defb 00bh		;a56a	0b 	. 
	defb 000h		;a56b	00 	. 
	defb 008h		;a56c	08 	. 
	defb 07fh		;a56d	7f 	 
	defb 00ah		;a56e	0a 	. 
	defb 000h		;a56f	00 	. 
	defb 000h		;a570	00 	. 
	defb 000h		;a571	00 	. 
	defb 000h		;a572	00 	. 
	defb 01bh		;a573	1b 	. 
	defb 01eh		;a574	1e 	. 
	defb 001h		;a575	01 	. 
	defb 009h		;a576	09 	. 
	defb 000h		;a577	00 	. 
	defb 000h		;a578	00 	. 
	defb 000h		;a579	00 	. 
	defb 000h		;a57a	00 	. 
	defb 000h		;a57b	00 	. 
	defb 000h		;a57c	00 	. 
	defb 000h		;a57d	00 	. 
	defb 000h		;a57e	00 	. 
	defb 000h		;a57f	00 	. 
	defb 000h		;a580	00 	. 
	defb 000h		;a581	00 	. 
	defb 000h		;a582	00 	. 
	defb 000h		;a583	00 	. 
	defb 000h		;a584	00 	. 
	defb 000h		;a585	00 	. 
	defb 000h		;a586	00 	. 
	defb 000h		;a587	00 	. 
	defb 000h		;a588	00 	. 
	defb 000h		;a589	00 	. 
	defb 000h		;a58a	00 	. 
	defb 000h		;a58b	00 	. 
	defb 000h		;a58c	00 	. 
	defb 000h		;a58d	00 	. 
	defb 000h		;a58e	00 	. 
	defb 000h		;a58f	00 	. 
	defb 000h		;a590	00 	. 
	defb 000h		;a591	00 	. 
	defb 000h		;a592	00 	. 
	defb 000h		;a593	00 	. 
	defb 000h		;a594	00 	. 
	defb 000h		;a595	00 	. 
	defb 000h		;a596	00 	. 
	defb 000h		;a597	00 	. 
	defb 000h		;a598	00 	. 
	defb 000h		;a599	00 	. 
	defb 000h		;a59a	00 	. 
	defb 000h		;a59b	00 	. 
	defb 000h		;a59c	00 	. 
	defb 000h		;a59d	00 	. 
	defb 000h		;a59e	00 	. 
	defb 000h		;a59f	00 	. 
	defb 000h		;a5a0	00 	. 
	defb 000h		;a5a1	00 	. 
	defb 000h		;a5a2	00 	. 
	defb 000h		;a5a3	00 	. 
	defb 000h		;a5a4	00 	. 
	defb 000h		;a5a5	00 	. 
	defb 000h		;a5a6	00 	. 
	defb 000h		;a5a7	00 	. 
	defb 000h		;a5a8	00 	. 
	defb 000h		;a5a9	00 	. 
	defb 000h		;a5aa	00 	. 
	defb 000h		;a5ab	00 	. 
	defb 000h		;a5ac	00 	. 
	defb 000h		;a5ad	00 	. 
	defb 000h		;a5ae	00 	. 
	defb 000h		;a5af	00 	. 
	defb 000h		;a5b0	00 	. 
	defb 020h		;a5b1	20 	  
	defb 0ceh		;a5b2	ce 	. 
	defb 0abh		;a5b3	ab 	. 
	defb 0d0h		;a5b4	d0 	. 
	defb 0d1h		;a5b5	d1 	. 
	defb 0d2h		;a5b6	d2 	. 
	defb 0d3h		;a5b7	d3 	. 
	defb 0e7h		;a5b8	e7 	. 
	defb 0c8h		;a5b9	c8 	. 
	defb 0c9h		;a5ba	c9 	. 
	defb 000h		;a5bb	00 	. 
	defb 000h		;a5bc	00 	. 
	defb 000h		;a5bd	00 	. 
	defb 000h		;a5be	00 	. 
	defb 000h		;a5bf	00 	. 
	defb 000h		;a5c0	00 	. 
	defb 000h		;a5c1	00 	. 
	defb 0cch		;a5c2	cc 	. 
	defb 0b2h		;a5c3	b2 	. 
	defb 0bch		;a5c4	bc 	. 
	defb 0b7h		;a5c5	b7 	. 
	defb 0e3h		;a5c6	e3 	. 
	defb 0f3h		;a5c7	f3 	. 
	defb 0e8h		;a5c8	e8 	. 
	defb 0dfh		;a5c9	df 	. 
	defb 0efh		;a5ca	ef 	. 
	defb 0ffh		;a5cb	ff 	. 
	defb 0d7h		;a5cc	d7 	. 
	defb 000h		;a5cd	00 	. 
	defb 0f7h		;a5ce	f7 	. 
	defb 000h		;a5cf	00 	. 
	defb 0a6h		;a5d0	a6 	. 
	defb 0a7h		;a5d1	a7 	. 
	defb 0b0h		;a5d2	b0 	. 
	defb 0b1h		;a5d3	b1 	. 
	defb 0e2h		;a5d4	e2 	. 
	defb 0f2h		;a5d5	f2 	. 
	defb 0e9h		;a5d6	e9 	. 
	defb 0deh		;a5d7	de 	. 
	defb 0eeh		;a5d8	ee 	. 
	defb 0feh		;a5d9	fe 	. 
	defb 0d7h		;a5da	d7 	. 
	defb 07bh		;a5db	7b 	{ 
	defb 07dh		;a5dc	7d 	} 
	defb 000h		;a5dd	00 	. 
	defb 000h		;a5de	00 	. 
	defb 000h		;a5df	00 	. 
	defb 0a2h		;a5e0	a2 	. 
	defb 0a3h		;a5e1	a3 	. 
	defb 0a4h		;a5e2	a4 	. 
	defb 0a5h		;a5e3	a5 	. 
	defb 0e6h		;a5e4	e6 	. 
	defb 0ddh		;a5e5	dd 	. 
	defb 0edh		;a5e6	ed 	. 
	defb 0fdh		;a5e7	fd 	. 
	defb 0f6h		;a5e8	f6 	. 
	defb 060h		;a5e9	60 	` 
	defb 07ch		;a5ea	7c 	| 
	defb 07eh		;a5eb	7e 	~ 
	defb 000h		;a5ec	00 	. 
	defb 000h		;a5ed	00 	. 
	defb 000h		;a5ee	00 	. 
	defb 000h		;a5ef	00 	. 
	defb 000h		;a5f0	00 	. 
	defb 000h		;a5f1	00 	. 
	defb 000h		;a5f2	00 	. 
	defb 000h		;a5f3	00 	. 
	defb 0a0h		;a5f4	a0 	. 
	defb 0a1h		;a5f5	a1 	. 
	defb 000h		;a5f6	00 	. 
	defb 000h		;a5f7	00 	. 
	defb 000h		;a5f8	00 	. 
	defb 000h		;a5f9	00 	. 
	defb 000h		;a5fa	00 	. 
	defb 000h		;a5fb	00 	. 
	defb 000h		;a5fc	00 	. 
	defb 000h		;a5fd	00 	. 
	defb 000h		;a5fe	00 	. 
	defb 000h		;a5ff	00 	. 
	defb 000h		;a600	00 	. 
	defb 000h		;a601	00 	. 
	defb 000h		;a602	00 	. 
	defb 000h		;a603	00 	. 
	defb 000h		;a604	00 	. 
	defb 000h		;a605	00 	. 
	defb 000h		;a606	00 	. 
	defb 000h		;a607	00 	. 
	defb 000h		;a608	00 	. 
	defb 000h		;a609	00 	. 
	defb 000h		;a60a	00 	. 
	defb 000h		;a60b	00 	. 
	defb 000h		;a60c	00 	. 
	defb 000h		;a60d	00 	. 
	defb 000h		;a60e	00 	. 
	defb 000h		;a60f	00 	. 
	defb 000h		;a610	00 	. 
	defb 000h		;a611	00 	. 
	defb 000h		;a612	00 	. 
	defb 000h		;a613	00 	. 
	defb 000h		;a614	00 	. 
	defb 000h		;a615	00 	. 
	defb 000h		;a616	00 	. 
	defb 000h		;a617	00 	. 
	defb 000h		;a618	00 	. 
	defb 000h		;a619	00 	. 
	defb 000h		;a61a	00 	. 
	defb 000h		;a61b	00 	. 
	defb 000h		;a61c	00 	. 
	defb 000h		;a61d	00 	. 
	defb 000h		;a61e	00 	. 
	defb 000h		;a61f	00 	. 
	defb 000h		;a620	00 	. 
	defb 000h		;a621	00 	. 
	defb 000h		;a622	00 	. 
	defb 000h		;a623	00 	. 
	defb 000h		;a624	00 	. 
	defb 000h		;a625	00 	. 
	defb 000h		;a626	00 	. 
	defb 000h		;a627	00 	. 
	defb 000h		;a628	00 	. 
	defb 000h		;a629	00 	. 
	defb 000h		;a62a	00 	. 
	defb 000h		;a62b	00 	. 
	defb 000h		;a62c	00 	. 
	defb 000h		;a62d	00 	. 
	defb 000h		;a62e	00 	. 
	defb 000h		;a62f	00 	. 
	defb 000h		;a630	00 	. 
	defb 020h		;a631	20 	  
	defb 0cfh		;a632	cf 	. 
	defb 0b5h		;a633	b5 	. 
	defb 0d4h		;a634	d4 	. 
	defb 0d5h		;a635	d5 	. 
	defb 0c5h		;a636	c5 	. 
	defb 0d6h		;a637	d6 	. 
	defb 0e5h		;a638	e5 	. 
	defb 0cah		;a639	ca 	. 
	defb 0cbh		;a63a	cb 	. 
	defb 000h		;a63b	00 	. 
	defb 000h		;a63c	00 	. 
	defb 000h		;a63d	00 	. 
	defb 000h		;a63e	00 	. 
	defb 000h		;a63f	00 	. 
	defb 000h		;a640	00 	. 
	defb 000h		;a641	00 	. 
	defb 0cdh		;a642	cd 	. 
	defb 0b3h		;a643	b3 	. 
	defb 0b4h		;a644	b4 	. 
	defb 0b6h		;a645	b6 	. 
	defb 0e1h		;a646	e1 	. 
	defb 0f1h		;a647	f1 	. 
	defb 0f8h		;a648	f8 	. 
	defb 0dch		;a649	dc 	. 
	defb 0ech		;a64a	ec 	. 
	defb 0fch		;a64b	fc 	. 
	defb 0c1h		;a64c	c1 	. 
	defb 000h		;a64d	00 	. 
	defb 0f5h		;a64e	f5 	. 
	defb 000h		;a64f	00 	. 
	defb 0b8h		;a650	b8 	. 
	defb 0a8h		;a651	a8 	. 
	defb 0b9h		;a652	b9 	. 
	defb 0bah		;a653	ba 	. 
	defb 0e0h		;a654	e0 	. 
	defb 0f0h		;a655	f0 	. 
	defb 0f9h		;a656	f9 	. 
	defb 0dbh		;a657	db 	. 
	defb 0ebh		;a658	eb 	. 
	defb 0fbh		;a659	fb 	. 
	defb 0d8h		;a65a	d8 	. 
	defb 0c2h		;a65b	c2 	. 
	defb 0c3h		;a65c	c3 	. 
	defb 000h		;a65d	00 	. 
	defb 000h		;a65e	00 	. 
	defb 000h		;a65f	00 	. 
	defb 0aeh		;a660	ae 	. 
	defb 0afh		;a661	af 	. 
	defb 0a9h		;a662	a9 	. 
	defb 0aah		;a663	aa 	. 
	defb 0e4h		;a664	e4 	. 
	defb 0dah		;a665	da 	. 
	defb 0eah		;a666	ea 	. 
	defb 0fah		;a667	fa 	. 
	defb 0f4h		;a668	f4 	. 
	defb 0c6h		;a669	c6 	. 
	defb 0c7h		;a66a	c7 	. 
	defb 0c0h		;a66b	c0 	. 
	defb 000h		;a66c	00 	. 
	defb 000h		;a66d	00 	. 
	defb 000h		;a66e	00 	. 
	defb 000h		;a66f	00 	. 
	defb 000h		;a670	00 	. 
	defb 000h		;a671	00 	. 
	defb 000h		;a672	00 	. 
	defb 000h		;a673	00 	. 
	defb 0ach		;a674	ac 	. 
	defb 0adh		;a675	ad 	. 
	defb 000h		;a676	00 	. 
	defb 000h		;a677	00 	. 
	defb 000h		;a678	00 	. 
	defb 000h		;a679	00 	. 
	defb 000h		;a67a	00 	. 
	defb 000h		;a67b	00 	. 
	defb 000h		;a67c	00 	. 
	defb 000h		;a67d	00 	. 
	defb 000h		;a67e	00 	. 
	defb 073h		;a67f	73 	s 
	defb 000h		;a680	00 	. 
	defb 000h		;a681	00 	. 
	defb 000h		;a682	00 	. 
	defb 072h		;a683	72 	r 
	defb 000h		;a684	00 	. 
	defb 019h		;a685	19 	. 
	defb 000h		;a686	00 	. 
	defb 071h		;a687	71 	q 
	defb 000h		;a688	00 	. 
	defb 032h		;a689	32 	2 
	defb 000h		;a68a	00 	. 
	defb 001h		;a68b	01 	. 
	defb 000h		;a68c	00 	. 
	defb 04bh		;a68d	4b 	K 
	defb 000h		;a68e	00 	. 
	defb 003h		;a68f	03 	. 
	defb 000h		;a690	00 	. 
	defb 064h		;a691	64 	d 
	defb 000h		;a692	00 	. 
	defb 004h		;a693	04 	. 
	defb 000h		;a694	00 	. 
	defb 07dh		;a695	7d 	} 
	defb 000h		;a696	00 	. 
	defb 005h		;a697	05 	. 
	defb 000h		;a698	00 	. 
	defb 096h		;a699	96 	. 
	defb 000h		;a69a	00 	. 
	defb 006h		;a69b	06 	. 
	defb 000h		;a69c	00 	. 
	defb 0afh		;a69d	af 	. 
	defb 000h		;a69e	00 	. 
	defb 007h		;a69f	07 	. 
	defb 000h		;a6a0	00 	. 
	defb 0c8h		;a6a1	c8 	. 
	defb 000h		;a6a2	00 	. 
	defb 009h		;a6a3	09 	. 
	defb 000h		;a6a4	00 	. 
	defb 0e1h		;a6a5	e1 	. 
	defb 000h		;a6a6	00 	. 
	defb 008h		;a6a7	08 	. 
	defb 000h		;a6a8	00 	. 
	defb 0fah		;a6a9	fa 	. 
	defb 000h		;a6aa	00 	. 
	defb 00ah		;a6ab	0a 	. 
	defb 000h		;a6ac	00 	. 
	defb 013h		;a6ad	13 	. 
	defb 001h		;a6ae	01 	. 
	defb 00bh		;a6af	0b 	. 
	defb 000h		;a6b0	00 	. 
	defb 02ch		;a6b1	2c 	, 
	defb 001h		;a6b2	01 	. 
	defb 00ch		;a6b3	0c 	. 
	defb 000h		;a6b4	00 	. 
	defb 045h		;a6b5	45 	E 
	defb 001h		;a6b6	01 	. 
	defb 00eh		;a6b7	0e 	. 
	defb 000h		;a6b8	00 	. 
	defb 05eh		;a6b9	5e 	^ 
	defb 001h		;a6ba	01 	. 
	defb 00fh		;a6bb	0f 	. 
	defb 000h		;a6bc	00 	. 
	defb 077h		;a6bd	77 	w 
	defb 001h		;a6be	01 	. 
	defb 01fh		;a6bf	1f 	. 
	defb 000h		;a6c0	00 	. 
	defb 090h		;a6c1	90 	. 
	defb 001h		;a6c2	01 	. 
	defb 01eh		;a6c3	1e 	. 
	defb 000h		;a6c4	00 	. 
	defb 0a9h		;a6c5	a9 	. 
	defb 001h		;a6c6	01 	. 
	defb 072h		;a6c7	72 	r 
	defb 001h		;a6c8	01 	. 
	defb 0c2h		;a6c9	c2 	. 
	defb 001h		;a6ca	01 	. 
	defb 071h		;a6cb	71 	q 
	defb 001h		;a6cc	01 	. 
	defb 0dbh		;a6cd	db 	. 
	defb 001h		;a6ce	01 	. 
	defb 001h		;a6cf	01 	. 
	defb 001h		;a6d0	01 	. 
	defb 0f4h		;a6d1	f4 	. 
	defb 001h		;a6d2	01 	. 
	defb 003h		;a6d3	03 	. 
	defb 001h		;a6d4	01 	. 
	defb 00dh		;a6d5	0d 	. 
	defb 002h		;a6d6	02 	. 
	defb 004h		;a6d7	04 	. 
	defb 001h		;a6d8	01 	. 
	defb 026h		;a6d9	26 	& 
	defb 002h		;a6da	02 	. 
	defb 005h		;a6db	05 	. 
	defb 001h		;a6dc	01 	. 
	defb 03fh		;a6dd	3f 	? 
	defb 002h		;a6de	02 	. 
	defb 006h		;a6df	06 	. 
	defb 001h		;a6e0	01 	. 
	defb 058h		;a6e1	58 	X 
	defb 002h		;a6e2	02 	. 
	defb 007h		;a6e3	07 	. 
	defb 001h		;a6e4	01 	. 
	defb 071h		;a6e5	71 	q 
	defb 002h		;a6e6	02 	. 
	defb 009h		;a6e7	09 	. 
	defb 001h		;a6e8	01 	. 
	defb 08ah		;a6e9	8a 	. 
	defb 002h		;a6ea	02 	. 
	defb 008h		;a6eb	08 	. 
	defb 001h		;a6ec	01 	. 
	defb 0a3h		;a6ed	a3 	. 
	defb 002h		;a6ee	02 	. 
	defb 00ah		;a6ef	0a 	. 
	defb 001h		;a6f0	01 	. 
	defb 0bch		;a6f1	bc 	. 
	defb 002h		;a6f2	02 	. 
	defb 00bh		;a6f3	0b 	. 
	defb 001h		;a6f4	01 	. 
	defb 0d5h		;a6f5	d5 	. 
	defb 002h		;a6f6	02 	. 
	defb 00ch		;a6f7	0c 	. 
	defb 001h		;a6f8	01 	. 
	defb 0eeh		;a6f9	ee 	. 
	defb 002h		;a6fa	02 	. 
	defb 00eh		;a6fb	0e 	. 
	defb 001h		;a6fc	01 	. 
	defb 007h		;a6fd	07 	. 
	defb 003h		;a6fe	03 	. 
	defb 00fh		;a6ff	0f 	. 
	defb 001h		;a700	01 	. 
	defb 020h		;a701	20 	  
	defb 003h		;a702	03 	. 
	defb 01fh		;a703	1f 	. 
	defb 001h		;a704	01 	. 
	defb 039h		;a705	39 	9 
	defb 003h		;a706	03 	. 
	defb 01eh		;a707	1e 	. 
	defb 001h		;a708	01 	. 
	defb 052h		;a709	52 	R 
	defb 003h		;a70a	03 	. 
	defb 000h		;a70b	00 	. 
	defb 000h		;a70c	00 	. 
	defb 000h		;a70d	00 	. 
	defb 000h		;a70e	00 	. 
	defb 000h		;a70f	00 	. 
	defb 000h		;a710	00 	. 
	defb 000h		;a711	00 	. 
	defb 000h		;a712	00 	. 
	defb 000h		;a713	00 	. 
	defb 000h		;a714	00 	. 
	defb 000h		;a715	00 	. 
	defb 000h		;a716	00 	. 
	defb 000h		;a717	00 	. 
	defb 000h		;a718	00 	. 
	defb 000h		;a719	00 	. 
	defb 000h		;a71a	00 	. 
	defb 000h		;a71b	00 	. 
	defb 000h		;a71c	00 	. 
	defb 000h		;a71d	00 	. 
	defb 000h		;a71e	00 	. 
	defb 000h		;a71f	00 	. 
	defb 000h		;a720	00 	. 
	defb 000h		;a721	00 	. 
	defb 000h		;a722	00 	. 
	defb 000h		;a723	00 	. 
	defb 0a5h		;a724	a5 	. 
	defb 053h		;a725	53 	S 
	defb 045h		;a726	45 	E 
	defb 054h		;a727	54 	T 
	defb 055h		;a728	55 	U 
	defb 050h		;a729	50 	P 
	defb 020h		;a72a	20 	  
	defb 020h		;a72b	20 	  
	defb 020h		;a72c	20 	  
	defb 020h		;a72d	20 	  
	defb 020h		;a72e	20 	  
	defb 020h		;a72f	20 	  
	defb 020h		;a730	20 	  
	defb 020h		;a731	20 	  
	defb 020h		;a732	20 	  
	defb 020h		;a733	20 	  
	defb 020h		;a734	20 	  
	defb 020h		;a735	20 	  
	defb 020h		;a736	20 	  
	defb 020h		;a737	20 	  
	defb 020h		;a738	20 	  
	defb 020h		;a739	20 	  
	defb 020h		;a73a	20 	  
	defb 020h		;a73b	20 	  
	defb 020h		;a73c	20 	  
	defb 0a8h		;a73d	a8 	. 
	defb 043h		;a73e	43 	C 
	defb 04fh		;a73f	4f 	O 
	defb 050h		;a740	50 	P 
	defb 059h		;a741	59 	Y 
	defb 044h		;a742	44 	D 
	defb 049h		;a743	49 	I 
	defb 053h		;a744	53 	S 
	defb 04bh		;a745	4b 	K 
	defb 020h		;a746	20 	  
	defb 020h		;a747	20 	  
	defb 020h		;a748	20 	  
	defb 020h		;a749	20 	  
	defb 020h		;a74a	20 	  
	defb 020h		;a74b	20 	  
	defb 020h		;a74c	20 	  
	defb 020h		;a74d	20 	  
	defb 020h		;a74e	20 	  
	defb 020h		;a74f	20 	  
	defb 020h		;a750	20 	  
	defb 020h		;a751	20 	  
	defb 020h		;a752	20 	  
	defb 020h		;a753	20 	  
	defb 020h		;a754	20 	  
	defb 020h		;a755	20 	  
	defb 000h		;a756	00 	. 
	defb 000h		;a757	00 	. 
	defb 000h		;a758	00 	. 
	defb 000h		;a759	00 	. 
	defb 000h		;a75a	00 	. 
	defb 000h		;a75b	00 	. 
	defb 000h		;a75c	00 	. 
	defb 000h		;a75d	00 	. 
	defb 000h		;a75e	00 	. 
	defb 000h		;a75f	00 	. 
	defb 000h		;a760	00 	. 
	defb 000h		;a761	00 	. 
	defb 000h		;a762	00 	. 
	defb 000h		;a763	00 	. 
	defb 000h		;a764	00 	. 
	defb 000h		;a765	00 	. 
	defb 000h		;a766	00 	. 
	defb 000h		;a767	00 	. 
	defb 000h		;a768	00 	. 
	defb 000h		;a769	00 	. 
	defb 000h		;a76a	00 	. 
	defb 000h		;a76b	00 	. 
	defb 000h		;a76c	00 	. 
	defb 000h		;a76d	00 	. 
	defb 000h		;a76e	00 	. 
	defb 000h		;a76f	00 	. 
	defb 000h		;a770	00 	. 
	defb 000h		;a771	00 	. 
	defb 000h		;a772	00 	. 
	defb 000h		;a773	00 	. 
	defb 000h		;a774	00 	. 
	defb 000h		;a775	00 	. 
	defb 000h		;a776	00 	. 
	defb 000h		;a777	00 	. 
	defb 000h		;a778	00 	. 
	defb 000h		;a779	00 	. 
	defb 000h		;a77a	00 	. 
	defb 000h		;a77b	00 	. 
	defb 000h		;a77c	00 	. 
	defb 000h		;a77d	00 	. 
	defb 000h		;a77e	00 	. 
	defb 000h		;a77f	00 	. 
	defb 000h		;a780	00 	. 
	defb 000h		;a781	00 	. 
	defb 000h		;a782	00 	. 
	defb 000h		;a783	00 	. 
	defb 000h		;a784	00 	. 
	defb 000h		;a785	00 	. 
	defb 000h		;a786	00 	. 
	defb 000h		;a787	00 	. 
	defb 000h		;a788	00 	. 
	defb 000h		;a789	00 	. 
	defb 000h		;a78a	00 	. 
	defb 000h		;a78b	00 	. 
	defb 000h		;a78c	00 	. 
	defb 000h		;a78d	00 	. 
	defb 000h		;a78e	00 	. 
	defb 000h		;a78f	00 	. 
	defb 000h		;a790	00 	. 
	defb 000h		;a791	00 	. 
	defb 000h		;a792	00 	. 
	defb 000h		;a793	00 	. 
	defb 000h		;a794	00 	. 
	defb 000h		;a795	00 	. 
	defb 000h		;a796	00 	. 
	defb 000h		;a797	00 	. 
	defb 000h		;a798	00 	. 
	defb 000h		;a799	00 	. 
	defb 000h		;a79a	00 	. 
	defb 000h		;a79b	00 	. 
	defb 000h		;a79c	00 	. 
	defb 000h		;a79d	00 	. 
	defb 000h		;a79e	00 	. 
	defb 000h		;a79f	00 	. 
	defb 000h		;a7a0	00 	. 
	defb 000h		;a7a1	00 	. 
	defb 000h		;a7a2	00 	. 
	defb 000h		;a7a3	00 	. 
	defb 000h		;a7a4	00 	. 
	defb 000h		;a7a5	00 	. 
	defb 000h		;a7a6	00 	. 
	defb 000h		;a7a7	00 	. 
	defb 000h		;a7a8	00 	. 
	defb 000h		;a7a9	00 	. 
	defb 000h		;a7aa	00 	. 
	defb 000h		;a7ab	00 	. 
	defb 000h		;a7ac	00 	. 
	defb 000h		;a7ad	00 	. 
	defb 000h		;a7ae	00 	. 
	defb 000h		;a7af	00 	. 
	defb 000h		;a7b0	00 	. 
	defb 000h		;a7b1	00 	. 
	defb 000h		;a7b2	00 	. 
	defb 000h		;a7b3	00 	. 
	defb 000h		;a7b4	00 	. 
	defb 000h		;a7b5	00 	. 
	defb 000h		;a7b6	00 	. 
	defb 000h		;a7b7	00 	. 
	defb 000h		;a7b8	00 	. 
	defb 000h		;a7b9	00 	. 
	defb 0a7h		;a7ba	a7 	. 
	defb 049h		;a7bb	49 	I 
	defb 04eh		;a7bc	4e 	N 
	defb 044h		;a7bd	44 	D 
	defb 045h		;a7be	45 	E 
	defb 058h		;a7bf	58 	X 
	defb 045h		;a7c0	45 	E 
	defb 052h		;a7c1	52 	R 
	defb 020h		;a7c2	20 	  
	defb 020h		;a7c3	20 	  
	defb 020h		;a7c4	20 	  
	defb 020h		;a7c5	20 	  
	defb 020h		;a7c6	20 	  
	defb 020h		;a7c7	20 	  
	defb 020h		;a7c8	20 	  
	defb 020h		;a7c9	20 	  
	defb 020h		;a7ca	20 	  
	defb 020h		;a7cb	20 	  
	defb 020h		;a7cc	20 	  
	defb 020h		;a7cd	20 	  
	defb 020h		;a7ce	20 	  
	defb 020h		;a7cf	20 	  
	defb 020h		;a7d0	20 	  
	defb 020h		;a7d1	20 	  
	defb 020h		;a7d2	20 	  
	defb 086h		;a7d3	86 	. 
	defb 04dh		;a7d4	4d 	M 
	defb 054h		;a7d5	54 	T 
	defb 045h		;a7d6	45 	E 
	defb 052h		;a7d7	52 	R 
	defb 04dh		;a7d8	4d 	M 
	defb 020h		;a7d9	20 	  
	defb 020h		;a7da	20 	  
	defb 020h		;a7db	20 	  
	defb 020h		;a7dc	20 	  
	defb 020h		;a7dd	20 	  
	defb 020h		;a7de	20 	  
	defb 020h		;a7df	20 	  
	defb 020h		;a7e0	20 	  
	defb 020h		;a7e1	20 	  
	defb 020h		;a7e2	20 	  
	defb 020h		;a7e3	20 	  
	defb 020h		;a7e4	20 	  
	defb 020h		;a7e5	20 	  
	defb 020h		;a7e6	20 	  
	defb 020h		;a7e7	20 	  
	defb 020h		;a7e8	20 	  
	defb 020h		;a7e9	20 	  
	defb 020h		;a7ea	20 	  
	defb 020h		;a7eb	20 	  
	defb 0a4h		;a7ec	a4 	. 
	defb 04dh		;a7ed	4d 	M 
	defb 045h		;a7ee	45 	E 
	defb 04eh		;a7ef	4e 	N 
	defb 055h		;a7f0	55 	U 
	defb 020h		;a7f1	20 	  
	defb 020h		;a7f2	20 	  
	defb 020h		;a7f3	20 	  
	defb 020h		;a7f4	20 	  
	defb 020h		;a7f5	20 	  
	defb 020h		;a7f6	20 	  
	defb 020h		;a7f7	20 	  
	defb 020h		;a7f8	20 	  
	defb 020h		;a7f9	20 	  
	defb 020h		;a7fa	20 	  
	defb 020h		;a7fb	20 	  
	defb 020h		;a7fc	20 	  
	defb 020h		;a7fd	20 	  
	defb 020h		;a7fe	20 	  
	defb 020h		;a7ff	20 	  
	defb 020h		;a800	20 	  
	defb 020h		;a801	20 	  
	defb 020h		;a802	20 	  
	defb 020h		;a803	20 	  
	defb 020h		;a804	20 	  
	defb 0a2h		;a805	a2 	. 
	defb 057h		;a806	57 	W 
	defb 053h		;a807	53 	S 
	defb 020h		;a808	20 	  
	defb 020h		;a809	20 	  
	defb 020h		;a80a	20 	  
	defb 020h		;a80b	20 	  
	defb 020h		;a80c	20 	  
	defb 020h		;a80d	20 	  
	defb 020h		;a80e	20 	  
	defb 020h		;a80f	20 	  
	defb 020h		;a810	20 	  
	defb 020h		;a811	20 	  
	defb 020h		;a812	20 	  
	defb 020h		;a813	20 	  
	defb 020h		;a814	20 	  
	defb 020h		;a815	20 	  
	defb 020h		;a816	20 	  
	defb 020h		;a817	20 	  
	defb 020h		;a818	20 	  
	defb 020h		;a819	20 	  
	defb 020h		;a81a	20 	  
	defb 020h		;a81b	20 	  
	defb 020h		;a81c	20 	  
	defb 020h		;a81d	20 	  
	defb 0a4h		;a81e	a4 	. 
	defb 050h		;a81f	50 	P 
	defb 04ch		;a820	4c 	L 
	defb 041h		;a821	41 	A 
	defb 04eh		;a822	4e 	N 
	defb 020h		;a823	20 	  
	defb 020h		;a824	20 	  
	defb 020h		;a825	20 	  
	defb 020h		;a826	20 	  
	defb 020h		;a827	20 	  
	defb 020h		;a828	20 	  
	defb 020h		;a829	20 	  
	defb 020h		;a82a	20 	  
	defb 020h		;a82b	20 	  
	defb 020h		;a82c	20 	  
	defb 020h		;a82d	20 	  
	defb 020h		;a82e	20 	  
	defb 020h		;a82f	20 	  
	defb 020h		;a830	20 	  
	defb 020h		;a831	20 	  
	defb 020h		;a832	20 	  
	defb 020h		;a833	20 	  
	defb 020h		;a834	20 	  
	defb 020h		;a835	20 	  
	defb 020h		;a836	20 	  
	defb 000h		;a837	00 	. 
	defb 000h		;a838	00 	. 
	defb 000h		;a839	00 	. 
	defb 000h		;a83a	00 	. 
	defb 000h		;a83b	00 	. 
	defb 000h		;a83c	00 	. 
	defb 000h		;a83d	00 	. 
	defb 000h		;a83e	00 	. 
	defb 000h		;a83f	00 	. 
	defb 000h		;a840	00 	. 
	defb 000h		;a841	00 	. 
	defb 000h		;a842	00 	. 
	defb 000h		;a843	00 	. 
	defb 000h		;a844	00 	. 
	defb 000h		;a845	00 	. 
	defb 000h		;a846	00 	. 
	defb 000h		;a847	00 	. 
	defb 000h		;a848	00 	. 
	defb 000h		;a849	00 	. 
	defb 000h		;a84a	00 	. 
	defb 000h		;a84b	00 	. 
	defb 000h		;a84c	00 	. 
	defb 000h		;a84d	00 	. 
	defb 000h		;a84e	00 	. 
	defb 000h		;a84f	00 	. 
	defb 0a5h		;a850	a5 	. 
	defb 047h		;a851	47 	G 
	defb 050h		;a852	50 	P 
	defb 04ch		;a853	4c 	L 
	defb 041h		;a854	41 	A 
	defb 04eh		;a855	4e 	N 
	defb 020h		;a856	20 	  
	defb 020h		;a857	20 	  
	defb 020h		;a858	20 	  
	defb 020h		;a859	20 	  
	defb 020h		;a85a	20 	  
	defb 020h		;a85b	20 	  
	defb 020h		;a85c	20 	  
	defb 020h		;a85d	20 	  
	defb 020h		;a85e	20 	  
	defb 020h		;a85f	20 	  
	defb 020h		;a860	20 	  
	defb 020h		;a861	20 	  
	defb 020h		;a862	20 	  
	defb 020h		;a863	20 	  
	defb 020h		;a864	20 	  
	defb 020h		;a865	20 	  
	defb 020h		;a866	20 	  
	defb 020h		;a867	20 	  
	defb 020h		;a868	20 	  
	defb 000h		;a869	00 	. 
	defb 000h		;a86a	00 	. 
	defb 000h		;a86b	00 	. 
	defb 000h		;a86c	00 	. 
	defb 000h		;a86d	00 	. 
	defb 000h		;a86e	00 	. 
	defb 000h		;a86f	00 	. 
	defb 000h		;a870	00 	. 
	defb 000h		;a871	00 	. 
	defb 000h		;a872	00 	. 
	defb 000h		;a873	00 	. 
	defb 000h		;a874	00 	. 
	defb 000h		;a875	00 	. 
	defb 000h		;a876	00 	. 
	defb 000h		;a877	00 	. 
	defb 000h		;a878	00 	. 
	defb 000h		;a879	00 	. 
	defb 000h		;a87a	00 	. 
	defb 000h		;a87b	00 	. 
	defb 000h		;a87c	00 	. 
	defb 000h		;a87d	00 	. 
	defb 000h		;a87e	00 	. 
	defb 000h		;a87f	00 	. 
	defb 000h		;a880	00 	. 
	defb 000h		;a881	00 	. 
	defb 000h		;a882	00 	. 
	defb 000h		;a883	00 	. 
	defb 000h		;a884	00 	. 
	defb 000h		;a885	00 	. 
	defb 000h		;a886	00 	. 
	defb 000h		;a887	00 	. 
	defb 000h		;a888	00 	. 
	defb 000h		;a889	00 	. 
	defb 000h		;a88a	00 	. 
	defb 000h		;a88b	00 	. 
	defb 000h		;a88c	00 	. 
	defb 000h		;a88d	00 	. 
	defb 000h		;a88e	00 	. 
	defb 000h		;a88f	00 	. 
	defb 000h		;a890	00 	. 
	defb 000h		;a891	00 	. 
	defb 000h		;a892	00 	. 
	defb 000h		;a893	00 	. 
	defb 000h		;a894	00 	. 
	defb 000h		;a895	00 	. 
	defb 000h		;a896	00 	. 
	defb 000h		;a897	00 	. 
	defb 000h		;a898	00 	. 
	defb 000h		;a899	00 	. 
	defb 000h		;a89a	00 	. 
	defb 000h		;a89b	00 	. 
	defb 000h		;a89c	00 	. 
	defb 000h		;a89d	00 	. 
	defb 000h		;a89e	00 	. 
	defb 000h		;a89f	00 	. 
	defb 000h		;a8a0	00 	. 
	defb 000h		;a8a1	00 	. 
	defb 000h		;a8a2	00 	. 
	defb 000h		;a8a3	00 	. 
	defb 000h		;a8a4	00 	. 
	defb 000h		;a8a5	00 	. 
	defb 000h		;a8a6	00 	. 
	defb 000h		;a8a7	00 	. 
	defb 000h		;a8a8	00 	. 
	defb 000h		;a8a9	00 	. 
	defb 000h		;a8aa	00 	. 
	defb 000h		;a8ab	00 	. 
	defb 000h		;a8ac	00 	. 
	defb 000h		;a8ad	00 	. 
	defb 000h		;a8ae	00 	. 
	defb 000h		;a8af	00 	. 
	defb 000h		;a8b0	00 	. 
	defb 000h		;a8b1	00 	. 
	defb 000h		;a8b2	00 	. 
	defb 000h		;a8b3	00 	. 
	defb 000h		;a8b4	00 	. 
	defb 000h		;a8b5	00 	. 
	defb 000h		;a8b6	00 	. 
	defb 000h		;a8b7	00 	. 
	defb 000h		;a8b8	00 	. 
	defb 000h		;a8b9	00 	. 
	defb 000h		;a8ba	00 	. 
	defb 000h		;a8bb	00 	. 
	defb 000h		;a8bc	00 	. 
	defb 000h		;a8bd	00 	. 
	defb 000h		;a8be	00 	. 
	defb 000h		;a8bf	00 	. 
	defb 000h		;a8c0	00 	. 
	defb 000h		;a8c1	00 	. 
	defb 000h		;a8c2	00 	. 
	defb 000h		;a8c3	00 	. 
	defb 000h		;a8c4	00 	. 
	defb 000h		;a8c5	00 	. 
	defb 000h		;a8c6	00 	. 
	defb 000h		;a8c7	00 	. 
	defb 000h		;a8c8	00 	. 
	defb 000h		;a8c9	00 	. 
	defb 000h		;a8ca	00 	. 
	defb 000h		;a8cb	00 	. 
	defb 000h		;a8cc	00 	. 
	defb 000h		;a8cd	00 	. 
	defb 000h		;a8ce	00 	. 
	defb 000h		;a8cf	00 	. 
	defb 000h		;a8d0	00 	. 
	defb 000h		;a8d1	00 	. 
	defb 000h		;a8d2	00 	. 
	defb 000h		;a8d3	00 	. 
	defb 000h		;a8d4	00 	. 
	defb 000h		;a8d5	00 	. 
	defb 000h		;a8d6	00 	. 
	defb 000h		;a8d7	00 	. 
	defb 000h		;a8d8	00 	. 
	defb 000h		;a8d9	00 	. 
	defb 000h		;a8da	00 	. 
	defb 000h		;a8db	00 	. 
	defb 000h		;a8dc	00 	. 
	defb 000h		;a8dd	00 	. 
	defb 000h		;a8de	00 	. 
	defb 000h		;a8df	00 	. 
	defb 000h		;a8e0	00 	. 
	defb 000h		;a8e1	00 	. 
	defb 000h		;a8e2	00 	. 
	defb 000h		;a8e3	00 	. 
	defb 000h		;a8e4	00 	. 
	defb 000h		;a8e5	00 	. 
	defb 000h		;a8e6	00 	. 
	defb 000h		;a8e7	00 	. 
	defb 000h		;a8e8	00 	. 
	defb 000h		;a8e9	00 	. 
	defb 000h		;a8ea	00 	. 
	defb 000h		;a8eb	00 	. 
	defb 000h		;a8ec	00 	. 
	defb 000h		;a8ed	00 	. 
	defb 000h		;a8ee	00 	. 
	defb 000h		;a8ef	00 	. 
	defb 000h		;a8f0	00 	. 
	defb 000h		;a8f1	00 	. 
	defb 000h		;a8f2	00 	. 
	defb 000h		;a8f3	00 	. 
	defb 000h		;a8f4	00 	. 
	defb 000h		;a8f5	00 	. 
	defb 000h		;a8f6	00 	. 
	defb 000h		;a8f7	00 	. 
	defb 000h		;a8f8	00 	. 
	defb 000h		;a8f9	00 	. 
	defb 000h		;a8fa	00 	. 
	defb 000h		;a8fb	00 	. 
	defb 000h		;a8fc	00 	. 
	defb 000h		;a8fd	00 	. 
	defb 000h		;a8fe	00 	. 
	defb 000h		;a8ff	00 	. 
	defb 000h		;a900	00 	. 
	defb 000h		;a901	00 	. 
	defb 000h		;a902	00 	. 
	defb 000h		;a903	00 	. 
	defb 000h		;a904	00 	. 
	defb 000h		;a905	00 	. 
	defb 000h		;a906	00 	. 
	defb 000h		;a907	00 	. 
	defb 000h		;a908	00 	. 
	defb 000h		;a909	00 	. 
	defb 000h		;a90a	00 	. 
	defb 000h		;a90b	00 	. 
	defb 000h		;a90c	00 	. 
	defb 000h		;a90d	00 	. 
	defb 000h		;a90e	00 	. 
	defb 000h		;a90f	00 	. 
	defb 000h		;a910	00 	. 
	defb 000h		;a911	00 	. 
	defb 000h		;a912	00 	. 
	defb 000h		;a913	00 	. 
	defb 000h		;a914	00 	. 
	defb 000h		;a915	00 	. 
	defb 000h		;a916	00 	. 
	defb 000h		;a917	00 	. 
	defb 000h		;a918	00 	. 
	defb 000h		;a919	00 	. 
	defb 000h		;a91a	00 	. 
	defb 000h		;a91b	00 	. 
	defb 000h		;a91c	00 	. 
	defb 000h		;a91d	00 	. 
	defb 000h		;a91e	00 	. 
	defb 000h		;a91f	00 	. 
	defb 000h		;a920	00 	. 
	defb 000h		;a921	00 	. 
	defb 000h		;a922	00 	. 
	defb 000h		;a923	00 	. 
	defb 000h		;a924	00 	. 
	defb 000h		;a925	00 	. 
	defb 000h		;a926	00 	. 
	defb 000h		;a927	00 	. 
	defb 000h		;a928	00 	. 
	defb 000h		;a929	00 	. 
	defb 000h		;a92a	00 	. 
	defb 000h		;a92b	00 	. 
	defb 000h		;a92c	00 	. 
	defb 000h		;a92d	00 	. 
	defb 000h		;a92e	00 	. 
	defb 000h		;a92f	00 	. 
	defb 000h		;a930	00 	. 
	defb 000h		;a931	00 	. 
	defb 000h		;a932	00 	. 
	defb 000h		;a933	00 	. 
	defb 000h		;a934	00 	. 
	defb 000h		;a935	00 	. 
	defb 000h		;a936	00 	. 
	defb 000h		;a937	00 	. 
	defb 000h		;a938	00 	. 
	defb 000h		;a939	00 	. 
	defb 000h		;a93a	00 	. 
	defb 000h		;a93b	00 	. 
	defb 000h		;a93c	00 	. 
	defb 000h		;a93d	00 	. 
	defb 000h		;a93e	00 	. 
	defb 000h		;a93f	00 	. 
	defb 000h		;a940	00 	. 
	defb 000h		;a941	00 	. 
	defb 000h		;a942	00 	. 
	defb 000h		;a943	00 	. 
	defb 000h		;a944	00 	. 
	defb 000h		;a945	00 	. 
	defb 000h		;a946	00 	. 
	defb 000h		;a947	00 	. 
	defb 000h		;a948	00 	. 
	defb 000h		;a949	00 	. 
	defb 000h		;a94a	00 	. 
	defb 000h		;a94b	00 	. 
	defb 000h		;a94c	00 	. 
	defb 000h		;a94d	00 	. 
	defb 000h		;a94e	00 	. 
	defb 000h		;a94f	00 	. 
	defb 000h		;a950	00 	. 
	defb 000h		;a951	00 	. 
	defb 000h		;a952	00 	. 
	defb 000h		;a953	00 	. 
	defb 000h		;a954	00 	. 
	defb 000h		;a955	00 	. 
	defb 000h		;a956	00 	. 
	defb 000h		;a957	00 	. 
	defb 000h		;a958	00 	. 
	defb 000h		;a959	00 	. 
	defb 000h		;a95a	00 	. 
	defb 000h		;a95b	00 	. 
	defb 000h		;a95c	00 	. 
	defb 000h		;a95d	00 	. 
	defb 000h		;a95e	00 	. 
	defb 000h		;a95f	00 	. 
	defb 000h		;a960	00 	. 
	defb 000h		;a961	00 	. 
	defb 000h		;a962	00 	. 
	defb 000h		;a963	00 	. 
	defb 000h		;a964	00 	. 
	defb 000h		;a965	00 	. 
	defb 000h		;a966	00 	. 
	defb 000h		;a967	00 	. 
	defb 000h		;a968	00 	. 
	defb 000h		;a969	00 	. 
	defb 000h		;a96a	00 	. 
	defb 000h		;a96b	00 	. 
	defb 000h		;a96c	00 	. 
	defb 000h		;a96d	00 	. 
	defb 000h		;a96e	00 	. 
	defb 000h		;a96f	00 	. 
	defb 000h		;a970	00 	. 
	defb 000h		;a971	00 	. 
	defb 000h		;a972	00 	. 
	defb 000h		;a973	00 	. 
	defb 000h		;a974	00 	. 
	defb 000h		;a975	00 	. 
	defb 000h		;a976	00 	. 
	defb 000h		;a977	00 	. 
	defb 000h		;a978	00 	. 
	defb 000h		;a979	00 	. 
	defb 000h		;a97a	00 	. 
	defb 000h		;a97b	00 	. 
	defb 000h		;a97c	00 	. 
	defb 000h		;a97d	00 	. 
	defb 000h		;a97e	00 	. 
	defb 000h		;a97f	00 	. 
	defb 000h		;a980	00 	. 
	defb 000h		;a981	00 	. 
	defb 000h		;a982	00 	. 
	defb 000h		;a983	00 	. 
	defb 000h		;a984	00 	. 
	defb 000h		;a985	00 	. 
	defb 000h		;a986	00 	. 
	defb 000h		;a987	00 	. 
	defb 000h		;a988	00 	. 
	defb 000h		;a989	00 	. 
	defb 000h		;a98a	00 	. 
	defb 000h		;a98b	00 	. 
	defb 000h		;a98c	00 	. 
	defb 000h		;a98d	00 	. 
	defb 000h		;a98e	00 	. 
	defb 000h		;a98f	00 	. 
	defb 000h		;a990	00 	. 
	defb 000h		;a991	00 	. 
	defb 000h		;a992	00 	. 
	defb 000h		;a993	00 	. 
	defb 000h		;a994	00 	. 
	defb 000h		;a995	00 	. 
	defb 000h		;a996	00 	. 
	defb 000h		;a997	00 	. 
	defb 000h		;a998	00 	. 
	defb 000h		;a999	00 	. 
	defb 000h		;a99a	00 	. 
	defb 000h		;a99b	00 	. 
	defb 000h		;a99c	00 	. 
	defb 000h		;a99d	00 	. 
	defb 000h		;a99e	00 	. 
	defb 000h		;a99f	00 	. 
	defb 000h		;a9a0	00 	. 
	defb 000h		;a9a1	00 	. 
	defb 000h		;a9a2	00 	. 
	defb 000h		;a9a3	00 	. 
	defb 000h		;a9a4	00 	. 
	defb 000h		;a9a5	00 	. 
	defb 000h		;a9a6	00 	. 
	defb 000h		;a9a7	00 	. 
	defb 000h		;a9a8	00 	. 
	defb 000h		;a9a9	00 	. 
	defb 000h		;a9aa	00 	. 
	defb 000h		;a9ab	00 	. 
	defb 000h		;a9ac	00 	. 
	defb 000h		;a9ad	00 	. 
	defb 000h		;a9ae	00 	. 
	defb 000h		;a9af	00 	. 
	defb 000h		;a9b0	00 	. 
	defb 000h		;a9b1	00 	. 
	defb 000h		;a9b2	00 	. 
	defb 000h		;a9b3	00 	. 
	defb 000h		;a9b4	00 	. 
	defb 000h		;a9b5	00 	. 
	defb 000h		;a9b6	00 	. 
	defb 000h		;a9b7	00 	. 
	defb 000h		;a9b8	00 	. 
	defb 000h		;a9b9	00 	. 
	defb 000h		;a9ba	00 	. 
	defb 000h		;a9bb	00 	. 
	defb 000h		;a9bc	00 	. 
	defb 000h		;a9bd	00 	. 
	defb 000h		;a9be	00 	. 
	defb 000h		;a9bf	00 	. 
	defb 000h		;a9c0	00 	. 
	defb 000h		;a9c1	00 	. 
	defb 000h		;a9c2	00 	. 
	defb 000h		;a9c3	00 	. 
	defb 000h		;a9c4	00 	. 
	defb 000h		;a9c5	00 	. 
	defb 000h		;a9c6	00 	. 
	defb 000h		;a9c7	00 	. 
	defb 000h		;a9c8	00 	. 
	defb 000h		;a9c9	00 	. 
	defb 000h		;a9ca	00 	. 
	defb 000h		;a9cb	00 	. 
	defb 000h		;a9cc	00 	. 
	defb 000h		;a9cd	00 	. 
	defb 000h		;a9ce	00 	. 
	defb 000h		;a9cf	00 	. 
	defb 000h		;a9d0	00 	. 
	defb 000h		;a9d1	00 	. 
	defb 000h		;a9d2	00 	. 
	defb 000h		;a9d3	00 	. 
	defb 000h		;a9d4	00 	. 
	defb 000h		;a9d5	00 	. 
	defb 000h		;a9d6	00 	. 
	defb 000h		;a9d7	00 	. 
	defb 000h		;a9d8	00 	. 
	defb 000h		;a9d9	00 	. 
	defb 000h		;a9da	00 	. 
	defb 000h		;a9db	00 	. 
	defb 000h		;a9dc	00 	. 
	defb 000h		;a9dd	00 	. 
	defb 000h		;a9de	00 	. 
	defb 000h		;a9df	00 	. 
	defb 000h		;a9e0	00 	. 
	defb 000h		;a9e1	00 	. 
	defb 000h		;a9e2	00 	. 
	defb 000h		;a9e3	00 	. 
	defb 000h		;a9e4	00 	. 
	defb 000h		;a9e5	00 	. 
	defb 000h		;a9e6	00 	. 
	defb 000h		;a9e7	00 	. 
	defb 000h		;a9e8	00 	. 
	defb 000h		;a9e9	00 	. 
	defb 000h		;a9ea	00 	. 
	defb 000h		;a9eb	00 	. 
	defb 000h		;a9ec	00 	. 
	defb 000h		;a9ed	00 	. 
	defb 000h		;a9ee	00 	. 
	defb 000h		;a9ef	00 	. 
	defb 000h		;a9f0	00 	. 
	defb 000h		;a9f1	00 	. 
	defb 000h		;a9f2	00 	. 
	defb 000h		;a9f3	00 	. 
	defb 000h		;a9f4	00 	. 
	defb 000h		;a9f5	00 	. 
	defb 000h		;a9f6	00 	. 
	defb 000h		;a9f7	00 	. 
	defb 000h		;a9f8	00 	. 
	defb 000h		;a9f9	00 	. 
	defb 000h		;a9fa	00 	. 
	defb 000h		;a9fb	00 	. 
	defb 000h		;a9fc	00 	. 
	defb 000h		;a9fd	00 	. 
	defb 000h		;a9fe	00 	. 
	defb 000h		;a9ff	00 	. 
	defb 000h		;aa00	00 	. 
	defb 000h		;aa01	00 	. 
	defb 000h		;aa02	00 	. 
	defb 000h		;aa03	00 	. 
	defb 000h		;aa04	00 	. 
	defb 000h		;aa05	00 	. 
	defb 000h		;aa06	00 	. 
	defb 000h		;aa07	00 	. 
	defb 000h		;aa08	00 	. 
	defb 000h		;aa09	00 	. 
	defb 000h		;aa0a	00 	. 
	defb 000h		;aa0b	00 	. 
	defb 000h		;aa0c	00 	. 
	defb 000h		;aa0d	00 	. 
	defb 000h		;aa0e	00 	. 
	defb 000h		;aa0f	00 	. 
	defb 000h		;aa10	00 	. 
	defb 000h		;aa11	00 	. 
	defb 000h		;aa12	00 	. 
	defb 000h		;aa13	00 	. 
	defb 000h		;aa14	00 	. 
	defb 000h		;aa15	00 	. 
	defb 000h		;aa16	00 	. 
	defb 000h		;aa17	00 	. 
	defb 000h		;aa18	00 	. 
	defb 000h		;aa19	00 	. 
	defb 000h		;aa1a	00 	. 
	defb 000h		;aa1b	00 	. 
	defb 000h		;aa1c	00 	. 
	defb 000h		;aa1d	00 	. 
	defb 000h		;aa1e	00 	. 
	defb 000h		;aa1f	00 	. 
	defb 000h		;aa20	00 	. 
	defb 000h		;aa21	00 	. 
	defb 000h		;aa22	00 	. 
	defb 000h		;aa23	00 	. 
	defb 000h		;aa24	00 	. 
	defb 000h		;aa25	00 	. 
	defb 000h		;aa26	00 	. 
	defb 000h		;aa27	00 	. 
	defb 000h		;aa28	00 	. 
	defb 000h		;aa29	00 	. 
	defb 000h		;aa2a	00 	. 
	defb 000h		;aa2b	00 	. 
	defb 000h		;aa2c	00 	. 
	defb 000h		;aa2d	00 	. 
	defb 000h		;aa2e	00 	. 
	defb 000h		;aa2f	00 	. 
	defb 000h		;aa30	00 	. 
	defb 000h		;aa31	00 	. 
	defb 000h		;aa32	00 	. 
	defb 000h		;aa33	00 	. 
	defb 000h		;aa34	00 	. 
	defb 000h		;aa35	00 	. 
	defb 000h		;aa36	00 	. 
	defb 000h		;aa37	00 	. 
	defb 000h		;aa38	00 	. 
	defb 000h		;aa39	00 	. 
	defb 000h		;aa3a	00 	. 
	defb 000h		;aa3b	00 	. 
	defb 000h		;aa3c	00 	. 
	defb 000h		;aa3d	00 	. 
	defb 000h		;aa3e	00 	. 
	defb 000h		;aa3f	00 	. 
	defb 000h		;aa40	00 	. 
	defb 000h		;aa41	00 	. 
	defb 000h		;aa42	00 	. 
	defb 000h		;aa43	00 	. 
	defb 000h		;aa44	00 	. 
	defb 000h		;aa45	00 	. 
	defb 000h		;aa46	00 	. 
	defb 000h		;aa47	00 	. 
	defb 000h		;aa48	00 	. 
	defb 000h		;aa49	00 	. 
	defb 000h		;aa4a	00 	. 
	defb 000h		;aa4b	00 	. 
	defb 000h		;aa4c	00 	. 
	defb 000h		;aa4d	00 	. 
	defb 000h		;aa4e	00 	. 
	defb 000h		;aa4f	00 	. 
	defb 000h		;aa50	00 	. 
	defb 000h		;aa51	00 	. 
	defb 000h		;aa52	00 	. 
	defb 000h		;aa53	00 	. 
	defb 000h		;aa54	00 	. 
	defb 000h		;aa55	00 	. 
	defb 000h		;aa56	00 	. 
	defb 000h		;aa57	00 	. 
	defb 000h		;aa58	00 	. 
	defb 000h		;aa59	00 	. 
	defb 000h		;aa5a	00 	. 
	defb 000h		;aa5b	00 	. 
	defb 000h		;aa5c	00 	. 
	defb 000h		;aa5d	00 	. 
	defb 000h		;aa5e	00 	. 
	defb 000h		;aa5f	00 	. 
	defb 000h		;aa60	00 	. 
	defb 000h		;aa61	00 	. 
	defb 000h		;aa62	00 	. 
	defb 000h		;aa63	00 	. 
	defb 000h		;aa64	00 	. 
	defb 000h		;aa65	00 	. 
	defb 000h		;aa66	00 	. 
	defb 000h		;aa67	00 	. 
	defb 000h		;aa68	00 	. 
	defb 000h		;aa69	00 	. 
	defb 000h		;aa6a	00 	. 
	defb 000h		;aa6b	00 	. 
	defb 000h		;aa6c	00 	. 
	defb 000h		;aa6d	00 	. 
	defb 000h		;aa6e	00 	. 
	defb 000h		;aa6f	00 	. 
	defb 000h		;aa70	00 	. 
	defb 000h		;aa71	00 	. 
	defb 000h		;aa72	00 	. 
	defb 000h		;aa73	00 	. 
	defb 000h		;aa74	00 	. 
	defb 000h		;aa75	00 	. 
	defb 000h		;aa76	00 	. 
	defb 000h		;aa77	00 	. 
	defb 000h		;aa78	00 	. 
	defb 000h		;aa79	00 	. 
	defb 000h		;aa7a	00 	. 
	defb 000h		;aa7b	00 	. 
	defb 000h		;aa7c	00 	. 
	defb 000h		;aa7d	00 	. 
	defb 000h		;aa7e	00 	. 
	defb 073h		;aa7f	73 	s 
	defb 000h		;aa80	00 	. 
	defb 000h		;aa81	00 	. 
	defb 000h		;aa82	00 	. 
	defb 072h		;aa83	72 	r 
	defb 000h		;aa84	00 	. 
	defb 019h		;aa85	19 	. 
	defb 000h		;aa86	00 	. 
	defb 071h		;aa87	71 	q 
	defb 000h		;aa88	00 	. 
	defb 032h		;aa89	32 	2 
	defb 000h		;aa8a	00 	. 
	defb 001h		;aa8b	01 	. 
	defb 000h		;aa8c	00 	. 
	defb 04bh		;aa8d	4b 	K 
	defb 000h		;aa8e	00 	. 
	defb 003h		;aa8f	03 	. 
	defb 000h		;aa90	00 	. 
	defb 064h		;aa91	64 	d 
	defb 000h		;aa92	00 	. 
	defb 004h		;aa93	04 	. 
	defb 000h		;aa94	00 	. 
	defb 07dh		;aa95	7d 	} 
	defb 000h		;aa96	00 	. 
	defb 005h		;aa97	05 	. 
	defb 000h		;aa98	00 	. 
	defb 096h		;aa99	96 	. 
	defb 000h		;aa9a	00 	. 
	defb 006h		;aa9b	06 	. 
	defb 000h		;aa9c	00 	. 
	defb 0afh		;aa9d	af 	. 
	defb 000h		;aa9e	00 	. 
	defb 007h		;aa9f	07 	. 
	defb 000h		;aaa0	00 	. 
	defb 0c8h		;aaa1	c8 	. 
	defb 000h		;aaa2	00 	. 
	defb 009h		;aaa3	09 	. 
	defb 000h		;aaa4	00 	. 
	defb 0e1h		;aaa5	e1 	. 
	defb 000h		;aaa6	00 	. 
	defb 008h		;aaa7	08 	. 
	defb 000h		;aaa8	00 	. 
	defb 0fah		;aaa9	fa 	. 
	defb 000h		;aaaa	00 	. 
	defb 00ah		;aaab	0a 	. 
	defb 000h		;aaac	00 	. 
	defb 013h		;aaad	13 	. 
	defb 001h		;aaae	01 	. 
	defb 00bh		;aaaf	0b 	. 
	defb 000h		;aab0	00 	. 
	defb 02ch		;aab1	2c 	, 
	defb 001h		;aab2	01 	. 
	defb 00ch		;aab3	0c 	. 
	defb 000h		;aab4	00 	. 
	defb 045h		;aab5	45 	E 
	defb 001h		;aab6	01 	. 
	defb 00eh		;aab7	0e 	. 
	defb 000h		;aab8	00 	. 
	defb 05eh		;aab9	5e 	^ 
	defb 001h		;aaba	01 	. 
	defb 00fh		;aabb	0f 	. 
	defb 000h		;aabc	00 	. 
	defb 077h		;aabd	77 	w 
	defb 001h		;aabe	01 	. 
	defb 01fh		;aabf	1f 	. 
	defb 000h		;aac0	00 	. 
	defb 090h		;aac1	90 	. 
	defb 001h		;aac2	01 	. 
	defb 01eh		;aac3	1e 	. 
	defb 000h		;aac4	00 	. 
	defb 0a9h		;aac5	a9 	. 
	defb 001h		;aac6	01 	. 
	defb 072h		;aac7	72 	r 
	defb 001h		;aac8	01 	. 
	defb 0c2h		;aac9	c2 	. 
	defb 001h		;aaca	01 	. 
	defb 071h		;aacb	71 	q 
	defb 001h		;aacc	01 	. 
	defb 0dbh		;aacd	db 	. 
	defb 001h		;aace	01 	. 
	defb 001h		;aacf	01 	. 
	defb 001h		;aad0	01 	. 
	defb 0f4h		;aad1	f4 	. 
	defb 001h		;aad2	01 	. 
	defb 003h		;aad3	03 	. 
	defb 001h		;aad4	01 	. 
	defb 00dh		;aad5	0d 	. 
	defb 002h		;aad6	02 	. 
	defb 004h		;aad7	04 	. 
	defb 001h		;aad8	01 	. 
	defb 026h		;aad9	26 	& 
	defb 002h		;aada	02 	. 
	defb 005h		;aadb	05 	. 
	defb 001h		;aadc	01 	. 
	defb 03fh		;aadd	3f 	? 
	defb 002h		;aade	02 	. 
	defb 006h		;aadf	06 	. 
	defb 001h		;aae0	01 	. 
	defb 058h		;aae1	58 	X 
	defb 002h		;aae2	02 	. 
	defb 007h		;aae3	07 	. 
	defb 001h		;aae4	01 	. 
	defb 071h		;aae5	71 	q 
	defb 002h		;aae6	02 	. 
	defb 009h		;aae7	09 	. 
	defb 001h		;aae8	01 	. 
	defb 08ah		;aae9	8a 	. 
	defb 002h		;aaea	02 	. 
	defb 008h		;aaeb	08 	. 
	defb 001h		;aaec	01 	. 
	defb 0a3h		;aaed	a3 	. 
	defb 002h		;aaee	02 	. 
	defb 00ah		;aaef	0a 	. 
	defb 001h		;aaf0	01 	. 
	defb 0bch		;aaf1	bc 	. 
	defb 002h		;aaf2	02 	. 
	defb 00bh		;aaf3	0b 	. 
	defb 001h		;aaf4	01 	. 
	defb 0d5h		;aaf5	d5 	. 
	defb 002h		;aaf6	02 	. 
	defb 00ch		;aaf7	0c 	. 
	defb 001h		;aaf8	01 	. 
	defb 0eeh		;aaf9	ee 	. 
	defb 002h		;aafa	02 	. 
	defb 00eh		;aafb	0e 	. 
	defb 001h		;aafc	01 	. 
	defb 007h		;aafd	07 	. 
	defb 003h		;aafe	03 	. 
	defb 00fh		;aaff	0f 	. 
	defb 001h		;ab00	01 	. 
	defb 020h		;ab01	20 	  
	defb 003h		;ab02	03 	. 
	defb 01fh		;ab03	1f 	. 
	defb 001h		;ab04	01 	. 
	defb 039h		;ab05	39 	9 
	defb 003h		;ab06	03 	. 
	defb 01eh		;ab07	1e 	. 
	defb 001h		;ab08	01 	. 
	defb 052h		;ab09	52 	R 
	defb 003h		;ab0a	03 	. 
	defb 000h		;ab0b	00 	. 
	defb 000h		;ab0c	00 	. 
	defb 000h		;ab0d	00 	. 
	defb 000h		;ab0e	00 	. 
	defb 000h		;ab0f	00 	. 
	defb 000h		;ab10	00 	. 
	defb 000h		;ab11	00 	. 
	defb 000h		;ab12	00 	. 
	defb 000h		;ab13	00 	. 
	defb 000h		;ab14	00 	. 
	defb 000h		;ab15	00 	. 
	defb 000h		;ab16	00 	. 
	defb 000h		;ab17	00 	. 
	defb 000h		;ab18	00 	. 
	defb 000h		;ab19	00 	. 
	defb 000h		;ab1a	00 	. 
	defb 000h		;ab1b	00 	. 
	defb 000h		;ab1c	00 	. 
	defb 000h		;ab1d	00 	. 
	defb 000h		;ab1e	00 	. 
	defb 000h		;ab1f	00 	. 
	defb 000h		;ab20	00 	. 
	defb 000h		;ab21	00 	. 
	defb 000h		;ab22	00 	. 
	defb 000h		;ab23	00 	. 
	defb 0a2h		;ab24	a2 	. 
	defb 001h		;ab25	01 	. 
	defb 040h		;ab26	40 	@ 
	defb 000h		;ab27	00 	. 
	defb 000h		;ab28	00 	. 
	defb 000h		;ab29	00 	. 
	defb 000h		;ab2a	00 	. 
	defb 000h		;ab2b	00 	. 
	defb 000h		;ab2c	00 	. 
	defb 000h		;ab2d	00 	. 
	defb 000h		;ab2e	00 	. 
	defb 000h		;ab2f	00 	. 
	defb 000h		;ab30	00 	. 
	defb 000h		;ab31	00 	. 
	defb 000h		;ab32	00 	. 
	defb 000h		;ab33	00 	. 
	defb 000h		;ab34	00 	. 
	defb 000h		;ab35	00 	. 
	defb 000h		;ab36	00 	. 
	defb 000h		;ab37	00 	. 
	defb 000h		;ab38	00 	. 
	defb 000h		;ab39	00 	. 
	defb 000h		;ab3a	00 	. 
	defb 000h		;ab3b	00 	. 
	defb 000h		;ab3c	00 	. 
	defb 0a2h		;ab3d	a2 	. 
	defb 001h		;ab3e	01 	. 
	defb 041h		;ab3f	41 	A 
	defb 000h		;ab40	00 	. 
	defb 000h		;ab41	00 	. 
	defb 000h		;ab42	00 	. 
	defb 000h		;ab43	00 	. 
	defb 000h		;ab44	00 	. 
	defb 000h		;ab45	00 	. 
	defb 000h		;ab46	00 	. 
	defb 000h		;ab47	00 	. 
	defb 000h		;ab48	00 	. 
	defb 000h		;ab49	00 	. 
	defb 000h		;ab4a	00 	. 
	defb 000h		;ab4b	00 	. 
	defb 000h		;ab4c	00 	. 
	defb 000h		;ab4d	00 	. 
	defb 000h		;ab4e	00 	. 
	defb 000h		;ab4f	00 	. 
	defb 000h		;ab50	00 	. 
	defb 000h		;ab51	00 	. 
	defb 000h		;ab52	00 	. 
	defb 000h		;ab53	00 	. 
	defb 000h		;ab54	00 	. 
	defb 000h		;ab55	00 	. 
	defb 0a2h		;ab56	a2 	. 
	defb 001h		;ab57	01 	. 
	defb 042h		;ab58	42 	B 
	defb 000h		;ab59	00 	. 
	defb 000h		;ab5a	00 	. 
	defb 000h		;ab5b	00 	. 
	defb 000h		;ab5c	00 	. 
	defb 000h		;ab5d	00 	. 
	defb 000h		;ab5e	00 	. 
	defb 000h		;ab5f	00 	. 
	defb 000h		;ab60	00 	. 
	defb 000h		;ab61	00 	. 
	defb 000h		;ab62	00 	. 
	defb 000h		;ab63	00 	. 
	defb 000h		;ab64	00 	. 
	defb 000h		;ab65	00 	. 
	defb 000h		;ab66	00 	. 
	defb 000h		;ab67	00 	. 
	defb 000h		;ab68	00 	. 
	defb 000h		;ab69	00 	. 
	defb 000h		;ab6a	00 	. 
	defb 000h		;ab6b	00 	. 
	defb 000h		;ab6c	00 	. 
	defb 000h		;ab6d	00 	. 
	defb 000h		;ab6e	00 	. 
	defb 0a2h		;ab6f	a2 	. 
	defb 001h		;ab70	01 	. 
	defb 043h		;ab71	43 	C 
	defb 000h		;ab72	00 	. 
	defb 000h		;ab73	00 	. 
	defb 000h		;ab74	00 	. 
	defb 000h		;ab75	00 	. 
	defb 000h		;ab76	00 	. 
	defb 000h		;ab77	00 	. 
	defb 000h		;ab78	00 	. 
	defb 000h		;ab79	00 	. 
	defb 000h		;ab7a	00 	. 
	defb 000h		;ab7b	00 	. 
	defb 000h		;ab7c	00 	. 
	defb 000h		;ab7d	00 	. 
	defb 000h		;ab7e	00 	. 
	defb 000h		;ab7f	00 	. 
	defb 000h		;ab80	00 	. 
	defb 000h		;ab81	00 	. 
	defb 000h		;ab82	00 	. 
	defb 000h		;ab83	00 	. 
	defb 000h		;ab84	00 	. 
	defb 000h		;ab85	00 	. 
	defb 000h		;ab86	00 	. 
	defb 000h		;ab87	00 	. 
	defb 0a2h		;ab88	a2 	. 
	defb 001h		;ab89	01 	. 
	defb 044h		;ab8a	44 	D 
	defb 000h		;ab8b	00 	. 
	defb 000h		;ab8c	00 	. 
	defb 000h		;ab8d	00 	. 
	defb 000h		;ab8e	00 	. 
	defb 000h		;ab8f	00 	. 
	defb 000h		;ab90	00 	. 
	defb 000h		;ab91	00 	. 
	defb 000h		;ab92	00 	. 
	defb 000h		;ab93	00 	. 
	defb 000h		;ab94	00 	. 
	defb 000h		;ab95	00 	. 
	defb 000h		;ab96	00 	. 
	defb 000h		;ab97	00 	. 
	defb 000h		;ab98	00 	. 
	defb 000h		;ab99	00 	. 
	defb 000h		;ab9a	00 	. 
	defb 000h		;ab9b	00 	. 
	defb 000h		;ab9c	00 	. 
	defb 000h		;ab9d	00 	. 
	defb 000h		;ab9e	00 	. 
	defb 000h		;ab9f	00 	. 
	defb 000h		;aba0	00 	. 
	defb 0a2h		;aba1	a2 	. 
	defb 001h		;aba2	01 	. 
	defb 045h		;aba3	45 	E 
	defb 000h		;aba4	00 	. 
	defb 000h		;aba5	00 	. 
	defb 000h		;aba6	00 	. 
	defb 000h		;aba7	00 	. 
	defb 000h		;aba8	00 	. 
	defb 000h		;aba9	00 	. 
	defb 000h		;abaa	00 	. 
	defb 000h		;abab	00 	. 
	defb 000h		;abac	00 	. 
	defb 000h		;abad	00 	. 
	defb 000h		;abae	00 	. 
	defb 000h		;abaf	00 	. 
	defb 000h		;abb0	00 	. 
	defb 000h		;abb1	00 	. 
	defb 000h		;abb2	00 	. 
	defb 000h		;abb3	00 	. 
	defb 000h		;abb4	00 	. 
	defb 000h		;abb5	00 	. 
	defb 000h		;abb6	00 	. 
	defb 000h		;abb7	00 	. 
	defb 000h		;abb8	00 	. 
	defb 000h		;abb9	00 	. 
	defb 0a2h		;abba	a2 	. 
	defb 001h		;abbb	01 	. 
	defb 046h		;abbc	46 	F 
	defb 000h		;abbd	00 	. 
	defb 000h		;abbe	00 	. 
	defb 000h		;abbf	00 	. 
	defb 000h		;abc0	00 	. 
	defb 000h		;abc1	00 	. 
	defb 000h		;abc2	00 	. 
	defb 000h		;abc3	00 	. 
	defb 000h		;abc4	00 	. 
	defb 000h		;abc5	00 	. 
	defb 000h		;abc6	00 	. 
	defb 000h		;abc7	00 	. 
	defb 000h		;abc8	00 	. 
	defb 000h		;abc9	00 	. 
	defb 000h		;abca	00 	. 
	defb 000h		;abcb	00 	. 
	defb 000h		;abcc	00 	. 
	defb 000h		;abcd	00 	. 
	defb 000h		;abce	00 	. 
	defb 000h		;abcf	00 	. 
	defb 000h		;abd0	00 	. 
	defb 000h		;abd1	00 	. 
	defb 000h		;abd2	00 	. 
	defb 0a2h		;abd3	a2 	. 
	defb 001h		;abd4	01 	. 
	defb 047h		;abd5	47 	G 
	defb 000h		;abd6	00 	. 
	defb 000h		;abd7	00 	. 
	defb 000h		;abd8	00 	. 
	defb 000h		;abd9	00 	. 
	defb 000h		;abda	00 	. 
	defb 000h		;abdb	00 	. 
	defb 000h		;abdc	00 	. 
	defb 000h		;abdd	00 	. 
	defb 000h		;abde	00 	. 
	defb 000h		;abdf	00 	. 
	defb 000h		;abe0	00 	. 
	defb 000h		;abe1	00 	. 
	defb 000h		;abe2	00 	. 
	defb 000h		;abe3	00 	. 
	defb 000h		;abe4	00 	. 
	defb 000h		;abe5	00 	. 
	defb 000h		;abe6	00 	. 
	defb 000h		;abe7	00 	. 
	defb 000h		;abe8	00 	. 
	defb 000h		;abe9	00 	. 
	defb 000h		;abea	00 	. 
	defb 000h		;abeb	00 	. 
	defb 0a2h		;abec	a2 	. 
	defb 001h		;abed	01 	. 
	defb 048h		;abee	48 	H 
	defb 000h		;abef	00 	. 
	defb 000h		;abf0	00 	. 
	defb 000h		;abf1	00 	. 
	defb 000h		;abf2	00 	. 
	defb 000h		;abf3	00 	. 
	defb 000h		;abf4	00 	. 
	defb 000h		;abf5	00 	. 
	defb 000h		;abf6	00 	. 
	defb 000h		;abf7	00 	. 
	defb 000h		;abf8	00 	. 
	defb 000h		;abf9	00 	. 
	defb 000h		;abfa	00 	. 
	defb 000h		;abfb	00 	. 
	defb 000h		;abfc	00 	. 
	defb 000h		;abfd	00 	. 
	defb 000h		;abfe	00 	. 
	defb 000h		;abff	00 	. 
	defb 000h		;ac00	00 	. 
	defb 000h		;ac01	00 	. 
	defb 000h		;ac02	00 	. 
	defb 000h		;ac03	00 	. 
	defb 000h		;ac04	00 	. 
	defb 0a2h		;ac05	a2 	. 
	defb 001h		;ac06	01 	. 
	defb 049h		;ac07	49 	I 
	defb 000h		;ac08	00 	. 
	defb 000h		;ac09	00 	. 
	defb 000h		;ac0a	00 	. 
	defb 000h		;ac0b	00 	. 
	defb 000h		;ac0c	00 	. 
	defb 000h		;ac0d	00 	. 
	defb 000h		;ac0e	00 	. 
	defb 000h		;ac0f	00 	. 
	defb 000h		;ac10	00 	. 
	defb 000h		;ac11	00 	. 
	defb 000h		;ac12	00 	. 
	defb 000h		;ac13	00 	. 
	defb 000h		;ac14	00 	. 
	defb 000h		;ac15	00 	. 
	defb 000h		;ac16	00 	. 
	defb 000h		;ac17	00 	. 
	defb 000h		;ac18	00 	. 
	defb 000h		;ac19	00 	. 
	defb 000h		;ac1a	00 	. 
	defb 000h		;ac1b	00 	. 
	defb 000h		;ac1c	00 	. 
	defb 000h		;ac1d	00 	. 
	defb 0a2h		;ac1e	a2 	. 
	defb 001h		;ac1f	01 	. 
	defb 049h		;ac20	49 	I 
	defb 000h		;ac21	00 	. 
	defb 000h		;ac22	00 	. 
	defb 000h		;ac23	00 	. 
	defb 000h		;ac24	00 	. 
	defb 000h		;ac25	00 	. 
	defb 000h		;ac26	00 	. 
	defb 000h		;ac27	00 	. 
	defb 000h		;ac28	00 	. 
	defb 000h		;ac29	00 	. 
	defb 000h		;ac2a	00 	. 
	defb 000h		;ac2b	00 	. 
	defb 000h		;ac2c	00 	. 
	defb 000h		;ac2d	00 	. 
	defb 000h		;ac2e	00 	. 
	defb 000h		;ac2f	00 	. 
	defb 000h		;ac30	00 	. 
	defb 000h		;ac31	00 	. 
	defb 000h		;ac32	00 	. 
	defb 000h		;ac33	00 	. 
	defb 000h		;ac34	00 	. 
	defb 000h		;ac35	00 	. 
	defb 000h		;ac36	00 	. 
	defb 0a2h		;ac37	a2 	. 
	defb 001h		;ac38	01 	. 
	defb 04ah		;ac39	4a 	J 
	defb 000h		;ac3a	00 	. 
	defb 000h		;ac3b	00 	. 
	defb 000h		;ac3c	00 	. 
	defb 000h		;ac3d	00 	. 
	defb 000h		;ac3e	00 	. 
	defb 000h		;ac3f	00 	. 
	defb 000h		;ac40	00 	. 
	defb 000h		;ac41	00 	. 
	defb 000h		;ac42	00 	. 
	defb 000h		;ac43	00 	. 
	defb 000h		;ac44	00 	. 
	defb 000h		;ac45	00 	. 
	defb 000h		;ac46	00 	. 
	defb 000h		;ac47	00 	. 
	defb 000h		;ac48	00 	. 
	defb 000h		;ac49	00 	. 
	defb 000h		;ac4a	00 	. 
	defb 000h		;ac4b	00 	. 
	defb 000h		;ac4c	00 	. 
	defb 000h		;ac4d	00 	. 
	defb 000h		;ac4e	00 	. 
	defb 000h		;ac4f	00 	. 
	defb 000h		;ac50	00 	. 
	defb 000h		;ac51	00 	. 
	defb 000h		;ac52	00 	. 
	defb 000h		;ac53	00 	. 
	defb 000h		;ac54	00 	. 
	defb 000h		;ac55	00 	. 
	defb 000h		;ac56	00 	. 
	defb 000h		;ac57	00 	. 
	defb 000h		;ac58	00 	. 
	defb 000h		;ac59	00 	. 
	defb 000h		;ac5a	00 	. 
	defb 000h		;ac5b	00 	. 
	defb 000h		;ac5c	00 	. 
	defb 000h		;ac5d	00 	. 
	defb 000h		;ac5e	00 	. 
	defb 000h		;ac5f	00 	. 
	defb 000h		;ac60	00 	. 
	defb 000h		;ac61	00 	. 
	defb 000h		;ac62	00 	. 
	defb 000h		;ac63	00 	. 
	defb 000h		;ac64	00 	. 
	defb 000h		;ac65	00 	. 
	defb 000h		;ac66	00 	. 
	defb 000h		;ac67	00 	. 
	defb 000h		;ac68	00 	. 
	defb 000h		;ac69	00 	. 
	defb 000h		;ac6a	00 	. 
	defb 000h		;ac6b	00 	. 
	defb 000h		;ac6c	00 	. 
	defb 000h		;ac6d	00 	. 
	defb 000h		;ac6e	00 	. 
	defb 000h		;ac6f	00 	. 
	defb 000h		;ac70	00 	. 
	defb 000h		;ac71	00 	. 
	defb 000h		;ac72	00 	. 
	defb 000h		;ac73	00 	. 
	defb 000h		;ac74	00 	. 
	defb 000h		;ac75	00 	. 
	defb 000h		;ac76	00 	. 
	defb 000h		;ac77	00 	. 
	defb 000h		;ac78	00 	. 
	defb 000h		;ac79	00 	. 
	defb 000h		;ac7a	00 	. 
	defb 000h		;ac7b	00 	. 
	defb 000h		;ac7c	00 	. 
	defb 000h		;ac7d	00 	. 
	defb 000h		;ac7e	00 	. 
	defb 000h		;ac7f	00 	. 
	defb 000h		;ac80	00 	. 
	defb 000h		;ac81	00 	. 
	defb 000h		;ac82	00 	. 
	defb 000h		;ac83	00 	. 
	defb 000h		;ac84	00 	. 
	defb 000h		;ac85	00 	. 
	defb 000h		;ac86	00 	. 
	defb 000h		;ac87	00 	. 
	defb 000h		;ac88	00 	. 
	defb 000h		;ac89	00 	. 
	defb 000h		;ac8a	00 	. 
	defb 000h		;ac8b	00 	. 
	defb 000h		;ac8c	00 	. 
	defb 000h		;ac8d	00 	. 
	defb 000h		;ac8e	00 	. 
	defb 000h		;ac8f	00 	. 
	defb 000h		;ac90	00 	. 
	defb 000h		;ac91	00 	. 
	defb 000h		;ac92	00 	. 
	defb 000h		;ac93	00 	. 
	defb 000h		;ac94	00 	. 
	defb 000h		;ac95	00 	. 
	defb 000h		;ac96	00 	. 
	defb 000h		;ac97	00 	. 
	defb 000h		;ac98	00 	. 
	defb 000h		;ac99	00 	. 
	defb 000h		;ac9a	00 	. 
	defb 000h		;ac9b	00 	. 
	defb 000h		;ac9c	00 	. 
	defb 000h		;ac9d	00 	. 
	defb 000h		;ac9e	00 	. 
	defb 000h		;ac9f	00 	. 
	defb 000h		;aca0	00 	. 
	defb 000h		;aca1	00 	. 
	defb 000h		;aca2	00 	. 
	defb 000h		;aca3	00 	. 
	defb 000h		;aca4	00 	. 
	defb 000h		;aca5	00 	. 
	defb 000h		;aca6	00 	. 
	defb 000h		;aca7	00 	. 
	defb 000h		;aca8	00 	. 
	defb 000h		;aca9	00 	. 
	defb 000h		;acaa	00 	. 
	defb 000h		;acab	00 	. 
	defb 000h		;acac	00 	. 
	defb 000h		;acad	00 	. 
	defb 000h		;acae	00 	. 
	defb 000h		;acaf	00 	. 
	defb 000h		;acb0	00 	. 
	defb 000h		;acb1	00 	. 
	defb 000h		;acb2	00 	. 
	defb 000h		;acb3	00 	. 
	defb 000h		;acb4	00 	. 
	defb 000h		;acb5	00 	. 
	defb 000h		;acb6	00 	. 
	defb 000h		;acb7	00 	. 
	defb 000h		;acb8	00 	. 
	defb 000h		;acb9	00 	. 
	defb 000h		;acba	00 	. 
	defb 000h		;acbb	00 	. 
	defb 000h		;acbc	00 	. 
	defb 000h		;acbd	00 	. 
	defb 000h		;acbe	00 	. 
	defb 000h		;acbf	00 	. 
	defb 000h		;acc0	00 	. 
	defb 000h		;acc1	00 	. 
	defb 000h		;acc2	00 	. 
	defb 000h		;acc3	00 	. 
	defb 000h		;acc4	00 	. 
	defb 000h		;acc5	00 	. 
	defb 000h		;acc6	00 	. 
	defb 000h		;acc7	00 	. 
	defb 000h		;acc8	00 	. 
	defb 000h		;acc9	00 	. 
	defb 000h		;acca	00 	. 
	defb 000h		;accb	00 	. 
	defb 000h		;accc	00 	. 
	defb 000h		;accd	00 	. 
	defb 000h		;acce	00 	. 
	defb 0a2h		;accf	a2 	. 
	defb 001h		;acd0	01 	. 
	defb 060h		;acd1	60 	` 
	defb 000h		;acd2	00 	. 
	defb 000h		;acd3	00 	. 
	defb 000h		;acd4	00 	. 
	defb 000h		;acd5	00 	. 
	defb 000h		;acd6	00 	. 
	defb 000h		;acd7	00 	. 
	defb 000h		;acd8	00 	. 
	defb 000h		;acd9	00 	. 
	defb 000h		;acda	00 	. 
	defb 000h		;acdb	00 	. 
	defb 000h		;acdc	00 	. 
	defb 000h		;acdd	00 	. 
	defb 000h		;acde	00 	. 
	defb 000h		;acdf	00 	. 
	defb 000h		;ace0	00 	. 
	defb 000h		;ace1	00 	. 
	defb 000h		;ace2	00 	. 
	defb 000h		;ace3	00 	. 
	defb 000h		;ace4	00 	. 
	defb 000h		;ace5	00 	. 
	defb 000h		;ace6	00 	. 
	defb 000h		;ace7	00 	. 
	defb 0a2h		;ace8	a2 	. 
	defb 001h		;ace9	01 	. 
	defb 061h		;acea	61 	a 
	defb 000h		;aceb	00 	. 
	defb 000h		;acec	00 	. 
	defb 000h		;aced	00 	. 
	defb 000h		;acee	00 	. 
	defb 000h		;acef	00 	. 
	defb 000h		;acf0	00 	. 
	defb 000h		;acf1	00 	. 
	defb 000h		;acf2	00 	. 
	defb 000h		;acf3	00 	. 
	defb 000h		;acf4	00 	. 
	defb 000h		;acf5	00 	. 
	defb 000h		;acf6	00 	. 
	defb 000h		;acf7	00 	. 
	defb 000h		;acf8	00 	. 
	defb 000h		;acf9	00 	. 
	defb 000h		;acfa	00 	. 
	defb 000h		;acfb	00 	. 
	defb 000h		;acfc	00 	. 
	defb 000h		;acfd	00 	. 
	defb 000h		;acfe	00 	. 
	defb 000h		;acff	00 	. 
	defb 000h		;ad00	00 	. 
	defb 0a2h		;ad01	a2 	. 
	defb 001h		;ad02	01 	. 
	defb 062h		;ad03	62 	b 
	defb 000h		;ad04	00 	. 
	defb 000h		;ad05	00 	. 
	defb 000h		;ad06	00 	. 
	defb 000h		;ad07	00 	. 
	defb 000h		;ad08	00 	. 
	defb 000h		;ad09	00 	. 
	defb 000h		;ad0a	00 	. 
	defb 000h		;ad0b	00 	. 
	defb 000h		;ad0c	00 	. 
	defb 000h		;ad0d	00 	. 
	defb 000h		;ad0e	00 	. 
	defb 000h		;ad0f	00 	. 
	defb 000h		;ad10	00 	. 
	defb 000h		;ad11	00 	. 
	defb 000h		;ad12	00 	. 
	defb 000h		;ad13	00 	. 
	defb 000h		;ad14	00 	. 
	defb 000h		;ad15	00 	. 
	defb 000h		;ad16	00 	. 
	defb 000h		;ad17	00 	. 
	defb 000h		;ad18	00 	. 
	defb 000h		;ad19	00 	. 
	defb 0a2h		;ad1a	a2 	. 
	defb 001h		;ad1b	01 	. 
	defb 063h		;ad1c	63 	c 
	defb 000h		;ad1d	00 	. 
	defb 000h		;ad1e	00 	. 
	defb 000h		;ad1f	00 	. 
	defb 000h		;ad20	00 	. 
	defb 000h		;ad21	00 	. 
	defb 000h		;ad22	00 	. 
	defb 000h		;ad23	00 	. 
	defb 000h		;ad24	00 	. 
	defb 000h		;ad25	00 	. 
	defb 000h		;ad26	00 	. 
	defb 000h		;ad27	00 	. 
	defb 000h		;ad28	00 	. 
	defb 000h		;ad29	00 	. 
	defb 000h		;ad2a	00 	. 
	defb 000h		;ad2b	00 	. 
	defb 000h		;ad2c	00 	. 
	defb 000h		;ad2d	00 	. 
	defb 000h		;ad2e	00 	. 
	defb 000h		;ad2f	00 	. 
	defb 000h		;ad30	00 	. 
	defb 000h		;ad31	00 	. 
	defb 000h		;ad32	00 	. 
	defb 0a2h		;ad33	a2 	. 
	defb 001h		;ad34	01 	. 
	defb 064h		;ad35	64 	d 
	defb 000h		;ad36	00 	. 
	defb 000h		;ad37	00 	. 
	defb 000h		;ad38	00 	. 
	defb 000h		;ad39	00 	. 
	defb 000h		;ad3a	00 	. 
	defb 000h		;ad3b	00 	. 
	defb 000h		;ad3c	00 	. 
	defb 000h		;ad3d	00 	. 
	defb 000h		;ad3e	00 	. 
	defb 000h		;ad3f	00 	. 
	defb 000h		;ad40	00 	. 
	defb 000h		;ad41	00 	. 
	defb 000h		;ad42	00 	. 
	defb 000h		;ad43	00 	. 
	defb 000h		;ad44	00 	. 
	defb 000h		;ad45	00 	. 
	defb 000h		;ad46	00 	. 
	defb 000h		;ad47	00 	. 
	defb 000h		;ad48	00 	. 
	defb 000h		;ad49	00 	. 
	defb 000h		;ad4a	00 	. 
	defb 000h		;ad4b	00 	. 
	defb 0a2h		;ad4c	a2 	. 
	defb 001h		;ad4d	01 	. 
	defb 065h		;ad4e	65 	e 
	defb 000h		;ad4f	00 	. 
	defb 000h		;ad50	00 	. 
	defb 000h		;ad51	00 	. 
	defb 000h		;ad52	00 	. 
	defb 000h		;ad53	00 	. 
	defb 000h		;ad54	00 	. 
	defb 000h		;ad55	00 	. 
	defb 000h		;ad56	00 	. 
	defb 000h		;ad57	00 	. 
	defb 000h		;ad58	00 	. 
	defb 000h		;ad59	00 	. 
	defb 000h		;ad5a	00 	. 
	defb 000h		;ad5b	00 	. 
	defb 000h		;ad5c	00 	. 
	defb 000h		;ad5d	00 	. 
	defb 000h		;ad5e	00 	. 
	defb 000h		;ad5f	00 	. 
	defb 000h		;ad60	00 	. 
	defb 000h		;ad61	00 	. 
	defb 000h		;ad62	00 	. 
	defb 000h		;ad63	00 	. 
	defb 000h		;ad64	00 	. 
	defb 0a2h		;ad65	a2 	. 
	defb 001h		;ad66	01 	. 
	defb 066h		;ad67	66 	f 
	defb 000h		;ad68	00 	. 
	defb 000h		;ad69	00 	. 
	defb 000h		;ad6a	00 	. 
	defb 000h		;ad6b	00 	. 
	defb 000h		;ad6c	00 	. 
	defb 000h		;ad6d	00 	. 
	defb 000h		;ad6e	00 	. 
	defb 000h		;ad6f	00 	. 
	defb 000h		;ad70	00 	. 
	defb 000h		;ad71	00 	. 
	defb 000h		;ad72	00 	. 
	defb 000h		;ad73	00 	. 
	defb 000h		;ad74	00 	. 
	defb 000h		;ad75	00 	. 
	defb 000h		;ad76	00 	. 
	defb 000h		;ad77	00 	. 
	defb 000h		;ad78	00 	. 
	defb 000h		;ad79	00 	. 
	defb 000h		;ad7a	00 	. 
	defb 000h		;ad7b	00 	. 
	defb 000h		;ad7c	00 	. 
	defb 000h		;ad7d	00 	. 
	defb 0a2h		;ad7e	a2 	. 
	defb 001h		;ad7f	01 	. 
	defb 067h		;ad80	67 	g 
	defb 000h		;ad81	00 	. 
	defb 000h		;ad82	00 	. 
	defb 000h		;ad83	00 	. 
	defb 000h		;ad84	00 	. 
	defb 000h		;ad85	00 	. 
	defb 000h		;ad86	00 	. 
	defb 000h		;ad87	00 	. 
	defb 000h		;ad88	00 	. 
	defb 000h		;ad89	00 	. 
	defb 000h		;ad8a	00 	. 
	defb 000h		;ad8b	00 	. 
	defb 000h		;ad8c	00 	. 
	defb 000h		;ad8d	00 	. 
	defb 000h		;ad8e	00 	. 
	defb 000h		;ad8f	00 	. 
	defb 000h		;ad90	00 	. 
	defb 000h		;ad91	00 	. 
	defb 000h		;ad92	00 	. 
	defb 000h		;ad93	00 	. 
	defb 000h		;ad94	00 	. 
	defb 000h		;ad95	00 	. 
	defb 000h		;ad96	00 	. 
	defb 0a2h		;ad97	a2 	. 
	defb 001h		;ad98	01 	. 
	defb 068h		;ad99	68 	h 
	defb 000h		;ad9a	00 	. 
	defb 000h		;ad9b	00 	. 
	defb 000h		;ad9c	00 	. 
	defb 000h		;ad9d	00 	. 
	defb 000h		;ad9e	00 	. 
	defb 000h		;ad9f	00 	. 
	defb 000h		;ada0	00 	. 
	defb 000h		;ada1	00 	. 
	defb 000h		;ada2	00 	. 
	defb 000h		;ada3	00 	. 
	defb 000h		;ada4	00 	. 
	defb 000h		;ada5	00 	. 
	defb 000h		;ada6	00 	. 
	defb 000h		;ada7	00 	. 
	defb 000h		;ada8	00 	. 
	defb 000h		;ada9	00 	. 
	defb 000h		;adaa	00 	. 
	defb 000h		;adab	00 	. 
	defb 000h		;adac	00 	. 
	defb 000h		;adad	00 	. 
	defb 000h		;adae	00 	. 
	defb 000h		;adaf	00 	. 
	defb 0a2h		;adb0	a2 	. 
	defb 001h		;adb1	01 	. 
	defb 069h		;adb2	69 	i 
	defb 000h		;adb3	00 	. 
	defb 000h		;adb4	00 	. 
	defb 000h		;adb5	00 	. 
	defb 000h		;adb6	00 	. 
	defb 000h		;adb7	00 	. 
	defb 000h		;adb8	00 	. 
	defb 000h		;adb9	00 	. 
	defb 000h		;adba	00 	. 
	defb 000h		;adbb	00 	. 
	defb 000h		;adbc	00 	. 
	defb 000h		;adbd	00 	. 
	defb 000h		;adbe	00 	. 
	defb 000h		;adbf	00 	. 
	defb 000h		;adc0	00 	. 
	defb 000h		;adc1	00 	. 
	defb 000h		;adc2	00 	. 
	defb 000h		;adc3	00 	. 
	defb 000h		;adc4	00 	. 
	defb 000h		;adc5	00 	. 
	defb 000h		;adc6	00 	. 
	defb 000h		;adc7	00 	. 
	defb 000h		;adc8	00 	. 
	defb 0a2h		;adc9	a2 	. 
	defb 001h		;adca	01 	. 
	defb 069h		;adcb	69 	i 
	defb 000h		;adcc	00 	. 
	defb 000h		;adcd	00 	. 
	defb 000h		;adce	00 	. 
	defb 000h		;adcf	00 	. 
	defb 000h		;add0	00 	. 
	defb 000h		;add1	00 	. 
	defb 000h		;add2	00 	. 
	defb 000h		;add3	00 	. 
	defb 000h		;add4	00 	. 
	defb 000h		;add5	00 	. 
	defb 000h		;add6	00 	. 
	defb 000h		;add7	00 	. 
	defb 000h		;add8	00 	. 
	defb 000h		;add9	00 	. 
	defb 000h		;adda	00 	. 
	defb 000h		;addb	00 	. 
	defb 000h		;addc	00 	. 
	defb 000h		;addd	00 	. 
	defb 000h		;adde	00 	. 
	defb 000h		;addf	00 	. 
	defb 000h		;ade0	00 	. 
	defb 000h		;ade1	00 	. 
	defb 0a2h		;ade2	a2 	. 
	defb 001h		;ade3	01 	. 
	defb 06ah		;ade4	6a 	j 
	defb 000h		;ade5	00 	. 
	defb 000h		;ade6	00 	. 
	defb 000h		;ade7	00 	. 
	defb 000h		;ade8	00 	. 
	defb 000h		;ade9	00 	. 
	defb 000h		;adea	00 	. 
	defb 000h		;adeb	00 	. 
	defb 000h		;adec	00 	. 
	defb 000h		;aded	00 	. 
	defb 000h		;adee	00 	. 
	defb 000h		;adef	00 	. 
	defb 000h		;adf0	00 	. 
	defb 000h		;adf1	00 	. 
	defb 000h		;adf2	00 	. 
	defb 000h		;adf3	00 	. 
	defb 000h		;adf4	00 	. 
	defb 000h		;adf5	00 	. 
	defb 000h		;adf6	00 	. 
	defb 000h		;adf7	00 	. 
	defb 000h		;adf8	00 	. 
	defb 000h		;adf9	00 	. 
	defb 000h		;adfa	00 	. 
	defb 000h		;adfb	00 	. 
	defb 000h		;adfc	00 	. 
	defb 000h		;adfd	00 	. 
	defb 000h		;adfe	00 	. 
	defb 000h		;adff	00 	. 
	defb 000h		;ae00	00 	. 
	defb 000h		;ae01	00 	. 
	defb 000h		;ae02	00 	. 
	defb 000h		;ae03	00 	. 
	defb 000h		;ae04	00 	. 
	defb 000h		;ae05	00 	. 
	defb 000h		;ae06	00 	. 
	defb 000h		;ae07	00 	. 
	defb 000h		;ae08	00 	. 
	defb 000h		;ae09	00 	. 
	defb 000h		;ae0a	00 	. 
	defb 000h		;ae0b	00 	. 
	defb 000h		;ae0c	00 	. 
	defb 000h		;ae0d	00 	. 
	defb 000h		;ae0e	00 	. 
	defb 000h		;ae0f	00 	. 
	defb 000h		;ae10	00 	. 
	defb 000h		;ae11	00 	. 
	defb 000h		;ae12	00 	. 
	defb 000h		;ae13	00 	. 
	defb 000h		;ae14	00 	. 
	defb 000h		;ae15	00 	. 
	defb 000h		;ae16	00 	. 
	defb 000h		;ae17	00 	. 
	defb 000h		;ae18	00 	. 
	defb 000h		;ae19	00 	. 
	defb 000h		;ae1a	00 	. 
	defb 000h		;ae1b	00 	. 
	defb 000h		;ae1c	00 	. 
	defb 000h		;ae1d	00 	. 
	defb 000h		;ae1e	00 	. 
	defb 000h		;ae1f	00 	. 
	defb 000h		;ae20	00 	. 
	defb 000h		;ae21	00 	. 
	defb 000h		;ae22	00 	. 
	defb 000h		;ae23	00 	. 
	defb 000h		;ae24	00 	. 
	defb 000h		;ae25	00 	. 
	defb 000h		;ae26	00 	. 
	defb 000h		;ae27	00 	. 
	defb 000h		;ae28	00 	. 
	defb 000h		;ae29	00 	. 
	defb 000h		;ae2a	00 	. 
	defb 000h		;ae2b	00 	. 
	defb 000h		;ae2c	00 	. 
	defb 000h		;ae2d	00 	. 
	defb 000h		;ae2e	00 	. 
	defb 000h		;ae2f	00 	. 
	defb 000h		;ae30	00 	. 
	defb 000h		;ae31	00 	. 
	defb 000h		;ae32	00 	. 
	defb 000h		;ae33	00 	. 
	defb 000h		;ae34	00 	. 
	defb 000h		;ae35	00 	. 
	defb 000h		;ae36	00 	. 
	defb 000h		;ae37	00 	. 
	defb 000h		;ae38	00 	. 
	defb 000h		;ae39	00 	. 
	defb 000h		;ae3a	00 	. 
	defb 000h		;ae3b	00 	. 
	defb 000h		;ae3c	00 	. 
	defb 000h		;ae3d	00 	. 
	defb 000h		;ae3e	00 	. 
	defb 000h		;ae3f	00 	. 
	defb 000h		;ae40	00 	. 
	defb 000h		;ae41	00 	. 
	defb 000h		;ae42	00 	. 
	defb 000h		;ae43	00 	. 
	defb 000h		;ae44	00 	. 
	defb 000h		;ae45	00 	. 
	defb 000h		;ae46	00 	. 
	defb 000h		;ae47	00 	. 
	defb 000h		;ae48	00 	. 
	defb 000h		;ae49	00 	. 
	defb 000h		;ae4a	00 	. 
	defb 000h		;ae4b	00 	. 
	defb 000h		;ae4c	00 	. 
	defb 000h		;ae4d	00 	. 
	defb 000h		;ae4e	00 	. 
	defb 000h		;ae4f	00 	. 
	defb 000h		;ae50	00 	. 
	defb 000h		;ae51	00 	. 
	defb 000h		;ae52	00 	. 
	defb 000h		;ae53	00 	. 
	defb 000h		;ae54	00 	. 
	defb 000h		;ae55	00 	. 
	defb 000h		;ae56	00 	. 
	defb 000h		;ae57	00 	. 
	defb 000h		;ae58	00 	. 
	defb 000h		;ae59	00 	. 
	defb 000h		;ae5a	00 	. 
	defb 000h		;ae5b	00 	. 
	defb 000h		;ae5c	00 	. 
	defb 000h		;ae5d	00 	. 
	defb 000h		;ae5e	00 	. 
	defb 000h		;ae5f	00 	. 
	defb 000h		;ae60	00 	. 
	defb 000h		;ae61	00 	. 
	defb 000h		;ae62	00 	. 
	defb 000h		;ae63	00 	. 
	defb 000h		;ae64	00 	. 
	defb 000h		;ae65	00 	. 
	defb 000h		;ae66	00 	. 
	defb 000h		;ae67	00 	. 
	defb 000h		;ae68	00 	. 
	defb 000h		;ae69	00 	. 
	defb 000h		;ae6a	00 	. 
	defb 000h		;ae6b	00 	. 
	defb 000h		;ae6c	00 	. 
	defb 000h		;ae6d	00 	. 
	defb 000h		;ae6e	00 	. 
	defb 000h		;ae6f	00 	. 
	defb 000h		;ae70	00 	. 
	defb 000h		;ae71	00 	. 
	defb 000h		;ae72	00 	. 
	defb 000h		;ae73	00 	. 
	defb 000h		;ae74	00 	. 
	defb 000h		;ae75	00 	. 
	defb 000h		;ae76	00 	. 
	defb 000h		;ae77	00 	. 
	defb 000h		;ae78	00 	. 
	defb 000h		;ae79	00 	. 
	defb 000h		;ae7a	00 	. 
	defb 000h		;ae7b	00 	. 
	defb 000h		;ae7c	00 	. 
	defb 000h		;ae7d	00 	. 
	defb 000h		;ae7e	00 	. 
	defb 000h		;ae7f	00 	. 
	defb 000h		;ae80	00 	. 
	defb 000h		;ae81	00 	. 
	defb 000h		;ae82	00 	. 
lae83h:
	defb 073h		;ae83	73 	s 
	defb 000h		;ae84	00 	. 
	defb 000h		;ae85	00 	. 
	defb 000h		;ae86	00 	. 
	defb 072h		;ae87	72 	r 
	defb 000h		;ae88	00 	. 
	defb 019h		;ae89	19 	. 
	defb 000h		;ae8a	00 	. 
	defb 071h		;ae8b	71 	q 
	defb 000h		;ae8c	00 	. 
	defb 032h		;ae8d	32 	2 
	defb 000h		;ae8e	00 	. 
	defb 001h		;ae8f	01 	. 
	defb 000h		;ae90	00 	. 
	defb 04bh		;ae91	4b 	K 
	defb 000h		;ae92	00 	. 
	defb 003h		;ae93	03 	. 
	defb 000h		;ae94	00 	. 
	defb 064h		;ae95	64 	d 
	defb 000h		;ae96	00 	. 
	defb 004h		;ae97	04 	. 
	defb 000h		;ae98	00 	. 
	defb 07dh		;ae99	7d 	} 
	defb 000h		;ae9a	00 	. 
	defb 005h		;ae9b	05 	. 
	defb 000h		;ae9c	00 	. 
	defb 096h		;ae9d	96 	. 
	defb 000h		;ae9e	00 	. 
	defb 006h		;ae9f	06 	. 
	defb 000h		;aea0	00 	. 
	defb 0afh		;aea1	af 	. 
	defb 000h		;aea2	00 	. 
	defb 007h		;aea3	07 	. 
	defb 000h		;aea4	00 	. 
	defb 0c8h		;aea5	c8 	. 
	defb 000h		;aea6	00 	. 
	defb 009h		;aea7	09 	. 
	defb 000h		;aea8	00 	. 
	defb 0e1h		;aea9	e1 	. 
	defb 000h		;aeaa	00 	. 
	defb 008h		;aeab	08 	. 
	defb 000h		;aeac	00 	. 
	defb 0fah		;aead	fa 	. 
	defb 000h		;aeae	00 	. 
	defb 00ah		;aeaf	0a 	. 
	defb 000h		;aeb0	00 	. 
	defb 013h		;aeb1	13 	. 
	defb 001h		;aeb2	01 	. 
	defb 00bh		;aeb3	0b 	. 
	defb 000h		;aeb4	00 	. 
	defb 02ch		;aeb5	2c 	, 
	defb 001h		;aeb6	01 	. 
	defb 00ch		;aeb7	0c 	. 
	defb 000h		;aeb8	00 	. 
	defb 045h		;aeb9	45 	E 
	defb 001h		;aeba	01 	. 
	defb 00eh		;aebb	0e 	. 
	defb 000h		;aebc	00 	. 
	defb 05eh		;aebd	5e 	^ 
	defb 001h		;aebe	01 	. 
	defb 00fh		;aebf	0f 	. 
	defb 000h		;aec0	00 	. 
	defb 077h		;aec1	77 	w 
	defb 001h		;aec2	01 	. 
	defb 01fh		;aec3	1f 	. 
	defb 000h		;aec4	00 	. 
	defb 090h		;aec5	90 	. 
	defb 001h		;aec6	01 	. 
	defb 01eh		;aec7	1e 	. 
	defb 000h		;aec8	00 	. 
	defb 0a9h		;aec9	a9 	. 
	defb 001h		;aeca	01 	. 
	defb 072h		;aecb	72 	r 
	defb 001h		;aecc	01 	. 
	defb 0c2h		;aecd	c2 	. 
	defb 001h		;aece	01 	. 
	defb 071h		;aecf	71 	q 
	defb 001h		;aed0	01 	. 
	defb 0dbh		;aed1	db 	. 
	defb 001h		;aed2	01 	. 
	defb 001h		;aed3	01 	. 
	defb 001h		;aed4	01 	. 
	defb 0f4h		;aed5	f4 	. 
	defb 001h		;aed6	01 	. 
	defb 003h		;aed7	03 	. 
	defb 001h		;aed8	01 	. 
	defb 00dh		;aed9	0d 	. 
	defb 002h		;aeda	02 	. 
	defb 004h		;aedb	04 	. 
	defb 001h		;aedc	01 	. 
	defb 026h		;aedd	26 	& 
	defb 002h		;aede	02 	. 
	defb 005h		;aedf	05 	. 
	defb 001h		;aee0	01 	. 
	defb 03fh		;aee1	3f 	? 
	defb 002h		;aee2	02 	. 
	defb 006h		;aee3	06 	. 
	defb 001h		;aee4	01 	. 
	defb 058h		;aee5	58 	X 
	defb 002h		;aee6	02 	. 
	defb 007h		;aee7	07 	. 
	defb 001h		;aee8	01 	. 
	defb 071h		;aee9	71 	q 
	defb 002h		;aeea	02 	. 
	defb 009h		;aeeb	09 	. 
	defb 001h		;aeec	01 	. 
	defb 08ah		;aeed	8a 	. 
	defb 002h		;aeee	02 	. 
	defb 008h		;aeef	08 	. 
	defb 001h		;aef0	01 	. 
	defb 0a3h		;aef1	a3 	. 
	defb 002h		;aef2	02 	. 
	defb 00ah		;aef3	0a 	. 
	defb 001h		;aef4	01 	. 
	defb 0bch		;aef5	bc 	. 
	defb 002h		;aef6	02 	. 
	defb 00bh		;aef7	0b 	. 
	defb 001h		;aef8	01 	. 
	defb 0d5h		;aef9	d5 	. 
	defb 002h		;aefa	02 	. 
	defb 00ch		;aefb	0c 	. 
	defb 001h		;aefc	01 	. 
	defb 0eeh		;aefd	ee 	. 
	defb 002h		;aefe	02 	. 
	defb 00eh		;aeff	0e 	. 
	defb 001h		;af00	01 	. 
	defb 007h		;af01	07 	. 
	defb 003h		;af02	03 	. 
	defb 00fh		;af03	0f 	. 
	defb 001h		;af04	01 	. 
	defb 020h		;af05	20 	  
	defb 003h		;af06	03 	. 
	defb 01fh		;af07	1f 	. 
	defb 001h		;af08	01 	. 
	defb 039h		;af09	39 	9 
	defb 003h		;af0a	03 	. 
	defb 01eh		;af0b	1e 	. 
	defb 001h		;af0c	01 	. 
	defb 052h		;af0d	52 	R 
	defb 003h		;af0e	03 	. 
	defb 040h		;af0f	40 	@ 
	defb 000h		;af10	00 	. 
	defb 000h		;af11	00 	. 
	defb 000h		;af12	00 	. 
	defb 000h		;af13	00 	. 
	defb 000h		;af14	00 	. 
	defb 000h		;af15	00 	. 
	defb 000h		;af16	00 	. 
	defb 000h		;af17	00 	. 
	defb 000h		;af18	00 	. 
	defb 000h		;af19	00 	. 
	defb 000h		;af1a	00 	. 
	defb 000h		;af1b	00 	. 
	defb 000h		;af1c	00 	. 
	defb 000h		;af1d	00 	. 
	defb 000h		;af1e	00 	. 
	defb 000h		;af1f	00 	. 
	defb 000h		;af20	00 	. 
	defb 000h		;af21	00 	. 
	defb 000h		;af22	00 	. 
	defb 000h		;af23	00 	. 
	defb 000h		;af24	00 	. 
	defb 000h		;af25	00 	. 
	defb 000h		;af26	00 	. 
	defb 000h		;af27	00 	. 
	defb 0a5h		;af28	a5 	. 
	defb 053h		;af29	53 	S 
	defb 045h		;af2a	45 	E 
	defb 054h		;af2b	54 	T 
	defb 055h		;af2c	55 	U 
	defb 050h		;af2d	50 	P 
	defb 020h		;af2e	20 	  
	defb 020h		;af2f	20 	  
	defb 020h		;af30	20 	  
	defb 020h		;af31	20 	  
	defb 020h		;af32	20 	  
	defb 020h		;af33	20 	  
	defb 020h		;af34	20 	  
	defb 020h		;af35	20 	  
	defb 020h		;af36	20 	  
	defb 020h		;af37	20 	  
	defb 020h		;af38	20 	  
	defb 020h		;af39	20 	  
	defb 020h		;af3a	20 	  
	defb 020h		;af3b	20 	  
	defb 020h		;af3c	20 	  
	defb 020h		;af3d	20 	  
	defb 020h		;af3e	20 	  
	defb 020h		;af3f	20 	  
	defb 020h		;af40	20 	  
	defb 0a8h		;af41	a8 	. 
	defb 043h		;af42	43 	C 
	defb 04fh		;af43	4f 	O 
	defb 050h		;af44	50 	P 
	defb 059h		;af45	59 	Y 
	defb 044h		;af46	44 	D 
	defb 049h		;af47	49 	I 
	defb 053h		;af48	53 	S 
	defb 04bh		;af49	4b 	K 
	defb 020h		;af4a	20 	  
	defb 020h		;af4b	20 	  
	defb 020h		;af4c	20 	  
	defb 020h		;af4d	20 	  
	defb 020h		;af4e	20 	  
	defb 020h		;af4f	20 	  
	defb 020h		;af50	20 	  
	defb 020h		;af51	20 	  
	defb 020h		;af52	20 	  
	defb 020h		;af53	20 	  
	defb 020h		;af54	20 	  
	defb 020h		;af55	20 	  
	defb 020h		;af56	20 	  
	defb 020h		;af57	20 	  
	defb 020h		;af58	20 	  
	defb 020h		;af59	20 	  
	defb 000h		;af5a	00 	. 
	defb 000h		;af5b	00 	. 
	defb 000h		;af5c	00 	. 
	defb 000h		;af5d	00 	. 
	defb 000h		;af5e	00 	. 
	defb 000h		;af5f	00 	. 
	defb 000h		;af60	00 	. 
	defb 000h		;af61	00 	. 
	defb 000h		;af62	00 	. 
	defb 000h		;af63	00 	. 
	defb 000h		;af64	00 	. 
	defb 000h		;af65	00 	. 
	defb 000h		;af66	00 	. 
	defb 000h		;af67	00 	. 
	defb 000h		;af68	00 	. 
	defb 000h		;af69	00 	. 
	defb 000h		;af6a	00 	. 
	defb 000h		;af6b	00 	. 
	defb 000h		;af6c	00 	. 
	defb 000h		;af6d	00 	. 
	defb 000h		;af6e	00 	. 
	defb 000h		;af6f	00 	. 
	defb 000h		;af70	00 	. 
	defb 000h		;af71	00 	. 
	defb 000h		;af72	00 	. 
	defb 000h		;af73	00 	. 
	defb 000h		;af74	00 	. 
	defb 000h		;af75	00 	. 
	defb 000h		;af76	00 	. 
	defb 000h		;af77	00 	. 
	defb 000h		;af78	00 	. 
	defb 000h		;af79	00 	. 
	defb 000h		;af7a	00 	. 
	defb 000h		;af7b	00 	. 
	defb 000h		;af7c	00 	. 
	defb 000h		;af7d	00 	. 
	defb 000h		;af7e	00 	. 
	defb 000h		;af7f	00 	. 
	defb 000h		;af80	00 	. 
	defb 000h		;af81	00 	. 
	defb 000h		;af82	00 	. 
	defb 000h		;af83	00 	. 
	defb 000h		;af84	00 	. 
	defb 000h		;af85	00 	. 
	defb 000h		;af86	00 	. 
	defb 000h		;af87	00 	. 
	defb 000h		;af88	00 	. 
	defb 000h		;af89	00 	. 
	defb 000h		;af8a	00 	. 
	defb 000h		;af8b	00 	. 
	defb 000h		;af8c	00 	. 
	defb 000h		;af8d	00 	. 
	defb 000h		;af8e	00 	. 
	defb 000h		;af8f	00 	. 
	defb 000h		;af90	00 	. 
	defb 000h		;af91	00 	. 
	defb 000h		;af92	00 	. 
	defb 000h		;af93	00 	. 
	defb 000h		;af94	00 	. 
	defb 000h		;af95	00 	. 
	defb 000h		;af96	00 	. 
	defb 000h		;af97	00 	. 
	defb 000h		;af98	00 	. 
	defb 000h		;af99	00 	. 
	defb 000h		;af9a	00 	. 
	defb 000h		;af9b	00 	. 
	defb 000h		;af9c	00 	. 
	defb 000h		;af9d	00 	. 
	defb 000h		;af9e	00 	. 
	defb 000h		;af9f	00 	. 
	defb 000h		;afa0	00 	. 
	defb 000h		;afa1	00 	. 
	defb 000h		;afa2	00 	. 
	defb 000h		;afa3	00 	. 
	defb 000h		;afa4	00 	. 
	defb 000h		;afa5	00 	. 
	defb 000h		;afa6	00 	. 
	defb 000h		;afa7	00 	. 
	defb 000h		;afa8	00 	. 
	defb 000h		;afa9	00 	. 
	defb 000h		;afaa	00 	. 
	defb 000h		;afab	00 	. 
	defb 000h		;afac	00 	. 
	defb 000h		;afad	00 	. 
	defb 000h		;afae	00 	. 
	defb 000h		;afaf	00 	. 
	defb 000h		;afb0	00 	. 
	defb 000h		;afb1	00 	. 
	defb 000h		;afb2	00 	. 
	defb 000h		;afb3	00 	. 
	defb 000h		;afb4	00 	. 
	defb 000h		;afb5	00 	. 
	defb 000h		;afb6	00 	. 
	defb 000h		;afb7	00 	. 
	defb 000h		;afb8	00 	. 
	defb 000h		;afb9	00 	. 
	defb 000h		;afba	00 	. 
	defb 000h		;afbb	00 	. 
	defb 000h		;afbc	00 	. 
	defb 000h		;afbd	00 	. 
	defb 0a7h		;afbe	a7 	. 
	defb 049h		;afbf	49 	I 
	defb 04eh		;afc0	4e 	N 
	defb 044h		;afc1	44 	D 
	defb 045h		;afc2	45 	E 
	defb 058h		;afc3	58 	X 
	defb 045h		;afc4	45 	E 
	defb 052h		;afc5	52 	R 
	defb 020h		;afc6	20 	  
	defb 020h		;afc7	20 	  
	defb 020h		;afc8	20 	  
	defb 020h		;afc9	20 	  
	defb 020h		;afca	20 	  
	defb 020h		;afcb	20 	  
	defb 020h		;afcc	20 	  
	defb 020h		;afcd	20 	  
	defb 020h		;afce	20 	  
	defb 020h		;afcf	20 	  
	defb 020h		;afd0	20 	  
	defb 020h		;afd1	20 	  
	defb 020h		;afd2	20 	  
	defb 020h		;afd3	20 	  
	defb 020h		;afd4	20 	  
	defb 020h		;afd5	20 	  
	defb 020h		;afd6	20 	  
	defb 086h		;afd7	86 	. 
	defb 04dh		;afd8	4d 	M 
	defb 054h		;afd9	54 	T 
	defb 045h		;afda	45 	E 
	defb 052h		;afdb	52 	R 
	defb 04dh		;afdc	4d 	M 
	defb 020h		;afdd	20 	  
	defb 020h		;afde	20 	  
	defb 020h		;afdf	20 	  
	defb 020h		;afe0	20 	  
	defb 020h		;afe1	20 	  
	defb 020h		;afe2	20 	  
	defb 020h		;afe3	20 	  
	defb 020h		;afe4	20 	  
	defb 020h		;afe5	20 	  
	defb 020h		;afe6	20 	  
	defb 020h		;afe7	20 	  
	defb 020h		;afe8	20 	  
	defb 020h		;afe9	20 	  
	defb 020h		;afea	20 	  
	defb 020h		;afeb	20 	  
	defb 020h		;afec	20 	  
	defb 020h		;afed	20 	  
	defb 020h		;afee	20 	  
	defb 020h		;afef	20 	  
	defb 0a4h		;aff0	a4 	. 
	defb 04dh		;aff1	4d 	M 
	defb 045h		;aff2	45 	E 
	defb 04eh		;aff3	4e 	N 
	defb 055h		;aff4	55 	U 
	defb 020h		;aff5	20 	  
	defb 020h		;aff6	20 	  
	defb 020h		;aff7	20 	  
	defb 020h		;aff8	20 	  
	defb 020h		;aff9	20 	  
	defb 020h		;affa	20 	  
	defb 020h		;affb	20 	  
	defb 020h		;affc	20 	  
	defb 020h		;affd	20 	  
	defb 020h		;affe	20 	  
	defb 020h		;afff	20 	  
	defb 020h		;b000	20 	  
	defb 020h		;b001	20 	  
	defb 020h		;b002	20 	  
	defb 020h		;b003	20 	  
	defb 020h		;b004	20 	  
	defb 020h		;b005	20 	  
	defb 020h		;b006	20 	  
	defb 020h		;b007	20 	  
	defb 020h		;b008	20 	  
	defb 0a2h		;b009	a2 	. 
	defb 057h		;b00a	57 	W 
	defb 053h		;b00b	53 	S 
	defb 020h		;b00c	20 	  
	defb 020h		;b00d	20 	  
	defb 020h		;b00e	20 	  
	defb 020h		;b00f	20 	  
	defb 020h		;b010	20 	  
	defb 020h		;b011	20 	  
	defb 020h		;b012	20 	  
	defb 020h		;b013	20 	  
	defb 020h		;b014	20 	  
	defb 020h		;b015	20 	  
	defb 020h		;b016	20 	  
	defb 020h		;b017	20 	  
	defb 020h		;b018	20 	  
	defb 020h		;b019	20 	  
	defb 020h		;b01a	20 	  
	defb 020h		;b01b	20 	  
	defb 020h		;b01c	20 	  
	defb 020h		;b01d	20 	  
	defb 020h		;b01e	20 	  
	defb 020h		;b01f	20 	  
	defb 020h		;b020	20 	  
	defb 020h		;b021	20 	  
	defb 0a4h		;b022	a4 	. 
	defb 050h		;b023	50 	P 
	defb 04ch		;b024	4c 	L 
	defb 041h		;b025	41 	A 
	defb 04eh		;b026	4e 	N 
	defb 020h		;b027	20 	  
	defb 020h		;b028	20 	  
	defb 020h		;b029	20 	  
	defb 020h		;b02a	20 	  
	defb 020h		;b02b	20 	  
	defb 020h		;b02c	20 	  
	defb 020h		;b02d	20 	  
	defb 020h		;b02e	20 	  
	defb 020h		;b02f	20 	  
	defb 020h		;b030	20 	  
	defb 020h		;b031	20 	  
	defb 020h		;b032	20 	  
	defb 020h		;b033	20 	  
	defb 020h		;b034	20 	  
	defb 020h		;b035	20 	  
	defb 020h		;b036	20 	  
	defb 020h		;b037	20 	  
	defb 020h		;b038	20 	  
	defb 020h		;b039	20 	  
	defb 020h		;b03a	20 	  
	defb 000h		;b03b	00 	. 
	defb 000h		;b03c	00 	. 
	defb 000h		;b03d	00 	. 
	defb 000h		;b03e	00 	. 
	defb 000h		;b03f	00 	. 
	defb 000h		;b040	00 	. 
	defb 000h		;b041	00 	. 
	defb 000h		;b042	00 	. 
	defb 000h		;b043	00 	. 
	defb 000h		;b044	00 	. 
	defb 000h		;b045	00 	. 
	defb 000h		;b046	00 	. 
	defb 000h		;b047	00 	. 
	defb 000h		;b048	00 	. 
	defb 000h		;b049	00 	. 
	defb 000h		;b04a	00 	. 
	defb 000h		;b04b	00 	. 
	defb 000h		;b04c	00 	. 
	defb 000h		;b04d	00 	. 
	defb 000h		;b04e	00 	. 
	defb 000h		;b04f	00 	. 
	defb 000h		;b050	00 	. 
	defb 000h		;b051	00 	. 
	defb 000h		;b052	00 	. 
	defb 000h		;b053	00 	. 
	defb 0a5h		;b054	a5 	. 
	defb 047h		;b055	47 	G 
	defb 050h		;b056	50 	P 
	defb 04ch		;b057	4c 	L 
	defb 041h		;b058	41 	A 
	defb 04eh		;b059	4e 	N 
	defb 020h		;b05a	20 	  
	defb 020h		;b05b	20 	  
	defb 020h		;b05c	20 	  
	defb 020h		;b05d	20 	  
	defb 020h		;b05e	20 	  
	defb 020h		;b05f	20 	  
	defb 020h		;b060	20 	  
	defb 020h		;b061	20 	  
	defb 020h		;b062	20 	  
	defb 020h		;b063	20 	  
	defb 020h		;b064	20 	  
	defb 020h		;b065	20 	  
	defb 020h		;b066	20 	  
	defb 020h		;b067	20 	  
	defb 020h		;b068	20 	  
	defb 020h		;b069	20 	  
	defb 020h		;b06a	20 	  
	defb 020h		;b06b	20 	  
	defb 020h		;b06c	20 	  
	defb 040h		;b06d	40 	@ 
	defb 000h		;b06e	00 	. 
	defb 000h		;b06f	00 	. 
	defb 000h		;b070	00 	. 
	defb 000h		;b071	00 	. 
	defb 000h		;b072	00 	. 
	defb 000h		;b073	00 	. 
	defb 000h		;b074	00 	. 
	defb 000h		;b075	00 	. 
	defb 000h		;b076	00 	. 
	defb 000h		;b077	00 	. 
	defb 000h		;b078	00 	. 
	defb 000h		;b079	00 	. 
	defb 000h		;b07a	00 	. 
	defb 000h		;b07b	00 	. 
	defb 000h		;b07c	00 	. 
	defb 000h		;b07d	00 	. 
	defb 000h		;b07e	00 	. 
	defb 000h		;b07f	00 	. 
	defb 000h		;b080	00 	. 
	defb 000h		;b081	00 	. 
	defb 000h		;b082	00 	. 
	defb 000h		;b083	00 	. 
	defb 000h		;b084	00 	. 
	defb 000h		;b085	00 	. 
	defb 040h		;b086	40 	@ 
	defb 000h		;b087	00 	. 
	defb 000h		;b088	00 	. 
	defb 000h		;b089	00 	. 
	defb 000h		;b08a	00 	. 
	defb 000h		;b08b	00 	. 
	defb 000h		;b08c	00 	. 
	defb 000h		;b08d	00 	. 
	defb 000h		;b08e	00 	. 
	defb 000h		;b08f	00 	. 
	defb 000h		;b090	00 	. 
	defb 000h		;b091	00 	. 
	defb 000h		;b092	00 	. 
	defb 000h		;b093	00 	. 
	defb 000h		;b094	00 	. 
	defb 000h		;b095	00 	. 
	defb 000h		;b096	00 	. 
	defb 000h		;b097	00 	. 
	defb 000h		;b098	00 	. 
	defb 000h		;b099	00 	. 
	defb 000h		;b09a	00 	. 
	defb 000h		;b09b	00 	. 
	defb 000h		;b09c	00 	. 
	defb 000h		;b09d	00 	. 
	defb 000h		;b09e	00 	. 
	defb 040h		;b09f	40 	@ 
	defb 000h		;b0a0	00 	. 
	defb 000h		;b0a1	00 	. 
	defb 000h		;b0a2	00 	. 
	defb 000h		;b0a3	00 	. 
	defb 000h		;b0a4	00 	. 
	defb 000h		;b0a5	00 	. 
	defb 000h		;b0a6	00 	. 
	defb 000h		;b0a7	00 	. 
	defb 000h		;b0a8	00 	. 
	defb 000h		;b0a9	00 	. 
	defb 000h		;b0aa	00 	. 
	defb 000h		;b0ab	00 	. 
	defb 000h		;b0ac	00 	. 
	defb 000h		;b0ad	00 	. 
	defb 000h		;b0ae	00 	. 
	defb 000h		;b0af	00 	. 
	defb 000h		;b0b0	00 	. 
	defb 000h		;b0b1	00 	. 
	defb 000h		;b0b2	00 	. 
	defb 000h		;b0b3	00 	. 
	defb 000h		;b0b4	00 	. 
	defb 000h		;b0b5	00 	. 
	defb 000h		;b0b6	00 	. 
	defb 000h		;b0b7	00 	. 
	defb 040h		;b0b8	40 	@ 
	defb 000h		;b0b9	00 	. 
	defb 000h		;b0ba	00 	. 
	defb 000h		;b0bb	00 	. 
	defb 000h		;b0bc	00 	. 
	defb 000h		;b0bd	00 	. 
	defb 000h		;b0be	00 	. 
	defb 000h		;b0bf	00 	. 
	defb 000h		;b0c0	00 	. 
	defb 000h		;b0c1	00 	. 
	defb 000h		;b0c2	00 	. 
	defb 000h		;b0c3	00 	. 
	defb 000h		;b0c4	00 	. 
	defb 000h		;b0c5	00 	. 
	defb 000h		;b0c6	00 	. 
	defb 000h		;b0c7	00 	. 
	defb 000h		;b0c8	00 	. 
	defb 000h		;b0c9	00 	. 
	defb 000h		;b0ca	00 	. 
	defb 000h		;b0cb	00 	. 
	defb 000h		;b0cc	00 	. 
	defb 000h		;b0cd	00 	. 
	defb 000h		;b0ce	00 	. 
	defb 000h		;b0cf	00 	. 
	defb 000h		;b0d0	00 	. 
	defb 000h		;b0d1	00 	. 
	defb 000h		;b0d2	00 	. 
	defb 000h		;b0d3	00 	. 
	defb 000h		;b0d4	00 	. 
	defb 000h		;b0d5	00 	. 
	defb 000h		;b0d6	00 	. 
	defb 000h		;b0d7	00 	. 
	defb 000h		;b0d8	00 	. 
	defb 000h		;b0d9	00 	. 
	defb 000h		;b0da	00 	. 
	defb 000h		;b0db	00 	. 
	defb 000h		;b0dc	00 	. 
	defb 000h		;b0dd	00 	. 
	defb 000h		;b0de	00 	. 
	defb 000h		;b0df	00 	. 
	defb 000h		;b0e0	00 	. 
	defb 000h		;b0e1	00 	. 
	defb 000h		;b0e2	00 	. 
	defb 000h		;b0e3	00 	. 
	defb 000h		;b0e4	00 	. 
	defb 000h		;b0e5	00 	. 
	defb 000h		;b0e6	00 	. 
	defb 000h		;b0e7	00 	. 
	defb 000h		;b0e8	00 	. 
	defb 000h		;b0e9	00 	. 
	defb 000h		;b0ea	00 	. 
	defb 000h		;b0eb	00 	. 
	defb 000h		;b0ec	00 	. 
	defb 000h		;b0ed	00 	. 
	defb 000h		;b0ee	00 	. 
	defb 000h		;b0ef	00 	. 
	defb 000h		;b0f0	00 	. 
	defb 000h		;b0f1	00 	. 
	defb 000h		;b0f2	00 	. 
	defb 000h		;b0f3	00 	. 
	defb 000h		;b0f4	00 	. 
	defb 000h		;b0f5	00 	. 
	defb 000h		;b0f6	00 	. 
	defb 000h		;b0f7	00 	. 
	defb 000h		;b0f8	00 	. 
	defb 000h		;b0f9	00 	. 
	defb 000h		;b0fa	00 	. 
	defb 000h		;b0fb	00 	. 
	defb 000h		;b0fc	00 	. 
	defb 000h		;b0fd	00 	. 
	defb 000h		;b0fe	00 	. 
	defb 000h		;b0ff	00 	. 
	defb 000h		;b100	00 	. 
	defb 000h		;b101	00 	. 
	defb 000h		;b102	00 	. 
	defb 000h		;b103	00 	. 
	defb 000h		;b104	00 	. 
	defb 000h		;b105	00 	. 
	defb 000h		;b106	00 	. 
	defb 000h		;b107	00 	. 
	defb 000h		;b108	00 	. 
	defb 000h		;b109	00 	. 
	defb 000h		;b10a	00 	. 
	defb 000h		;b10b	00 	. 
	defb 000h		;b10c	00 	. 
	defb 000h		;b10d	00 	. 
	defb 000h		;b10e	00 	. 
	defb 000h		;b10f	00 	. 
	defb 000h		;b110	00 	. 
	defb 000h		;b111	00 	. 
	defb 000h		;b112	00 	. 
	defb 000h		;b113	00 	. 
	defb 000h		;b114	00 	. 
	defb 000h		;b115	00 	. 
	defb 000h		;b116	00 	. 
	defb 000h		;b117	00 	. 
	defb 000h		;b118	00 	. 
	defb 000h		;b119	00 	. 
	defb 000h		;b11a	00 	. 
	defb 000h		;b11b	00 	. 
	defb 000h		;b11c	00 	. 
	defb 000h		;b11d	00 	. 
	defb 000h		;b11e	00 	. 
	defb 000h		;b11f	00 	. 
	defb 000h		;b120	00 	. 
	defb 000h		;b121	00 	. 
	defb 000h		;b122	00 	. 
	defb 000h		;b123	00 	. 
	defb 000h		;b124	00 	. 
	defb 000h		;b125	00 	. 
	defb 000h		;b126	00 	. 
	defb 000h		;b127	00 	. 
	defb 000h		;b128	00 	. 
	defb 000h		;b129	00 	. 
	defb 000h		;b12a	00 	. 
	defb 000h		;b12b	00 	. 
	defb 000h		;b12c	00 	. 
	defb 000h		;b12d	00 	. 
	defb 000h		;b12e	00 	. 
	defb 000h		;b12f	00 	. 
	defb 000h		;b130	00 	. 
	defb 000h		;b131	00 	. 
	defb 000h		;b132	00 	. 
	defb 000h		;b133	00 	. 
	defb 000h		;b134	00 	. 
	defb 000h		;b135	00 	. 
	defb 000h		;b136	00 	. 
	defb 000h		;b137	00 	. 
	defb 000h		;b138	00 	. 
	defb 000h		;b139	00 	. 
	defb 000h		;b13a	00 	. 
	defb 000h		;b13b	00 	. 
	defb 000h		;b13c	00 	. 
	defb 000h		;b13d	00 	. 
	defb 000h		;b13e	00 	. 
	defb 000h		;b13f	00 	. 
	defb 000h		;b140	00 	. 
	defb 000h		;b141	00 	. 
	defb 000h		;b142	00 	. 
	defb 000h		;b143	00 	. 
	defb 000h		;b144	00 	. 
	defb 000h		;b145	00 	. 
	defb 000h		;b146	00 	. 
	defb 000h		;b147	00 	. 
	defb 000h		;b148	00 	. 
	defb 000h		;b149	00 	. 
	defb 000h		;b14a	00 	. 
	defb 000h		;b14b	00 	. 
	defb 000h		;b14c	00 	. 
	defb 000h		;b14d	00 	. 
	defb 000h		;b14e	00 	. 
	defb 000h		;b14f	00 	. 
	defb 000h		;b150	00 	. 
	defb 000h		;b151	00 	. 
	defb 000h		;b152	00 	. 
	defb 000h		;b153	00 	. 
	defb 000h		;b154	00 	. 
	defb 000h		;b155	00 	. 
	defb 000h		;b156	00 	. 
	defb 000h		;b157	00 	. 
	defb 000h		;b158	00 	. 
	defb 000h		;b159	00 	. 
	defb 000h		;b15a	00 	. 
	defb 000h		;b15b	00 	. 
	defb 000h		;b15c	00 	. 
	defb 000h		;b15d	00 	. 
	defb 000h		;b15e	00 	. 
	defb 000h		;b15f	00 	. 
	defb 000h		;b160	00 	. 
	defb 000h		;b161	00 	. 
	defb 000h		;b162	00 	. 
	defb 000h		;b163	00 	. 
	defb 000h		;b164	00 	. 
	defb 000h		;b165	00 	. 
	defb 000h		;b166	00 	. 
	defb 000h		;b167	00 	. 
	defb 000h		;b168	00 	. 
	defb 000h		;b169	00 	. 
	defb 000h		;b16a	00 	. 
	defb 000h		;b16b	00 	. 
	defb 000h		;b16c	00 	. 
	defb 000h		;b16d	00 	. 
	defb 000h		;b16e	00 	. 
	defb 000h		;b16f	00 	. 
	defb 000h		;b170	00 	. 
	defb 000h		;b171	00 	. 
	defb 000h		;b172	00 	. 
	defb 000h		;b173	00 	. 
	defb 000h		;b174	00 	. 
	defb 000h		;b175	00 	. 
	defb 000h		;b176	00 	. 
	defb 000h		;b177	00 	. 
	defb 000h		;b178	00 	. 
	defb 000h		;b179	00 	. 
	defb 000h		;b17a	00 	. 
	defb 000h		;b17b	00 	. 
	defb 000h		;b17c	00 	. 
	defb 000h		;b17d	00 	. 
	defb 000h		;b17e	00 	. 
	defb 000h		;b17f	00 	. 
	defb 000h		;b180	00 	. 
	defb 000h		;b181	00 	. 
	defb 000h		;b182	00 	. 
	defb 000h		;b183	00 	. 
	defb 000h		;b184	00 	. 
	defb 000h		;b185	00 	. 
	defb 000h		;b186	00 	. 
	defb 000h		;b187	00 	. 
	defb 000h		;b188	00 	. 
	defb 000h		;b189	00 	. 
	defb 000h		;b18a	00 	. 
	defb 000h		;b18b	00 	. 
	defb 000h		;b18c	00 	. 
	defb 000h		;b18d	00 	. 
	defb 000h		;b18e	00 	. 
	defb 000h		;b18f	00 	. 
	defb 000h		;b190	00 	. 
	defb 000h		;b191	00 	. 
	defb 000h		;b192	00 	. 
	defb 000h		;b193	00 	. 
	defb 000h		;b194	00 	. 
	defb 000h		;b195	00 	. 
	defb 000h		;b196	00 	. 
	defb 000h		;b197	00 	. 
	defb 000h		;b198	00 	. 
	defb 000h		;b199	00 	. 
	defb 000h		;b19a	00 	. 
	defb 000h		;b19b	00 	. 
	defb 000h		;b19c	00 	. 
	defb 000h		;b19d	00 	. 
	defb 000h		;b19e	00 	. 
	defb 000h		;b19f	00 	. 
	defb 000h		;b1a0	00 	. 
	defb 000h		;b1a1	00 	. 
	defb 000h		;b1a2	00 	. 
	defb 000h		;b1a3	00 	. 
	defb 000h		;b1a4	00 	. 
	defb 000h		;b1a5	00 	. 
	defb 000h		;b1a6	00 	. 
	defb 000h		;b1a7	00 	. 
	defb 000h		;b1a8	00 	. 
	defb 000h		;b1a9	00 	. 
	defb 000h		;b1aa	00 	. 
	defb 000h		;b1ab	00 	. 
	defb 000h		;b1ac	00 	. 
	defb 000h		;b1ad	00 	. 
	defb 000h		;b1ae	00 	. 
	defb 000h		;b1af	00 	. 
	defb 000h		;b1b0	00 	. 
	defb 000h		;b1b1	00 	. 
	defb 000h		;b1b2	00 	. 
	defb 000h		;b1b3	00 	. 
	defb 000h		;b1b4	00 	. 
	defb 000h		;b1b5	00 	. 
	defb 000h		;b1b6	00 	. 
	defb 000h		;b1b7	00 	. 
	defb 000h		;b1b8	00 	. 
	defb 000h		;b1b9	00 	. 
	defb 000h		;b1ba	00 	. 
	defb 000h		;b1bb	00 	. 
	defb 000h		;b1bc	00 	. 
	defb 000h		;b1bd	00 	. 
	defb 000h		;b1be	00 	. 
	defb 000h		;b1bf	00 	. 
	defb 000h		;b1c0	00 	. 
	defb 000h		;b1c1	00 	. 
	defb 000h		;b1c2	00 	. 
	defb 000h		;b1c3	00 	. 
	defb 000h		;b1c4	00 	. 
	defb 000h		;b1c5	00 	. 
	defb 000h		;b1c6	00 	. 
	defb 000h		;b1c7	00 	. 
	defb 000h		;b1c8	00 	. 
	defb 000h		;b1c9	00 	. 
	defb 000h		;b1ca	00 	. 
	defb 000h		;b1cb	00 	. 
	defb 000h		;b1cc	00 	. 
	defb 000h		;b1cd	00 	. 
	defb 000h		;b1ce	00 	. 
	defb 000h		;b1cf	00 	. 
	defb 000h		;b1d0	00 	. 
	defb 000h		;b1d1	00 	. 
	defb 000h		;b1d2	00 	. 
	defb 000h		;b1d3	00 	. 
	defb 000h		;b1d4	00 	. 
	defb 000h		;b1d5	00 	. 
	defb 000h		;b1d6	00 	. 
	defb 000h		;b1d7	00 	. 
	defb 000h		;b1d8	00 	. 
	defb 000h		;b1d9	00 	. 
	defb 000h		;b1da	00 	. 
	defb 000h		;b1db	00 	. 
	defb 000h		;b1dc	00 	. 
	defb 000h		;b1dd	00 	. 
	defb 000h		;b1de	00 	. 
	defb 000h		;b1df	00 	. 
	defb 000h		;b1e0	00 	. 
	defb 000h		;b1e1	00 	. 
	defb 000h		;b1e2	00 	. 
	defb 000h		;b1e3	00 	. 
	defb 000h		;b1e4	00 	. 
	defb 000h		;b1e5	00 	. 
	defb 000h		;b1e6	00 	. 
	defb 000h		;b1e7	00 	. 
	defb 000h		;b1e8	00 	. 
	defb 000h		;b1e9	00 	. 
	defb 000h		;b1ea	00 	. 
	defb 000h		;b1eb	00 	. 
	defb 000h		;b1ec	00 	. 
	defb 000h		;b1ed	00 	. 
	defb 000h		;b1ee	00 	. 
	defb 000h		;b1ef	00 	. 
	defb 000h		;b1f0	00 	. 
	defb 000h		;b1f1	00 	. 
	defb 000h		;b1f2	00 	. 
	defb 000h		;b1f3	00 	. 
	defb 000h		;b1f4	00 	. 
	defb 000h		;b1f5	00 	. 
	defb 000h		;b1f6	00 	. 
	defb 000h		;b1f7	00 	. 
	defb 000h		;b1f8	00 	. 
	defb 000h		;b1f9	00 	. 
	defb 000h		;b1fa	00 	. 
	defb 000h		;b1fb	00 	. 
	defb 000h		;b1fc	00 	. 
	defb 000h		;b1fd	00 	. 
	defb 000h		;b1fe	00 	. 
	defb 000h		;b1ff	00 	. 
	defb 000h		;b200	00 	. 
	defb 000h		;b201	00 	. 
	defb 000h		;b202	00 	. 
	defb 000h		;b203	00 	. 
	defb 000h		;b204	00 	. 
	defb 000h		;b205	00 	. 
	defb 000h		;b206	00 	. 
	defb 000h		;b207	00 	. 
	defb 000h		;b208	00 	. 
	defb 000h		;b209	00 	. 
	defb 000h		;b20a	00 	. 
	defb 000h		;b20b	00 	. 
	defb 000h		;b20c	00 	. 
	defb 000h		;b20d	00 	. 
	defb 000h		;b20e	00 	. 
	defb 000h		;b20f	00 	. 
	defb 000h		;b210	00 	. 
	defb 000h		;b211	00 	. 
	defb 000h		;b212	00 	. 
	defb 000h		;b213	00 	. 
	defb 000h		;b214	00 	. 
	defb 000h		;b215	00 	. 
	defb 040h		;b216	40 	@ 
	defb 000h		;b217	00 	. 
	defb 000h		;b218	00 	. 
	defb 000h		;b219	00 	. 
	defb 000h		;b21a	00 	. 
	defb 000h		;b21b	00 	. 
	defb 000h		;b21c	00 	. 
	defb 000h		;b21d	00 	. 
	defb 000h		;b21e	00 	. 
	defb 000h		;b21f	00 	. 
	defb 000h		;b220	00 	. 
	defb 000h		;b221	00 	. 
	defb 000h		;b222	00 	. 
	defb 000h		;b223	00 	. 
	defb 000h		;b224	00 	. 
	defb 000h		;b225	00 	. 
	defb 000h		;b226	00 	. 
	defb 000h		;b227	00 	. 
	defb 000h		;b228	00 	. 
	defb 000h		;b229	00 	. 
	defb 000h		;b22a	00 	. 
	defb 000h		;b22b	00 	. 
	defb 000h		;b22c	00 	. 
	defb 000h		;b22d	00 	. 
	defb 000h		;b22e	00 	. 
	defb 040h		;b22f	40 	@ 
	defb 000h		;b230	00 	. 
	defb 000h		;b231	00 	. 
	defb 000h		;b232	00 	. 
	defb 000h		;b233	00 	. 
	defb 000h		;b234	00 	. 
	defb 000h		;b235	00 	. 
	defb 000h		;b236	00 	. 
	defb 000h		;b237	00 	. 
	defb 000h		;b238	00 	. 
	defb 000h		;b239	00 	. 
	defb 000h		;b23a	00 	. 
	defb 000h		;b23b	00 	. 
	defb 000h		;b23c	00 	. 
	defb 000h		;b23d	00 	. 
	defb 000h		;b23e	00 	. 
	defb 000h		;b23f	00 	. 
	defb 000h		;b240	00 	. 
	defb 000h		;b241	00 	. 
	defb 000h		;b242	00 	. 
	defb 000h		;b243	00 	. 
	defb 000h		;b244	00 	. 
	defb 000h		;b245	00 	. 
	defb 000h		;b246	00 	. 
	defb 000h		;b247	00 	. 
	defb 040h		;b248	40 	@ 
	defb 000h		;b249	00 	. 
	defb 000h		;b24a	00 	. 
	defb 000h		;b24b	00 	. 
	defb 000h		;b24c	00 	. 
	defb 000h		;b24d	00 	. 
	defb 000h		;b24e	00 	. 
	defb 000h		;b24f	00 	. 
	defb 000h		;b250	00 	. 
	defb 000h		;b251	00 	. 
	defb 000h		;b252	00 	. 
	defb 000h		;b253	00 	. 
	defb 000h		;b254	00 	. 
	defb 000h		;b255	00 	. 
	defb 000h		;b256	00 	. 
	defb 000h		;b257	00 	. 
	defb 000h		;b258	00 	. 
	defb 000h		;b259	00 	. 
	defb 000h		;b25a	00 	. 
	defb 000h		;b25b	00 	. 
	defb 000h		;b25c	00 	. 
	defb 000h		;b25d	00 	. 
	defb 000h		;b25e	00 	. 
	defb 000h		;b25f	00 	. 
	defb 000h		;b260	00 	. 
	defb 040h		;b261	40 	@ 
	defb 000h		;b262	00 	. 
	defb 000h		;b263	00 	. 
	defb 000h		;b264	00 	. 
	defb 000h		;b265	00 	. 
	defb 000h		;b266	00 	. 
	defb 000h		;b267	00 	. 
	defb 000h		;b268	00 	. 
	defb 000h		;b269	00 	. 
	defb 000h		;b26a	00 	. 
	defb 000h		;b26b	00 	. 
	defb 000h		;b26c	00 	. 
	defb 000h		;b26d	00 	. 
	defb 000h		;b26e	00 	. 
	defb 000h		;b26f	00 	. 
	defb 000h		;b270	00 	. 
	defb 000h		;b271	00 	. 
	defb 000h		;b272	00 	. 
	defb 000h		;b273	00 	. 
	defb 000h		;b274	00 	. 
	defb 000h		;b275	00 	. 
	defb 000h		;b276	00 	. 
	defb 000h		;b277	00 	. 
	defb 000h		;b278	00 	. 
	defb 000h		;b279	00 	. 
	defb 000h		;b27a	00 	. 
	defb 000h		;b27b	00 	. 
	defb 000h		;b27c	00 	. 
	defb 000h		;b27d	00 	. 
	defb 000h		;b27e	00 	. 
	defb 000h		;b27f	00 	. 
	defb 000h		;b280	00 	. 
	defb 000h		;b281	00 	. 
	defb 000h		;b282	00 	. 
sub_b283h:
	ld hl,sys_page_drv_assign		;b283	21 88 2c 	! . , 
	ld de,sys_page_cur_drv_assign		;b286	11 98 2c 	. . , 
	ld bc,00010h		;b289	01 10 00 	. . . 
	ldir		;b28c	ed b0 	. . 
	ld hl,sys_page_cur_drv_assign		;b28e	21 98 2c 	! . , 
	ld de,drive_mapping		;b291	11 83 f5 	. . . 
	ld b,000h		;b294	06 00 	. . 
lb296h:
	ld a,(hl)			;b296	7e 	~ 
	or a			;b297	b7 	. 
	call nz,sub_b2a5h		;b298	c4 a5 b2 	. . . 
	inc hl			;b29b	23 	# 
	inc de			;b29c	13 	. 
	inc de			;b29d	13 	. 
	inc b			;b29e	04 	. 
	ld a,b			;b29f	78 	x 
	cp 010h		;b2a0	fe 10 	. . 
	jr nz,lb296h		;b2a2	20 f2 	  . 
	ret			;b2a4	c9 	. 
sub_b2a5h:
	push af			;b2a5	f5 	. 
	cp 001h		;b2a6	fe 01 	. . 
	jr nz,lb2b0h		;b2a8	20 06 	  . 
	ld a,b			;b2aa	78 	x 
	ld (lb3dbh),a		;b2ab	32 db b3 	2 . . 
	jr lb2b8h		;b2ae	18 08 	. . 
lb2b0h:
	cp 002h		;b2b0	fe 02 	. . 
	jr nz,lb2b8h		;b2b2	20 04 	  . 
	ld a,b			;b2b4	78 	x 
	ld (lb3dch),a		;b2b5	32 dc b3 	2 . . 
lb2b8h:
	pop af			;b2b8	f1 	. 
	push bc			;b2b9	c5 	. 
	push hl			;b2ba	e5 	. 
	push de			;b2bb	d5 	. 
	ld hl,lb36ch		;b2bc	21 6c b3 	! l . 
	sla a		;b2bf	cb 27 	. ' 
	ld e,a			;b2c1	5f 	_ 
	ld d,000h		;b2c2	16 00 	. . 
	add hl,de			;b2c4	19 	. 
	pop de			;b2c5	d1 	. 
	push de			;b2c6	d5 	. 
	ld a,(hl)			;b2c7	7e 	~ 
	ld (de),a			;b2c8	12 	. 
	inc hl			;b2c9	23 	# 
	inc de			;b2ca	13 	. 
	ld a,(hl)			;b2cb	7e 	~ 
	ld (de),a			;b2cc	12 	. 
	pop de			;b2cd	d1 	. 
	pop hl			;b2ce	e1 	. 
	pop bc			;b2cf	c1 	. 
	ret			;b2d0	c9 	. 
sub_b2d1h:
	ld hl,drive_mapping		;b2d1	21 83 f5 	! . . 
	ld b,010h		;b2d4	06 10 	. . 
lb2d6h:
	ld e,(hl)			;b2d6	5e 	^ 
	inc hl			;b2d7	23 	# 
	ld a,(hl)			;b2d8	7e 	~ 
	inc hl			;b2d9	23 	# 
	ld d,a			;b2da	57 	W 
	or e			;b2db	b3 	. 
	jr nz,lb2e2h		;b2dc	20 04 	  . 
	djnz lb2d6h		;b2de	10 f6 	. . 
	jr lb2fah		;b2e0	18 18 	. . 
lb2e2h:
	push bc			;b2e2	c5 	. 
	push hl			;b2e3	e5 	. 
	ex de,hl			;b2e4	eb 	. 
	ld de,0fffch		;b2e5	11 fc ff 	. . . 
	add hl,de			;b2e8	19 	. 
	ld a,(hl)			;b2e9	7e 	~ 
	inc hl			;b2ea	23 	# 
	ld h,(hl)			;b2eb	66 	f 
	inc hl			;b2ec	23 	# 
	ld l,a			;b2ed	6f 	o 
	or h			;b2ee	b4 	. 
	jr z,lb2f6h		;b2ef	28 05 	( . 
	ld de,lb2f6h		;b2f1	11 f6 b2 	. . . 
	push de			;b2f4	d5 	. 
	jp (hl)			;b2f5	e9 	. 
lb2f6h:
	pop hl			;b2f6	e1 	. 
	pop bc			;b2f7	c1 	. 
	djnz lb2d6h		;b2f8	10 dc 	. . 
lb2fah:
	ret			;b2fa	c9 	. 
sub_b2fbh:
	ld hl,lb3bfh		;b2fb	21 bf b3 	! . . 
	call print_string		;b2fe	cd 66 33 	. f 3 
	ld a,(lb35fh)		;b301	3a 5f b3 	: _ . 
	or a			;b304	b7 	. 
	jr z,lb325h		;b305	28 1e 	( . 
	ld hl,lb378h		;b307	21 78 b3 	! x . 
	ld de,drive_mapping		;b30a	11 83 f5 	. . . 
	ld bc,00020h		;b30d	01 20 00 	.   . 
	ldir		;b310	ed b0 	. . 
	xor a			;b312	af 	. 
	ld (lb3dbh),a		;b313	32 db b3 	2 . . 
	inc a			;b316	3c 	< 
	ld (lb3dch),a		;b317	32 dc b3 	2 . . 
	ld hl,lb398h		;b31a	21 98 b3 	! . . 
	ld de,sys_page_cur_drv_assign		;b31d	11 98 2c 	. . , 
	ld bc,00010h		;b320	01 10 00 	. . . 
	ldir		;b323	ed b0 	. . 
lb325h:
	ld hl,sys_page_cur_drv_assign		;b325	21 98 2c 	! . , 
	ld b,010h		;b328	06 10 	. . 
	ld c,000h		;b32a	0e 00 	. . 
lb32ch:
	ld a,(hl)			;b32c	7e 	~ 
	or a			;b32d	b7 	. 
	call nz,sub_b33ch		;b32e	c4 3c b3 	. < . 
	inc hl			;b331	23 	# 
	inc c			;b332	0c 	. 
	djnz lb32ch		;b333	10 f7 	. . 
	ld hl,lb3d1h		;b335	21 d1 b3 	! . . 
	call print_string		;b338	cd 66 33 	. f 3 
	ret			;b33b	c9 	. 
sub_b33ch:
	push hl			;b33c	e5 	. 
	push bc			;b33d	c5 	. 
	push af			;b33e	f5 	. 
	ld a,c			;b33f	79 	y 
	add a,041h		;b340	c6 41 	. A 
	ld (lb3d7h),a		;b342	32 d7 b3 	2 . . 
	ld hl,lb3d5h		;b345	21 d5 b3 	! . . 
	call print_string		;b348	cd 66 33 	. f 3 
	pop af			;b34b	f1 	. 
	sla a		;b34c	cb 27 	. ' 
	ld e,a			;b34e	5f 	_ 
	ld d,000h		;b34f	16 00 	. . 
	ld hl,lb360h		;b351	21 60 b3 	! ` . 
	add hl,de			;b354	19 	. 
	ld a,(hl)			;b355	7e 	~ 
	inc hl			;b356	23 	# 
	ld h,(hl)			;b357	66 	f 
	ld l,a			;b358	6f 	o 
	call print_string		;b359	cd 66 33 	. f 3 
	pop bc			;b35c	c1 	. 
	pop hl			;b35d	e1 	. 
	ret			;b35e	c9 	. 
lb35fh:
	defb 000h		;b35f	00 	. 
lb360h:
	defb 0a8h		;b360	a8 	. 
	defb 0b3h		;b361	b3 	. 
	defb 05ah		;b362	5a 	Z 
	defb 0bah		;b363	ba 	. 
	defb 070h		;b364	70 	p 
	defb 0bah		;b365	ba 	. 
	defb 051h		;b366	51 	Q 
	defb 0c0h		;b367	c0 	. 
	defb 0b6h		;b368	b6 	. 
	defb 0bah		;b369	ba 	. 
	defb 0e3h		;b36a	e3 	. 
	defb 0bah		;b36b	ba 	. 
lb36ch:
	defb 000h		;b36c	00 	. 
	defb 000h		;b36d	00 	. 
	defb 0afh		;b36e	af 	. 
	defb 0f5h		;b36f	f5 	. 
	defb 0cbh		;b370	cb 	. 
	defb 0f5h		;b371	f5 	. 
	defb 052h		;b372	52 	R 
	defb 0fah		;b373	fa 	. 
	defb 001h		;b374	01 	. 
	defb 0f7h		;b375	f7 	. 
	defb 01dh		;b376	1d 	. 
	defb 0f7h		;b377	f7 	. 
lb378h:
	defb 0afh		;b378	af 	. 
	defb 0f5h		;b379	f5 	. 
	defb 0cbh		;b37a	cb 	. 
	defb 0f5h		;b37b	f5 	. 
	defb 000h		;b37c	00 	. 
	defb 000h		;b37d	00 	. 
	defb 000h		;b37e	00 	. 
	defb 000h		;b37f	00 	. 
	defb 000h		;b380	00 	. 
	defb 000h		;b381	00 	. 
	defb 000h		;b382	00 	. 
	defb 000h		;b383	00 	. 
	defb 000h		;b384	00 	. 
	defb 000h		;b385	00 	. 
	defb 000h		;b386	00 	. 
	defb 000h		;b387	00 	. 
	defb 000h		;b388	00 	. 
	defb 000h		;b389	00 	. 
	defb 000h		;b38a	00 	. 
	defb 000h		;b38b	00 	. 
	defb 000h		;b38c	00 	. 
	defb 000h		;b38d	00 	. 
	defb 000h		;b38e	00 	. 
	defb 000h		;b38f	00 	. 
	defb 052h		;b390	52 	R 
	defb 0fah		;b391	fa 	. 
	defb 000h		;b392	00 	. 
	defb 000h		;b393	00 	. 
	defb 000h		;b394	00 	. 
	defb 000h		;b395	00 	. 
	defb 000h		;b396	00 	. 
	defb 000h		;b397	00 	. 
lb398h:
	defb 001h		;b398	01 	. 
	defb 002h		;b399	02 	. 
	defb 000h		;b39a	00 	. 
	defb 000h		;b39b	00 	. 
	defb 000h		;b39c	00 	. 
	defb 000h		;b39d	00 	. 
	defb 000h		;b39e	00 	. 
	defb 000h		;b39f	00 	. 
	defb 000h		;b3a0	00 	. 
	defb 000h		;b3a1	00 	. 
	defb 000h		;b3a2	00 	. 
	defb 000h		;b3a3	00 	. 
	defb 003h		;b3a4	03 	. 
	defb 000h		;b3a5	00 	. 
	defb 000h		;b3a6	00 	. 
	defb 000h		;b3a7	00 	. 
	defb 02ah		;b3a8	2a 	* 
	defb 02ah		;b3a9	2a 	* 
	defb 020h		;b3aa	20 	  
	defb 049h		;b3ab	49 	I 
	defb 04eh		;b3ac	4e 	N 
	defb 056h		;b3ad	56 	V 
	defb 041h		;b3ae	41 	A 
	defb 04ch		;b3af	4c 	L 
	defb 049h		;b3b0	49 	I 
	defb 044h		;b3b1	44 	D 
	defb 020h		;b3b2	20 	  
	defb 044h		;b3b3	44 	D 
	defb 045h		;b3b4	45 	E 
	defb 056h		;b3b5	56 	V 
	defb 049h		;b3b6	49 	I 
	defb 043h		;b3b7	43 	C 
	defb 045h		;b3b8	45 	E 
	defb 020h		;b3b9	20 	  
	defb 02ah		;b3ba	2a 	* 
	defb 02ah		;b3bb	2a 	* 
	defb 00dh		;b3bc	0d 	. 
	defb 00ah		;b3bd	0a 	. 
	defb 000h		;b3be	00 	. 
lb3bfh:
	defb 044h		;b3bf	44 	D 
	defb 072h		;b3c0	72 	r 
	defb 069h		;b3c1	69 	i 
	defb 076h		;b3c2	76 	v 
	defb 065h		;b3c3	65 	e 
	defb 020h		;b3c4	20 	  
	defb 041h		;b3c5	41 	A 
	defb 073h		;b3c6	73 	s 
	defb 073h		;b3c7	73 	s 
	defb 069h		;b3c8	69 	i 
	defb 067h		;b3c9	67 	g 
	defb 06eh		;b3ca	6e 	n 
	defb 06dh		;b3cb	6d 	m 
	defb 065h		;b3cc	65 	e 
	defb 06eh		;b3cd	6e 	n 
	defb 074h		;b3ce	74 	t 
	defb 073h		;b3cf	73 	s 
	defb 03ah		;b3d0	3a 	: 
lb3d1h:
	defb 00dh		;b3d1	0d 	. 
	defb 00ah		;b3d2	0a 	. 
	defb 00ah		;b3d3	0a 	. 
	defb 000h		;b3d4	00 	. 
lb3d5h:
	defb 020h		;b3d5	20 	  
	defb 020h		;b3d6	20 	  
lb3d7h:
	defb 000h		;b3d7	00 	. 
	defb 03eh		;b3d8	3e 	> 
	defb 020h		;b3d9	20 	  
	defb 000h		;b3da	00 	. 
lb3dbh:
	defb 000h		;b3db	00 	. 
lb3dch:
	defb 000h		;b3dc	00 	. 
floppy_select:
	ld a,(disk_unit)		;b3dd	3a 1e 1c 	: . . 
	cp 002h		;b3e0	fe 02 	. . 
	jr c,lb3efh		;b3e2	38 0b 	8 . 
lb3e4h:
	ld a,005h		;b3e4	3e 05 	> . 
	call sub_1ae6h		;b3e6	cd e6 1a 	. . . 
	cp 043h		;b3e9	fe 43 	. C 
	jr z,lb42ch		;b3eb	28 3f 	( ? 
	jr lb3e4h		;b3ed	18 f5 	. . 
lb3efh:
	ld (lba3eh),a		;b3ef	32 3e ba 	2 > . 
	ld hl,lfloppy_dph		;b3f2	21 af f5 	! . . 
	or a			;b3f5	b7 	. 
	jr z,lb3fdh		;b3f6	28 05 	( . 
	ld hl,rfloppy_dph		;b3f8	21 cb f5 	! . . 
	jr lb40fh		;b3fb	18 12 	. . 
lb3fdh:
	ld bc,lb81bh		;b3fd	01 1b b8 	. . . 
	ld (lb83ah),bc		;b400	ed 43 3a b8 	. C : . 
	ld a,(lba4eh)		;b404	3a 4e ba 	: N . 
	or a			;b407	b7 	. 
	ret z			;b408	c8 	. 
	xor a			;b409	af 	. 
	ld (lba4eh),a		;b40a	32 4e ba 	2 N . 
	jr lb41fh		;b40d	18 10 	. . 
lb40fh:
	ld bc,nec765_param_table		;b40f	01 f9 f5 	. . . 
	ld (lb83ah),bc		;b412	ed 43 3a b8 	. C : . 
	ld a,(lba4fh)		;b416	3a 4f ba 	: O . 
	or a			;b419	b7 	. 
	ret z			;b41a	c8 	. 
	xor a			;b41b	af 	. 
	ld (lba4fh),a		;b41c	32 4f ba 	2 O . 
lb41fh:
	ld b,000h		;b41f	06 00 	. . 
	ld a,(lba3eh)		;b421	3a 3e ba 	: > . 
	ld c,a			;b424	4f 	O 
	push hl			;b425	e5 	. 
	xor a			;b426	af 	. 
	call sub_b5bah		;b427	cd ba b5 	. . . 
	pop hl			;b42a	e1 	. 
	ret z			;b42b	c8 	. 
lb42ch:
	ld hl,00000h		;b42c	21 00 00 	! . . 
	ret			;b42f	c9 	. 
floppy_home:
	ld a,(lba45h)		;b430	3a 45 ba 	: E . 
	or a			;b433	b7 	. 
	jp nz,lb43ah		;b434	c2 3a b4 	. : . 
	ld (lba44h),a		;b437	32 44 ba 	2 D . 
lb43ah:
	ld bc,00000h		;b43a	01 00 00 	. . . 
	ld (disk_track),bc		;b43d	ed 43 20 1c 	. C   . 
	ret			;b441	c9 	. 
floppy_read:
	call sub_b446h		;b442	cd 46 b4 	. F . 
	ret			;b445	c9 	. 
sub_b446h:
	ld ix,(lb83ah)		;b446	dd 2a 3a b8 	. * : . 
	xor a			;b44a	af 	. 
	ld (lba46h),a		;b44b	32 46 ba 	2 F . 
	inc a			;b44e	3c 	< 
	ld (lba4ch),a		;b44f	32 4c ba 	2 L . 
	ld (lba4bh),a		;b452	32 4b ba 	2 K . 
	ld a,002h		;b455	3e 02 	> . 
	ld (lba4dh),a		;b457	32 4d ba 	2 M . 
	jr lb4cch		;b45a	18 70 	. p 
floppy_write:
	call sub_b460h		;b45c	cd 60 b4 	. ` . 
	ret			;b45f	c9 	. 
sub_b460h:
	ld ix,(lb83ah)		;b460	dd 2a 3a b8 	. * : . 
	xor a			;b464	af 	. 
	ld (lba4ch),a		;b465	32 4c ba 	2 L . 
	ld a,c			;b468	79 	y 
	ld (lba4dh),a		;b469	32 4d ba 	2 M . 
	and 002h		;b46c	e6 02 	. . 
	jr z,lb48ah		;b46e	28 1a 	( . 
	ld a,(ix+000h)		;b470	dd 7e 00 	. ~ . 
	ld (lba46h),a		;b473	32 46 ba 	2 F . 
	ld a,(lba3eh)		;b476	3a 3e ba 	: > . 
	ld (lba47h),a		;b479	32 47 ba 	2 G . 
	ld bc,(disk_track)		;b47c	ed 4b 20 1c 	. K   . 
	ld (lba48h),bc		;b480	ed 43 48 ba 	. C H . 
	ld a,(disk_sector)		;b484	3a 22 1c 	: " . 
	ld (lba4ah),a		;b487	32 4a ba 	2 J . 
lb48ah:
	ld a,(lba46h)		;b48a	3a 46 ba 	: F . 
	or a			;b48d	b7 	. 
	jr z,lb4c4h		;b48e	28 34 	( 4 
	dec a			;b490	3d 	= 
	ld (lba46h),a		;b491	32 46 ba 	2 F . 
	ld a,(lba3eh)		;b494	3a 3e ba 	: > . 
	ld hl,lba47h		;b497	21 47 ba 	! G . 
	cp (hl)			;b49a	be 	. 
	jr nz,lb4c4h		;b49b	20 27 	  ' 
	ld hl,lba48h		;b49d	21 48 ba 	! H . 
	call sub_b583h		;b4a0	cd 83 b5 	. . . 
	jr nz,lb4c4h		;b4a3	20 1f 	  . 
	ld a,(disk_sector)		;b4a5	3a 22 1c 	: " . 
	ld hl,lba4ah		;b4a8	21 4a ba 	! J . 
	cp (hl)			;b4ab	be 	. 
	jr nz,lb4c4h		;b4ac	20 16 	  . 
	inc (hl)			;b4ae	34 	4 
	ld a,(hl)			;b4af	7e 	~ 
	cp (ix+001h)		;b4b0	dd be 01 	. . . 
	jr c,lb4beh		;b4b3	38 09 	8 . 
	ld (hl),000h		;b4b5	36 00 	6 . 
	ld hl,(lba48h)		;b4b7	2a 48 ba 	* H . 
	inc hl			;b4ba	23 	# 
	ld (lba48h),hl		;b4bb	22 48 ba 	" H . 
lb4beh:
	xor a			;b4be	af 	. 
	ld (lba4bh),a		;b4bf	32 4b ba 	2 K . 
	jr lb4cch		;b4c2	18 08 	. . 
lb4c4h:
	xor a			;b4c4	af 	. 
	ld (lba46h),a		;b4c5	32 46 ba 	2 F . 
	inc a			;b4c8	3c 	< 
	ld (lba4bh),a		;b4c9	32 4b ba 	2 K . 
lb4cch:
	xor a			;b4cc	af 	. 
	ld (lb834h),a		;b4cd	32 34 b8 	2 4 . 
	ld a,(ix+002h)		;b4d0	dd 7e 02 	. ~ . 
	ld b,a			;b4d3	47 	G 
	or a			;b4d4	b7 	. 
	ld a,(disk_sector)		;b4d5	3a 22 1c 	: " . 
	jr z,lb4dfh		;b4d8	28 05 	( . 
lb4dah:
	or a			;b4da	b7 	. 
	rra			;b4db	1f 	. 
	dec b			;b4dc	05 	. 
	jr nz,lb4dah		;b4dd	20 fb 	  . 
lb4dfh:
	ld (lba43h),a		;b4df	32 43 ba 	2 C . 
	ld hl,lba44h		;b4e2	21 44 ba 	! D . 
	ld a,(hl)			;b4e5	7e 	~ 
	ld (hl),001h		;b4e6	36 01 	6 . 
	or a			;b4e8	b7 	. 
	jr z,lb511h		;b4e9	28 26 	( & 
	ld a,(lba3eh)		;b4eb	3a 3e ba 	: > . 
	ld hl,lba3fh		;b4ee	21 3f ba 	! ? . 
	cp (hl)			;b4f1	be 	. 
	jr nz,lb505h		;b4f2	20 11 	  . 
	ld hl,lba40h		;b4f4	21 40 ba 	! @ . 
	call sub_b583h		;b4f7	cd 83 b5 	. . . 
	jr nz,lb505h		;b4fa	20 09 	  . 
	ld a,(lba43h)		;b4fc	3a 43 ba 	: C . 
	ld hl,lba42h		;b4ff	21 42 ba 	! B . 
	cp (hl)			;b502	be 	. 
	jr z,lb52dh		;b503	28 28 	( ( 
lb505h:
	ld a,(lba45h)		;b505	3a 45 ba 	: E . 
	or a			;b508	b7 	. 
	call nz,sub_b59fh		;b509	c4 9f b5 	. . . 
	ret nz			;b50c	c0 	. 
	xor a			;b50d	af 	. 
	ld (lba45h),a		;b50e	32 45 ba 	2 E . 
lb511h:
	ld a,(lba3eh)		;b511	3a 3e ba 	: > . 
	ld (lba3fh),a		;b514	32 3f ba 	2 ? . 
	ld bc,(disk_track)		;b517	ed 4b 20 1c 	. K   . 
	ld (lba40h),bc		;b51b	ed 43 40 ba 	. C @ . 
	ld a,(lba43h)		;b51f	3a 43 ba 	: C . 
	ld (lba42h),a		;b522	32 42 ba 	2 B . 
	ld a,(lba4bh)		;b525	3a 4b ba 	: K . 
	or a			;b528	b7 	. 
	call nz,sub_b5a9h		;b529	c4 a9 b5 	. . . 
	ret nz			;b52c	c0 	. 
lb52dh:
	ld a,(disk_sector)		;b52d	3a 22 1c 	: " . 
	and (ix+003h)		;b530	dd a6 03 	. . . 
	ld l,a			;b533	6f 	o 
	ld h,000h		;b534	26 00 	& . 
	add hl,hl			;b536	29 	) 
	add hl,hl			;b537	29 	) 
	add hl,hl			;b538	29 	) 
	add hl,hl			;b539	29 	) 
	add hl,hl			;b53a	29 	) 
	add hl,hl			;b53b	29 	) 
	add hl,hl			;b53c	29 	) 
	ld de,lb83eh		;b53d	11 3e b8 	. > . 
	add hl,de			;b540	19 	. 
	ld de,(disk_dma)		;b541	ed 5b 24 1c 	. [ $ . 
	ld a,(lba4ch)		;b545	3a 4c ba 	: L . 
	or a			;b548	b7 	. 
	jr nz,lb551h		;b549	20 06 	  . 
	ld a,001h		;b54b	3e 01 	> . 
	ld (lba45h),a		;b54d	32 45 ba 	2 E . 
	ex de,hl			;b550	eb 	. 
lb551h:
	ld a,(0f3d2h)		;b551	3a d2 f3 	: . . 
	ld b,a			;b554	47 	G 
	ld a,(lba4ch)		;b555	3a 4c ba 	: L . 
	or a			;b558	b7 	. 
	jr nz,lb560h		;b559	20 05 	  . 
	ld c,b			;b55b	48 	H 
	ld b,000h		;b55c	06 00 	. . 
	jr lb562h		;b55e	18 02 	. . 
lb560h:
	ld c,000h		;b560	0e 00 	. . 
lb562h:
	call setup_banked_copy		;b562	cd 44 f3 	. D . 
	ld bc,00080h		;b565	01 80 00 	. . . 
	call copy_memblock		;b568	cd 4e f3 	. N . 
	ld a,(lba4dh)		;b56b	3a 4d ba 	: M . 
	and 001h		;b56e	e6 01 	. . 
	ld a,(lb834h)		;b570	3a 34 b8 	: 4 . 
	ret z			;b573	c8 	. 
	or a			;b574	b7 	. 
	ret nz			;b575	c0 	. 
lb576h:
	xor a			;b576	af 	. 
	ld (lba45h),a		;b577	32 45 ba 	2 E . 
	call sub_b59fh		;b57a	cd 9f b5 	. . . 
	ret nz			;b57d	c0 	. 
	xor a			;b57e	af 	. 
	ld (lba45h),a		;b57f	32 45 ba 	2 E . 
	ret			;b582	c9 	. 
sub_b583h:
	ex de,hl			;b583	eb 	. 
	ld hl,disk_track		;b584	21 20 1c 	!   . 
	ld a,(de)			;b587	1a 	. 
	cp (hl)			;b588	be 	. 
	ret nz			;b589	c0 	. 
	inc de			;b58a	13 	. 
	inc hl			;b58b	23 	# 
	ld a,(de)			;b58c	1a 	. 
	cp (hl)			;b58d	be 	. 
	ret			;b58e	c9 	. 
sub_b58fh:
	ld a,(lba3fh)		;b58f	3a 3f ba 	: ? . 
	ld c,a			;b592	4f 	O 
	ld a,(lba40h)		;b593	3a 40 ba 	: @ . 
	ld d,a			;b596	57 	W 
	ld a,(lba42h)		;b597	3a 42 ba 	: B . 
	ld e,a			;b59a	5f 	_ 
	ld hl,lb83eh		;b59b	21 3e b8 	! > . 
	ret			;b59e	c9 	. 
sub_b59fh:
	call sub_b58fh		;b59f	cd 8f b5 	. . . 
	ld b,002h		;b5a2	06 02 	. . 
	xor a			;b5a4	af 	. 
	call sub_b5bah		;b5a5	cd ba b5 	. . . 
	ret			;b5a8	c9 	. 
sub_b5a9h:
	call sub_b58fh		;b5a9	cd 8f b5 	. . . 
	ld b,001h		;b5ac	06 01 	. . 
	xor a			;b5ae	af 	. 
	call sub_b5bah		;b5af	cd ba b5 	. . . 
	ret			;b5b2	c9 	. 
flush_floppy_buffer:
	ld a,(lba45h)		;b5b3	3a 45 ba 	: E . 
	or a			;b5b6	b7 	. 
	ret z			;b5b7	c8 	. 
	jr lb576h		;b5b8	18 bc 	. . 
sub_b5bah:
	ld (lba59h),a		;b5ba	32 59 ba 	2 Y . 
	ld a,(lb83ch)		;b5bd	3a 3c b8 	: < . 
	ld (lb837h),a		;b5c0	32 37 b8 	2 7 . 
lb5c3h:
	xor a			;b5c3	af 	. 
	ld (lb834h),a		;b5c4	32 34 b8 	2 4 . 
	push hl			;b5c7	e5 	. 
	push de			;b5c8	d5 	. 
	push bc			;b5c9	c5 	. 
	call sub_b661h		;b5ca	cd 61 b6 	. a . 
	pop bc			;b5cd	c1 	. 
	pop de			;b5ce	d1 	. 
	pop hl			;b5cf	e1 	. 
	or a			;b5d0	b7 	. 
	ret z			;b5d1	c8 	. 
	ld (lb834h),a		;b5d2	32 34 b8 	2 4 . 
	ld a,(lb837h)		;b5d5	3a 37 b8 	: 7 . 
	dec a			;b5d8	3d 	= 
	ld (lb837h),a		;b5d9	32 37 b8 	2 7 . 
	jr nz,lb5c3h		;b5dc	20 e5 	  . 
	ld a,(lba59h)		;b5de	3a 59 ba 	: Y . 
	or a			;b5e1	b7 	. 
	jr z,lb5ech		;b5e2	28 08 	( . 
	ld a,(lba87h)		;b5e4	3a 87 ba 	: . . 
	ld b,a			;b5e7	47 	G 
	ld a,(lb834h)		;b5e8	3a 34 b8 	: 4 . 
	ret			;b5eb	c9 	. 
lb5ech:
	ld a,(sys_page_err_diag)		;b5ec	3a 62 2c 	: b , 
	or a			;b5ef	b7 	. 
	jr z,lb629h		;b5f0	28 37 	( 7 
	push hl			;b5f2	e5 	. 
	push de			;b5f3	d5 	. 
	push bc			;b5f4	c5 	. 
lb5f5h:
	ld a,001h		;b5f5	3e 01 	> . 
	ld (l1f98h),a		;b5f7	32 98 1f 	2 . . 
	ld a,(lba87h)		;b5fa	3a 87 ba 	: . . 
	ld b,a			;b5fd	47 	G 
	ld a,(lb834h)		;b5fe	3a 34 b8 	: 4 . 
	cp 005h		;b601	fe 05 	. . 
	jr z,lb61ch		;b603	28 17 	( . 
	call sub_1ae6h		;b605	cd e6 1a 	. . . 
	cp 049h		;b608	fe 49 	. I 
	jr z,lb623h		;b60a	28 17 	( . 
	cp 043h		;b60c	fe 43 	. C 
	jr z,lb61ch		;b60e	28 0c 	( . 
	cp 052h		;b610	fe 52 	. R 
	jr nz,lb5f5h		;b612	20 e1 	  . 
	pop bc			;b614	c1 	. 
	pop de			;b615	d1 	. 
	pop hl			;b616	e1 	. 
	ld a,(lba59h)		;b617	3a 59 ba 	: Y . 
	jr sub_b5bah		;b61a	18 9e 	. . 
lb61ch:
	ld a,001h		;b61c	3e 01 	> . 
	or a			;b61e	b7 	. 
lb61fh:
	pop bc			;b61f	c1 	. 
	pop de			;b620	d1 	. 
	pop hl			;b621	e1 	. 
	ret			;b622	c9 	. 
lb623h:
	xor a			;b623	af 	. 
	ld (lb834h),a		;b624	32 34 b8 	2 4 . 
	jr lb61fh		;b627	18 f6 	. . 
lb629h:
	ld a,001h		;b629	3e 01 	> . 
	or a			;b62b	b7 	. 
	ret			;b62c	c9 	. 
sub_b62dh:
	ld a,(lba59h)		;b62d	3a 59 ba 	: Y . 
	or a			;b630	b7 	. 
	jr nz,lb653h		;b631	20 20 	    
	ld a,(sys_page_err_diag)		;b633	3a 62 2c 	: b , 
	or a			;b636	b7 	. 
	jr nz,lb63eh		;b637	20 05 	  . 
	pop hl			;b639	e1 	. 
	pop hl			;b63a	e1 	. 
	jp lb629h		;b63b	c3 29 b6 	. ) . 
lb63eh:
	ld a,001h		;b63e	3e 01 	> . 
	ld (l1f98h),a		;b640	32 98 1f 	2 . . 
	ld a,(lba87h)		;b643	3a 87 ba 	: . . 
	ld b,a			;b646	47 	G 
	ld a,005h		;b647	3e 05 	> . 
	call sub_1ae6h		;b649	cd e6 1a 	. . . 
	cp 052h		;b64c	fe 52 	. R 
	ret z			;b64e	c8 	. 
	cp 043h		;b64f	fe 43 	. C 
	jr nz,lb63eh		;b651	20 eb 	  . 
lb653h:
	pop hl			;b653	e1 	. 
	pop hl			;b654	e1 	. 
	ld a,001h		;b655	3e 01 	> . 
	ld (lb837h),a		;b657	32 37 b8 	2 7 . 
	ld a,(lba87h)		;b65a	3a 87 ba 	: . . 
	ld b,a			;b65d	47 	G 
	ld a,005h		;b65e	3e 05 	> . 
	ret			;b660	c9 	. 
sub_b661h:
	ld (l1c26h),bc		;b661	ed 43 26 1c 	. C & . 
	ld a,c			;b665	79 	y 
	or a			;b666	b7 	. 
	jr nz,lb671h		;b667	20 08 	  . 
	ld a,(lb3dbh)		;b669	3a db b3 	: . . 
	ld (lba87h),a		;b66c	32 87 ba 	2 . . 
	jr lb677h		;b66f	18 06 	. . 
lb671h:
	ld a,(lb3dch)		;b671	3a dc b3 	: . . 
	ld (lba87h),a		;b674	32 87 ba 	2 . . 
lb677h:
	ld a,b			;b677	78 	x 
	or a			;b678	b7 	. 
	jp z,lb74eh		;b679	ca 4e b7 	. N . 
	cp 003h		;b67c	fe 03 	. . 
	jr nz,lb686h		;b67e	20 06 	  . 
	ld ix,lb827h		;b680	dd 21 27 b8 	. ! ' . 
	jr lb6a1h		;b684	18 1b 	. . 
lb686h:
	cp 004h		;b686	fe 04 	. . 
	jr nz,lb695h		;b688	20 0b 	  . 
	ld ix,lb827h		;b68a	dd 21 27 b8 	. ! ' . 
	ld a,002h		;b68e	3e 02 	> . 
	ld (l1c27h),a		;b690	32 27 1c 	2 ' . 
	jr lb6a1h		;b693	18 0c 	. . 
lb695h:
	xor a			;b695	af 	. 
	or c			;b696	b1 	. 
	ld ix,lb81bh		;b697	dd 21 1b b8 	. ! . . 
	jr z,lb6a1h		;b69b	28 04 	( . 
	ld ix,nec765_param_table		;b69d	dd 21 f9 f5 	. ! . . 
lb6a1h:
	xor a			;b6a1	af 	. 
	ld (lb833h),a		;b6a2	32 33 b8 	2 3 . 
	cp (ix+00ah)		;b6a5	dd be 0a 	. . . 
	jr z,lb6bch		;b6a8	28 12 	( . 
	ld a,d			;b6aa	7a 	z 
	sub (ix+00bh)		;b6ab	dd 96 0b 	. . . 
	jr c,lb6c8h		;b6ae	38 18 	8 . 
	ld d,a			;b6b0	57 	W 
	ld a,027h		;b6b1	3e 27 	> ' 
	sub d			;b6b3	92 	. 
	ld d,a			;b6b4	57 	W 
	ld a,001h		;b6b5	3e 01 	> . 
	ld (lb833h),a		;b6b7	32 33 b8 	2 3 . 
	jr lb6c8h		;b6ba	18 0c 	. . 
lb6bch:
	ld a,e			;b6bc	7b 	{ 
	sub (ix+004h)		;b6bd	dd 96 04 	. . . 
	jr c,lb6c8h		;b6c0	38 06 	8 . 
	ld e,a			;b6c2	5f 	_ 
	ld a,001h		;b6c3	3e 01 	> . 
	ld (lb833h),a		;b6c5	32 33 b8 	2 3 . 
lb6c8h:
	inc e			;b6c8	1c 	. 
	ld (lb838h),hl		;b6c9	22 38 b8 	" 8 . 
	ld (lb835h),de		;b6cc	ed 53 35 b8 	. S 5 . 
	call sub_b762h		;b6d0	cd 62 b7 	. b . 
	ret nz			;b6d3	c0 	. 
	call sub_b739h		;b6d4	cd 39 b7 	. 9 . 
	ret nz			;b6d7	c0 	. 
	ld a,(l1c27h)		;b6d8	3a 27 1c 	: ' . 
	cp 002h		;b6db	fe 02 	. . 
	jr z,lb6e6h		;b6dd	28 07 	( . 
	call sub_b7b4h		;b6df	cd b4 b7 	. . . 
	ld a,046h		;b6e2	3e 46 	> F 
	jr lb6ebh		;b6e4	18 05 	. . 
lb6e6h:
	call sub_b7dah		;b6e6	cd da b7 	. . . 
	ld a,045h		;b6e9	3e 45 	> E 
lb6ebh:
	call sub_b7f1h		;b6eb	cd f1 b7 	. . . 
	ld a,(l1c26h)		;b6ee	3a 26 1c 	: & . 
	ld c,a			;b6f1	4f 	O 
	ld a,(lb833h)		;b6f2	3a 33 b8 	: 3 . 
	or a			;b6f5	b7 	. 
	jr z,lb6fah		;b6f6	28 02 	( . 
	set 2,c		;b6f8	cb d1 	. . 
lb6fah:
	ld a,c			;b6fa	79 	y 
	call sub_b7f1h		;b6fb	cd f1 b7 	. . . 
	ld a,(lb836h)		;b6fe	3a 36 b8 	: 6 . 
	call sub_b7f1h		;b701	cd f1 b7 	. . . 
	ld a,(lb833h)		;b704	3a 33 b8 	: 3 . 
	call sub_b7f1h		;b707	cd f1 b7 	. . . 
	ld a,(lb835h)		;b70a	3a 35 b8 	: 5 . 
	call sub_b7f1h		;b70d	cd f1 b7 	. . . 
	ld a,(ix+006h)		;b710	dd 7e 06 	. ~ . 
	call sub_b7f1h		;b713	cd f1 b7 	. . . 
	ld a,(ix+004h)		;b716	dd 7e 04 	. ~ . 
	call sub_b7f1h		;b719	cd f1 b7 	. . . 
	ld a,(ix+005h)		;b71c	dd 7e 05 	. ~ . 
	call sub_b7f1h		;b71f	cd f1 b7 	. . . 
	ld a,0ffh		;b722	3e ff 	> . 
	call sub_b7f1h		;b724	cd f1 b7 	. . . 
	call sub_b810h		;b727	cd 10 b8 	. . . 
	xor a			;b72a	af 	. 
	out (04dh),a		;b72b	d3 4d 	. M 
	call sub_b7dfh		;b72d	cd df b7 	. . . 
	ld a,(lba50h)		;b730	3a 50 ba 	: P . 
	and 0c0h		;b733	e6 c0 	. . 
	ret z			;b735	c8 	. 
	ld a,003h		;b736	3e 03 	> . 
	ret			;b738	c9 	. 
sub_b739h:
	ld a,00fh		;b739	3e 0f 	> . 
	call sub_b7f1h		;b73b	cd f1 b7 	. . . 
	ld a,(l1c26h)		;b73e	3a 26 1c 	: & . 
	call sub_b7f1h		;b741	cd f1 b7 	. . . 
	ld a,(lb836h)		;b744	3a 36 b8 	: 6 . 
	call sub_b7f1h		;b747	cd f1 b7 	. . . 
	call sub_b79eh		;b74a	cd 9e b7 	. . . 
	ret			;b74d	c9 	. 
lb74eh:
	call sub_b762h		;b74e	cd 62 b7 	. b . 
	or a			;b751	b7 	. 
	ret nz			;b752	c0 	. 
sub_b753h:
	ld a,007h		;b753	3e 07 	> . 
	call sub_b7f1h		;b755	cd f1 b7 	. . . 
	ld a,(l1c26h)		;b758	3a 26 1c 	: & . 
	call sub_b7f1h		;b75b	cd f1 b7 	. . . 
	call sub_b79eh		;b75e	cd 9e b7 	. . . 
	ret			;b761	c9 	. 
sub_b762h:
	in a,(030h)		;b762	db 30 	. 0 
	out (030h),a		;b764	d3 30 	. 0 
	and 002h		;b766	e6 02 	. . 
	jr z,lb76dh		;b768	28 03 	( . 
	call sub_b792h		;b76a	cd 92 b7 	. . . 
lb76dh:
	ld a,004h		;b76d	3e 04 	> . 
	call sub_b7f1h		;b76f	cd f1 b7 	. . . 
	ld a,(l1c26h)		;b772	3a 26 1c 	: & . 
	call sub_b7f1h		;b775	cd f1 b7 	. . . 
	call sub_b7dfh		;b778	cd df b7 	. . . 
	ld a,(lba50h)		;b77b	3a 50 ba 	: P . 
	and 020h		;b77e	e6 20 	.   
	xor 020h		;b780	ee 20 	.   
	ret z			;b782	c8 	. 
	call sub_b62dh		;b783	cd 2d b6 	. - . 
	in a,(030h)		;b786	db 30 	. 0 
	out (030h),a		;b788	d3 30 	. 0 
	call sub_b792h		;b78a	cd 92 b7 	. . . 
	call sub_b753h		;b78d	cd 53 b7 	. S . 
	jr lb76dh		;b790	18 db 	. . 
sub_b792h:
	ld de,00190h		;b792	11 90 01 	. . . 
lb795h:
	call sub_b7fah		;b795	cd fa b7 	. . . 
	dec de			;b798	1b 	. 
	ld a,d			;b799	7a 	z 
	or e			;b79a	b3 	. 
	jr nz,lb795h		;b79b	20 f8 	  . 
	ret			;b79d	c9 	. 
sub_b79eh:
	ld a,008h		;b79e	3e 08 	> . 
	call sub_b7f1h		;b7a0	cd f1 b7 	. . . 
	call sub_b7dfh		;b7a3	cd df b7 	. . . 
	ld a,(lba50h)		;b7a6	3a 50 ba 	: P . 
	bit 5,a		;b7a9	cb 6f 	. o 
	jr z,sub_b79eh		;b7ab	28 f1 	( . 
	and 010h		;b7ad	e6 10 	. . 
	ret z			;b7af	c8 	. 
	ld a,004h		;b7b0	3e 04 	> . 
	or a			;b7b2	b7 	. 
	ret			;b7b3	c9 	. 
sub_b7b4h:
	ld bc,l6044h		;b7b4	01 44 60 	. D ` 
lb7b7h:
	xor a			;b7b7	af 	. 
	out (04dh),a		;b7b8	d3 4d 	. M 
	ld a,c			;b7ba	79 	y 
	out (04bh),a		;b7bb	d3 4b 	. K 
	ld a,(lb838h)		;b7bd	3a 38 b8 	: 8 . 
	out (040h),a		;b7c0	d3 40 	. @ 
	ld a,(lb839h)		;b7c2	3a 39 b8 	: 9 . 
	out (040h),a		;b7c5	d3 40 	. @ 
	ld a,(ix+007h)		;b7c7	dd 7e 07 	. ~ . 
	out (041h),a		;b7ca	d3 41 	. A 
	ld a,(ix+008h)		;b7cc	dd 7e 08 	. ~ . 
	out (041h),a		;b7cf	d3 41 	. A 
	ld a,b			;b7d1	78 	x 
	out (048h),a		;b7d2	d3 48 	. H 
	ld a,00eh		;b7d4	3e 0e 	> . 
	out (04fh),a		;b7d6	d3 4f 	. O 
	xor a			;b7d8	af 	. 
	ret			;b7d9	c9 	. 
sub_b7dah:
	ld bc,04048h		;b7da	01 48 40 	. H @ 
	jr lb7b7h		;b7dd	18 d8 	. . 
sub_b7dfh:
	ld hl,lba50h		;b7df	21 50 ba 	! P . 
	ld c,035h		;b7e2	0e 35 	. 5 
lb7e4h:
	in a,(034h)		;b7e4	db 34 	. 4 
	bit 7,a		;b7e6	cb 7f 	.  
	jr z,lb7e4h		;b7e8	28 fa 	( . 
	bit 6,a		;b7ea	cb 77 	. w 
	ret z			;b7ec	c8 	. 
	ini		;b7ed	ed a2 	. . 
	jr lb7e4h		;b7ef	18 f3 	. . 
sub_b7f1h:
	ld c,a			;b7f1	4f 	O 
	call sub_b805h		;b7f2	cd 05 b8 	. . . 
	ld a,c			;b7f5	79 	y 
	out (035h),a		;b7f6	d3 35 	. 5 
	xor a			;b7f8	af 	. 
	ret			;b7f9	c9 	. 
sub_b7fah:
	push de			;b7fa	d5 	. 
	ld de,0029ah		;b7fb	11 9a 02 	. . . 
lb7feh:
	dec de			;b7fe	1b 	. 
	ld a,d			;b7ff	7a 	z 
	or e			;b800	b3 	. 
	jr nz,lb7feh		;b801	20 fb 	  . 
	pop de			;b803	d1 	. 
	ret			;b804	c9 	. 
sub_b805h:
	in a,(034h)		;b805	db 34 	. 4 
	bit 7,a		;b807	cb 7f 	.  
	jr z,sub_b805h		;b809	28 fa 	( . 
	bit 6,a		;b80b	cb 77 	. w 
	jr nz,sub_b805h		;b80d	20 f6 	  . 
	ret			;b80f	c9 	. 
sub_b810h:
	in a,(034h)		;b810	db 34 	. 4 
	bit 7,a		;b812	cb 7f 	.  
	jr z,sub_b810h		;b814	28 fa 	( . 
	bit 6,a		;b816	cb 77 	. w 
	jr z,sub_b810h		;b818	28 f6 	( . 
	ret			;b81a	c9 	. 
lb81bh:
	defb 010h		;b81b	10 	. 
	defb 050h		;b81c	50 	P 
	defb 002h		;b81d	02 	. 
	defb 003h		;b81e	03 	. 
	defb 00ah		;b81f	0a 	. 
	defb 00fh		;b820	0f 	. 
	defb 002h		;b821	02 	. 
	defb 0ffh		;b822	ff 	. 
	defb 001h		;b823	01 	. 
	defb 004h		;b824	04 	. 
	defb 000h		;b825	00 	. 
	defb 028h		;b826	28 	( 
lb827h:
	defb 010h		;b827	10 	. 
	defb 040h		;b828	40 	@ 
	defb 001h		;b829	01 	. 
	defb 001h		;b82a	01 	. 
	defb 010h		;b82b	10 	. 
	defb 023h		;b82c	23 	# 
	defb 001h		;b82d	01 	. 
	defb 0ffh		;b82e	ff 	. 
	defb 000h		;b82f	00 	. 
	defb 004h		;b830	04 	. 
	defb 000h		;b831	00 	. 
	defb 028h		;b832	28 	( 
lb833h:
	defb 000h		;b833	00 	. 
lb834h:
	defb 000h		;b834	00 	. 
lb835h:
	defb 000h		;b835	00 	. 
lb836h:
	defb 000h		;b836	00 	. 
lb837h:
	defb 000h		;b837	00 	. 
lb838h:
	defb 000h		;b838	00 	. 
lb839h:
	defb 000h		;b839	00 	. 
lb83ah:
	defb 000h		;b83a	00 	. 
	defb 000h		;b83b	00 	. 
lb83ch:
	defb 005h		;b83c	05 	. 
	defb 000h		;b83d	00 	. 
lb83eh:
	defb 000h		;b83e	00 	. 
	defb 000h		;b83f	00 	. 
	defb 000h		;b840	00 	. 
	defb 000h		;b841	00 	. 
	defb 000h		;b842	00 	. 
	defb 000h		;b843	00 	. 
	defb 000h		;b844	00 	. 
	defb 000h		;b845	00 	. 
	defb 000h		;b846	00 	. 
	defb 000h		;b847	00 	. 
	defb 000h		;b848	00 	. 
	defb 000h		;b849	00 	. 
	defb 000h		;b84a	00 	. 
	defb 000h		;b84b	00 	. 
	defb 000h		;b84c	00 	. 
	defb 000h		;b84d	00 	. 
	defb 000h		;b84e	00 	. 
	defb 000h		;b84f	00 	. 
	defb 000h		;b850	00 	. 
	defb 000h		;b851	00 	. 
	defb 000h		;b852	00 	. 
	defb 000h		;b853	00 	. 
lb854h:
	defb 000h		;b854	00 	. 
	defb 000h		;b855	00 	. 
	defb 000h		;b856	00 	. 
	defb 000h		;b857	00 	. 
	defb 000h		;b858	00 	. 
	defb 000h		;b859	00 	. 
	defb 000h		;b85a	00 	. 
	defb 000h		;b85b	00 	. 
	defb 000h		;b85c	00 	. 
	defb 000h		;b85d	00 	. 
	defb 000h		;b85e	00 	. 
	defb 000h		;b85f	00 	. 
	defb 000h		;b860	00 	. 
	defb 000h		;b861	00 	. 
	defb 000h		;b862	00 	. 
	defb 000h		;b863	00 	. 
	defb 000h		;b864	00 	. 
	defb 000h		;b865	00 	. 
	defb 000h		;b866	00 	. 
	defb 000h		;b867	00 	. 
	defb 000h		;b868	00 	. 
	defb 000h		;b869	00 	. 
	defb 000h		;b86a	00 	. 
	defb 000h		;b86b	00 	. 
	defb 000h		;b86c	00 	. 
	defb 000h		;b86d	00 	. 
	defb 000h		;b86e	00 	. 
	defb 000h		;b86f	00 	. 
	defb 000h		;b870	00 	. 
	defb 000h		;b871	00 	. 
	defb 000h		;b872	00 	. 
	defb 000h		;b873	00 	. 
	defb 000h		;b874	00 	. 
	defb 000h		;b875	00 	. 
	defb 000h		;b876	00 	. 
	defb 000h		;b877	00 	. 
	defb 000h		;b878	00 	. 
	defb 000h		;b879	00 	. 
	defb 000h		;b87a	00 	. 
	defb 000h		;b87b	00 	. 
	defb 000h		;b87c	00 	. 
	defb 000h		;b87d	00 	. 
	defb 000h		;b87e	00 	. 
	defb 000h		;b87f	00 	. 
	defb 000h		;b880	00 	. 
	defb 000h		;b881	00 	. 
	defb 000h		;b882	00 	. 
	defb 000h		;b883	00 	. 
	defb 000h		;b884	00 	. 
	defb 000h		;b885	00 	. 
	defb 000h		;b886	00 	. 
	defb 000h		;b887	00 	. 
	defb 000h		;b888	00 	. 
	defb 000h		;b889	00 	. 
	defb 000h		;b88a	00 	. 
	defb 000h		;b88b	00 	. 
	defb 000h		;b88c	00 	. 
	defb 000h		;b88d	00 	. 
	defb 000h		;b88e	00 	. 
	defb 000h		;b88f	00 	. 
	defb 000h		;b890	00 	. 
	defb 000h		;b891	00 	. 
	defb 000h		;b892	00 	. 
	defb 000h		;b893	00 	. 
	defb 000h		;b894	00 	. 
	defb 000h		;b895	00 	. 
	defb 000h		;b896	00 	. 
	defb 000h		;b897	00 	. 
	defb 000h		;b898	00 	. 
	defb 000h		;b899	00 	. 
	defb 000h		;b89a	00 	. 
	defb 000h		;b89b	00 	. 
	defb 000h		;b89c	00 	. 
	defb 000h		;b89d	00 	. 
	defb 000h		;b89e	00 	. 
	defb 000h		;b89f	00 	. 
	defb 000h		;b8a0	00 	. 
	defb 000h		;b8a1	00 	. 
	defb 000h		;b8a2	00 	. 
	defb 000h		;b8a3	00 	. 
	defb 000h		;b8a4	00 	. 
	defb 000h		;b8a5	00 	. 
	defb 000h		;b8a6	00 	. 
	defb 000h		;b8a7	00 	. 
	defb 000h		;b8a8	00 	. 
	defb 000h		;b8a9	00 	. 
	defb 000h		;b8aa	00 	. 
	defb 000h		;b8ab	00 	. 
	defb 000h		;b8ac	00 	. 
	defb 000h		;b8ad	00 	. 
	defb 000h		;b8ae	00 	. 
	defb 000h		;b8af	00 	. 
	defb 000h		;b8b0	00 	. 
	defb 000h		;b8b1	00 	. 
	defb 000h		;b8b2	00 	. 
	defb 000h		;b8b3	00 	. 
	defb 000h		;b8b4	00 	. 
	defb 000h		;b8b5	00 	. 
	defb 000h		;b8b6	00 	. 
	defb 000h		;b8b7	00 	. 
	defb 000h		;b8b8	00 	. 
	defb 000h		;b8b9	00 	. 
	defb 000h		;b8ba	00 	. 
	defb 000h		;b8bb	00 	. 
	defb 000h		;b8bc	00 	. 
lb8bdh:
	defb 000h		;b8bd	00 	. 
	defb 000h		;b8be	00 	. 
	defb 000h		;b8bf	00 	. 
	defb 000h		;b8c0	00 	. 
	defb 000h		;b8c1	00 	. 
	defb 000h		;b8c2	00 	. 
	defb 000h		;b8c3	00 	. 
	defb 000h		;b8c4	00 	. 
	defb 000h		;b8c5	00 	. 
	defb 000h		;b8c6	00 	. 
	defb 000h		;b8c7	00 	. 
	defb 000h		;b8c8	00 	. 
	defb 000h		;b8c9	00 	. 
	defb 000h		;b8ca	00 	. 
	defb 000h		;b8cb	00 	. 
	defb 000h		;b8cc	00 	. 
	defb 000h		;b8cd	00 	. 
	defb 000h		;b8ce	00 	. 
	defb 000h		;b8cf	00 	. 
	defb 000h		;b8d0	00 	. 
	defb 000h		;b8d1	00 	. 
	defb 000h		;b8d2	00 	. 
	defb 000h		;b8d3	00 	. 
	defb 000h		;b8d4	00 	. 
	defb 000h		;b8d5	00 	. 
	defb 000h		;b8d6	00 	. 
	defb 000h		;b8d7	00 	. 
	defb 000h		;b8d8	00 	. 
	defb 000h		;b8d9	00 	. 
	defb 000h		;b8da	00 	. 
	defb 000h		;b8db	00 	. 
	defb 000h		;b8dc	00 	. 
	defb 000h		;b8dd	00 	. 
	defb 000h		;b8de	00 	. 
	defb 000h		;b8df	00 	. 
	defb 000h		;b8e0	00 	. 
	defb 000h		;b8e1	00 	. 
	defb 000h		;b8e2	00 	. 
	defb 000h		;b8e3	00 	. 
	defb 000h		;b8e4	00 	. 
	defb 000h		;b8e5	00 	. 
	defb 000h		;b8e6	00 	. 
	defb 000h		;b8e7	00 	. 
	defb 000h		;b8e8	00 	. 
	defb 000h		;b8e9	00 	. 
	defb 000h		;b8ea	00 	. 
	defb 000h		;b8eb	00 	. 
	defb 000h		;b8ec	00 	. 
	defb 000h		;b8ed	00 	. 
	defb 000h		;b8ee	00 	. 
	defb 000h		;b8ef	00 	. 
	defb 000h		;b8f0	00 	. 
	defb 000h		;b8f1	00 	. 
	defb 000h		;b8f2	00 	. 
	defb 000h		;b8f3	00 	. 
	defb 000h		;b8f4	00 	. 
	defb 000h		;b8f5	00 	. 
	defb 000h		;b8f6	00 	. 
	defb 000h		;b8f7	00 	. 
	defb 000h		;b8f8	00 	. 
	defb 000h		;b8f9	00 	. 
	defb 000h		;b8fa	00 	. 
	defb 000h		;b8fb	00 	. 
	defb 000h		;b8fc	00 	. 
	defb 000h		;b8fd	00 	. 
	defb 000h		;b8fe	00 	. 
	defb 000h		;b8ff	00 	. 
	defb 000h		;b900	00 	. 
	defb 000h		;b901	00 	. 
	defb 000h		;b902	00 	. 
	defb 000h		;b903	00 	. 
	defb 000h		;b904	00 	. 
	defb 000h		;b905	00 	. 
	defb 000h		;b906	00 	. 
	defb 000h		;b907	00 	. 
	defb 000h		;b908	00 	. 
	defb 000h		;b909	00 	. 
	defb 000h		;b90a	00 	. 
	defb 000h		;b90b	00 	. 
	defb 000h		;b90c	00 	. 
	defb 000h		;b90d	00 	. 
	defb 000h		;b90e	00 	. 
	defb 000h		;b90f	00 	. 
	defb 000h		;b910	00 	. 
	defb 000h		;b911	00 	. 
	defb 000h		;b912	00 	. 
	defb 000h		;b913	00 	. 
	defb 000h		;b914	00 	. 
	defb 000h		;b915	00 	. 
	defb 000h		;b916	00 	. 
	defb 000h		;b917	00 	. 
	defb 000h		;b918	00 	. 
	defb 000h		;b919	00 	. 
	defb 000h		;b91a	00 	. 
	defb 000h		;b91b	00 	. 
	defb 000h		;b91c	00 	. 
	defb 000h		;b91d	00 	. 
	defb 000h		;b91e	00 	. 
	defb 000h		;b91f	00 	. 
	defb 000h		;b920	00 	. 
	defb 000h		;b921	00 	. 
	defb 000h		;b922	00 	. 
	defb 000h		;b923	00 	. 
	defb 000h		;b924	00 	. 
	defb 000h		;b925	00 	. 
	defb 000h		;b926	00 	. 
	defb 000h		;b927	00 	. 
	defb 000h		;b928	00 	. 
	defb 000h		;b929	00 	. 
	defb 000h		;b92a	00 	. 
	defb 000h		;b92b	00 	. 
	defb 000h		;b92c	00 	. 
	defb 000h		;b92d	00 	. 
	defb 000h		;b92e	00 	. 
	defb 000h		;b92f	00 	. 
	defb 000h		;b930	00 	. 
	defb 000h		;b931	00 	. 
	defb 000h		;b932	00 	. 
	defb 000h		;b933	00 	. 
	defb 000h		;b934	00 	. 
	defb 000h		;b935	00 	. 
	defb 000h		;b936	00 	. 
	defb 000h		;b937	00 	. 
	defb 000h		;b938	00 	. 
	defb 000h		;b939	00 	. 
	defb 000h		;b93a	00 	. 
	defb 000h		;b93b	00 	. 
	defb 000h		;b93c	00 	. 
	defb 000h		;b93d	00 	. 
	defb 000h		;b93e	00 	. 
	defb 000h		;b93f	00 	. 
	defb 000h		;b940	00 	. 
	defb 000h		;b941	00 	. 
	defb 000h		;b942	00 	. 
	defb 000h		;b943	00 	. 
	defb 000h		;b944	00 	. 
	defb 000h		;b945	00 	. 
	defb 000h		;b946	00 	. 
	defb 000h		;b947	00 	. 
	defb 000h		;b948	00 	. 
	defb 000h		;b949	00 	. 
	defb 000h		;b94a	00 	. 
	defb 000h		;b94b	00 	. 
	defb 000h		;b94c	00 	. 
	defb 000h		;b94d	00 	. 
	defb 000h		;b94e	00 	. 
	defb 000h		;b94f	00 	. 
	defb 000h		;b950	00 	. 
	defb 000h		;b951	00 	. 
	defb 000h		;b952	00 	. 
	defb 000h		;b953	00 	. 
	defb 000h		;b954	00 	. 
	defb 000h		;b955	00 	. 
	defb 000h		;b956	00 	. 
	defb 000h		;b957	00 	. 
	defb 000h		;b958	00 	. 
	defb 000h		;b959	00 	. 
	defb 000h		;b95a	00 	. 
	defb 000h		;b95b	00 	. 
	defb 000h		;b95c	00 	. 
	defb 000h		;b95d	00 	. 
	defb 000h		;b95e	00 	. 
	defb 000h		;b95f	00 	. 
	defb 000h		;b960	00 	. 
	defb 000h		;b961	00 	. 
	defb 000h		;b962	00 	. 
	defb 000h		;b963	00 	. 
	defb 000h		;b964	00 	. 
	defb 000h		;b965	00 	. 
	defb 000h		;b966	00 	. 
	defb 000h		;b967	00 	. 
	defb 000h		;b968	00 	. 
	defb 000h		;b969	00 	. 
	defb 000h		;b96a	00 	. 
	defb 000h		;b96b	00 	. 
	defb 000h		;b96c	00 	. 
	defb 000h		;b96d	00 	. 
	defb 000h		;b96e	00 	. 
	defb 000h		;b96f	00 	. 
	defb 000h		;b970	00 	. 
	defb 000h		;b971	00 	. 
	defb 000h		;b972	00 	. 
	defb 000h		;b973	00 	. 
	defb 000h		;b974	00 	. 
	defb 000h		;b975	00 	. 
	defb 000h		;b976	00 	. 
	defb 000h		;b977	00 	. 
	defb 000h		;b978	00 	. 
	defb 000h		;b979	00 	. 
	defb 000h		;b97a	00 	. 
	defb 000h		;b97b	00 	. 
	defb 000h		;b97c	00 	. 
	defb 000h		;b97d	00 	. 
	defb 000h		;b97e	00 	. 
	defb 000h		;b97f	00 	. 
	defb 000h		;b980	00 	. 
	defb 000h		;b981	00 	. 
	defb 000h		;b982	00 	. 
	defb 000h		;b983	00 	. 
	defb 000h		;b984	00 	. 
	defb 000h		;b985	00 	. 
	defb 000h		;b986	00 	. 
	defb 000h		;b987	00 	. 
	defb 000h		;b988	00 	. 
	defb 000h		;b989	00 	. 
	defb 000h		;b98a	00 	. 
	defb 000h		;b98b	00 	. 
	defb 000h		;b98c	00 	. 
	defb 000h		;b98d	00 	. 
	defb 000h		;b98e	00 	. 
	defb 000h		;b98f	00 	. 
	defb 000h		;b990	00 	. 
	defb 000h		;b991	00 	. 
	defb 000h		;b992	00 	. 
	defb 000h		;b993	00 	. 
	defb 000h		;b994	00 	. 
	defb 000h		;b995	00 	. 
	defb 000h		;b996	00 	. 
	defb 000h		;b997	00 	. 
	defb 000h		;b998	00 	. 
	defb 000h		;b999	00 	. 
	defb 000h		;b99a	00 	. 
	defb 000h		;b99b	00 	. 
	defb 000h		;b99c	00 	. 
	defb 000h		;b99d	00 	. 
	defb 000h		;b99e	00 	. 
	defb 000h		;b99f	00 	. 
	defb 000h		;b9a0	00 	. 
	defb 000h		;b9a1	00 	. 
	defb 000h		;b9a2	00 	. 
	defb 000h		;b9a3	00 	. 
	defb 000h		;b9a4	00 	. 
	defb 000h		;b9a5	00 	. 
	defb 000h		;b9a6	00 	. 
	defb 000h		;b9a7	00 	. 
	defb 000h		;b9a8	00 	. 
	defb 000h		;b9a9	00 	. 
	defb 000h		;b9aa	00 	. 
	defb 000h		;b9ab	00 	. 
	defb 000h		;b9ac	00 	. 
	defb 000h		;b9ad	00 	. 
	defb 000h		;b9ae	00 	. 
	defb 000h		;b9af	00 	. 
	defb 000h		;b9b0	00 	. 
	defb 000h		;b9b1	00 	. 
	defb 000h		;b9b2	00 	. 
	defb 000h		;b9b3	00 	. 
	defb 000h		;b9b4	00 	. 
	defb 000h		;b9b5	00 	. 
	defb 000h		;b9b6	00 	. 
	defb 000h		;b9b7	00 	. 
	defb 000h		;b9b8	00 	. 
	defb 000h		;b9b9	00 	. 
	defb 000h		;b9ba	00 	. 
	defb 000h		;b9bb	00 	. 
	defb 000h		;b9bc	00 	. 
	defb 000h		;b9bd	00 	. 
	defb 000h		;b9be	00 	. 
	defb 000h		;b9bf	00 	. 
	defb 000h		;b9c0	00 	. 
	defb 000h		;b9c1	00 	. 
	defb 000h		;b9c2	00 	. 
	defb 000h		;b9c3	00 	. 
	defb 000h		;b9c4	00 	. 
	defb 000h		;b9c5	00 	. 
	defb 000h		;b9c6	00 	. 
	defb 000h		;b9c7	00 	. 
	defb 000h		;b9c8	00 	. 
	defb 000h		;b9c9	00 	. 
	defb 000h		;b9ca	00 	. 
	defb 000h		;b9cb	00 	. 
	defb 000h		;b9cc	00 	. 
	defb 000h		;b9cd	00 	. 
	defb 000h		;b9ce	00 	. 
	defb 000h		;b9cf	00 	. 
	defb 000h		;b9d0	00 	. 
	defb 000h		;b9d1	00 	. 
	defb 000h		;b9d2	00 	. 
	defb 000h		;b9d3	00 	. 
	defb 000h		;b9d4	00 	. 
	defb 000h		;b9d5	00 	. 
	defb 000h		;b9d6	00 	. 
	defb 000h		;b9d7	00 	. 
	defb 000h		;b9d8	00 	. 
	defb 000h		;b9d9	00 	. 
	defb 000h		;b9da	00 	. 
	defb 000h		;b9db	00 	. 
	defb 000h		;b9dc	00 	. 
	defb 000h		;b9dd	00 	. 
	defb 000h		;b9de	00 	. 
	defb 000h		;b9df	00 	. 
	defb 000h		;b9e0	00 	. 
	defb 000h		;b9e1	00 	. 
	defb 000h		;b9e2	00 	. 
	defb 000h		;b9e3	00 	. 
	defb 000h		;b9e4	00 	. 
	defb 000h		;b9e5	00 	. 
	defb 000h		;b9e6	00 	. 
	defb 000h		;b9e7	00 	. 
	defb 000h		;b9e8	00 	. 
	defb 000h		;b9e9	00 	. 
	defb 000h		;b9ea	00 	. 
	defb 000h		;b9eb	00 	. 
	defb 000h		;b9ec	00 	. 
	defb 000h		;b9ed	00 	. 
	defb 000h		;b9ee	00 	. 
	defb 000h		;b9ef	00 	. 
	defb 000h		;b9f0	00 	. 
	defb 000h		;b9f1	00 	. 
	defb 000h		;b9f2	00 	. 
	defb 000h		;b9f3	00 	. 
	defb 000h		;b9f4	00 	. 
	defb 000h		;b9f5	00 	. 
	defb 000h		;b9f6	00 	. 
	defb 000h		;b9f7	00 	. 
	defb 000h		;b9f8	00 	. 
	defb 000h		;b9f9	00 	. 
	defb 000h		;b9fa	00 	. 
	defb 000h		;b9fb	00 	. 
	defb 000h		;b9fc	00 	. 
	defb 000h		;b9fd	00 	. 
	defb 000h		;b9fe	00 	. 
	defb 000h		;b9ff	00 	. 
	defb 000h		;ba00	00 	. 
	defb 000h		;ba01	00 	. 
	defb 000h		;ba02	00 	. 
	defb 000h		;ba03	00 	. 
	defb 000h		;ba04	00 	. 
	defb 000h		;ba05	00 	. 
	defb 000h		;ba06	00 	. 
	defb 000h		;ba07	00 	. 
	defb 000h		;ba08	00 	. 
	defb 000h		;ba09	00 	. 
	defb 000h		;ba0a	00 	. 
	defb 000h		;ba0b	00 	. 
	defb 000h		;ba0c	00 	. 
	defb 000h		;ba0d	00 	. 
	defb 000h		;ba0e	00 	. 
	defb 000h		;ba0f	00 	. 
	defb 000h		;ba10	00 	. 
	defb 000h		;ba11	00 	. 
	defb 000h		;ba12	00 	. 
	defb 000h		;ba13	00 	. 
	defb 000h		;ba14	00 	. 
	defb 000h		;ba15	00 	. 
	defb 000h		;ba16	00 	. 
	defb 000h		;ba17	00 	. 
	defb 000h		;ba18	00 	. 
	defb 000h		;ba19	00 	. 
	defb 000h		;ba1a	00 	. 
	defb 000h		;ba1b	00 	. 
	defb 000h		;ba1c	00 	. 
	defb 000h		;ba1d	00 	. 
	defb 000h		;ba1e	00 	. 
	defb 000h		;ba1f	00 	. 
	defb 000h		;ba20	00 	. 
	defb 000h		;ba21	00 	. 
	defb 000h		;ba22	00 	. 
	defb 000h		;ba23	00 	. 
	defb 000h		;ba24	00 	. 
	defb 000h		;ba25	00 	. 
	defb 000h		;ba26	00 	. 
	defb 000h		;ba27	00 	. 
	defb 000h		;ba28	00 	. 
	defb 000h		;ba29	00 	. 
	defb 000h		;ba2a	00 	. 
	defb 000h		;ba2b	00 	. 
	defb 000h		;ba2c	00 	. 
	defb 000h		;ba2d	00 	. 
	defb 000h		;ba2e	00 	. 
	defb 000h		;ba2f	00 	. 
	defb 000h		;ba30	00 	. 
	defb 000h		;ba31	00 	. 
	defb 000h		;ba32	00 	. 
	defb 000h		;ba33	00 	. 
	defb 000h		;ba34	00 	. 
	defb 000h		;ba35	00 	. 
	defb 000h		;ba36	00 	. 
	defb 000h		;ba37	00 	. 
	defb 000h		;ba38	00 	. 
	defb 000h		;ba39	00 	. 
	defb 000h		;ba3a	00 	. 
	defb 000h		;ba3b	00 	. 
	defb 000h		;ba3c	00 	. 
	defb 000h		;ba3d	00 	. 
lba3eh:
	defb 000h		;ba3e	00 	. 
lba3fh:
	defb 000h		;ba3f	00 	. 
lba40h:
	defb 000h		;ba40	00 	. 
	defb 000h		;ba41	00 	. 
lba42h:
	defb 000h		;ba42	00 	. 
lba43h:
	defb 000h		;ba43	00 	. 
lba44h:
	defb 000h		;ba44	00 	. 
lba45h:
	defb 000h		;ba45	00 	. 
lba46h:
	defb 000h		;ba46	00 	. 
lba47h:
	defb 000h		;ba47	00 	. 
lba48h:
	defb 000h		;ba48	00 	. 
	defb 000h		;ba49	00 	. 
lba4ah:
	defb 000h		;ba4a	00 	. 
lba4bh:
	defb 000h		;ba4b	00 	. 
lba4ch:
	defb 000h		;ba4c	00 	. 
lba4dh:
	defb 000h		;ba4d	00 	. 
lba4eh:
	defb 0ffh		;ba4e	ff 	. 
lba4fh:
	defb 0ffh		;ba4f	ff 	. 
lba50h:
	defb 000h		;ba50	00 	. 
	defb 000h		;ba51	00 	. 
	defb 000h		;ba52	00 	. 
	defb 000h		;ba53	00 	. 
	defb 000h		;ba54	00 	. 
	defb 000h		;ba55	00 	. 
	defb 000h		;ba56	00 	. 
	defb 000h		;ba57	00 	. 
	defb 000h		;ba58	00 	. 
lba59h:
	defb 000h		;ba59	00 	. 
	defb 04ch		;ba5a	4c 	L 
	defb 065h		;ba5b	65 	e 
	defb 066h		;ba5c	66 	f 
	defb 074h		;ba5d	74 	t 
	defb 020h		;ba5e	20 	  
	defb 044h		;ba5f	44 	D 
	defb 069h		;ba60	69 	i 
	defb 073h		;ba61	73 	s 
	defb 06bh		;ba62	6b 	k 
	defb 065h		;ba63	65 	e 
	defb 074h		;ba64	74 	t 
	defb 074h		;ba65	74 	t 
	defb 065h		;ba66	65 	e 
	defb 020h		;ba67	20 	  
	defb 044h		;ba68	44 	D 
	defb 072h		;ba69	72 	r 
	defb 069h		;ba6a	69 	i 
	defb 076h		;ba6b	76 	v 
	defb 065h		;ba6c	65 	e 
	defb 00dh		;ba6d	0d 	. 
	defb 00ah		;ba6e	0a 	. 
	defb 000h		;ba6f	00 	. 
	defb 052h		;ba70	52 	R 
	defb 069h		;ba71	69 	i 
	defb 067h		;ba72	67 	g 
	defb 068h		;ba73	68 	h 
	defb 074h		;ba74	74 	t 
	defb 020h		;ba75	20 	  
	defb 044h		;ba76	44 	D 
	defb 069h		;ba77	69 	i 
	defb 073h		;ba78	73 	s 
	defb 06bh		;ba79	6b 	k 
	defb 065h		;ba7a	65 	e 
	defb 074h		;ba7b	74 	t 
	defb 074h		;ba7c	74 	t 
	defb 065h		;ba7d	65 	e 
	defb 020h		;ba7e	20 	  
	defb 044h		;ba7f	44 	D 
	defb 072h		;ba80	72 	r 
	defb 069h		;ba81	69 	i 
	defb 076h		;ba82	76 	v 
	defb 065h		;ba83	65 	e 
	defb 00dh		;ba84	0d 	. 
	defb 00ah		;ba85	0a 	. 
	defb 000h		;ba86	00 	. 
lba87h:
	defb 000h		;ba87	00 	. 
	defb 046h		;ba88	46 	F 
	defb 080h		;ba89	80 	. 
	defb 000h		;ba8a	00 	. 
	defb 008h		;ba8b	08 	. 
	defb 010h		;ba8c	10 	. 
	defb 031h		;ba8d	31 	1 
	defb 001h		;ba8e	01 	. 
	defb 003h		;ba8f	03 	. 
	defb 004h		;ba90	04 	. 
	defb 000h		;ba91	00 	. 
	defb 000h		;ba92	00 	. 
hdd_init_drive:
	ld a,0a0h		;ba93	3e a0 	> . 
	out (086h),a		;ba95	d3 86 	. . 
	ld b,a			;ba97	47 	G 
	cpl			;ba98	2f 	/ 
	out (084h),a		;ba99	d3 84 	. . 
	in a,(086h)		;ba9b	db 86 	. . 
	cp b			;ba9d	b8 	. 
	jp nz,lbaa5h		;ba9e	c2 a5 ba 	. . . 
	xor a			;baa1	af 	. 
	jp lbaa7h		;baa2	c3 a7 ba 	. . . 
lbaa5h:
	ld a,0ffh		;baa5	3e ff 	> . 
lbaa7h:
	ld (lb35fh),a		;baa7	32 5f b3 	2 _ . 
	ld a,030h		;baaa	3e 30 	> 0 
	out (086h),a		;baac	d3 86 	. . 
	ret			;baae	c9 	. 
hdd_select:
	ld a,(disk_unit)		;baaf	3a 1e 1c 	: . . 
	ld (lbd90h),a		;bab2	32 90 bd 	2 . . 
	ret			;bab5	c9 	. 
	defb 048h		;bab6	48 	H 
	defb 061h		;bab7	61 	a 
	defb 072h		;bab8	72 	r 
	defb 064h		;bab9	64 	d 
	defb 020h		;baba	20 	  
	defb 044h		;babb	44 	D 
	defb 069h		;babc	69 	i 
	defb 073h		;babd	73 	s 
	defb 06bh		;babe	6b 	k 
	defb 020h		;babf	20 	  
	defb 044h		;bac0	44 	D 
	defb 072h		;bac1	72 	r 
	defb 069h		;bac2	69 	i 
	defb 076h		;bac3	76 	v 
	defb 065h		;bac4	65 	e 
	defb 020h		;bac5	20 	  
	defb 031h		;bac6	31 	1 
	defb 020h		;bac7	20 	  
	defb 02dh		;bac8	2d 	- 
	defb 020h		;bac9	20 	  
	defb 043h		;baca	43 	C 
	defb 04fh		;bacb	4f 	O 
	defb 04dh		;bacc	4d 	M 
	defb 052h		;bacd	52 	R 
	defb 045h		;bace	45 	E 
	defb 058h		;bacf	58 	X 
	defb 020h		;bad0	20 	  
	defb 043h		;bad1	43 	C 
	defb 06fh		;bad2	6f 	o 
	defb 06dh		;bad3	6d 	m 
	defb 046h		;bad4	46 	F 
	defb 069h		;bad5	69 	i 
	defb 06ch		;bad6	6c 	l 
	defb 065h		;bad7	65 	e 
	defb 072h		;bad8	72 	r 
	defb 020h		;bad9	20 	  
	defb 043h		;bada	43 	C 
	defb 052h		;badb	52 	R 
	defb 031h		;badc	31 	1 
	defb 035h		;badd	35 	5 
	defb 031h		;bade	31 	1 
	defb 030h		;badf	30 	0 
	defb 00dh		;bae0	0d 	. 
	defb 00ah		;bae1	0a 	. 
	defb 000h		;bae2	00 	. 
	defb 048h		;bae3	48 	H 
	defb 061h		;bae4	61 	a 
	defb 072h		;bae5	72 	r 
	defb 064h		;bae6	64 	d 
	defb 020h		;bae7	20 	  
	defb 044h		;bae8	44 	D 
	defb 069h		;bae9	69 	i 
	defb 073h		;baea	73 	s 
	defb 06bh		;baeb	6b 	k 
	defb 020h		;baec	20 	  
	defb 044h		;baed	44 	D 
	defb 072h		;baee	72 	r 
	defb 069h		;baef	69 	i 
	defb 076h		;baf0	76 	v 
	defb 065h		;baf1	65 	e 
	defb 020h		;baf2	20 	  
	defb 032h		;baf3	32 	2 
	defb 020h		;baf4	20 	  
	defb 02dh		;baf5	2d 	- 
	defb 020h		;baf6	20 	  
	defb 043h		;baf7	43 	C 
	defb 04fh		;baf8	4f 	O 
	defb 04dh		;baf9	4d 	M 
	defb 052h		;bafa	52 	R 
	defb 045h		;bafb	45 	E 
	defb 058h		;bafc	58 	X 
	defb 020h		;bafd	20 	  
	defb 043h		;bafe	43 	C 
	defb 06fh		;baff	6f 	o 
	defb 06dh		;bb00	6d 	m 
	defb 046h		;bb01	46 	F 
	defb 069h		;bb02	69 	i 
	defb 06ch		;bb03	6c 	l 
	defb 065h		;bb04	65 	e 
	defb 072h		;bb05	72 	r 
	defb 020h		;bb06	20 	  
	defb 043h		;bb07	43 	C 
	defb 052h		;bb08	52 	R 
	defb 031h		;bb09	31 	1 
	defb 035h		;bb0a	35 	5 
	defb 031h		;bb0b	31 	1 
	defb 030h		;bb0c	30 	0 
	defb 00dh		;bb0d	0d 	. 
	defb 00ah		;bb0e	0a 	. 
	defb 000h		;bb0f	00 	. 
hdd_home:
	ld a,(lbd97h)		;bb10	3a 97 bd 	: . . 
	or a			;bb13	b7 	. 
	jr nz,lbb19h		;bb14	20 03 	  . 
	ld (lbd92h),a		;bb16	32 92 bd 	2 . . 
lbb19h:
	ld bc,00000h		;bb19	01 00 00 	. . . 
	ld (disk_track),bc		;bb1c	ed 43 20 1c 	. C   . 
	ret			;bb20	c9 	. 
hdd_read:
	xor a			;bb21	af 	. 
	ld (lbd98h),a		;bb22	32 98 bd 	2 . . 
	inc a			;bb25	3c 	< 
	ld (lbd9fh),a		;bb26	32 9f bd 	2 . . 
	ld (lbd9eh),a		;bb29	32 9e bd 	2 . . 
	inc a			;bb2c	3c 	< 
	ld (lbda0h),a		;bb2d	32 a0 bd 	2 . . 
	jp lbb97h		;bb30	c3 97 bb 	. . . 
hdd_write:
	xor a			;bb33	af 	. 
	ld (lbd9fh),a		;bb34	32 9f bd 	2 . . 
	ld a,c			;bb37	79 	y 
	ld (lbda0h),a		;bb38	32 a0 bd 	2 . . 
	cp 002h		;bb3b	fe 02 	. . 
	jp nz,lbb57h		;bb3d	c2 57 bb 	. W . 
	ld a,00fh		;bb40	3e 0f 	> . 
	ld (lbd98h),a		;bb42	32 98 bd 	2 . . 
	ld a,(lbd90h)		;bb45	3a 90 bd 	: . . 
	ld (lbd99h),a		;bb48	32 99 bd 	2 . . 
	ld hl,(disk_track)		;bb4b	2a 20 1c 	*   . 
	ld (lbd9ah),hl		;bb4e	22 9a bd 	" . . 
	ld a,(disk_sector)		;bb51	3a 22 1c 	: " . 
	jp lbb77h		;bb54	c3 77 bb 	. w . 
lbb57h:
	ld hl,lbd98h		;bb57	21 98 bd 	! . . 
	ld a,(hl)			;bb5a	7e 	~ 
	or a			;bb5b	b7 	. 
	jp z,lbb8fh		;bb5c	ca 8f bb 	. . . 
	dec a			;bb5f	3d 	= 
	ld (hl),a			;bb60	77 	w 
	ld a,(lbd90h)		;bb61	3a 90 bd 	: . . 
	inc hl			;bb64	23 	# 
	cp (hl)			;bb65	be 	. 
	jp nz,lbb8fh		;bb66	c2 8f bb 	. . . 
	inc hl			;bb69	23 	# 
	call sub_bd83h		;bb6a	cd 83 bd 	. . . 
	jp nz,lbb8fh		;bb6d	c2 8f bb 	. . . 
	ld a,(disk_sector)		;bb70	3a 22 1c 	: " . 
	cp (hl)			;bb73	be 	. 
	jp nz,lbb8fh		;bb74	c2 8f bb 	. . . 
lbb77h:
	inc a			;bb77	3c 	< 
	cp 040h		;bb78	fe 40 	. @ 
	jp c,lbb85h		;bb7a	da 85 bb 	. . . 
	xor a			;bb7d	af 	. 
	ld hl,(lbd9ah)		;bb7e	2a 9a bd 	* . . 
	inc hl			;bb81	23 	# 
	ld (lbd9ah),hl		;bb82	22 9a bd 	" . . 
lbb85h:
	ld (lbd9ch),a		;bb85	32 9c bd 	2 . . 
	xor a			;bb88	af 	. 
	ld (lbd9eh),a		;bb89	32 9e bd 	2 . . 
	jp lbb97h		;bb8c	c3 97 bb 	. . . 
lbb8fh:
	xor a			;bb8f	af 	. 
	ld (lbd98h),a		;bb90	32 98 bd 	2 . . 
	inc a			;bb93	3c 	< 
	ld (lbd9eh),a		;bb94	32 9e bd 	2 . . 
lbb97h:
	xor a			;bb97	af 	. 
	ld (lbd9dh),a		;bb98	32 9d bd 	2 . . 
	ld a,(disk_sector)		;bb9b	3a 22 1c 	: " . 
	or a			;bb9e	b7 	. 
	rra			;bb9f	1f 	. 
	or a			;bba0	b7 	. 
	rra			;bba1	1f 	. 
	ld (lbd91h),a		;bba2	32 91 bd 	2 . . 
	ld hl,lbd92h		;bba5	21 92 bd 	! . . 
	ld a,(hl)			;bba8	7e 	~ 
	ld (hl),001h		;bba9	36 01 	6 . 
	or a			;bbab	b7 	. 
	jp z,lbbcch		;bbac	ca cc bb 	. . . 
	ld a,(lbd90h)		;bbaf	3a 90 bd 	: . . 
	inc hl			;bbb2	23 	# 
	cp (hl)			;bbb3	be 	. 
	jp nz,lbbc5h		;bbb4	c2 c5 bb 	. . . 
	inc hl			;bbb7	23 	# 
	call sub_bd83h		;bbb8	cd 83 bd 	. . . 
	jp nz,lbbc5h		;bbbb	c2 c5 bb 	. . . 
	ld a,(lbd91h)		;bbbe	3a 91 bd 	: . . 
	cp (hl)			;bbc1	be 	. 
	jp z,lbbe9h		;bbc2	ca e9 bb 	. . . 
lbbc5h:
	ld a,(lbd97h)		;bbc5	3a 97 bd 	: . . 
	or a			;bbc8	b7 	. 
	call nz,hdd_write_sector		;bbc9	c4 35 bc 	. 5 . 
lbbcch:
	ld a,(lbd90h)		;bbcc	3a 90 bd 	: . . 
	ld (lbd93h),a		;bbcf	32 93 bd 	2 . . 
	ld hl,(disk_track)		;bbd2	2a 20 1c 	*   . 
	ld (lbd94h),hl		;bbd5	22 94 bd 	" . . 
	ld a,(lbd91h)		;bbd8	3a 91 bd 	: . . 
	ld (lbd96h),a		;bbdb	32 96 bd 	2 . . 
	ld a,(lbd9eh)		;bbde	3a 9e bd 	: . . 
	or a			;bbe1	b7 	. 
	call nz,hdd_read_sector		;bbe2	c4 5b bc 	. [ . 
	xor a			;bbe5	af 	. 
	ld (lbd97h),a		;bbe6	32 97 bd 	2 . . 
lbbe9h:
	ld a,(disk_sector)		;bbe9	3a 22 1c 	: " . 
	and 003h		;bbec	e6 03 	. . 
	rra			;bbee	1f 	. 
	ld h,a			;bbef	67 	g 
	ld a,000h		;bbf0	3e 00 	> . 
	rra			;bbf2	1f 	. 
	ld l,a			;bbf3	6f 	o 
	ld de,hdd_sector_buffer		;bbf4	11 a1 bd 	. . . 
	add hl,de			;bbf7	19 	. 
	ld de,(disk_dma)		;bbf8	ed 5b 24 1c 	. [ $ . 
	ld a,(lbd9fh)		;bbfc	3a 9f bd 	: . . 
	or a			;bbff	b7 	. 
	jp nz,lbc08h		;bc00	c2 08 bc 	. . . 
	inc a			;bc03	3c 	< 
	ld (lbd97h),a		;bc04	32 97 bd 	2 . . 
	ex de,hl			;bc07	eb 	. 
lbc08h:
	ld a,(0f3d2h)		;bc08	3a d2 f3 	: . . 
	ld b,a			;bc0b	47 	G 
	ld a,(lbd9fh)		;bc0c	3a 9f bd 	: . . 
	or a			;bc0f	b7 	. 
	jp nz,lbc18h		;bc10	c2 18 bc 	. . . 
	ld c,b			;bc13	48 	H 
	ld b,000h		;bc14	06 00 	. . 
	jr lbc1ah		;bc16	18 02 	. . 
lbc18h:
	ld c,000h		;bc18	0e 00 	. . 
lbc1ah:
	call setup_banked_copy		;bc1a	cd 44 f3 	. D . 
	ld bc,00080h		;bc1d	01 80 00 	. . . 
	call copy_memblock		;bc20	cd 4e f3 	. N . 
	ld a,(lbda0h)		;bc23	3a a0 bd 	: . . 
	cp 001h		;bc26	fe 01 	. . 
	ld a,(lbd9dh)		;bc28	3a 9d bd 	: . . 
	ret nz			;bc2b	c0 	. 
	or a			;bc2c	b7 	. 
	ret nz			;bc2d	c0 	. 
	xor a			;bc2e	af 	. 
	ld (lbd97h),a		;bc2f	32 97 bd 	2 . . 
	jp hdd_write_sector		;bc32	c3 35 bc 	. 5 . 
hdd_write_sector:
	call setup_hdd_access		;bc35	cd ef bc 	. . . 
	ld a,030h		;bc38	3e 30 	> 0 
	out (087h),a		;bc3a	d3 87 	. . 
	ld hl,hdd_sector_buffer		;bc3c	21 a1 bd 	! . . 
	ld bc,00080h		;bc3f	01 80 00 	. . . 
	otir		;bc42	ed b3 	. . 
	otir		;bc44	ed b3 	. . 
lbc46h:
	in a,(087h)		;bc46	db 87 	. . 
	and a			;bc48	a7 	. 
	jp m,lbc46h		;bc49	fa 46 bc 	. F . 
	ld b,a			;bc4c	47 	G 
	ld a,030h		;bc4d	3e 30 	> 0 
	out (086h),a		;bc4f	d3 86 	. . 
	ld a,b			;bc51	78 	x 
	and 001h		;bc52	e6 01 	. . 
	ret z			;bc54	c8 	. 
	call print_disk_error		;bc55	cd 81 bc 	. . . 
	jp hdd_write_sector		;bc58	c3 35 bc 	. 5 . 
hdd_read_sector:
	call setup_hdd_access		;bc5b	cd ef bc 	. . . 
	ld a,020h		;bc5e	3e 20 	>   
	out (087h),a		;bc60	d3 87 	. . 
	ld hl,hdd_sector_buffer		;bc62	21 a1 bd 	! . . 
	ld bc,00080h		;bc65	01 80 00 	. . . 
lbc68h:
	in a,(087h)		;bc68	db 87 	. . 
	and a			;bc6a	a7 	. 
	jp m,lbc68h		;bc6b	fa 68 bc 	. h . 
	inir		;bc6e	ed b2 	. . 
	inir		;bc70	ed b2 	. . 
	ld b,a			;bc72	47 	G 
	ld a,030h		;bc73	3e 30 	> 0 
	out (086h),a		;bc75	d3 86 	. . 
	ld a,b			;bc77	78 	x 
	and 001h		;bc78	e6 01 	. . 
	ret z			;bc7a	c8 	. 
	call print_disk_error		;bc7b	cd 81 bc 	. . . 
	jp hdd_read_sector		;bc7e	c3 5b bc 	. [ . 
print_disk_error:
	ld b,a			;bc81	47 	G 
	ld a,(sys_page_err_diag)		;bc82	3a 62 2c 	: b , 
	or a			;bc85	b7 	. 
	ld a,b			;bc86	78 	x 
lbc87h:
	call sub_1ae6h		;bc87	cd e6 1a 	. . . 
	cp 052h		;bc8a	fe 52 	. R 
	ret z			;bc8c	c8 	. 
	cp 049h		;bc8d	fe 49 	. I 
	jp z,lbceah		;bc8f	ca ea bc 	. . . 
	cp 043h		;bc92	fe 43 	. C 
	jp nz,lbc87h		;bc94	c2 87 bc 	. . . 
	pop hl			;bc97	e1 	. 
	call sub_bd57h		;bc98	cd 57 bd 	. W . 
	defb 00dh		;bc9b	0d 	. 
	defb 00ah		;bc9c	0a 	. 
	defb 045h		;bc9d	45 	E 
	defb 072h		;bc9e	72 	r 
	defb 072h		;bc9f	72 	r 
	defb 06fh		;bca0	6f 	o 
	defb 072h		;bca1	72 	r 
	defb 0a0h		;bca2	a0 	. 
	in a,(081h)		;bca3	db 81 	. . 
	call sub_bd67h		;bca5	cd 67 bd 	. g . 
	call sub_bd57h		;bca8	cd 57 bd 	. W . 
	defb 020h		;bcab	20 	  
	defb 06fh		;bcac	6f 	o 
	defb 06eh		;bcad	6e 	n 
	defb 020h		;bcae	20 	  
	defb 048h		;bcaf	48 	H 
	defb 065h		;bcb0	65 	e 
	defb 061h		;bcb1	61 	a 
	defb 064h		;bcb2	64 	d 
	defb 0a0h		;bcb3	a0 	. 
	in a,(086h)		;bcb4	db 86 	. . 
	and 007h		;bcb6	e6 07 	. . 
	call sub_bd70h		;bcb8	cd 70 bd 	. p . 
	call sub_bd57h		;bcbb	cd 57 bd 	. W . 
	defb 02ch		;bcbe	2c 	, 
	defb 020h		;bcbf	20 	  
	defb 043h		;bcc0	43 	C 
	defb 079h		;bcc1	79 	y 
	defb 06ch		;bcc2	6c 	l 
	defb 069h		;bcc3	69 	i 
	defb 06eh		;bcc4	6e 	n 
	defb 064h		;bcc5	64 	d 
	defb 065h		;bcc6	65 	e 
	defb 072h		;bcc7	72 	r 
	defb 0a0h		;bcc8	a0 	. 
	in a,(085h)		;bcc9	db 85 	. . 
	call sub_bd67h		;bccb	cd 67 bd 	. g . 
	in a,(084h)		;bcce	db 84 	. . 
	call sub_bd67h		;bcd0	cd 67 bd 	. g . 
	call sub_bd57h		;bcd3	cd 57 bd 	. W . 
	defb 02ch		;bcd6	2c 	, 
	defb 020h		;bcd7	20 	  
	defb 053h		;bcd8	53 	S 
	defb 065h		;bcd9	65 	e 
	defb 063h		;bcda	63 	c 
	defb 074h		;bcdb	74 	t 
	defb 06fh		;bcdc	6f 	o 
	defb 072h		;bcdd	72 	r 
	defb 0a0h		;bcde	a0 	. 
	in a,(083h)		;bcdf	db 83 	. . 
	call sub_bd67h		;bce1	cd 67 bd 	. g . 
	ld a,001h		;bce4	3e 01 	> . 
lbce6h:
	ld (lbd9dh),a		;bce6	32 9d bd 	2 . . 
	ret			;bce9	c9 	. 
lbceah:
	pop hl			;bcea	e1 	. 
	xor a			;bceb	af 	. 
	jp lbce6h		;bcec	c3 e6 bc 	. . . 
setup_hdd_access:
	ld a,0a0h		;bcef	3e a0 	> . 
	out (086h),a		;bcf1	d3 86 	. . 
	ld b,a			;bcf3	47 	G 
	cpl			;bcf4	2f 	/ 
	out (084h),a		;bcf5	d3 84 	. . 
	in a,(086h)		;bcf7	db 86 	. . 
	cp b			;bcf9	b8 	. 
	jp nz,lbd4dh		;bcfa	c2 4d bd 	. M . 
	in a,(087h)		;bcfd	db 87 	. . 
	and 0c0h		;bcff	e6 c0 	. . 
	cp 040h		;bd01	fe 40 	. @ 
	jp nz,lbd4dh		;bd03	c2 4d bd 	. M . 
	ld hl,(lbd94h)		;bd06	2a 94 bd 	* . . 
	ld a,(lbd93h)		;bd09	3a 93 bd 	: . . 
	rra			;bd0c	1f 	. 
	jp nc,lbd14h		;bd0d	d2 14 bd 	. . . 
	ld de,00264h		;bd10	11 64 02 	. d . 
	add hl,de			;bd13	19 	. 
lbd14h:
	ld a,l			;bd14	7d 	} 
	and 003h		;bd15	e6 03 	. . 
	ld b,a			;bd17	47 	G 
	ld a,(lbd93h)		;bd18	3a 93 bd 	: . . 
	rrca			;bd1b	0f 	. 
	add a,a			;bd1c	87 	. 
	add a,a			;bd1d	87 	. 
	add a,a			;bd1e	87 	. 
	or 0a0h		;bd1f	f6 a0 	. . 
	or b			;bd21	b0 	. 
	out (086h),a		;bd22	d3 86 	. . 
	ld a,(lbd96h)		;bd24	3a 96 bd 	: . . 
	out (083h),a		;bd27	d3 83 	. . 
	ld a,l			;bd29	7d 	} 
	rra			;bd2a	1f 	. 
	rra			;bd2b	1f 	. 
	and 03fh		;bd2c	e6 3f 	. ? 
	ld b,a			;bd2e	47 	G 
	ld a,h			;bd2f	7c 	| 
	rrca			;bd30	0f 	. 
	rrca			;bd31	0f 	. 
	ld c,a			;bd32	4f 	O 
	and 0c0h		;bd33	e6 c0 	. . 
	or b			;bd35	b0 	. 
	out (084h),a		;bd36	d3 84 	. . 
	ld a,c			;bd38	79 	y 
	and 003h		;bd39	e6 03 	. . 
	out (085h),a		;bd3b	d3 85 	. . 
	ld a,(lbd8fh)		;bd3d	3a 8f bd 	: . . 
	or a			;bd40	b7 	. 
	nop			;bd41	00 	. 
	ld a,070h		;bd42	3e 70 	> p 
	out (087h),a		;bd44	d3 87 	. . 
lbd46h:
	in a,(087h)		;bd46	db 87 	. . 
	and a			;bd48	a7 	. 
	jp m,lbd46h		;bd49	fa 46 bd 	. F . 
	ret			;bd4c	c9 	. 
lbd4dh:
	ld a,005h		;bd4d	3e 05 	> . 
	ld (lbd8fh),a		;bd4f	32 8f bd 	2 . . 
	call sub_1ae6h		;bd52	cd e6 1a 	. . . 
	jr setup_hdd_access		;bd55	18 98 	. . 
sub_bd57h:
	ex (sp),hl			;bd57	e3 	. 
lbd58h:
	ld a,(hl)			;bd58	7e 	~ 
	and 07fh		;bd59	e6 7f 	.  
	ld c,a			;bd5b	4f 	O 
	call sub_bd79h		;bd5c	cd 79 bd 	. y . 
	ld a,(hl)			;bd5f	7e 	~ 
	inc hl			;bd60	23 	# 
	and a			;bd61	a7 	. 
	jp p,lbd58h		;bd62	f2 58 bd 	. X . 
	ex (sp),hl			;bd65	e3 	. 
	ret			;bd66	c9 	. 
sub_bd67h:
	push af			;bd67	f5 	. 
	rrca			;bd68	0f 	. 
	rrca			;bd69	0f 	. 
	rrca			;bd6a	0f 	. 
	rrca			;bd6b	0f 	. 
	call sub_bd70h		;bd6c	cd 70 bd 	. p . 
	pop af			;bd6f	f1 	. 
sub_bd70h:
	and 00fh		;bd70	e6 0f 	. . 
	add a,090h		;bd72	c6 90 	. . 
	daa			;bd74	27 	' 
	adc a,040h		;bd75	ce 40 	. @ 
	daa			;bd77	27 	' 
	ld c,a			;bd78	4f 	O 
sub_bd79h:
	push hl			;bd79	e5 	. 
	push de			;bd7a	d5 	. 
	push bc			;bd7b	c5 	. 
	call bios2_conout		;bd7c	cd e4 19 	. . . 
	pop bc			;bd7f	c1 	. 
	pop de			;bd80	d1 	. 
	pop hl			;bd81	e1 	. 
	ret			;bd82	c9 	. 
sub_bd83h:
	ld a,(disk_track)		;bd83	3a 20 1c 	:   . 
	cp (hl)			;bd86	be 	. 
	ret nz			;bd87	c0 	. 
	inc hl			;bd88	23 	# 
	ld a,(disk_track+1)		;bd89	3a 21 1c 	: ! . 
	cp (hl)			;bd8c	be 	. 
	inc hl			;bd8d	23 	# 
	ret			;bd8e	c9 	. 
lbd8fh:
	defb 000h		;bd8f	00 	. 
lbd90h:
	defb 000h		;bd90	00 	. 
lbd91h:
	defb 000h		;bd91	00 	. 
lbd92h:
	defb 000h		;bd92	00 	. 
lbd93h:
	defb 000h		;bd93	00 	. 
lbd94h:
	defb 000h		;bd94	00 	. 
	defb 000h		;bd95	00 	. 
lbd96h:
	defb 000h		;bd96	00 	. 
lbd97h:
	defb 000h		;bd97	00 	. 
lbd98h:
	defb 000h		;bd98	00 	. 
lbd99h:
	defb 000h		;bd99	00 	. 
lbd9ah:
	defb 000h		;bd9a	00 	. 
	defb 000h		;bd9b	00 	. 
lbd9ch:
	defb 000h		;bd9c	00 	. 
lbd9dh:
	defb 000h		;bd9d	00 	. 
lbd9eh:
	defb 000h		;bd9e	00 	. 
lbd9fh:
	defb 000h		;bd9f	00 	. 
lbda0h:
	defb 000h		;bda0	00 	. 
hdd_sector_buffer:
	defb 000h		;bda1	00 	. 
	defb 000h		;bda2	00 	. 
	defb 000h		;bda3	00 	. 
	defb 000h		;bda4	00 	. 
	defb 000h		;bda5	00 	. 
	defb 000h		;bda6	00 	. 
	defb 000h		;bda7	00 	. 
	defb 000h		;bda8	00 	. 
	defb 000h		;bda9	00 	. 
	defb 000h		;bdaa	00 	. 
	defb 000h		;bdab	00 	. 
	defb 000h		;bdac	00 	. 
	defb 000h		;bdad	00 	. 
	defb 000h		;bdae	00 	. 
	defb 000h		;bdaf	00 	. 
	defb 000h		;bdb0	00 	. 
	defb 000h		;bdb1	00 	. 
	defb 000h		;bdb2	00 	. 
	defb 000h		;bdb3	00 	. 
	defb 000h		;bdb4	00 	. 
	defb 000h		;bdb5	00 	. 
	defb 000h		;bdb6	00 	. 
	defb 000h		;bdb7	00 	. 
	defb 000h		;bdb8	00 	. 
	defb 000h		;bdb9	00 	. 
	defb 000h		;bdba	00 	. 
	defb 000h		;bdbb	00 	. 
	defb 000h		;bdbc	00 	. 
	defb 000h		;bdbd	00 	. 
	defb 000h		;bdbe	00 	. 
	defb 000h		;bdbf	00 	. 
	defb 000h		;bdc0	00 	. 
	defb 000h		;bdc1	00 	. 
	defb 000h		;bdc2	00 	. 
	defb 000h		;bdc3	00 	. 
	defb 000h		;bdc4	00 	. 
	defb 000h		;bdc5	00 	. 
	defb 000h		;bdc6	00 	. 
	defb 000h		;bdc7	00 	. 
	defb 000h		;bdc8	00 	. 
	defb 000h		;bdc9	00 	. 
	defb 000h		;bdca	00 	. 
	defb 000h		;bdcb	00 	. 
	defb 000h		;bdcc	00 	. 
	defb 000h		;bdcd	00 	. 
	defb 000h		;bdce	00 	. 
	defb 000h		;bdcf	00 	. 
	defb 000h		;bdd0	00 	. 
	defb 000h		;bdd1	00 	. 
	defb 000h		;bdd2	00 	. 
	defb 000h		;bdd3	00 	. 
	defb 000h		;bdd4	00 	. 
	defb 000h		;bdd5	00 	. 
	defb 000h		;bdd6	00 	. 
	defb 000h		;bdd7	00 	. 
	defb 000h		;bdd8	00 	. 
	defb 000h		;bdd9	00 	. 
	defb 000h		;bdda	00 	. 
	defb 000h		;bddb	00 	. 
	defb 000h		;bddc	00 	. 
	defb 000h		;bddd	00 	. 
	defb 000h		;bdde	00 	. 
	defb 000h		;bddf	00 	. 
	defb 000h		;bde0	00 	. 
	defb 000h		;bde1	00 	. 
	defb 000h		;bde2	00 	. 
	defb 000h		;bde3	00 	. 
	defb 000h		;bde4	00 	. 
	defb 000h		;bde5	00 	. 
	defb 000h		;bde6	00 	. 
	defb 000h		;bde7	00 	. 
	defb 000h		;bde8	00 	. 
	defb 000h		;bde9	00 	. 
	defb 000h		;bdea	00 	. 
	defb 000h		;bdeb	00 	. 
	defb 000h		;bdec	00 	. 
	defb 000h		;bded	00 	. 
	defb 000h		;bdee	00 	. 
	defb 000h		;bdef	00 	. 
	defb 000h		;bdf0	00 	. 
	defb 000h		;bdf1	00 	. 
	defb 000h		;bdf2	00 	. 
	defb 000h		;bdf3	00 	. 
	defb 000h		;bdf4	00 	. 
	defb 000h		;bdf5	00 	. 
	defb 000h		;bdf6	00 	. 
	defb 000h		;bdf7	00 	. 
	defb 000h		;bdf8	00 	. 
	defb 000h		;bdf9	00 	. 
	defb 000h		;bdfa	00 	. 
	defb 000h		;bdfb	00 	. 
	defb 000h		;bdfc	00 	. 
	defb 000h		;bdfd	00 	. 
	defb 000h		;bdfe	00 	. 
	defb 000h		;bdff	00 	. 
	defb 000h		;be00	00 	. 
	defb 000h		;be01	00 	. 
	defb 000h		;be02	00 	. 
	defb 000h		;be03	00 	. 
	defb 000h		;be04	00 	. 
	defb 000h		;be05	00 	. 
	defb 000h		;be06	00 	. 
	defb 000h		;be07	00 	. 
	defb 000h		;be08	00 	. 
	defb 000h		;be09	00 	. 
	defb 000h		;be0a	00 	. 
	defb 000h		;be0b	00 	. 
	defb 000h		;be0c	00 	. 
	defb 000h		;be0d	00 	. 
	defb 000h		;be0e	00 	. 
	defb 000h		;be0f	00 	. 
	defb 000h		;be10	00 	. 
	defb 000h		;be11	00 	. 
	defb 000h		;be12	00 	. 
	defb 000h		;be13	00 	. 
	defb 000h		;be14	00 	. 
	defb 000h		;be15	00 	. 
	defb 000h		;be16	00 	. 
	defb 000h		;be17	00 	. 
	defb 000h		;be18	00 	. 
	defb 000h		;be19	00 	. 
	defb 000h		;be1a	00 	. 
	defb 000h		;be1b	00 	. 
	defb 000h		;be1c	00 	. 
	defb 000h		;be1d	00 	. 
	defb 000h		;be1e	00 	. 
	defb 000h		;be1f	00 	. 
	defb 000h		;be20	00 	. 
	defb 000h		;be21	00 	. 
	defb 000h		;be22	00 	. 
	defb 000h		;be23	00 	. 
	defb 000h		;be24	00 	. 
	defb 000h		;be25	00 	. 
	defb 000h		;be26	00 	. 
	defb 000h		;be27	00 	. 
	defb 000h		;be28	00 	. 
	defb 000h		;be29	00 	. 
	defb 000h		;be2a	00 	. 
	defb 000h		;be2b	00 	. 
	defb 000h		;be2c	00 	. 
	defb 000h		;be2d	00 	. 
	defb 000h		;be2e	00 	. 
	defb 000h		;be2f	00 	. 
	defb 000h		;be30	00 	. 
	defb 000h		;be31	00 	. 
	defb 000h		;be32	00 	. 
	defb 000h		;be33	00 	. 
	defb 000h		;be34	00 	. 
	defb 000h		;be35	00 	. 
	defb 000h		;be36	00 	. 
	defb 000h		;be37	00 	. 
	defb 000h		;be38	00 	. 
	defb 000h		;be39	00 	. 
	defb 000h		;be3a	00 	. 
	defb 000h		;be3b	00 	. 
	defb 000h		;be3c	00 	. 
	defb 000h		;be3d	00 	. 
	defb 000h		;be3e	00 	. 
	defb 000h		;be3f	00 	. 
	defb 000h		;be40	00 	. 
	defb 000h		;be41	00 	. 
	defb 000h		;be42	00 	. 
	defb 000h		;be43	00 	. 
	defb 000h		;be44	00 	. 
	defb 000h		;be45	00 	. 
	defb 000h		;be46	00 	. 
	defb 000h		;be47	00 	. 
	defb 000h		;be48	00 	. 
	defb 000h		;be49	00 	. 
	defb 000h		;be4a	00 	. 
	defb 000h		;be4b	00 	. 
	defb 000h		;be4c	00 	. 
	defb 000h		;be4d	00 	. 
	defb 000h		;be4e	00 	. 
	defb 000h		;be4f	00 	. 
	defb 000h		;be50	00 	. 
	defb 000h		;be51	00 	. 
	defb 000h		;be52	00 	. 
	defb 000h		;be53	00 	. 
	defb 000h		;be54	00 	. 
	defb 000h		;be55	00 	. 
	defb 000h		;be56	00 	. 
	defb 000h		;be57	00 	. 
	defb 000h		;be58	00 	. 
	defb 000h		;be59	00 	. 
	defb 000h		;be5a	00 	. 
	defb 000h		;be5b	00 	. 
	defb 000h		;be5c	00 	. 
	defb 000h		;be5d	00 	. 
	defb 000h		;be5e	00 	. 
	defb 000h		;be5f	00 	. 
	defb 000h		;be60	00 	. 
	defb 000h		;be61	00 	. 
	defb 000h		;be62	00 	. 
	defb 000h		;be63	00 	. 
	defb 000h		;be64	00 	. 
	defb 000h		;be65	00 	. 
	defb 000h		;be66	00 	. 
	defb 000h		;be67	00 	. 
	defb 000h		;be68	00 	. 
	defb 000h		;be69	00 	. 
	defb 000h		;be6a	00 	. 
	defb 000h		;be6b	00 	. 
	defb 000h		;be6c	00 	. 
	defb 000h		;be6d	00 	. 
	defb 000h		;be6e	00 	. 
	defb 000h		;be6f	00 	. 
	defb 000h		;be70	00 	. 
	defb 000h		;be71	00 	. 
	defb 000h		;be72	00 	. 
	defb 000h		;be73	00 	. 
	defb 000h		;be74	00 	. 
	defb 000h		;be75	00 	. 
	defb 000h		;be76	00 	. 
	defb 000h		;be77	00 	. 
	defb 000h		;be78	00 	. 
	defb 000h		;be79	00 	. 
	defb 000h		;be7a	00 	. 
	defb 000h		;be7b	00 	. 
	defb 000h		;be7c	00 	. 
	defb 000h		;be7d	00 	. 
	defb 000h		;be7e	00 	. 
	defb 000h		;be7f	00 	. 
	defb 000h		;be80	00 	. 
	defb 000h		;be81	00 	. 
	defb 000h		;be82	00 	. 
	defb 000h		;be83	00 	. 
	defb 000h		;be84	00 	. 
	defb 000h		;be85	00 	. 
	defb 000h		;be86	00 	. 
	defb 000h		;be87	00 	. 
	defb 000h		;be88	00 	. 
	defb 000h		;be89	00 	. 
	defb 000h		;be8a	00 	. 
	defb 000h		;be8b	00 	. 
	defb 000h		;be8c	00 	. 
	defb 000h		;be8d	00 	. 
	defb 000h		;be8e	00 	. 
	defb 000h		;be8f	00 	. 
	defb 000h		;be90	00 	. 
	defb 000h		;be91	00 	. 
	defb 000h		;be92	00 	. 
	defb 000h		;be93	00 	. 
	defb 000h		;be94	00 	. 
	defb 000h		;be95	00 	. 
	defb 000h		;be96	00 	. 
	defb 000h		;be97	00 	. 
	defb 000h		;be98	00 	. 
	defb 000h		;be99	00 	. 
	defb 000h		;be9a	00 	. 
	defb 000h		;be9b	00 	. 
	defb 000h		;be9c	00 	. 
	defb 000h		;be9d	00 	. 
	defb 000h		;be9e	00 	. 
	defb 000h		;be9f	00 	. 
	defb 000h		;bea0	00 	. 
	defb 000h		;bea1	00 	. 
	defb 000h		;bea2	00 	. 
	defb 000h		;bea3	00 	. 
	defb 000h		;bea4	00 	. 
	defb 000h		;bea5	00 	. 
	defb 000h		;bea6	00 	. 
	defb 000h		;bea7	00 	. 
	defb 000h		;bea8	00 	. 
	defb 000h		;bea9	00 	. 
	defb 000h		;beaa	00 	. 
	defb 000h		;beab	00 	. 
	defb 000h		;beac	00 	. 
	defb 000h		;bead	00 	. 
	defb 000h		;beae	00 	. 
	defb 000h		;beaf	00 	. 
	defb 000h		;beb0	00 	. 
	defb 000h		;beb1	00 	. 
	defb 000h		;beb2	00 	. 
	defb 000h		;beb3	00 	. 
	defb 000h		;beb4	00 	. 
	defb 000h		;beb5	00 	. 
	defb 000h		;beb6	00 	. 
	defb 000h		;beb7	00 	. 
	defb 000h		;beb8	00 	. 
	defb 000h		;beb9	00 	. 
	defb 000h		;beba	00 	. 
	defb 000h		;bebb	00 	. 
	defb 000h		;bebc	00 	. 
	defb 000h		;bebd	00 	. 
	defb 000h		;bebe	00 	. 
	defb 000h		;bebf	00 	. 
	defb 000h		;bec0	00 	. 
	defb 000h		;bec1	00 	. 
	defb 000h		;bec2	00 	. 
	defb 000h		;bec3	00 	. 
	defb 000h		;bec4	00 	. 
	defb 000h		;bec5	00 	. 
	defb 000h		;bec6	00 	. 
	defb 000h		;bec7	00 	. 
	defb 000h		;bec8	00 	. 
	defb 000h		;bec9	00 	. 
	defb 000h		;beca	00 	. 
	defb 000h		;becb	00 	. 
	defb 000h		;becc	00 	. 
	defb 000h		;becd	00 	. 
	defb 000h		;bece	00 	. 
	defb 000h		;becf	00 	. 
	defb 000h		;bed0	00 	. 
	defb 000h		;bed1	00 	. 
	defb 000h		;bed2	00 	. 
	defb 000h		;bed3	00 	. 
	defb 000h		;bed4	00 	. 
	defb 000h		;bed5	00 	. 
	defb 000h		;bed6	00 	. 
	defb 000h		;bed7	00 	. 
	defb 000h		;bed8	00 	. 
	defb 000h		;bed9	00 	. 
	defb 000h		;beda	00 	. 
	defb 000h		;bedb	00 	. 
	defb 000h		;bedc	00 	. 
	defb 000h		;bedd	00 	. 
	defb 000h		;bede	00 	. 
	defb 000h		;bedf	00 	. 
	defb 000h		;bee0	00 	. 
	defb 000h		;bee1	00 	. 
	defb 000h		;bee2	00 	. 
	defb 000h		;bee3	00 	. 
	defb 000h		;bee4	00 	. 
	defb 000h		;bee5	00 	. 
	defb 000h		;bee6	00 	. 
	defb 000h		;bee7	00 	. 
	defb 000h		;bee8	00 	. 
	defb 000h		;bee9	00 	. 
	defb 000h		;beea	00 	. 
	defb 000h		;beeb	00 	. 
	defb 000h		;beec	00 	. 
	defb 000h		;beed	00 	. 
	defb 000h		;beee	00 	. 
	defb 000h		;beef	00 	. 
	defb 000h		;bef0	00 	. 
	defb 000h		;bef1	00 	. 
	defb 000h		;bef2	00 	. 
	defb 000h		;bef3	00 	. 
	defb 000h		;bef4	00 	. 
	defb 000h		;bef5	00 	. 
	defb 000h		;bef6	00 	. 
	defb 000h		;bef7	00 	. 
	defb 000h		;bef8	00 	. 
	defb 000h		;bef9	00 	. 
	defb 000h		;befa	00 	. 
	defb 000h		;befb	00 	. 
	defb 000h		;befc	00 	. 
	defb 000h		;befd	00 	. 
	defb 000h		;befe	00 	. 
	defb 000h		;beff	00 	. 
	defb 000h		;bf00	00 	. 
	defb 000h		;bf01	00 	. 
	defb 000h		;bf02	00 	. 
	defb 000h		;bf03	00 	. 
	defb 000h		;bf04	00 	. 
	defb 000h		;bf05	00 	. 
	defb 000h		;bf06	00 	. 
	defb 000h		;bf07	00 	. 
	defb 000h		;bf08	00 	. 
	defb 000h		;bf09	00 	. 
	defb 000h		;bf0a	00 	. 
	defb 000h		;bf0b	00 	. 
	defb 000h		;bf0c	00 	. 
	defb 000h		;bf0d	00 	. 
	defb 000h		;bf0e	00 	. 
	defb 000h		;bf0f	00 	. 
	defb 000h		;bf10	00 	. 
	defb 000h		;bf11	00 	. 
	defb 000h		;bf12	00 	. 
	defb 000h		;bf13	00 	. 
	defb 000h		;bf14	00 	. 
	defb 000h		;bf15	00 	. 
	defb 000h		;bf16	00 	. 
	defb 000h		;bf17	00 	. 
	defb 000h		;bf18	00 	. 
	defb 000h		;bf19	00 	. 
	defb 000h		;bf1a	00 	. 
	defb 000h		;bf1b	00 	. 
	defb 000h		;bf1c	00 	. 
	defb 000h		;bf1d	00 	. 
	defb 000h		;bf1e	00 	. 
	defb 000h		;bf1f	00 	. 
	defb 000h		;bf20	00 	. 
	defb 000h		;bf21	00 	. 
	defb 000h		;bf22	00 	. 
	defb 000h		;bf23	00 	. 
	defb 000h		;bf24	00 	. 
	defb 000h		;bf25	00 	. 
	defb 000h		;bf26	00 	. 
	defb 000h		;bf27	00 	. 
	defb 000h		;bf28	00 	. 
	defb 000h		;bf29	00 	. 
	defb 000h		;bf2a	00 	. 
	defb 000h		;bf2b	00 	. 
	defb 000h		;bf2c	00 	. 
	defb 000h		;bf2d	00 	. 
	defb 000h		;bf2e	00 	. 
	defb 000h		;bf2f	00 	. 
	defb 000h		;bf30	00 	. 
	defb 000h		;bf31	00 	. 
	defb 000h		;bf32	00 	. 
	defb 000h		;bf33	00 	. 
	defb 000h		;bf34	00 	. 
	defb 000h		;bf35	00 	. 
	defb 000h		;bf36	00 	. 
	defb 000h		;bf37	00 	. 
	defb 000h		;bf38	00 	. 
	defb 000h		;bf39	00 	. 
	defb 000h		;bf3a	00 	. 
	defb 000h		;bf3b	00 	. 
	defb 000h		;bf3c	00 	. 
	defb 000h		;bf3d	00 	. 
	defb 000h		;bf3e	00 	. 
	defb 000h		;bf3f	00 	. 
	defb 000h		;bf40	00 	. 
	defb 000h		;bf41	00 	. 
	defb 000h		;bf42	00 	. 
	defb 000h		;bf43	00 	. 
	defb 000h		;bf44	00 	. 
	defb 000h		;bf45	00 	. 
	defb 000h		;bf46	00 	. 
	defb 000h		;bf47	00 	. 
	defb 000h		;bf48	00 	. 
	defb 000h		;bf49	00 	. 
	defb 000h		;bf4a	00 	. 
	defb 000h		;bf4b	00 	. 
	defb 000h		;bf4c	00 	. 
	defb 000h		;bf4d	00 	. 
	defb 000h		;bf4e	00 	. 
	defb 000h		;bf4f	00 	. 
	defb 000h		;bf50	00 	. 
	defb 000h		;bf51	00 	. 
	defb 000h		;bf52	00 	. 
	defb 000h		;bf53	00 	. 
	defb 000h		;bf54	00 	. 
	defb 000h		;bf55	00 	. 
	defb 000h		;bf56	00 	. 
	defb 000h		;bf57	00 	. 
	defb 000h		;bf58	00 	. 
	defb 000h		;bf59	00 	. 
	defb 000h		;bf5a	00 	. 
	defb 000h		;bf5b	00 	. 
	defb 000h		;bf5c	00 	. 
	defb 000h		;bf5d	00 	. 
	defb 000h		;bf5e	00 	. 
	defb 000h		;bf5f	00 	. 
	defb 000h		;bf60	00 	. 
	defb 000h		;bf61	00 	. 
	defb 000h		;bf62	00 	. 
	defb 000h		;bf63	00 	. 
	defb 000h		;bf64	00 	. 
	defb 000h		;bf65	00 	. 
	defb 000h		;bf66	00 	. 
	defb 000h		;bf67	00 	. 
	defb 000h		;bf68	00 	. 
	defb 000h		;bf69	00 	. 
	defb 000h		;bf6a	00 	. 
	defb 000h		;bf6b	00 	. 
	defb 000h		;bf6c	00 	. 
	defb 000h		;bf6d	00 	. 
	defb 000h		;bf6e	00 	. 
	defb 000h		;bf6f	00 	. 
	defb 000h		;bf70	00 	. 
	defb 000h		;bf71	00 	. 
	defb 000h		;bf72	00 	. 
	defb 000h		;bf73	00 	. 
	defb 000h		;bf74	00 	. 
	defb 000h		;bf75	00 	. 
	defb 000h		;bf76	00 	. 
	defb 000h		;bf77	00 	. 
	defb 000h		;bf78	00 	. 
	defb 000h		;bf79	00 	. 
	defb 000h		;bf7a	00 	. 
	defb 000h		;bf7b	00 	. 
	defb 000h		;bf7c	00 	. 
	defb 000h		;bf7d	00 	. 
	defb 000h		;bf7e	00 	. 
	defb 000h		;bf7f	00 	. 
	defb 000h		;bf80	00 	. 
	defb 000h		;bf81	00 	. 
	defb 000h		;bf82	00 	. 
	defb 000h		;bf83	00 	. 
	defb 000h		;bf84	00 	. 
	defb 000h		;bf85	00 	. 
	defb 000h		;bf86	00 	. 
	defb 000h		;bf87	00 	. 
	defb 000h		;bf88	00 	. 
	defb 000h		;bf89	00 	. 
	defb 000h		;bf8a	00 	. 
	defb 000h		;bf8b	00 	. 
	defb 000h		;bf8c	00 	. 
	defb 000h		;bf8d	00 	. 
	defb 000h		;bf8e	00 	. 
	defb 000h		;bf8f	00 	. 
	defb 000h		;bf90	00 	. 
	defb 000h		;bf91	00 	. 
	defb 000h		;bf92	00 	. 
	defb 000h		;bf93	00 	. 
	defb 000h		;bf94	00 	. 
	defb 000h		;bf95	00 	. 
	defb 000h		;bf96	00 	. 
	defb 000h		;bf97	00 	. 
	defb 000h		;bf98	00 	. 
	defb 000h		;bf99	00 	. 
	defb 000h		;bf9a	00 	. 
	defb 000h		;bf9b	00 	. 
	defb 000h		;bf9c	00 	. 
	defb 000h		;bf9d	00 	. 
	defb 000h		;bf9e	00 	. 
	defb 000h		;bf9f	00 	. 
	defb 000h		;bfa0	00 	. 
mem_disk_select:
	ret			;bfa1	c9 	. 
mem_disk_home:
	ld bc,00000h		;bfa2	01 00 00 	. . . 
	ld (disk_track),bc		;bfa5	ed 43 20 1c 	. C   . 
	ret			;bfa9	c9 	. 
mem_disk_read:
	ld a,000h		;bfaa	3e 00 	> . 
	call sub_bfb6h		;bfac	cd b6 bf 	. . . 
	ret			;bfaf	c9 	. 
mem_disk_write:
	ld a,0ffh		;bfb0	3e ff 	> . 
	call sub_bfb6h		;bfb2	cd b6 bf 	. . . 
	ret			;bfb5	c9 	. 
sub_bfb6h:
	ld (lc047h),a		;bfb6	32 47 c0 	2 G . 
	call sub_bff1h		;bfb9	cd f1 bf 	. . . 
	jp nz,lbff0h		;bfbc	c2 f0 bf 	. . . 
	ld de,(disk_dma)		;bfbf	ed 5b 24 1c 	. [ $ . 
	ld a,(lc047h)		;bfc3	3a 47 c0 	: G . 
	or a			;bfc6	b7 	. 
	jp z,lbfd0h		;bfc7	ca d0 bf 	. . . 
	ld a,001h		;bfca	3e 01 	> . 
	ld (lc050h),a		;bfcc	32 50 c0 	2 P . 
	ex de,hl			;bfcf	eb 	. 
lbfd0h:
	ld a,(0f3d2h)		;bfd0	3a d2 f3 	: . . 
	ld b,a			;bfd3	47 	G 
	ld a,(lc047h)		;bfd4	3a 47 c0 	: G . 
	or a			;bfd7	b7 	. 
	jp z,lbfe2h		;bfd8	ca e2 bf 	. . . 
	ld c,b			;bfdb	48 	H 
	ld a,(lc04fh)		;bfdc	3a 4f c0 	: O . 
	ld b,a			;bfdf	47 	G 
	jr lbfe6h		;bfe0	18 04 	. . 
lbfe2h:
	ld a,(lc04fh)		;bfe2	3a 4f c0 	: O . 
	ld c,a			;bfe5	4f 	O 
lbfe6h:
	call setup_banked_copy		;bfe6	cd 44 f3 	. D . 
	ld bc,00080h		;bfe9	01 80 00 	. . . 
	call copy_memblock		;bfec	cd 4e f3 	. N . 
	xor a			;bfef	af 	. 
lbff0h:
	ret			;bff0	c9 	. 
sub_bff1h:
	ld a,002h		;bff1	3e 02 	> . 
	ld (lc04fh),a		;bff3	32 4f c0 	2 O . 
	ld a,(disk_track)		;bff6	3a 20 1c 	:   . 
	cp 007h		;bff9	fe 07 	. . 
	jp nc,lc043h		;bffb	d2 43 c0 	. C . 
	cp 004h		;bffe	fe 04 	. . 
	jp c,lc008h		;c000	da 08 c0 	. . . 
	ld a,003h		;c003	3e 03 	> . 
	ld (lc04fh),a		;c005	32 4f c0 	2 O . 
lc008h:
	ld hl,lc048h		;c008	21 48 c0 	! H . 
	ld de,(disk_track)		;c00b	ed 5b 20 1c 	. [   . 
	add hl,de			;c00f	19 	. 
	ld h,(hl)			;c010	66 	f 
	ld l,000h		;c011	2e 00 	. . 
	ld a,(disk_track)		;c013	3a 20 1c 	:   . 
	cp 003h		;c016	fe 03 	. . 
	jp nz,lc030h		;c018	c2 30 c0 	. 0 . 
	ld a,(disk_sector)		;c01b	3a 22 1c 	: " . 
	cp 040h		;c01e	fe 40 	. @ 
	jp c,lc030h		;c020	da 30 c0 	. 0 . 
	sub 040h		;c023	d6 40 	. @ 
	ld (disk_sector),a		;c025	32 22 1c 	2 " . 
	ld hl,00000h		;c028	21 00 00 	! . . 
	ld a,003h		;c02b	3e 03 	> . 
	ld (lc04fh),a		;c02d	32 4f c0 	2 O . 
lc030h:
	ld de,00080h		;c030	11 80 00 	. . . 
	or a			;c033	b7 	. 
	sbc hl,de		;c034	ed 52 	. R 
	ld a,(disk_sector)		;c036	3a 22 1c 	: " . 
	inc a			;c039	3c 	< 
	ld b,a			;c03a	47 	G 
lc03bh:
	ld de,00080h		;c03b	11 80 00 	. . . 
	add hl,de			;c03e	19 	. 
	djnz lc03bh		;c03f	10 fa 	. . 
	xor a			;c041	af 	. 
	ret			;c042	c9 	. 
lc043h:
	ld a,001h		;c043	3e 01 	> . 
	or a			;c045	b7 	. 
	ret			;c046	c9 	. 
lc047h:
	defb 000h		;c047	00 	. 
lc048h:
	defb 000h		;c048	00 	. 
	defb 040h		;c049	40 	@ 
	defb 080h		;c04a	80 	. 
	defb 0c0h		;c04b	c0 	. 
	defb 020h		;c04c	20 	  
	defb 060h		;c04d	60 	` 
	defb 0a0h		;c04e	a0 	. 
lc04fh:
	defb 000h		;c04f	00 	. 
lc050h:
	defb 000h		;c050	00 	. 
	defb 052h		;c051	52 	R 
	defb 041h		;c052	41 	A 
	defb 04dh		;c053	4d 	M 
	defb 020h		;c054	20 	  
	defb 044h		;c055	44 	D 
	defb 069h		;c056	69 	i 
	defb 073h		;c057	73 	s 
	defb 06bh		;c058	6b 	k 
	defb 00dh		;c059	0d 	. 
	defb 00ah		;c05a	0a 	. 
	defb 000h		;c05b	00 	. 
	defb 054h		;c05c	54 	T 
	defb 048h		;c05d	48 	H 
	defb 049h		;c05e	49 	I 
	defb 053h		;c05f	53 	S 
	defb 020h		;c060	20 	  
	defb 049h		;c061	49 	I 
	defb 053h		;c062	53 	S 
	defb 020h		;c063	20 	  
	defb 054h		;c064	54 	T 
	defb 048h		;c065	48 	H 
	defb 045h		;c066	45 	E 
	defb 020h		;c067	20 	  
	defb 045h		;c068	45 	E 
	defb 04eh		;c069	4e 	N 
	defb 044h		;c06a	44 	D 
	defb 020h		;c06b	20 	  
	defb 04fh		;c06c	4f 	O 
	defb 046h		;c06d	46 	F 
	defb 020h		;c06e	20 	  
	defb 044h		;c06f	44 	D 
	defb 053h		;c070	53 	S 
	defb 045h		;c071	45 	E 
	defb 047h		;c072	47 	G 

	end
