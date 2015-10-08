all: generate-scr-file

generate-scr-file: scr-generator.o
	gcc scr-generator.c -std=c11 -o generate-scr-file

scr-generator: scr-generator.c
	gcc scr-generator.c -c
