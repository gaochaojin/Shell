#!/bin/bash
#使用反引号当做命令执行，也可以使用$()来替代
date1=`date`
date2=$(date)
echo "the date and time are:$date1  $date2"