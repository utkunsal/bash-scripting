#!/bin/bash

for file in $1*.log
do
	tar -czvf $file.tar.gz $file
done
