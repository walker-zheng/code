#! /usr/bin/bash

[ $# == 1 ] &&  pushd . && cd "$1"
# set -x
ls -d */|while read line
do 
    echo $line;
    cd "$line";
    cc_COUNT=$(grep -E '\[E\]\[HttpService\]' log* 2> /dev/null|wc -l)
    (("$cc_COUNT" > "0")) 2> /dev/null && echo -e "\t内控连接异常次数\t\t" $cc_COUNT|grep --color=always .;
    up_alarm_COUNT=$(grep '数据上传 .*Alarm' log* 2> /dev/null|wc -l)
    (("$up_alarm_COUNT" > "0")) 2> /dev/null && echo -e "\t数据上传 Alarm\t\t\t" $up_alarm_COUNT|grep --color=always .;
    up_falied_COUNT=$(grep '数据上传 .*Failed' log* 2> /dev/null|wc -l)
    (("$up_falied_COUNT" > "0")) 2> /dev/null && echo -e "\t数据上传 Failed\t\t\t" $up_falied_COUNT|grep --color=always .;
    has_file=$(grep 分析服务器 * 2> /dev/null|grep -v v1.2.69|awk -F: '{print $1}') 
    [[ -e "$has_file" ]] && echo "修改时间在["$has_file"]之前的为旧版本文件"|grep --color=always .;
    COUNT=$(cat failed* 2> /dev/null |sed 's/\(bussinessId\)/\n\1/g' |grep -c bussinessId); 
    (("$COUNT" > "0")) && echo -e "\t核心数据失败数\t\t\t" $COUNT|grep --color=always .;
    all_COUNT=$(grep 'businessList":\[{' log* 2> /dev/null |sed 's/\(bussinessId\)/\n\1/g' |grep -c bussinessId);
    (("$all_COUNT" > "0")) && echo -e "\t核心数据总数\t\t\t" $all_COUNT|grep --color=always .;
    err_COUNT=$(cat log* 2> /dev/null |awk -F# '{print $2}'|grep -c 用户配置错误); 
    (("$err_COUNT" > "0")) && echo -e "\t用户配置错误\t\t\t" $err_COUNT|grep --color=always .;
    t1_COUNT=$(grep '任务 创建\[T+1\]' log* 2> /dev/null|wc -l); 
    (("$t1_COUNT" > "0")) && echo -e "\t任务 创建[T+1]\t\t\t" $t1_COUNT|grep --color=always .;
    t0_COUNT=$(grep '任务 创建\[T+0\]' log* 2> /dev/null|wc -l); 
    (("$t0_COUNT" > "0")) && echo -e "\t任务 创建[T+0]\t\t\t" $t0_COUNT|grep --color=always .;
    failed_COUNT=$(grep '消息 处理\[任务\]' log* 2> /dev/null|grep -c 'SMsgVATaskExecFailNotify'); 
    (("$failed_COUNT" > "50")) && echo -e "\tSMsgVATaskExecFailNotify > 50\t" $failed_COUNT|grep --color=always .;
    cd ..
done
