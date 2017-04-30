GCC=gcc
FLAGS=-Wall
OBJFLAGS=-c

.PHONY: clean all


all: collatz

# Reglas para compilar "collatz"
collatz: collatz.o
	$(GCC) $(FLAGS) -o collatz collatz.o

collatz.o: collatz.h collatz.c
	$(GCC) $(FLAGS) $(OBJFLAGS) -o collatz.o collatz.c


# Elimina todos los ficheros objeto y ejecutables
clean:
	rm -f *.o
	rm -f collatz
