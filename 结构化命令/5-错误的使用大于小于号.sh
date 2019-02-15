#!/bin/bash
#大于小于号必须转义，否则shell会将他们当做重定向符号而把自渡船值当做文件名处理

var1=baseball
var2=hockey

if [ $var1 > $var2 ]
then
	echo "$var1 is greater than $var2"
else
	echo "$var1 is less than $var2"
fi