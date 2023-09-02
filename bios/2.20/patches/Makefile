Z80ASM=z80asm


all: patch-bios

bios-ba93-patch.bin: bios-ba93-patch.asm
	$(Z80ASM) -o $@ $^

bios-bab6-patch.bin: bios-bab6-patch.asm
	$(Z80ASM) -o $@ $^

bios-bc35-patch.bin: bios-bc35-patch.asm
	$(Z80ASM) -o $@ $^

bios-bc81-patch.bin: bios-bc81-patch.asm
	$(Z80ASM) -o $@ $^

bios-bcef-patch.bin: bios-bcef-patch.asm
	$(Z80ASM) -o $@ $^

bios-f736-patch.bin: bios-f736-patch.asm
	$(Z80ASM) -o $@ $^

patch-bios: bios-ba93-patch.bin bios-bab6-patch.bin bios-bc35-patch.bin bios-bc81-patch.bin bios-bcef-patch.bin bios-f736-patch.bin
	cp ../cpm2.sys .
	dd if=bios-ba93-patch.bin of=cpm2.sys conv=notrunc bs=1 seek=$(shell printf "%d" $$((0xba93+256)))
	dd if=bios-bab6-patch.bin of=cpm2.sys conv=notrunc bs=1 seek=$(shell printf "%d" $$((0xbab6+256)))
	dd if=bios-bc35-patch.bin of=cpm2.sys conv=notrunc bs=1 seek=$(shell printf "%d" $$((0xbc35+256)))
	dd if=bios-bc81-patch.bin of=cpm2.sys conv=notrunc bs=1 seek=$(shell printf "%d" $$((0xbc81+256)))
	dd if=bios-bcef-patch.bin of=cpm2.sys conv=notrunc bs=1 seek=$(shell printf "%d" $$((0xbcef+256)))
	dd if=bios-f736-patch.bin of=cpm2.sys conv=notrunc bs=1 seek=$(shell printf "%d" $$((0xc8a9)))

.PHONY: clean
clean:
	@rm -rf *.bin
	@rm -rf *.sys
