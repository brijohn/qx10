
CQGTEST_SRC = cqgtest.z80
CQGTEST_OBJ = $(CQGTEST_SRC:.z80=.o)

CQGTEST = cqgtest.com

all: $(CQGTEST)

disk: $(CQGTEST)
	z88dk-appmake +cpmdisk -f qc10 --container imd  -b $(CQGTEST)

$(CQGTEST): $(CQGTEST_OBJ)
	z88dk-z80asm -l -s -m -g -v -b -o$@ $^

%.o: %.z80
	z88dk-z80asm -l -s -m -g -v $^

clean:
	$(RM) *.o *.lis *.def *.sym *.bin *.map *.imd *.err $(CQGTEST)
