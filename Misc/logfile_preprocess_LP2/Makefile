all : enc dec
enc : enc.o 
	g++ enc.o -o enc

enc.o : enc.cpp
	g++ -c enc.cpp -o enc.o


dec : dec.o
	g++ dec.o -o dec

dec.o : dec.cpp
	g++ -c dec.cpp -o dec.o


clean :
	rm *.o enc dec
