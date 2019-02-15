#!/bin/bash

file="state"

#更改字段分隔符，使其只能识别换行符
IFS=$'\n'

for state in `cat $file`
do
	echo "visit beautiful $state"
done