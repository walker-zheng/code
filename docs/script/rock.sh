#! /usr/bin/bash
#   by walker

VERSION='v0.0.4 by walker'
CURR_DIR=$(pwd)

### 待配置
BANKCODE=( 0401 0501 0901 1502 1601 1602 )                                          # 机构码 列表
MSI_DIR='/e/zmy/analyseServer/analyseServer/Release/msi'                            # 分析服务器 版本目录，会安装最新版本
TOMCAT='/d/xampp/tomcat/bin/startup.bat'                                            # tomcat启动脚本
CONFIG_FILE='/d/xampp/tomcat/webapps/iics/WEB-INF/classes/spring-hibernate.xml'     # 内控配置 修改 核心数据解析时间(03 02 01) 为 当前时间2min后
OLD_FILE='/d/2017-06-01.txt'                                                        # 核心数据 文件
sleep_time=120																		# 30sec等待			(tomcat完全启动)
parse_time=2																		# 2min后解析核心数据	(tomcat完全启动)
va_PORT=64000                                                                       # 算法 端口
notify_PORT=7900                                                                    # 分析服务器 监听端口(内控通知端口)
HEARTBEAT=30                                                                        # 心跳间隔
URL='http://192.168.1.31:8080/inforunws/service/rest'                               # 内控URL

### 以下 不要修改
MSI_FILE=$(cd $MSI_DIR && ls -t *.msi|sed -n '1p')                                  # 当前目录下 最新msi
SRC_DIR='/c/Program Files/Inforun/analyseServer'                                    # 分析服务器 安装目录
LOG_DIR='D:/Log'                                                                    # 分析服务器 日志目录
default_notify_PORT=7900															# 配置文件默认设置
default_va_PORT=64000																# 配置文件默认设置
redis_PORT=6379                                                                     # redis 端口

