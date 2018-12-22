#!/bin/bash

echo Installing rt...
echo This script requires superuser permissions
sudo cp "./rt" "/usr/bin"
echo "rt script copied to /usr/bin/rt
"

echo "Do you want to make rm an alias for rt?
That means that every rm command will be substituted with rt, to run rm you will need to type '\rm'
"
read -p "[Y/n] " answer

while [ "$answer" != "Y" ] && [ "$answer" != "y" ] && [ "$answer" != "N" ] && [ "$answer" != "n" ] && [ "$answer" != "" ]; do
	
	read -p "Type 'Y' or 'N' (not case sensitive) [Y/n] " answer
	
done

if [ "$answer" == "N" ] || [ "$answer" == "n" ]; then
	echo Alias NOT created!
	echo "rm installed successfully
"
	echo MANUAL
	rt --help

	exit 0
fi

echo "
# alias created by rm install script
alias rm=rt
" >> "/home/$USER/.bashrc"

echo Alias created!
echo "To remove it, open ./bashrc file in your home directory and remove the line below the comment '#alias created by rm install script'
"
echo "Sourcing /home/$USER/.bashrc..."
source "/home/$USER/.bashrc"
bash

echo "rm installed successfully
"

echo MANUAL

rt --help

exit 0
