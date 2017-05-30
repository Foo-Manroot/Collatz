GAS=as
LD=ld
ASFLAGS=--32
LDFLAGS=-I/lib/ld-linux.so.2 -m elf_i386 -lc

CC=gcc
CCFLAGS=-m32

.PHONY: clean all

all: collatz_as collatz_cc

####
# Binary generated only with the compiler
####
collatz_cc: collatz_cc.s
	$(CC) $(CCFLAGS) $^ -o $@
	

####
# Binary generated with both AS and LD (assembler and linker)
####
collatz_as: collatz_as.o
	$(LD) $(LDFLAGS) $^ -o $@
	

collatz_as.o: collatz_as.s
	$(AS) $(ASFLAGS) $< -o $@



clean:
	rm -f *.o
	rm -f collatz_as
	rm -f collatz_cc
