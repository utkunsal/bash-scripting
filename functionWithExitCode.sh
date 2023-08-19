#!/opt/homebrew/bin/bash

namecheck(){
	if [ ${1,,} = utku ]; then
		echo Welcome Utku!!
		return 0
	else
		echo Who are you??
		return 1
	fi
}
namecheck $1
if [ $? = 1 ]; then
	echo Someone unknown called the function!!
	exit 1
	echo You won't see this
else
	exit 0
	echo You won't see this too
fi
