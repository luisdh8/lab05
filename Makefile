all:
        yacc -d syntax-calc.y
        lex syntax-calc.l
        gcc y.tab.c lex.yy.c -o syntax-calc

clean:
        rm -rf syntax-calc
        rm -rf lex.yy.c
        rm -rf y.tab.c
        rm -rf y.tab.h
        rm -rf y.tab.h.gch
