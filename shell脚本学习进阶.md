#### shell脚本学习进阶

1. ##### if条件语句

   ```shell
   #!/bin/bash
   
   #单分支语句
   if [ -f /etc/hosts ];then
     echo "hosts exist"
   fi
   
   #双分支语句
   if [ -f /etc/host ]; then
     echo "file exists"
   else
     echo "file not exists"
   fi
   
   #多分支语句
   if [ -f /etc/hosts ]; then
     echo "file exists"
   elif [ -f /etc/host ]; then
     echo "host exists"
   fi
   ```

2. ##### case条件结构语句

   ```shell
   #!/bin/bash
   
   cat<<EOF
   1.first case
   2.second case
   3.third case
   4.four case
   EOF
   
   read -p 'please write:' num
   
   case $num in
     1)
     echo "first case"
     ;;
     2)
      echo "second case"
     ;;
     3)
     echo "third case"
     ;;
     4)
     echo "four case"
     ;;
     *)
     echo "write error!"
   esac
   ```

3. ##### linux中产生随机数的方法

   ```shell
   echo $RANDOM
   ```

4. ##### windows下编写的shell脚本在linux下运行

   ```shell
   yum -y install dos2unix     #安装dos2unix命令
   dos2unix dos2unix.sh        #转换格式（方式一）
   
   :set ff                     #查看脚本编码格式 dos
   :set ff=unix                #设置编码格式为unix（方式二）
   ```

5. ##### shell脚本排错技巧

   ```shell
   bash -x doc2unix.sh        # -x 开启脚本调试模式
   sh -x doc2unix.sh          
   
   cat -A doc2unix.sh         # -A 查看文件的隐藏字符
   ```

6. ##### shell脚本段注释方法

   ```shell
   <<EOF
     内容
    EOF
   ```

7. ##### for循环语句

   - 列表for循环

     ```
     #!/bin/bash
     
     nums=(1 2 3 4)
     for i in ${nums[@]}
     do
       echo $i
     done
     ```

   - 不带列表for循环

     ```shell
     #!/bin/bash
     
     echo "baidu website:"
     for i
         do
         echo "$i"
         done
     
     bash for.sh http://www.baidu.com  # 执行命令
     ```

   - 类似C语言的风格

     ```shell
     #!/bin/bash
     
     for((i=0;i<=3;i++))
       do
         echo $i
     done
     ```

8. ##### while循环语句

   ```shell
   #!/bin/bash
   
   i=1
   while [ "$i" -le 100 ]
     do
     ((b=b+1))
     ((i++))
   done
   
   echo $b  #5150 计算1-100的和
   ```

9. ##### 获取文件中的行，单词和字符

   - 迭代获取文件中的每一行

     ```shell
     #!/bin/bash
     
     #方法一
     while read line;
       do
         echo $line;
     done < file.txt
     
     #方法二
     cat file.txt|while read line
       do
         echo $line
     done
     
     #方法三
     exec < file.txt
     while read line;
       do
         echo $line;
     done;
     ```

   - 迭代获取每一个单词

     ```shell
     #!/bin/bash
     
     while read line;
       do
         for word in $line;
           do
             echo $word;
           done
     done < file.txt
     ```

   - 迭代获取每一个字符

     ```shell
     #!/bin/bash
     
     word=participate
     for ((i=0;i<${#word};i++))
       do
         echo ${word:i:1}
     done
     ```

10. ##### break continue exit return

    - break           跳出循环

      ```shell
      #!/bin/bash
      
      for i in {1..5}
        do
         if [ $i -eq 3 ]
           then
             break
         fi
         echo $i
      done
      
      echo "ok"
      ```

    - continue     跳出本次循环

      ```shell
      #!/bin/bash
      
      for i in {1..5}
        do
         if [ $i -eq 3 ]
           then
             continue
         fi
         echo $i
      done
      
      echo "ok"
      ```

    - exit               退出脚本

      ```shell
      #!/bin/bash
      
      for i in {1..5}
        do
         if [ $i -eq 3 ]
           then
             exit
         fi
         echo $i
      done
      
      echo "ok"
      ```

    - return          与exit相同，在函数中使用