make:
	bison -d infix.y
	flex infix.l
	gcc -c infix.tab.c
	gcc -c lex.yy.c
	gcc infix.tab.o lex.yy.o -lfl -lm
clean:
	find -name "*.c" -type f -delete
	find -name "*.h" -type f -delete
	find -name "*.o" -type f -delete
	find -name "a.out" -type f -delete
	clear