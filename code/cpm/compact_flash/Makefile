
CFINFO_SRC = cfinfo.z80 compact_flash.z80 strings.z80
CFINFO_OBJ = $(CFINFO_SRC:.z80=.o)

CFFORMAT_SRC = cfformat.z80 compact_flash.z80 strings.z80
CFFORMAT_OBJ = $(CFFORMAT_SRC:.z80=.o)

# Uncomment to build using CHS adressing instead of LBA
#ASMFLAGS = -DCHS

CFINFO = cfinfo.com
CFFORMAT = cfformat.com

all: $(CFINFO) $(CFFORMAT)

disk: $(CFINFO) $(CFFORMAT)
	z88dk-appmake +cpmdisk -f qc10 --container imd  -b $(CFINFO) -a $(CFFORMAT)

$(CFINFO): $(CFINFO_OBJ)
	z88dk-z80asm -l -s -m -g -v -b -o$@ $(CFINFO_OBJ)

$(CFFORMAT): $(CFFORMAT_OBJ)
	z88dk-z80asm -l -s -m -g -v -b -o$@ $(CFFORMAT_OBJ)

%.o: %.z80
	z88dk-z80asm -l -s -m -g -v $(ASMFLAGS) $^

clean:
	$(RM) *.o *.lis *.def *.sym *.bin *.map *.imd *.err $(CFINFO) $(CFFORMAT)
