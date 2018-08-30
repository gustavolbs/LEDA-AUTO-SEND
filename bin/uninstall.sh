#!/bin/bash

read -r -p "${1:--Are you sure you want to uninstall LEDA-AUTO-SEND? [Yes/No]} " response
case "$response" in [yY][eE][sS]|[yY])
	{
		pwd=$(pwd)
		user=$(whoami)
		
		cd
		rm -fr ~/.local/bin/leda 
		rm -fr ~/.local/etc/LEDA-AUTO-SEND
		echo "- LEDA-AUTO-SEND was removed"
			
	} || {
		echo '\n\033[0;31m(FAIL)\033[0m Uninstall failed'
	}
esac

