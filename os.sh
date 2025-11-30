#!/usr/bin/env bash

# 1. Generate lexer
jflex src/Lexer.flex
echo "Created Lexer"

# 2. Generate parser
javacup -expect 43 -destdir src/ -symbols ParserSym -parser Parser src/Parser.cup 
echo "Created Parser"

# 3. Compile
mkdir -p build
javac -cp java-cup-11b-runtime.jar -d build $(find src/ -name "*.java") 
echo "Compiled suc"

# 4. Run
java -cp build:java-cup-11b-runtime.jar example.Main
echo "Ran succ"
