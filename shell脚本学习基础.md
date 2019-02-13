#### Shell脚本学习基础：

1. #### 查看当前Linux系统的可用Shell

   ```shell
   cat /etc/shells
   ```

2. ##### 查看当前默认Shell

   ```shell
    echo $SHELL
   ```

3. ##### 查看系统中Bash Shell的版本

   ```shell
   bash --version       #第一种方式
   echo $BASH_VERSION   #第二种方式
   ```

4. ##### 第一个shell脚本test.sh

   ```shell
   #!/bin/bash  #其中#!为约定标记，表名为shell，/bin/bash指明了解释器的具体位置
   echo "hello world!"  #echo为标准输出
   ```

5. ##### 执行shell脚本的方法

   - 给test.sh脚本增加执行权限

     ```shell
     chmod +x test.sh
     ./test.sh
     ```

   - 使用点号"."

     ```shell
     . ./test.sh
     ```

   - 使用source命令

     ```shell
     source test.sh
     ```

6. ##### Shell变量

   - 定义变量：=周围不能有空格

     ```shell
     variable=value      #value不包含任务空白符
     variable='value'    #单引号中是什么就输出什么
     variable="value"    #输出时下解析里面的变量和命令
     ```

   - 使用变量：在变量前加美元符号$

     ```shell
     author="gaochaojin"
     echo $author      #
     echo ${author}    #推荐使用
     ```

   - 将命令的结果赋值给变量

     ```shell
     variable= `command`  #使用反引号
     variable=$(command)  #推荐使用
     ```

   - 只读变量：readonly

     ```shell
     author="gaochaojin"
     readonly author
     ```

   - 删除变量：unset

     ```shell
     author="gaochaojin"
     unset author         # unset不能删除只读变量
     ```

7. ##### 变量作用域

   - 全局变量：当前的Shell会话，而不是当前的Shell脚本文件

   - 局部变量：需要加上local命令，才能变为局部变量

     ```shell
     #定义函数
     function func(){
         local a=99
     }
     #调用函数
     func
     #输出函数内部的变量
     echo $a    #结果为空
     ```

   - 环境变量：使用export命令将变量导出，在其所有的子Shell中就有效了

     ```shell
     a=22        #定义一个变量
     echo $a     #在当前Shell中输出a，值为22
     bash        #进入子Shell
     echo $a     #在子Shell中输出a，失败
     exit        #退出ziShell
     export a    #将a导出为环境变量
     bash        #进入子Shell
     echo $a     #在当前Shell中输出a，值为22
     ```

8. ##### Shell命令替换

   ```shell
   #!/bin/bash
   
   LSL=$(ls -l)
   echo $LSL         #不使用双引号包围（格式会乱）
   echo "--------"   #输出分隔符
   echo "$LSL"       #使用双引号包围（格式不会乱，建议使用）
   ```

9. ##### 获取字符串长度

   ```shell
   #!/bin/bash
   str="http://wwww.baidu.com"
   echo ${#str}             #${#str}获取字符串长度 
   ```

10. ##### Shell字符串截取

    - 从指定位置开始截取--从字符串左边开始计数${str:start:length}（start从0开始计数）

      ```shell
      #!/bin/bash
      url="http://www.baidu.com/index.html"
      echo ${url:7:13}  #www.baidu.com
      ```

    - 从指定位置开始截取--从字符串右边开始计数${str:0-start:length}（start从1开始计数）

      ```shell
      #!/bin/bash
      url="http://www.baidu.com/index.html"
      echo ${url:0-24:13} #www.baidu.com
      ```

    - 从指定字符（子字符串）开始截取--使用#号截取右边字符${str#*chars}

      ```shell
      #!/bin/bash
      url="http://www.baidu.com/index.html"
      echo ${url#*/}   #匹配第一个/   #/www.baidu.com/index.html
      echo ${url##*/}  #匹配最后一个/ #index.html
      ```

    - 从指定字符（子字符串）开始截取--使用%号截取左边字符${str%chars*}

      ```shell
      #!/bin/bash
      url="http://www.baidu.com/index.html"
      echo ${url%/*}    #匹配第一个/   #http://www.baidu.com
      echo ${url%%/*}   #匹配最后一个/ #http:
      ```

11. ##### Shell数组定义以及获取数组元素

    ```shell
    #!/bin/bash
    
    nums=(29 100 13 8 91 44)  #数组的定义
    echo ${nums[@]}           #输出所有数组元素
    
    nums[10]=66               #给第10个元素赋值（会增加数组长度）
    echo ${nums[*]}           #输出所有数组元素
    echo ${nums[4]}           #输出第4个元素
    ```

12. ##### Shell获取数组长度

    ```shell
    #!/bin/bash
    
    nums=(29 100 13 8 91 44)  #数组的定义
    echo ${#nums[@]}          #获取数组长度
    echo ${#nums[*]}          #获取数组长度
    ```

13. ##### 数组拼接合并

    ```shell
    #!/bin/bash
    
    array1=(23 56)
    array2=(99 "http://www.baidu.com")
    array_new=(${array1[@]} ${array2[@]}) #数组拼接
    echo ${array_new[@]}
    ```

14. ##### 删除数组元素

    ```shell
    unset array_new[1]    #删除数组中的第1个元素
    echo ${array_new[@]}
    
    unset array_new       #删除整个数组
    echo ${array_new[@]}
    ```

15. ##### shell内建命令

    使用type来确定一个命令是否为内建命令：

    ```shell
    type cd          #cd is a shell builtin    (内建命令)
    type ifconfig    #ifconfig is /usr/sbin/ifconfig
    ```

    | bash    | :       | .      | [       | alias    | bg       | bind     |
    | ------- | ------- | ------ | ------- | -------- | -------- | -------- |
    | break   | builtin | cd     | command | compgen  | complete | continue |
    | declare | dirs    | disown | echo    | enable   | eval     | exec     |
    | exit    | export  | fc     | fg      | getopts  | hash     | help     |
    | history | jobs    | kill   | let     | local    | logout   | popd     |
    | printf  | pushd   | pwd    | read    | readonly | return   | set      |
    | shift   | shopt   | source | suspend | test     | times    | trap     |
    | type    | typeset | ulimit | umask   | unalias  | unset    | wait     |



