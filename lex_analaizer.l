%option noyywrap
%{
/*Performing lexical Analysis of a COMMENT, an INTEGER, and a FLOAT */

#include <stdio.h> /*Para incluir la funcion de printf*/

FILE *output; // nuevo: archivo tokens.out

%}

%%

\/\/[^\/].*     { printf("COMMENT\n"); fprintf(output, "COMMENT\n"); }
f               { printf("floatdcl\n"); fprintf(output, "floatdcl\n"); }
i               { printf("intdcl\n"); fprintf(output, "intdcl\n"); }
=               { printf("assign\n"); fprintf(output, "assign\n"); }
\+              { printf("plus\n"); fprintf(output, "plus\n"); }
[0-9]+\.[0-9]+  { printf("fnum\n"); fprintf(output, "fnum\n"); }
[0-9]+          { printf("inum\n"); fprintf(output, "inum\n"); }
[a-eg-hj-oq-z]  { printf("id\n"); fprintf(output, "id\n"); }
p               { printf("print\n"); fprintf(output, "print\n"); }
\/              { printf("divide\n"); fprintf(output, "divide\n"); }
\*              { printf("times\n"); fprintf(output, "times\n"); }
\-              { printf("minus\n"); fprintf(output, "minus\n"); }

[ \t\n]+        ;

%%

int main(int argc, char **argv) {
    FILE *fd;

    if (argc == 2) {
        if (!(fd = fopen(argv[1], "r"))) {
            perror("Error: ");
            return (-1);
        }

        yyset_in(fd);

        output = fopen("tokens.out", "w"); // nuevo: abrir archivo de salida
        if (!output) {
            perror("Error opening tokens.out");
            fclose(fd);
            return (-1);
        }

        yylex();

        fclose(fd);
        fclose(output); // cerrar archivo tokens.out
    } else {
        printf("Usage: a.out filename\n");
    }

    return (0);
}
