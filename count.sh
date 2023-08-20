#!/bin/bash

if [ $# -gt 1 ]; then
	echo "Too many arguments."
	exit 1
fi

lines=$(ls -l $1 | wc -l)

echo "You have $(($lines-1)) objects in the ${1:-current} directory."
