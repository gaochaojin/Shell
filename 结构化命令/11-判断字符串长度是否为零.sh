#!/bin/bash

#-n 判断长度是否非零
#-z 判断长度是否为零

var1=testing
var2=''

if [ -n "$var1" ]
then
	echo "The String $var1 is not enpty"
else
	echo "The String $var1 is enpty"
fi

if [ -z "$var2" ]
then
	echo "The String $var2 is enpty"
else
	echo "The String $var2 is not enpty"
fi

if [ -z "$var3" ]
then
	echo "The String $var3 is enpty"
else
	echo "The String $var3 is not enpty"
fi


