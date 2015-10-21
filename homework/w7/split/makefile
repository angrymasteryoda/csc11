all: 
	as -o split1.o split1.s
	as -o split2.o split2.s
	gcc -o combine split1.o split2.o
clean :
	rm -vf *.o
