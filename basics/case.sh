#!/opt/homebrew/bin/bash

case ${1,,} in
	utku | utkunsal | utku.unsal | admin)
		echo "Welcome!!"
		;;
	help)
		echo "Enter your username"
		;;
	*)
		echo "Invalid username!!"
esac
