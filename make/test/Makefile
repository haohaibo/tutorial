CC=gcc
CFLAGS=-DMACRO
CSRCS := $(shell find . -name '*.c')
COBJS := $(subst .c,.o,$(CSRCS))

all: Test

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $(basename $@).o

Test: $(COBJS)
	$(CC) -o Test $(COBJS)

clean:
	rm -rf *.o Test
