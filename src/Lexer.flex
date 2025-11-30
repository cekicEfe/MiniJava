package example;
import java_cup.runtime.SymbolFactory;
import java.io.StringReader;

%%

%public
%class Lexer
%unicode
%cupsym ParserSym
%cup

%{
    SymbolFactory sf;

    public Lexer(String line, SymbolFactory sf) {
        this(new StringReader(line));
        this.sf = sf;
    }

    

// %eofval{
//     return sf.newSymbol("EOF", ParserSym.EOF);
// %eofval}
%}


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

"class"        { return sf.newSymbol ("CLASS",ParserSym.CLASS); }
"public"       { return sf.newSymbol ("PUBLIC",ParserSym.PUBLIC); }
"static"       { return sf.newSymbol ("STATIC",ParserSym.STATIC); }
"void"         { return sf.newSymbol ("VOID",ParserSym.VOID); }
"main"         { return sf.newSymbol ("MAIN",ParserSym.MAIN); }
"String"       { return sf.newSymbol ("STRING",ParserSym.STRING); }
"extends"      { return sf.newSymbol ("EXTENDS",ParserSym.EXTENDS); }
"return"       { return sf.newSymbol ("RETURN",ParserSym.RETURN); }
"int"          { return sf.newSymbol ("INT",ParserSym.INT); }
"boolean"      { return sf.newSymbol ("BOOLEAN",ParserSym.BOOLEAN); }
"if"           { return sf.newSymbol ("IF",ParserSym.IF); }
"else"         { return sf.newSymbol ("ELSE",ParserSym.ELSE); }
"while"        { return sf.newSymbol ("WHILE",ParserSym.WHILE); }
"this"         { return sf.newSymbol ("THIS",ParserSym.THIS); }
"new"          { return sf.newSymbol ("NEW",ParserSym.NEW); }
"true"         { return sf.newSymbol ("TRUE",ParserSym.TRUE); }
"false"        { return sf.newSymbol ("FALSE",ParserSym.FALSE); }
"System"".""out"".""println"    { 
                  return sf.newSymbol ("PRINTLN",ParserSym.PRINTLN);
                }

{LE}            { return sf.newSymbol("LE",ParserSym.LE); }
{GE}            { return sf.newSymbol("GE",ParserSym.GE); }
{EQ}            { return sf.newSymbol("EQ",ParserSym.EQ); }
{NE}            { return sf.newSymbol("NE",ParserSym.NE); }
{AND}           { return sf.newSymbol("AND",ParserSym.AND); }
{OR}            { return sf.newSymbol("OR",ParserSym.OR); }
"<"            { return sf.newSymbol ("LT",ParserSym.LT); }
">"            { return sf.newSymbol ("GT",ParserSym.GT); }
"+"            { return sf.newSymbol ("PLUS",ParserSym.PLUS); }
"-"            { return sf.newSymbol ("MINUS",ParserSym.MINUS); }
"*"            { return sf.newSymbol ("TIMES",ParserSym.TIMES); }
"/"            { return sf.newSymbol ("DIVIDE",ParserSym.DIVIDE); }
"!"            { return sf.newSymbol ("NOT",ParserSym.NOT); }
"="            { return sf.newSymbol ("ASSIGN",ParserSym.ASSIGN); }
";"            { return sf.newSymbol ("SEMI",ParserSym.SEMI); }
","            { return sf.newSymbol ("COMMA",ParserSym.COMMA); }
"."            { return sf.newSymbol ("DOT",ParserSym.DOT); }
"("            { return sf.newSymbol ("LPAREN",ParserSym.LPAREN); }
")"            { return sf.newSymbol ("RPAREN",ParserSym.RPAREN); }
"{"            { return sf.newSymbol ("LBRACE",ParserSym.LBRACE); }
"}"            { return sf.newSymbol ("RBRACE",ParserSym.RBRACE); }
"["            { return sf.newSymbol ("LBRACK",ParserSym.LBRACK); }
"]"            { return sf.newSymbol ("RBRACK",ParserSym.RBRACK); }

{NUMBER}        { return sf.newSymbol("NUMBER",ParserSym.NUM, Integer.valueOf(yytext())); }

{ID}            { return sf.newSymbol("ID",ParserSym.ID, yytext()); }

[^]               { System.err.println("Illegal character: '" + yytext() + "' at line " + (yyline+1) + ", col " + yycolumn); }


