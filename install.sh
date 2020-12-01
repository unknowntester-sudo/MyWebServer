#!/bin/bash

function CreateManiFestFile() {
  if [ -d "./src" ] 
  then
    cd ./src
    javafiles=$(find . -name "*.java" | xargs)
    IFS=', ' read -r -a array <<< "$javafiles"
    MAINCLASS=""
    for element in "${array[@]}"
    do 
       if grep -q "static void main" "$element"; then   
         MAINCLASS=${element:2} #trim the first two characters
         MAINCLASS="${MAINCLASS%.*}" #remove file extension
         echo "Found main class at " $MAINCLASS
      fi
    done

  cd ..
  if [ -d "./bin/META-INF/" ]
  then
    rm -R "./bin/META-INF/" ## remove the folder completly, otherwise we will have duplicate entry points.
  fi
  mkdir ./bin/META-INF
  touch ./bin/META-INF/MANIFEST.MF

  echo "Manifest-Version: 1.0" >> ./bin/META-INF/MANIFEST.MF
  echo "Main-Class: $MAINCLASS" >> ./bin/META-INF/MANIFEST.MF

  echo "Wrote to $(pwd)/bin/META-INF/MANIFEST.MF"
else
  echo "Could not find src folder..."
fi
}
function CompileJava() {
  cd ./src
  find . -name "*.java" | xargs javac -d ../bin
  cd ..
}


cp ./bin/se/lnu/http/resources/ ./resources # move resources to root folder.

CompileJava
CreateManiFestFile

cd ./bin
zip -qq server.jar -r . # zip this quiet
mv server.jar ..

echo "Build complete you will find the server.jar at $(pwd)/server.jar"
