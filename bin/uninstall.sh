#!/bin/bash

read -r -p "${1:--Are you sure you want to uninstall LEDA-AUTO-SEND? [Yes/No]} " response
case "$response" in [yY][eE][sS]|[yY])
	{
		cd
		rm -fr ~/.local/bin/leda 
		rm -fr ~/.local/etc/LEDA-AUTO-SEND
		sed -i "s/# These Comands was added by AutoGIT//g;" ~/.bashrc
		sed -i "/atgit/d" ~/.bashrc
		sed -i "s/# Finished the commands of AutoGIT//g;" ~/.bashrc

		sed -i "s/# These Comands was added by AutoGIT//g;" ~/.zshrc
		sed -i "/atgit/d" ~/.zshrc
		sed -i "s/# Finished the commands of AutoGIT//g;" ~/.zshrc
		echo "- LEDA-AUTO-SEND was removed"
			
	} || {
		echo '\n\033[0;31m(FAIL)\033[0m Uninstall failed'
	}
esac

exit
