#!/bin/bash

logfile=log/updater.log
errorlog=log/updater_errors.log

checkerror(){
	if [ $? -ne 0 ]; then
		echo "An error occurred, please check the $errorlog file."
		exit 1
	fi
}

if [ -d /etc/pacman.d ]; then
	# The host is based on Arch, run the pacman update command
	sudo pacman -Syu >>$logfile 2>>$errorlog
	checkerror
elif [ -d /etc/apt ]; then
	# The host is based on Debian or Ubuntu,
	# Run the apt version of the update command
	sudo apt update >>$logfile 2>>$errorlog
	checkerror
	sudo apt dist-upgrade -y >>$logfile 2>>$errorlog
	checkerror 
elif [ $(uname) = Darwin ]; then
	if [ -d /opt/homebrew ]; then
		# Homebrew is installed on macOS
		# Run the brew version of the update command
		brew update >>$logfile 2>>$errorlog
		checkerror
		brew upgrade >>$logfile 2>>$errorlog
		checkerror
	else
		echo Homebrew is not installed on macOS.
	fi
else
	echo Unsupported package manager or host.
fi
