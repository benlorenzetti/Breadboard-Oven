all: test

test: test.o
	gcc test.o -std=c11 -o test

test.o: test.c
	gcc test.c -c
