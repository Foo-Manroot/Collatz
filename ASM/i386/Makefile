GAS=as
LD=ld
ASFLAGS=--32
LDFLAGS=-I/lib/ld-linux.so.2 -m elf_i386 -lc

.PHONY: clean all

all: collatz_as

####
# Binario generado con AS y LD (ensamblador y enlazador)
####
collatz_as: collatz_as.o
	$(LD) $(LDFLAGS) $^ -o $@
	

collatz_as.o: collatz_as.s
	$(AS) $(ASFLAGS) $< -o $@



clean:
	rm -f *.o
	rm -f collatz_as
