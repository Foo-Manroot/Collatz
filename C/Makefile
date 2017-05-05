GCC=gcc
FLAGS=-Wall
OBJFLAGS=-c

.PHONY: clean all


all: collatz

# Reglas para compilar "collatz"
collatz: collatz.o
	$(GCC) $(FLAGS) -o $@ $^

collatz.o: collatz.c collatz.h
	$(GCC) $(FLAGS) $(OBJFLAGS) -o $@ $<


# Elimina todos los ficheros objeto y ejecutables
clean:
	rm -f *.o
	rm -f collatz