#############
function usage()
{
    cat <<EOF |GREP_COLOR='01;32' grep --color=always .
Usage:
    ./rock.sh [op] [file]
    分析服务器测试用自动脚本[卸载/安装/修改/克隆/部署/启动/停止/日志分析]
Op:
                无参数命令[-h -t -i]
    [file]      统计日志[file]
    -h          显示usage
    -V          版本信息
    -v          更新版本日志
    -vv         当前安装版本:analyseServer 
    -x          日志过滤
    -l          统计日志 (/d/log/*.rg.log)
    -e          统计日志错误
    -ll         监测日志统计 (/d/log/*.rg.log)
    -ls         监测处理速度 (cout/min)
    -le         监测日志错误
    -m [day]    修改配置(默认0,当天)
    -n [msg]    手动通知分析(模拟内控, msg默认222)
    -1          启动所有vaServer64
    -2          启动所有analyserServer64
    -s          停止tomcat
    -t          停止,修改,启动tomcat[-s -m -t]
    -k          杀死进程
    -i          卸载并安装,停止,克隆,启动[-i -k -c -r -p]
    -c          克隆副本 (mkcopy)
    -cc         显示克隆信息
    -r          [-1 -2]
    -p          已启动副本进程
EOF
}

function mkshow()
{
    echo -e "所有bankcode \t[${BANKCODE[*]}]"
    echo -e "bankCode\t算法端口\t内控通知端口\t日志路径"
    COUNT=0
    for arg in ${BANKCODE[*]}
    do
        (( COUNT += 1 ))
        echo -e $arg"\t\t"$(($va_PORT + $COUNT))"\t\t"$(($notify_PORT + $COUNT))"\t\t$LOG_DIR/$arg.rg.log"
    done
}
function mkcopy()
{
    [ -d $LOG_DIR ] || mkdir -p $LOG_DIR
    [ -d build ] || mkdir -p build
    echo -e "源目录:\t\t$SRC_DIR"
    echo -e "日志目录：\t$LOG_DIR"
    echo -e "心跳间隔：\t$HEARTBEAT""s"
    echo -e "内控地址：\t$URL"
    echo -e "所有bankcode \t[${BANKCODE[*]}]"
    echo -e "bankCode\t算法端口\t内控通知端口\t日志路径"

    [ -d build ] && rm -rf build/* || mkdir build
    COUNT=0
    for arg in ${BANKCODE[*]}
    do
        (( COUNT += 1 ))
        [ -d "$SRC_DIR" ] && cp -R "$SRC_DIR" build/$arg
        sed -i 's#\(.*\).path =.*#\1.path = '$LOG_DIR'/'$arg'.rg.log#'                                                  build/$arg/log_rg.properties
        sed -i 's#\(.*\).path =.*#\1.path = '$LOG_DIR'/'$arg'.va.log#'                                                  build/$arg/log_va.properties
        sed -i 's#<port>'$default_va_PORT'</port>#<port>'$(($va_PORT + $COUNT))'</port>#'                               build/$arg/vaServer.xml
        sed -i 's#<port>'$default_va_PORT'</port>#<port>'$(($va_PORT + $COUNT))'</port>#'                               build/$arg/analyseServer64.xml
        sed -i 's#<port>'$default_notify_PORT'</port>#<port>'$(($notify_PORT + $COUNT))'</port>#'                       build/$arg/analyseServer64.xml
        sed -i 's#<bankCode>.*</bankCode>#<bankCode>'$arg'</bankCode>#'                                                 build/$arg/analyseServer64.xml
        sed -i 's#<url>.*</url>#<url>'$URL'</url>#'                                                                     build/$arg/analyseServer64.xml
        sed -i 's#<heartBeatInterval>.*</heartBeatInterval>#<heartBeatInterval>'$HEARTBEAT'</heartBeatInterval>#gi'     build/$arg/analyseServer64.xml
        sed -i 's#<heartbeatInterval>.*</heartbeatInterval>#<heartbeatInterval>'$HEARTBEAT'</heartbeatInterval>#gi'     build/$arg/vaServer.xml

        echo -e $arg"\t\t"$(($va_PORT + $COUNT))"\t\t"$(($notify_PORT + $COUNT))"\t\t$LOG_DIR/$arg.rg.log"
    done
}
function modconfig()
{
    [ $# != 1 ] && exit
    TIME=$(date +%S" "%M" "%H --date="$parse_time minutes")
    TIME_ECHO=$(date +%X --date="$parse_time minutes")
    DATA_FILE="/d/"$(date -d "$1 day" +%Y-%m-%d)".txt"                                              # 生成新的核心数据
    echo '修改配置' $DATA_FILE|grep --color=always . && cp $OLD_FILE $DATA_FILE && sed -i 's#|\(2017/[^|]*\)#|'"$(date +%Y/%m/%d --date="$(($1-1)) day")"'#' $DATA_FILE && sed -n '1p' $DATA_FILE
    echo '修改配置' $CONFIG_FILE '核心数据解析时间:' $TIME_ECHO "("$parse_time "min之后)"|grep --color=always . && ([ -f ${CONFIG_FILE}.bak ] && [ $(grep -F 'property name="cronExpression" value="03 02 01' ${CONFIG_FILE}.bak|wc -l) == 1 ]) && (cp $CONFIG_FILE{.bak,} && sed -i 's#\(property name="cronExpression" value="\)\(03 02 01\)#\1'"$TIME"'#' $CONFIG_FILE )|| ( ([  -f ${CONFIG_FILE}.bak ] && rm -rf ${CONFIG_FILE}.bak)|( ISOK=$(grep -F 'property name="cronExpression" value="03 02 01' $CONFIG_FILE|wc -l) && [ $ISOK ==  0 ] && echo "脚本无法修改文件[$CONFIG_FILE]:检查到 核心数据解析时间不为 03 02 01" || cp $CONFIG_FILE{,.bak} && sed -i 's#\(property name="cronExpression" value="\)\(03 02 01\)#\1'"$TIME"'#' $CONFIG_FILE) )
    grep --color=always -n "$TIME" $CONFIG_FILE{,}|sort|uniq
}
function print_info()
{
    echo '已启动副本进程' | grep --color=always . && ps -ef |sort -k 6|grep --color=always 'build.*64'
    #   echo '通知监听端口' | grep --color=always . && echo $notify_PORT|sed -n 's#^\(..\).*#\1#p'|xargs.exe -i grep --color=always '\([[:digit:]]\{1,3\}\.\)\{3\}[[:digit:]]\{1,3\}:'{} <(netstat -abon|tr "\n\r" " "|sed 's#TCP#\nTCP#g')
    #   echo '算法服务端口' | grep --color=always . && echo $va_PORT|sed -n 's#^\(..\).*#\1#p'|xargs.exe -i grep --color=always '\([[:digit:]]\{1,3\}\.\)\{3\}[[:digit:]]\{1,3\}:'{} <(netstat -abon|tr "\n\r" " "|sed 's#TCP#\nTCP#g')
    #   echo 'redis服务端口' | grep --color=always . && echo $redis_PORT|xargs.exe -i grep --color=always '\([[:digit:]]\{1,3\}\.\)\{3\}[[:digit:]]\{1,3\}:'{} <(netstat -abon|tr "\n\r" " "|sed 's#TCP#\nTCP#g')
}
function notify()
{
    [ $# != 1 ] && exit
    COUNT_notify=0
    echo '手动通知分析' | grep --color=always .
    for arg in ${BANKCODE[*]}
    do
        (( COUNT_notify += 1 ))
        echo '{"messageType":"'$1'"}' localhost:"$(($notify_PORT + $COUNT_notify))"
        #echo '{"messageType":'$1'}'|nc localhost $(($notify_PORT + $COUNT_notify))
        echo '{"messageType":"'$1'"}'|socat - TCP:localhost:$(($notify_PORT + $COUNT_notify))
    done
}
function version()
{
    ( cd /e/zmy/analyseServer/analyseServer/Release && ./getVer.sh )
    ( cd /e/zmy/analyseServer/analyseServer/Release;
    ver_old=$(git tag|sort -rn|sed -n '1p'); ver_new=$(grep PRODUCT ../analyseServer/version.h|sed 's/[^"]*"//;s/"//'); 
    ( [ $ver_old != $ver_new ] && (( "0" == $(grep -c "$ver_new" 发布日志.md) )) ) && 
    (
    cp 发布日志.md{,.bak};
    new_log=$(echo "##### $ver_new [$(date +%Y-%m-%d)]" && git log "$ver_old".. --oneline |grep -v 'Merge'|grep -v $ver_new|sed 's/[^ ]* //;s/[0-9]*\. /\n/g'|grep -v '^$'|cat -n -|sed 's/^\([ 0-9]*\)\(.*\)/\1.\2/;s/\t/ /g')
    echo "$new_log"
    cat  <(cat 发布日志.md|sed -n '1,2p') <(echo "$new_log") <(cat 发布日志.md|sed -n '3,$p') > 发布日志.md.bak; 
    mv 发布日志.md{.bak,}) ||
        (echo 没有增加版本号 $ver_new|GREP_COLOR='03;36' grep --color=always .) )
}
function loop()
{
    while true; do $0 $1;echo "========================================="|GREP_COLOR='03;36' grep --color=always .; sleep 3;done
}
[ $# == 0 ] && $0 -h -t && (echo "等待tomcat完全启动("$sleep_time" sec)"| grep --color=always . && sleep $sleep_time)  && $0 -i && exit

until [ -z "$1" ]
do
    [ -f "$1" ] && (echo '日志统计' $1|GREP_COLOR='01;32' grep --color=always . && grep -E 'waiting|推送|数据|上传|缓存|任务|报警|计划|\[设备\]' "$1"|awk -F# '{print $2}'|sort|uniq -c|grep --color=always -E 'waiting|推送|数据|上传|缓存|任务|报警|计划|\[设备\]' && grep  '\[E\]' "$1"|awk -F# '{print $2}'|sort|uniq -c|GREP_COLOR='01;33' grep --color=always -E .)
    
    [ "$1" == "-ll" ] && (echo '监测日志统计'|grep --color=always . && loop -l)
    [ "$1" == "-le" ] && (echo '监测日志错误' | grep --color=always . && loop -e)
    [ "$1" == "-ls" ] && (echo '监测处理速度' "count/min(SMsgVATaskEndNotify)"|grep --color=always . && loop --stat)
    [ "$1" == "-cc" ] && (echo '显示克隆信息' | grep --color=always . && mkshow)
    [ "$1" == "-vv" ] && (echo '当前安装版本:analyseServer['$(reg query "HKLM\SOFTWARE\Inforun\analyseServer"|grep Version|awk '{print $3}')"]" | grep --color=always .)

    [ "$1" == "-v" ] && version
    [ "$1" == "-t" ] && ($0 -s && $0 -m && echo "启动tomcat"| grep --color=always . && $TOMCAT)
    [ "$1" == "-i" ] && (echo '卸载并安装['$MSI_DIR"/"$MSI_FILE']'| grep --color=always . && (msiexec.exe -q -x $(reg query "HKLM\SOFTWARE\Inforun\analyseServer"|grep ProductCode|awk '{print $3}') &> /dev/null );(cd $MSI_DIR && msiexec.exe -q -i $MSI_FILE) ;$0 -k -c -r -p)
    [ "$1" == "-x" ] && [ $# == 2 ] && (echo '过滤:' $2| grep --color=always . && WORD=$(echo $2|sed 's/\[/\\\[/g;s/\]/\\\]/g;s/\+/\\\+/g') && (for line in /d/log/*.rg.log; do echo $line|grep --color=always .;grep --color=always -E ''"$WORD"'' $line|awk -F# '{print $2}'|sort|uniq -c;done;))

    [ "$1" == "-l" ] && ($0 /d/log/*.rg.log)
    [ "$1" == "--stat" ] && (for line in /d/log/*.rg.log; do echo -e $line|grep --color=always . ;time=$(grep -E '消息 处理\[任务\]\[struct SMsgVATaskEndNotify' $line|sed -n '1p;$p'|sed 's/\]\[.*$//g;s/\[//g'|xargs.exe -i date --date='{}' +%s|tr "\n" "-"|sed 's/^/(0-(/;s#-$#))#;s/$/\n/'|bc);count=$(grep -cE '消息 处理\[任务\]\[struct SMsgVATaskEndNotify' $line);speed=$(echo "("$count"-1)*60/"$time|bc);echo "("$count"-1)*60/"$time"="$speed;done;)
    [ "$1" == "-e" ] && (grep --color=always -n '\[E\]' /d/log/*.rg.log|awk -F[#:] '{print $1"#"$6}'|sort|uniq -c| GREP_COLOR='01;32' grep --color=always '#.*';)
    [ "$1" == "-n" ] && ([ $# == 2 ] && notify $2 || notify 222)
    [ "$1" == "-m" ] && ([ $# == 2 ] && modconfig $2 || modconfig 0)
    [ "$1" == "-h" ] && usage
    [ "$1" == "-V" ] && (echo -e 'rock' $VERSION | GREP_COLOR='01;36' grep --color=always .)
    [ "$1" == "-p" ] && print_info

    [ "$1" == "-s" ] && (echo '停止tomcat' | grep --color=always . && eval $(tasklist.exe |grep -ia 'java.exe'|awk '{print "-PID "$2}'|tr "\n" " " |xargs.exe -i echo {}|sed 's/^/taskkill -F /'))
    [ "$1" == "-k" ] &&  $0 -k1 -k2
    [ "$1" == "-k1" ] && (echo '杀死进程[vaServer64]'| grep --color=always . && eval $(tasklist.exe |grep -ia vaServer64.exe|awk '{print "-PID "$2}'|tr "\n" " " |xargs.exe -i echo {}|sed 's/^/taskkill -F /'))
    [ "$1" == "-k2" ] && (echo '杀死进程[analyserServer64]'| grep --color=always . && eval $(tasklist.exe |grep -ia analyseServer64.exe|awk '{print "-PID "$2}'|tr "\n" " " |xargs.exe -i echo {}|sed 's/^/taskkill -F /'))
    [ "$1" == "-c" ] && (echo '克隆副本' | grep --color=always . && mkcopy)
    [ "$1" == "-r" ] && ($0 -1; echo '等待启动 5 sec'|grep --color=always . && sleep 5; $0 -2)
    [ "$1" == "-1" ] && (echo '启动所有vaServer64' | grep --color=always . && eval $(find . -name 'vaServer64.exe'|sed 's#/[^/]*$##;s/\.//;s#^#(cd '\'"$CURR_DIR"\''#g;s#$# \&\& ./vaServer64.exe \&> /dev/null \&)#'|tr "\n" " "|sed 's#) (#) \&\& (#g') )
    [ "$1" == "-2" ] && (echo '启动所有analyserServer64' | grep --color=always . && eval $(find . -name 'analyseServer64.exe'|sed 's#/[^/]*$##;s/\.//;s#^#(cd '\'"$CURR_DIR"\''#g;s#$# \&\& ./analyseServer64.exe \&> /dev/null \&)#'|tr "\n" " "|sed 's#) (#) \&\& (#g'))

    shift
done

