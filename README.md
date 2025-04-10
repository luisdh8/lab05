## Comandos a Ejecutar:

1. ```flex lex_analaizer.l```  
2. ```gcc lex.yy.c -o lex_analaizer```  
3. ```python3 code_generator.py > example.ac```  **Aunque esto ya no es necesario**
4. ```./lex_analaizer example.ac```  
5. ```make```  
6. ```./syntax-calc < tokens.out```  
