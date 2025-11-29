import lexer.*;
import parser.*;
import java_cup.runtime.Symbol;

public class Main {
    public static void main(String[] args) throws Exception {
        MiniJavaLexer lexer = new MiniJavaLexer(System.in);
        MiniJavaParser parser = new MiniJavaParser(lexer);
        Object result = parser.parse();
        System.out.println("Parsing finished.");
    }
}
