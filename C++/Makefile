CC=g++
CCFLAGS=-Wall
OBJFLAGS=$(CCFLAGS) -c

.PHONY: clean all

all: collatz

collatz: main.o collatz.o
	$(CC) $(CCFLAGS) $^ -o $@

# Generation of all object
%.o: %.cpp %.hpp
	$(CC) $(OBJFLAGS) $< -o $@

clean:
	rm -f *.o
	rm -f collatz
