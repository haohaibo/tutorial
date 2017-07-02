# objects 可以理解为类似于C语言的宏
objects = main.o kbd.o command.o display.o \
	insert.o search.o files.o utils.o 
edit : $(objects) 
	cc -o edit $(objects) 
# \ 是换行符的意思
# 让make自动推导
# 只要make看到[.o]文件，它就会自动的把[.c]文件加在依赖关系中
# 例如 如果make找到一个whatever.o,那么whatever.c就会是whatever.o的依赖文件
# cc -c whatever.c 也会被推导出来


# 这样写 文件依赖关系就显得有点凌乱
# 文件依赖关系看不清楚
$(objects) : defs.h

kbd.o command.o files.o :  command.h

display.o insert.o search.o files.o : buffer.h

# .PHONY 表示clean为伪目标文件
.PHONY : clean
clean : 
	# - 的意思是，也许某些文件出现问题，但不要管，继续做后面的事
	-rm edit $(objects) 
# just a test for Makefile label
byeworld : 
	rm edit $(objects) 
a : 
	echo $(objects)
