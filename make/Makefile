main: main.o mytool1.o mytool2.o
	gcc -o $@ $^ 
.c.o:
	gcc -c $<
clean:
	rm main *.o
