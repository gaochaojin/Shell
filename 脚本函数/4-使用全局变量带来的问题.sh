#!/bin/bash

# 演示全局变量带来的问题

function func1 {
	temp=$[ $value +5 ]
	result=$[ $temp * 2 ]
}

temp=4
value=6

func1
echo "The result is $result"

if [ $temp -gt $value ]
then 
	echo "Temp is larger"
else
	echo "Temp is smaller"
fi