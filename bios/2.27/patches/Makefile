Z80ASM=z80asm


all: patch-bios patch-hdpart

bios-99b1-patch.bin: bios-99b1-patch.asm
	$(Z80ASM) -o $@ $^

bios-9a5f-patch.bin: bios-9a5f-patch.asm
	$(Z80ASM) -o $@ $^

bios-9ae1-patch.bin: bios-9ae1-patch.asm
	$(Z80ASM) -o $@ $^

bios-9f2b-patch.bin: bios-9f2b-patch.asm
	$(Z80ASM) -o $@ $^

bios-f708-patch.bin: bios-f708-patch.asm
	$(Z80ASM) -o $@ $^

patch-bios: bios-99b1-patch.bin bios-9a5f-patch.bin bios-9ae1-patch.bin bios-9f2b-patch.bin bios-f708-patch.bin
	cp ../cpm2.sys .
	dd if=bios-99b1-patch.bin of=cpm2.sys conv=notrunc bs=1 seek=$(shell printf "%d" $$((0x99b1+5888)))
	dd if=bios-9a5f-patch.bin of=cpm2.sys conv=notrunc bs=1 seek=$(shell printf "%d" $$((0x9a5f+5888)))
#	dd if=bios-9ae1-patch.bin of=cpm2.sys conv=notrunc bs=1 seek=$(shell printf "%d" $$((0x9ae1+5888)))
	dd if=bios-9f2b-patch.bin of=cpm2.sys conv=notrunc bs=1 seek=$(shell printf "%d" $$((0x9f2b+5888)))
#	dd if=bios-f708-patch.bin of=cpm2.sys conv=notrunc bs=1 seek=$(shell printf "%d" $$((0xc358)))

hdpart-3034-patch.bin: hdpart-3034-patch.asm
	$(Z80ASM) -o $@ $^

hdpart-2c61-patch.bin: hdpart-2c61-patch.asm
	$(Z80ASM) -o $@ $^

hdpart-2cb5-patch.bin: hdpart-2cb5-patch.asm
	$(Z80ASM) -o $@ $^

hdpart-2d35-patch.bin: hdpart-2d35-patch.asm
	$(Z80ASM) -o $@ $^

patch-hdpart: hdpart-3034-patch.bin hdpart-2c61-patch.bin hdpart-2cb5-patch.bin hdpart-2d35-patch.bin
	cp ../hdpart.com .
	dd if=hdpart-2c61-patch.bin of=hdpart.com conv=notrunc bs=1 seek=$(shell printf "%d" $$((0x2c61-0x100)))
	dd if=hdpart-2cb5-patch.bin of=hdpart.com conv=notrunc bs=1 seek=$(shell printf "%d" $$((0x2cb5-0x100)))
	dd if=hdpart-2d35-patch.bin of=hdpart.com conv=notrunc bs=1 seek=$(shell printf "%d" $$((0x2d35-0x100)))
	dd if=hdpart-3034-patch.bin of=hdpart.com conv=notrunc bs=1 seek=$(shell printf "%d" $$((0x3034-0x100)))

.PHONY: clean
clean:
	@rm -rf *.bin
	@rm -rf *.com
	@rm -rf *.sys
