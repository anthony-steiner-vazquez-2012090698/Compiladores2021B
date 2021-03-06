/* Infix notation calculator. */

%{
    #include <math.h>
    #include <stdio.h>
    void yyerror(char* mensaje){
        printf("Error: %s\n", mensaje);
    }
%}
/* Bison declarations. */
%define api.value.type {double}
%token NUM
%left '-' '+'
%left '*' '/'
%precedence NEG   /* negation--unary minus */
%right '^'         /* exponentiation */

%% /* The grammar follows. */
input:
    %empty
| input line
;

line:
    '\n'
| exp '\n'  { printf ("\t%.10g\n", $1); }
;

exp: NUM
| exp '+' exp        { $$ = $1 + $3;      }
| exp '-' exp        { $$ = $1 - $3;      }
| exp '*' exp        { $$ = $1 * $3;      }
| exp '/' exp        { $$ = $1 / $3;      }
| '-' exp  %prec NEG { $$ = -$2;          }
| exp '^' exp        { $$ = pow ($1, $3); }
| '(' exp ')'        { $$ = $2;           }
;
%%
int main() {
	yyparse();
	return 0;
}