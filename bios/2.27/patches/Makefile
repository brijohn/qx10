Z80ASM=z80asm


all: patch-bios

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

.PHONY: clean
clean:
	@rm -rf *.bin
	@rm -rf *.sys
