package example;

import java_cup.runtime.ComplexSymbolFactory;

import java.io.FileReader;
import java.io.BufferedReader;
import java.io.InputStreamReader;

import example.ParserSym;

class Main {

  public static void main(String[] args) {

    BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
    while (true) {
      try {

        System.out.print("> ");
        String line = reader.readLine();
        if (line == null) break;

        ComplexSymbolFactory factory = new ComplexSymbolFactory();


        // Construct lexer using Reader, not String
        example.Lexer debugLexer =
            new example.Lexer(line, factory);

        java_cup.runtime.Symbol sym;
        while ((sym = debugLexer.next_token()).sym != example.ParserSym.EOF) {
            System.out.println("tok = " + sym);
        }



        example.Lexer lexer = new example.Lexer(line, factory);
        example.Parser parser = new example.Parser(lexer, factory);

        Object result = parser.parse().value;
        System.out.println("= " + result);

      } catch (Exception e) {
        e.printStackTrace();
      }
    }
  }
}
