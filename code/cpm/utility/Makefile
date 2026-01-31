Z80ASM=z80asm

all: cmosload.com cmosdump.com loadrom.com

cmosload.com: cmosload.asm
	$(Z80ASM) -o $@ $^

cmosdump.com: cmosdump.asm
	$(Z80ASM) -o $@ $^

loadrom.com: loadrom.asm
	$(Z80ASM) -o $@ $^

.PHONY: clean
clean:
	@rm -rf *.com

