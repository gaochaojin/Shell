#!/bin/bash
#bashshell仅能处理浮点数值，test命令无法处理vall变量中存储的浮点值

vall=`echo "scale=4; 10 / 3" | bc`
echo "The test value is $vall"
if [ $vall -gt 3 ]
then
	echo "The result is larger than 3"
fi
