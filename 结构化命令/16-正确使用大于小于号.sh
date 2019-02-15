#!/bin/bash

#正确使用大于小于号
var1=baseball
var2=hockey

if [ $var1 \> $var2 ]
then
	echo "$var1 is greater than $var2"
else
	echo "$var1 is less than $var2"
fi