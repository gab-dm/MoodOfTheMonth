#!/bin/sh

## clean previous output
rm -rf out/*

## compile all java files to classes (TODO configure classpath)
#javac -d out/classes -cp lib/slf4j-api-1.7.30.jar:lib/slf4j-simple-1.7.30.jar $(find ./src/main -name "*.java")
javac -d out/classes -cp $(find -name "*.jar" | paste -sd ":") $(find ./src/main -name "*.java")
