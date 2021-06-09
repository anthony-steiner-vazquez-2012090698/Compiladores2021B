    %{
    /*
        bison -d name.y
        flex name.l
        gcc -c lex.yy.c
        gcc -c name.tab.c
        gcc name.tab.o lex.yy.o -lfl
    */
    #include <stdio.h>
    void yyerror(char* mensaje){
        printf("Error: %s\n", mensaje);
    }
%}
%token NUMERO
%%
entrada:
%empty
| entrada linea
;
linea: '\n'
| expresion '\n'                    { printf("\n Resultado = %d \n ", $1); }
;
expresion: 
expresion expresion '+'             { $$ = $1 + $2; }
| expresion expresion '*'           { $$ = $1 * $2; }
| NUMERO                            { $$ = $1; }
;
%%
int main(){
    yyparse();
    return 0;
}