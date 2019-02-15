#!/bin/bash

#redirecting the for output to a file
for file in /opt/shell/*
do
	if [ -d "file" ]
	then
		echo "$file is a directory"
	else
		echo "$file is a file"
	fi
done > output.txt


#piping a loop to another command
for state in "North Dakota" Connecticut
do
	echo "$state is next place to go"
done | sort
echo "The completes our travels"