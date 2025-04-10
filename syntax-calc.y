%{
#include <stdio.h>
#include <stdlib.h>

int yylex(void);
void yyerror(const char *s) {
    printf("Error de sintaxis: %s\n", s);
}
%}

/* Declaración de tokens (con todos los nombres que usa mi lexer) */
%token COMMENT FLOATDCL INTDCL ASSIGN INUM FNUM ID PRINT
%token PLUS MINUS TIMES DIVIDE

%%

/* La regla principal: */
program:
    statement_list
    {
        /* Imprime la cabecera del DOT y cierra el grafo */
        printf("digraph G {\n");
        printf("  program -> statement_list;\n");
        printf("}\n");
    }
    ;

/* Una lista de sentencias */
statement_list:
      statement_list statement
      {
          printf("  statement_list -> statement;\n");
      }
    | statement
      {
          printf("  statement_list -> statement;\n");
      }
    ;

/* Cada sentencia puede ser: */
statement:
      COMMENT
      {
          printf("  statement -> COMMENT;\n");
      }
    | FLOATDCL ID
      {
          printf("  statement -> FLOATDCL ID;\n");
      }
    | INTDCL ID
      {
          printf("  statement -> INTDCL ID;\n");
      }
    | ID ASSIGN value
      {
          printf("  statement -> ID ASSIGN value;\n");
      }
    | PRINT ID
      {
          printf("  statement -> PRINT ID;\n");
      }
    ;

/* Definición de una expresión (valor) */
value:
      ID
      {
          printf("  value -> ID;\n");
      }
    | INUM
      {
          printf("  value -> INUM;\n");
      }
    | FNUM
      {
          printf("  value -> FNUM;\n");
      }
    | value PLUS value
      {
          printf("  value -> value PLUS value;\n");
      }
    | value MINUS value
      {
          printf("  value -> value MINUS value;\n");
      }
    | value TIMES value
      {
          printf("  value -> value TIMES value;\n");
      }
    | value DIVIDE value
      {
          printf("  value -> value DIVIDE value;\n");
      }
    ;

%%

int main(void) {
    yyparse();
    return 0;
}
