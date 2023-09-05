
TUNE_SRC = tune.z80
TUNE_OBJ = $(TUNE_SRC:.z80=.o)

TUNE = tune.com

all: $(TUNE)

disk: $(TUNE)
	z88dk-appmake +cpmdisk -f qc10 --container imd  -b $(TUNE)

$(TUNE): $(TUNE_OBJ)
	z88dk-z80asm -l -s -m -g -v -b -o$@ $^

%.o: %.z80
	z88dk-z80asm -l -s -m -g -v $^

clean:
	$(RM) *.o *.lis *.def *.sym *.bin *.map *.imd *.err $(TUNE)
