make:
	bison -d mfcalc.y
	flex mfcalc.l
	gcc -c mfcalc.tab.c
	gcc -c lex.yy.c
	gcc mfcalc.tab.o lex.yy.o -lfl -lm
clean:
	find -name "*.c" -type f -delete
	find -name "mfcalc.tab.h" -type f -delete
	find -name "*.o" -type f -delete
	find -name "a.out" -type f -delete
	clear