#! /bin/bash

read -p "Roteiro: " roteiro

matricula='117210400'

wget -O "$roteiro.zip" --post-data="id=$roteiro&matricula=$matricula" http://150.165.85.29:81/download
unzip  "$roteiro.zip" -d "$roteiro"
rm -rf "$roteiro.zip"

sed -i "s/INSIRA SEU NUMERO DE MATRICULA/$matricula/g;s/R0X-0X/$roteiro/g" "$roteiro"/pom.xml 
cd $roteiro
mvn install -DskipTests
exit 0
