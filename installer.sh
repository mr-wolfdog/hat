#!/usr/bin/env bash

#This is a script designed to install the HAT tool and some of its dependencies

echo "Welcome to the Honeypot Administration Tool (HAT) installer!"

#Make sure that the user has their own bin directory
if ! [ -d "$HOME/bin/" ]
then
	mkdir "$HOME"/bin/
fi

#If this installer script was run as root, copy the scripts into /usr/local/bin/ for use by sudo; if not, let the user know.
if [ "$EUID" -ne 0 ]
then
	echo "To make this script easily-accessible to root, please run this script as root."
else
	#Ensure that /usr/local/bin/ exists (you never know if it is a weird distro)
	if [ -d "/usr/local/bin/" ]
	then
		find . -type f -not -name "installer.sh" -exec cp {} /usr/local/bin/ +
	fi
fi

#Move the script files into the user's bin directory
find . -type f -not -name "installer.sh" -exec cp {} ~/bin/ +

#Begin by cloning the GitHub page for the VirusTotal API that will be used
git clone http://github.com/doomedraven/VirusTotalApi

cd VirusTotalApi/ || exit
./setup.py
pip3 install -r requirements.txt

#Copy vt.py, the necessary script, into the user's bin
cp vt/vt.py "$HOME"/bin/vt.py
cp vt/vt.py /usr/local/bin/vt.py

#Move back to the installer's directory
cd ..

echo "Try out the scripts now and see if they work! Enjoy malware catching!"
