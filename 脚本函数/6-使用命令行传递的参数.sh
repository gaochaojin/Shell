#!/bin/bash

#使用命令行中传递的参数

function db1 {
	# $1 $2 不能从命令行中传递，只能调用函数时手动传递
	echo $[ $1 * $2 ]
}

if [ $# -eq 2 ]
then 
	value=`db1 $1 $2`
	echo "The result is $value"
else
	echo "Usage: badtest1 a b"
fi