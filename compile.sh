jflex src/Lexer.flex
echo "Created Lexer"

javacup -expect 43 -destdir src/ -symbols ParserSym -parser Parser src/Parser.cup 
echo "Created Parser"

mkdir -p build
javac -cp java-cup-11b-runtime.jar -d build $(find src/ -name "*.java") 
echo "Compiled suc"

