%{
#include "y.tab.h"
%}

%%
\/\/[^\/].*     { return COMMENT; }
f               { return FLOATDCL; }
i               { return INTDCL; }
=               { return ASSIGN; }
\+              { return PLUS; }
\-              { return MINUS; }
\*              { return TIMES; }
\/              { return DIVIDE; }
[0-9]+\.[0-9]+  { return FNUM; }
[0-9]+          { return INUM; }
[a-eg-hj-oq-z]  { return ID; }
p               { return PRINT; }
[ \t\n]+        ; // Ignora espacios
%%

int yywrap(void) {
    return 1;
}
