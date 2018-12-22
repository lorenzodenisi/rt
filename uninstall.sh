#!/bin/bash


echo Uninstalling rm...

echo This program requires superuser permissions

echo Removing rt from /usr/bin/rt
sudo "/usr/bin/rm" "/usr/bin/rt"

if [ $? -ne 0 ]; then
	echo "Unable to remove rt! (Maybe rt in not installed)"
	exit 0
fi

echo Removing eventual alias...
grep -v "alias rm=rt\|\# alias created by rm install script" "/home/$USER/.bashrc" > tmp
cat tmp > "/home/$USER/.bashrc" 

/usr/bin/rm tmp

source "/home/$USER/.bashrc"
bash

echo Uninstall complete


exit 0
