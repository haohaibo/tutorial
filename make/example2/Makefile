CC = gcc
TARGET = test
OBJS = test.o

ifeq ($(ver), debug)
  $(warning ver is debug)
else
  $(warning ver is release)
endif

$(TARGET):$(OBJS)
	$(CC) -o $@ $^

clean:
	rm -rf test test.o
