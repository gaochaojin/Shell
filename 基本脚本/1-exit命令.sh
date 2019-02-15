#!/bin/bash
#退出状态码，最大值为255，超过则进行模式运算
#$[]表示计算符号等价于$(())
var1=10
var2=20
var3=$[ $var1 + $var2 ]
echo The answer is $var3
exit 5