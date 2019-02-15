#### linux命令--系统管理

##### 常用工具命令

- ls cd pwd

- mkdir

  ```shell
  mkdir [option] dirname     #创建目录
  mkdir -m 777 test          #创建目录的同时设置权限，没人呢权限时755
  mkdir -p p1/p2             #创建多级目录
  ```

- touch

  ```shell
  touch a.txt                #修改文件创建时间或以当前系统时间创建空文件
  ```

- cp mv rm cat

- which

  ```shell
  which touch                #显示应用程序文件的位置
  ```

- whereis

  ```shell
  whereis touch              #显示指定命令或文件的帮助信息
  ```

- grep

  ```shell
  rpm -qa | grep vim         #从一个文件中找出匹配指定关键字的行，并输出
  ```

- gzip

  ```shell
  gzip a.txt                 #文件压缩 a.txt.gz
  gzip -d a.txt.gz           #文件解压 a/txt
  ```

- find

  ```shell
  find . -name "*.txt"      #查找当前目录及其子目录下的txt问价
  ```

- tar

  ```shell
  tar -zcvf test.tar.gz test  #压缩为tar.gz包 tar为打包，-z为gzip压缩
  tar -zxvf test.tar.gz       #解压
  ```

- xargs

  ```shell
  cat file.txt | xargs        #多行输入单行输出
  cat file.txt | xargs -n3    #将每一行再分为3行输出
  ```

- awk

