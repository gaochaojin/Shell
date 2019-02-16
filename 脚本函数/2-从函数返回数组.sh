#!/bin/bash

# returning an array value

function arrayblr {
	local oriarray
	local newarray
	local elements
	local i
	oriarray=(`echo "$@"`)
	newarray=(`echo "$@"`)
	elements=$[ $# -1 ]
	for ((i=0; i<$elements; i++))
	do
		newarray[$i]=$[ ${oriarray[$i]} * 2 ]
	done
	echo ${newarray[*]}
}

myarray=(1 2 3 4 5)
echo "The original array is : ${myarray[*]}"
arg1=`echo ${myarray[*]}`
result=(`arrayblr $arg1`)
echo "The new array is : ${result[*]}"