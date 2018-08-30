#!/bin/bash

echo '- Welcome to the LEDA-AUTO-SEND installation wizard'
echo


rm -rf ~/.local/bin/leda 
rm -rf ~/.local/etc/LEDA-AUTO-SEND

echo "# These Comands was added by LEDA-AUTO-SEND" >> ~/.bashrc
echo "source ~/.local/bin/leda" >> ~/.bashrc
echo "# Finished the commands of LEDA-AUTO-SEND" >> ~/.bashrc
echo "" >> ~/.bashrc 
source ~/.bashrc
	
echo "# These Comands was added by LEDA-AUTO-SEND" >> ~/.zshrc
echo "source ~/.local/bin/leda'" >> ~/.zshrc
echo "# Finished the commands of LEDA-AUTO-SEND" >> ~/.zshrc
echo "" >> ~/.zshrc
source ~/.zshrc
	
cd 
cd .local
mkdir bin
mkdir etc
cd etc
mkdir bin
cd
echo "- Now, let's configure the execution file..." 

pwd=$(pwd)
user=$(whoami)
read -r -p "${1:-- Digite sua matrícula: } " matricula
sed -i "s/matriculaUser/$matricula/g;" ~/LEDA-AUTO-SEND/usr/leda.sh 	

cp ~/LEDA-AUTO-SEND/usr/leda ~/.local/bin
mv ~/LEDA-AUTO-SEND ~/.local/etc

echo -e "- Thank's for install LEDA-AUTO-SEND, run 'leda' on terminal to start\n"
source ~/.bashrc
source ~/.zshrc

exit
