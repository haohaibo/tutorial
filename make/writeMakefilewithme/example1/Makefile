objects = main.o kbd.o command.o display.o \
	insert.o search.o files.o utils.o 
edit : $(objects) 
	cc -o edit $(objects) 
# \ 是换行符的意思
# 让make自动推导
# 只要make看到[.o]文件，它就会自动的把[.c]文件加在依赖关系中
# 例如 如果make找到一个whatever.o,那么whatever.c就会是whatever.o的依赖文件
# cc -c whatever.c 也会被推导出来
main.o : defs.h

kbd.o : defs.h command.h

command.o : defs.h command.h

display.o : defs.h buffer.h

insert.o : defs.h buffer.h

search.o : defs.h buffer.h

files.o : defs.h buffer.h command.h

utils.o : defs.h

# .PHONY 表示clean为伪目标文件
.PHONY : clean
clean : 
	rm edit $(objects) 
# just a test for Makefile label
byeworld : 
	rm edit $(objects) 
