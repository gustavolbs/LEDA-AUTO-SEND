#!/bin/bash

echo '- Welcome to the LEDA-AUTO-SEND installation wizard'
echo

read -r -p "${1:-- Have you installed LEDA-AUTO-SEND before? [Yes/No]} " response
case "$response" in [yY][eE][sS]|[yY])
		rm -rf ~/.local/bin/leda 
        rm -rf ~/.local/etc/LEDA-AUTO-SEND
        ;;
esac
case "$response" in [nN][oO]|[nN])
	
	echo "# These Comands was added by LEDA-AUTO-SEND" >> ~/.bashrc
	echo "alias leda='/home/$(whoami)/.local/bin/leda'" >> ~/.bashrc
	echo "# Finished the commands of LEDA-AUTO-SEND" >> ~/.bashrc
	echo "" >> ~/.bashrc 
	source ~/.bashrc
	
	echo "# These Comands was added by LEDA-AUTO-SEND" >> ~/.zshrc
	echo "alias leda='/home/$(whoami)/.local/bin/leda'" >> ~/.zshrc
	echo "# Finished the commands of LEDA-AUTO-SEND" >> ~/.zshrc
	echo "" >> ~/.zshrc
	source ~/.zshrc
	
	;;
esac
read -r -p "${1:-- Do you want to install LEDA-AUTO-SEND? [Yes/No]} " response
case "$response" in [yY][eE][sS]|[yY])
cd 
cd .local
mkdir bin
mkdir etc
cd etc
mkdir bin
cd
echo "- Now, let's configure the execution file..." 
	{
		pwd=$(pwd)
		user=$(whoami)
		read -r -p "${1:-- Digite sua matrícula? [Yes/No]} " matricula
		sed -i "s/matriculaUser/$matricula/g;" ../usr/leda.sh 	
	
		cp ~/LEDA-AUTO-SEND/usr/leda ~/.local/bin
		mv ~/LEDA-AUTO-SEND ~/.local/etc

	} || {
		echo
		echo "INSTALLATION FAILED: Something wrong has occurred!"
		installed=false
	}
	echo
	;;
esac

installed=true


if $installed ; then

	echo -e "- Thank's for install LEDA-AUTO-SEND, run 'leda' on terminal to start\n"
       source ~/.bashrc
       source ~/.zshrc
fi
