package src;

%%

%{

private void imprimir(String descricao, String lexema) {
    System.out.println(lexema + " - " + descricao);
}

%}


%class AnalisadorLexico
%type void

letra = [A-Za-z_]
numero = [0-9]

IDENTIFICADOR = {letra}({letra}|{numero})*

PONTOEVIRGULA = [\;]
PONTO = [\.]
ABRE_CHAVE = [\{]
FECHA_CHAVE = [\}]
ABREPAR = [\(]
FECHAPAR = [\)]
VIRGULA = [\,]
DOIS_PONTOS = [:]
NUMBER = {numero}+(\.{numero}+)?(E[+-]?{numero}+)?
CONST_CARACTERE = \'(.)\'
OPERADOR_RELACIONAL = "<"|">"|"<="|">="|"=="|"!="
OPATR = "="
OPERADOR_ARG = arg[] | args[]
OPERADOR_ADITIVO_ARIT = [+\-]
OPERADOR_ADITIVO_LOGIC = "||"
OPERADOR_MULTIPLICATIVO = [\*\/\%]|"&&"

%%

"boolean"				{ imprimir("Palavra reservada boolean", yytext()); } 
"break"					{ imprimir("Palavra reservada break", yytext()); } 
"char"					{ imprimir("Palavra reservada char", yytext()); } 
"class"					{ imprimir("Palavra reservada class", yytext()); } 
"continue"				{ imprimir("Palavra reservada continue", yytext()); } 
"else"					{ imprimir("Palavra reservada else", yytext()); } 
"float"					{ imprimir("Palavra reservada float", yytext()); }
"if"					{ imprimir("Palavra reservada if", yytext()); }
"int"					{ imprimir("Palavra reservada int", yytext()); } 
"public"				{ imprimir("Palavra reservada public", yytext()); } 
"return"				{ imprimir("Palavra reservada return", yytext()); } 
"static"				{ imprimir("Palavra reservada static", yytext()); } 
"String"				{ imprimir("Palavra reservada String", yytext()); } 
"switch"				{ imprimir("Palavra reservada switch", yytext()); } 
"void"					{ imprimir("Palavra reservada void", yytext()); } 
"while"					{ imprimir("Palavra reservada while", yytext()); }

"true"					{ imprimir("Palavra reservada constante booleana true", yytext()); }
"false"					{ imprimir("Palavra reservada constante booleana false", yytext()); }

{IDENTIFICADOR}				{ imprimir("Identificador", yytext()); }
{PONTOEVIRGULA}				{ imprimir("Ponto e virgula", yytext()); }
{PONTO}						{ imprimir("Ponto", yytext()); }
{ABRE_CHAVE}				{ imprimir("Abre Chave", yytext()); }
{FECHA_CHAVE}				{ imprimir("Fecha Chave", yytext()); }
{ABREPAR}					{ imprimir("Abre Parenteses", yytext()); }
{FECHAPAR}					{ imprimir("Fecha Parenteses", yytext()); }
{VIRGULA}					{ imprimir("Virgula", yytext()); }
{DOIS_PONTOS}				{ imprimir("Dois pontos", yytext()); }
{NUMBER}					{ imprimir("Número", yytext()); }
{CONST_CARACTERE}			{ imprimir("Caractere", yytext()); }
{OPERADOR_RELACIONAL}		{ imprimir("Operador relacional", yytext()); }
{OPATR}						{ imprimir("Operador de atribuição", yytext()); }
{OPERADOR_ARG}				{ imprimir("Operador de argumento", yytext()); }
{OPERADOR_ADITIVO_ARIT}		{ imprimir("Operador aditivo (soma ou subtração)", yytext()); }
{OPERADOR_ADITIVO_LOGIC}	{ imprimir("Operador aditivo (ou)", yytext()); }
{OPERADOR_MULTIPLICATIVO}	{ imprimir("Operador mutiplicativo", yytext()); }

. { throw new RuntimeException("Caractere inválido " + yytext()); }