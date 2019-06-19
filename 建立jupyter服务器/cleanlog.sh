#!/bin/bash
# Author: [用户名]
# Last Update: 2018.11.16
# nohup jupyter lab > /home/[用户名]/.jupyter/lab.out & (不执行这条，所以一下do_split1相关可以注释掉)
# nohup jupyter notebook > /home/[用户名]/.jupyter/notebook.out & （只执行这条可以同时启动notebook和lab）
# Description: lab.out notebook.out 日志分割

this_path=$(cd `dirname $0`;pwd)   #根据脚本所在路径
current_date=`date -d "-1 day" "+%Y%m%d"`   #列出时间
cd $this_path
echo $this_path
echo $current_date

# do_split1 () {
#     [ ! -d `echo $this_path`/logs ] && mkdir -p `echo $this_path`/logs
#     split -b 10m -d -a 4 `echo $this_path`/lab.out   `echo $this_path`/logs/lab-${current_date}  #切分10兆每块至logs文件中，格式为：lab-xxxxxxxxxx
#     if [ $? -eq 0 ];then
#         echo "Split is finished!"
#     else
#         echo "Split is Failed!"
#         exit 1
#     fi
# }

do_split2 () {
    [ ! -d `echo $this_path`/logs ] && mkdir -p `echo $this_path`/logs
    split -b 10m -d -a 4 `echo $this_path`/notebook.out   `echo $this_path`/logs/notebook-${current_date}  #切分10兆每块至logs文件中，格式
为：notebook-xxxxxxxxxx
    if [ $? -eq 0 ];then
        echo "Split is finished!"
    else
        echo "Split is Failed!"
        exit 1
    fi
}

# do_del_log1() {
#     find `echo $this_path`/logs -type f -ctime +7 | xargs rm -rf #清理7天前创建的日志
#     cat /dev/null > `echo $this_path`/lab.out #清空当前目录的lab.out文件
# }

do_del_log2() {
    find `echo $this_path`/logs -type f -ctime +7 | xargs rm -rf #清理7天前创建的日志
    cat /dev/null > `echo $this_path`/notebook.out #清空当前目录的notebook.out文件
}

# if do_split1 ;then
#     do_del_log1
#     echo "lab is split Success"
# else
#     echo "lab is split Failure"
#     exit 2
# fi

if do_split2 ;then
    do_del_log2
    echo "notebook is split Success"
else
    echo "notebook is split Failure"
    exit 2
fi

# crontab -e 添加定时任务:每周第一天的1点执行一次
#0 1 * * */1 /home/[用户名]/.jupyter/clearNohup.sh &>/dev/null