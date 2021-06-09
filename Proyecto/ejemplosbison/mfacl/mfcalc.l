%{
    #include <stdlib.h>
    #include "mfcalc.tab.h"
    /* hacer */
%}
%%
[0-9]+      { yylval.NUM = atoi(yytext); return NUM;}
[+]         { return '+'; }
"^"        { return '^'; }
[*]         { return '*'; }
[-]         { return '-'; }
[/]         { return '/'; }
"("         { return '('; }
")"         { return ')'; }
\n          { return '\n'; }
.
