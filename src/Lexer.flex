

package lexer;

%{
import java_cup.runtime.Symbol;

private Integer toInt(String s){ return Integer.valueOf(yytext()); }
%}


%class Lexer
%public
%implements java_cup.runtime.Scanner
%unicode
%cup
%line
%column

DIGIT = [0-9]
NUMBER = {DIGIT}+
ID = [A-Za-z_][A-Za-z0-9_]*
WS = [ \t\r\n\f\v]+

LE = "<="
GE = ">="
EQ = "=="
NE = "!="
AND = "&&"
OR = "\|\|"

%%

{WS}         {  }

"//"[^\n]*   { }

"/*"([^*]|\*+[^*/])*"*""/"   {  }

"class"        { return new Symbol(sym.CLASS); }
"public"       { return new Symbol(sym.PUBLIC); }
"static"       { return new Symbol(sym.STATIC); }
"void"         { return new Symbol(sym.VOID); }
"main"         { return new Symbol(sym.MAIN); }
"String"       { return new Symbol(sym.STRING); }
"extends"      { return new Symbol(sym.EXTENDS); }
"return"       { return new Symbol(sym.RETURN); }
"int"          { return new Symbol(sym.INT); }
"boolean"      { return new Symbol(sym.BOOLEAN); }
"if"           { return new Symbol(sym.IF); }
"else"         { return new Symbol(sym.ELSE); }
"while"        { return new Symbol(sym.WHILE); }
"this"         { return new Symbol(sym.THIS); }
"new"          { return new Symbol(sym.NEW); }
"true"         { return new Symbol(sym.TRUE); }
"false"        { return new Symbol(sym.FALSE); }
"System"".""out"".""println"    { 
                  return new Symbol(sym.PRINTLN);
                }

{LE}            { return new Symbol(sym.LE); }
{GE}            { return new Symbol(sym.GE); }
{EQ}            { return new Symbol(sym.EQ); }
{NE}            { return new Symbol(sym.NE); }
{AND}           { return new Symbol(sym.AND); }
{OR}            { return new Symbol(sym.OR); }
"<"            { return new Symbol(sym.LT); }
">"            { return new Symbol(sym.GT); }
"+"            { return new Symbol(sym.PLUS); }
"-"            { return new Symbol(sym.MINUS); }
"*"            { return new Symbol(sym.TIMES); }
"/"            { return new Symbol(sym.DIVIDE); }
"!"            { return new Symbol(sym.NOT); }
"="            { return new Symbol(sym.ASSIGN); }
";"            { return new Symbol(sym.SEMI); }
","            { return new Symbol(sym.COMMA); }
"."            { return new Symbol(sym.DOT); }
"("            { return new Symbol(sym.LPAREN); }
")"            { return new Symbol(sym.RPAREN); }
"{"            { return new Symbol(sym.LBRACE); }
"}"            { return new Symbol(sym.RBRACE); }
"["            { return new Symbol(sym.LBRACK); }
"]"            { return new Symbol(sym.RBRACK); }

{NUMBER}        { return new Symbol(sym.NUM, toInt(yytext())); }

{ID}            { return new Symbol(sym.ID, yytext()); }

.               { System.err.println("Illegal character: '" + yytext() + "' at line " + (yyline+1) + ", col " + yycolumn); }

