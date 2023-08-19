#!/opt/homebrew/bin/bash  # Using updated bash because "${1,,}" does not work with /bin/bash version

if [ ${1,,} = utku ]; then
	echo "Welcome!!"
elif [ ${1,,} = help ]; then
	echo "Enter your username"
else
	echo "Worng username!!"
fi
