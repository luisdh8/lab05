%{
#include "y.tab.h"
%}

%%

"COMMENT"     { return COMMENT; }
"floatdcl"    { return FLOATDCL; }
"intdcl"      { return INTDCL; }
"id"          { return ID; }
"assign"      { return ASSIGN; }
"inum"        { return INUM; }
"fnum"        { return FNUM; }
"print"       { return PRINT; }
"plus"        { return PLUS; }
"minus"       { return MINUS; }
"times"       { return TIMES; }
"divide"      { return DIVIDE; }

[ \t\n]+      ; // Ignorar espacios, tabs y saltos de línea
.             { return yytext[0]; }

%%

int yywrap(void) { return 1; }
