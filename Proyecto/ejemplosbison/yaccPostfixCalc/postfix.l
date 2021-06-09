%{
    /* %%
    int main(){
        yylex();
    } */
    #include <stdlib.h>
    #include "postfix.tab.h"
%}
%%
[0-9]+      { yylval = atoi(yytext); return NUMERO;}
[+]         { return '+'; }
[*]         { return '*'; }
\n          { return '\n'; }
.
