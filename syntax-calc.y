%{
#include <stdio.h>
#include <stdlib.h>
int yylex();
void yyerror(const char *s) {
    printf("Error de sintaxis: %s\n", s);
}
%}

%token COMMENT FLOATDCL INTDCL ASSIGN INUM FNUM ID PRINT PLUS MINUS TIMES DIVIDE

%%

program:
    statement_list
    {
        printf("Análisis exitoso.\n");
    }
;

statement_list:
    statement_list statement
    | statement
;

statement:
    COMMENT { printf("Comentario detectado.\n"); }
    | FLOATDCL ID { printf("Declaración de float: %s\n", $2); }
    | INTDCL ID { printf("Declaración de int: %s\n", $2); }
    | ID ASSIGN value { printf("Asignación: %s = %d\n", $1, $3); }
    | PRINT ID { printf("Imprimir: %s\n", $2); }
;

value:
    ID { printf("Valor (ID): %s\n", $1); }
    | INUM { printf("Valor (INUM): %d\n", $1); }
    | FNUM { printf("Valor (FNUM): %f\n", $1); }
    | value operator value { printf("Operación: %d %s %d\n", $1, $2, $3); }
;

operator:
    PLUS { printf("Operador: +\n"); }
    | MINUS { printf("Operador: -\n"); }
    | TIMES { printf("Operador: *\n"); }
    | DIVIDE { printf("Operador: /\n"); }
;

%%

int main() {
    return yyparse();
}
