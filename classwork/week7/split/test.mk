#Makefile
all: main

main : main.o
	gcc -o combine split1.o split2.o

main.o : main .s
	as -o split1.o split1.s
	as -o split2.o split2.s

clean:
	rm -vf *.o
