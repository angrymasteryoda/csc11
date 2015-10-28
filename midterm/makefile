all: 
#	gcc -c *.s
#	gcc -o program *.o 
	as -o menu.o menu.s
	as -o p3.o p3.s
	gcc -o program menu.o p3.o
clean :
	rm -vf *.o
