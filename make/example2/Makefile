CC = gcc
TARGET = test
OBJS = test.o

ifeq ($(ver), debug)
  $(warning ver is debug)
else
  $(warning ver is release)
endif

# $@ 代表目标
# $^ 代表所有依赖的对象
# $< 代表第一个依赖的对象
$(TARGET):$(OBJS)
	$(CC) -o $@ $^

clean:
	rm -rf *.o $(TARGET) 
