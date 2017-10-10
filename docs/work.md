# 命令

## 新版本更新注意

1. 配置文件格式变化，测试需根据旧配置修改，见图片注释
2. 内控配置中json库改为 jsonProvider2

## 匹配中文

* \[\u4e00-\u9fa5\]
* shell单行\(部分需要管理员权限\)

## redis

* 查看 核心数据总数 和 已完成数
  * `for code in 0401 0501 0901 1502 1601 1602;do echo "   "$code":";redis-cli scard $code":data:done:";redis-cli scard $code":data:all:";done`
* 统计 key 个数
  * `time redis-cli keys *|sed 's,:[^:]*$,:,'|sort|uniq -c`
* 统计 set 个数
  * `redis-cli keys *|sed 's,:[^:]*$,:,'|sort|uniq -c|grep ':data:'|awk '{print $2}'|xargs -i redis-cli scard {}`

## webapi test

* `curl -l -H "Content-type: application/json" -X POST -d @./json_body.json http://192.168.1.31:8080/iics/service/rest/alarm/uploadFailedNotifyResult`

## 生成 emoji list

* `echo "### gogs emoji list" >README.md`
* `LINE="";COUNT=0;ls gogs/img/emoji/*|sed 's/gogs\/img\/emoji\/\(.*\)\.\(.*\)/![\1](gogs\/img\/emoji\/\1.\2) :\1:/'|while read line;do (( COUNT+=1 )); (( ! (COUNT % 8) )) && { echo " - $LINE" ; LINE=""; } || { LINE="$LINE $line"; };done >> README.md`

## kill进程

* `eval $(tasklist.exe |grep -ia er64.exe|awk '{print "-PID "$2}'|tr "\n" " " |xargs.exe -i echo {}|sed 's/^/taskkill /')`
* `eval $(tasklist.exe |grep -ia er64.exe|grep analyseServer|awk '{print "-PID "$2}'|tr "\n" " " |xargs.exe -i echo {}|sed 's/^/taskkill /')`

## 卸载并安装

* `msiexec.exe -q -x $(reg query "HKLM\SOFTWARE\Inforun\analyseServer"|grep ProductCode|awk '{print $3}') ; (cd /e/zmy/analyseServer/analyseServer/Release/msi && ls -t *.msi|sed -n '1p'|xargs -i msiexec.exe -q -i {})`

## 启动程序

* `eval $(find . -name '*64.exe'|grep vaS|sed 's#/vaS.*##g;s#\./#/#g;s#^#(cd /e/zmy/analyseServer/analyseServer/analyseServer/tools#g;s#$# \&\& ./vaServer64.exe \& >\& /dev/null)#'|tr "\n" " "|sed 's#) (#) \&\& (#g')`
* `eval $(find . -name '*64.exe'|grep analy|sed 's#/ana.*##g;s#\./#/#g;s#^#(cd /e/zmy/analyseServer/analyseServer/analyseServer/tools#g;s#$# \&\& ./analyseServer64.exe \& >\& /dev/null)#'|tr "\n" " "|sed 's#) (#) \&\& (#g')`

## sftp同步最新文件

* `(echo "cd /d/ftpInforun/businessData";echo "ls -lt")|sftp -b - cs@192.168.1.100 |grep -v 'sftp>'|head -1|sed 's/.* //g;s#^#cd /d/ftpInforun/businessData\nget #g'|sftp -b - cs@192.168.1.100`

## rsync

### 远程到本地

* `rsync -ravzP -e ssh cs@inforun:/home/cs/test/ test`
* `rsync -ravzP -e 'ssh -p 2222' cs@inforun:/home/cs/test/ test`

### 本地到远程

* `rsync -ravzP -e ssh test cs@inforun:/home/cs/test/`
* `rsync -ravzP -e 'ssh -p 2222' test cs@inforun:/home/cs/test/`

## tcp消息发送

* `echo '{"messageType":222}'|nc 127.0.0.1 7901;echo '{"messageType":222}'|nc 127.0.0.1 7902;echo '{"messageType":222}'|nc 127.0.0.1 7903;echo '{"messageType":222}'|nc 127.0.0.1 7904;echo '{"messageType":222}'|nc 127.0.0.1 7905;echo '{"messageType":222}'|nc 127.0.0.1 7906`
* `echo '{"messageType":222}'|socat - TCP:localhost:7901 && echo '{"messageType":222}'|socat - TCP:localhost:7902 && echo '{"messageType":222}'|socat - TCP:localhost:7903 && echo '{"messageType":222}'|socat - TCP:localhost:7904 && echo '{"messageType":222}'|socat - TCP:localhost:7905 && echo '{"messageType":222}'|socat - TCP:localhost:7906`

## 格式化打印

* `cat /c/Users/walker/Desktop/1.txt|while read line;do echo $line|sed 's/、/\n/g'|awk '{printf "%04d\n", $1}'|sort -n|uniq|tr "\n" " ";echo;done`
* `cat /e/zmy/analyseServer/analyseServer/analyseServer/riskpoint.xml|grep trans|sed 's#</.*##;s#.*>##'|while read line; do echo $line|sed 's/,/ /g'; done |tr " " "\n"|sort -n|uniq -c|sort -n`

## 消息统计

* `ls /d/log/*.va.log|while read line; do echo $line|grep .;grep -E '消息 [发送|解析]' $line|awk -F# '{print $2}'|sed 's/].*//g'|sort|uniq -c; done`

## 计算 总数

* `grep 核心数据总数 /d/log/log.rg.log|awk -F# '{print $2}'|awk '{print $1}'|tr "\n" "+"|sed 's/+$/\n/'|bc`

## 删掉彩色

* `sed -r "s/\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]//g"`
* `sed "s,\x1B\[[0-9;]*[a-zA-Z],,g"`

## 查看用的最多的命令

* `history |awk '{print $2}'|sort|uniq -c|sort -rn|head -10`

## 行列转换

* `awk -F " +" '{for(i=1;i<=NF;i++) a[i,NR]=$i}END{for(i=1;i<=NF;i++) {for(j=1;j<=NR;j++) printf a[i,j] " ";print ""}}' urfile`

## 计时

* `while true; do END=$(date +%s --date='17:30:00'); echo "离17:30还有["$(( $END - $(date +%s) ))"]秒";sleep 1;done`
* `COUNT=0; while true;do echo $(( COUNT+=1 )) $(date +%T);sleep 30;done`

# 统计

## 报警+失败 与 核心数据 对比

* `comm -3 <(grep '"bussinessCoreId": ' ./log.rg.log|grep -v '"bussinessCoreId": 0,'|sed 's/.*bussinessCoreId": //g;s/,//g'|sort|uniq) <(grep businessList ./log.rg.log|sed 's/,/\n/g'|grep 'bussinessId'|sed 's/.*"bussinessId"://g'|sort|uniq)`

## 报警 与 核心数据 对比

* `comm -3 <(grep -n '数据上传 .*Alarm' ./log.rg.log|awk -F: '{print $1}'|sed 's/\(.*\)/\1+5/g'|bc|tr "\n" " "|sed 's/ /p;/g'|sed 's/;$//'|xargs.exe -i sed -n ''{}'' ./log.rg.log |grep -v '"bussinessCoreId": 0,'|sed 's/.*"bussinessCoreId": //;s/,//g'|sort|uniq) <(grep businessList ./log.rg.log|sed 's/,/\n/g'|grep 'bussinessId'|sed 's/.*"bussinessId"://g'|sort|uniq)`

## 是否创建任务

* `echo '5912377'|tr "\n" "|"|sed 's/|$//'|xargs.exe -i grep --color -E ''{}'' <(grep '任务 创建' log.rg.log)|wc -l`

## 获取失败上传行号

* `grep -n '数据上传 FailedNotify' ./log.rg.log`

## 失败任务是否最后分析成功

* `grep -n '数据上传 .*Alarm' ./log.rg.log|awk -F: '{print $1}'|sed 's/\(.*\)/\1+5/g'|bc|sort|uniq|xargs.exe -i sed -n ''{}'p' ./log.rg.log|sed 's/.*"bussinessCoreId": //;s/,//g'`
* `grep -n '数据上传 FailedNotify' ./log.rg.log|awk -F: '{print $1}'|sed 's/\(.*\)/\1+2/g'|bc|sort|uniq|xargs.exe -i sed -n ''{}'p' ./log.rg.log|sed 's/.*"bussinessCoreId": //;s/,//g'`

## 新增报警成功数

* `count=0;stat=0;while true ; do  (( count++ )); last=$stat;echo -e "数据上传\n"|grep . --color; stat=$(grep -c 数据上传 /d/log/*.rg.log|tr "\n" ":"|sed 's/[^:]*log:/+/g;s/^+//;s/://g;'|xargs.exe -i echo '({})'|bc); echo $last $stat $(( $stat-$last ))" "$count;echo 'sleep for 3 sec';sleep 3; done`

# SQL命令

## 核心数据 清理

* `delete t_business_data t where t.create_time like '2017-08-02%';`

  ## 更新上下班时间\(2min\)

  * dev321
    * `update t_work_time twt set twt.begin_date=sysdate,twt.end_date= sysdate+2,twt.work_begin_time=to_char(sysdate+2/24/60,'hh24:mi'),twt.work_end_time=to_char(sysdate+12/24/60,'hh24:mi'),twt.rest_starttime =to_char(sysdate+5/24/60,'hh24:mi'),twt.rest_endtime =to_char(sysdate+10/24/60,'hh24:mi')  where twt.bank_id in (select twt.bank_id from t_work_time twt left join t_bank tb on twt.bank_id = tb.id where tb.bank_code in ('0501', '0901', '0401', '1602', '1502', '1601'));`
    * `select * from t_work_time  twt  left join t_bank tb on twt.bank_id=tb.id  where tb.bank_code in ('0501','0901','0401','1602','1502','1601');`
  * dev
    * `update t_work_time twt set twt.begin_date=sysdate,twt.end_date= sysdate+2,twt.work_begin_time=to_char(sysdate+2/24/60,'hh24:mi'),twt.work_end_time=to_char(sysdate+12/24/60,'hh24:mi'),twt.rest_starttime =to_char(sysdate+5/24/60,'hh24:mi'),twt.rest_endtime =to_char(sysdate+10/24/60,'hh24:mi')  where twt.bank_id in (select twt.bank_id from t_work_time twt left join t_bank tb on twt.bank_id = tb.id where tb.bank_code in ('0601','0701','0732','0733','0734','0735','3401','4101'));`
    * `select * from t_work_time  twt  left join t_bank tb on twt.bank_id=tb.id  where tb.bank_code in ('0601','0701','0732','0733','0734','0735','3401','4101');`

## 修改分析 ip port

* `select * from t_facilities tf inner join t_bank tb on tf.bank_id=tb.id where tf.ip='192.168.1.31' and tb.bank_code in ('0501','0901','0401','1602','1502','1601');`
* `select * from t_bank tb where tb.bank_code in ('0501','0901','0401','1602','1502','1601');`
* `select * from t_facilities tf where tf.ip='192.168.1.31' for update`
* `select tf.f_code, tf.ip , tf.port from t_facilities tf inner join t_bank tb on tf.bank_id=tb.id where tf.ip='192.168.1.31' and tb.bank_code in ('0401','0501','0901','1502','1601','1602')  for update`

# 一键更新基本需求

## 1. 安装为服务

* 定时拉取,监听通知
* curl\(下载\), msiexec\(安装,更新\),启动,安装日志上传
* 强制更新
* 日志上传, db记录

## 2. 安装卸载\(管理员权限 静默\)

* `msiexec /i analyseServer-x64-1.2.42.msi /qb /l+ install.log`
* `msiexec /i analyseServer-x64-1.2.42.msi /qr /l+ install.log`
* `msiexec /i analyseServer-x64-1.2.42.msi /passive /l+ install.log`
* `msiexec /x analyseServer-x64-1.2.42.msi /qb /l+ install.log`
* `msiexec /x analyseServer-x64-1.2.42.msi /qr /l+ install.log`
* `msiexec /x analyseServer-x64-1.2.42.msi /passive /l+ install.log`

# 工具和库

## include去重

* `g++ -H  foo.C |& awk '{print $2}' | sort | uniq -c | grep -v '      1 '`

## gogs

* 下载 windows\_amd64\_mws.zip\(含服务注册\)
* 编辑custom/conf/app.ini

* mysql 建表

  * `DROP DATABASE IF EXISTS gogs;`
    * `CREATE DATABASE IF NOT EXISTS gogs CHARACTER SET utf8 COLLATE utf8_general_ci;`

* ./gogs.exe web 启动成功，则说明正常
* 注册成windows服务 
  * `sc create gogs start= auto binPath= ""C:\gogs\gogs.exe" web --config "C:\gogs\conf\app.ini""`

## json 序列化

* `:%s/\(.*\)/j["\1"] = data.\1;/g`
* `:%s/\(.*\)/if (j.find("\1") != j.end())\r{\rdata.\1 = j["\1"];\r}\r/g`

# 搜索

1. taskid
   * 发送信息:TaskID:.\*thumbnail.jpg
   * 任务 结果\[上报\]    \[alarm\]:     taskID\[
   * thumbnail.jpg

# 配置修改

## 内控

```
D:\xampp\tomcat\webapps\iics\WEB-INF\classes\config.properties
    jdbc.url=jdbc:oracle:thin:@192.168.1.100:1521:BANK4
    jdbc.username=dev
    jdbc.password=dev321
    versionUrl=http://192.168.1.31:8080/doc/
    versionPath=E:\\zmy\\analyseServer\\analyseServer\\Release\\msi
    pushDataTime=60000
D:\xampp\tomcat\webapps\iics\WEB-INF\classes\spring-hibernate.xml
        <property name="cronExpression" value="0 53 12 * * ?" />
```

## 核心数据推送

1. 核心数据文件更名为 当前日期
2. 核心数据文件 日期替换为 昨天日期
3. 修改 tomcat 文件config.properties 中推送时间为解析后一分钟 pushDataTime=60000
4. 修改 tomcat 文件spring-hibernate.xml 中 cronExpression 的value 为 当前时间 之后 几分钟
5. 启动 tomcat
6. 启动 vaServer
7. 清理 redis 数据 flushdatabase 或者 redis-cli flushall
8. 启动 analyseServer

# mkgh.sh

```
#! /usr/bin/bash
gitbook install > /dev/null
gitbook init > /dev/null && gitbook build > /dev/null
git add .
git commit -a -m 'build gh'
git checkout gh-pages
git pull origin gh-pages --rebase
cp -R _book/* .
git add .
git commit -a -m "update gh"
git clean -fx _book
git push origin gh-pages
git checkout master
git clean -fx _book
git push
```

# rock.sh

```
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
sleep_time=30                                                                                                                                           # 30sec等待                     (tomcat完全启动)
parse_time=2                                                                                                                                            # 2min后解析核心数据    (tomcat完全启动)
va_PORT=64000                                                                       # 算法 端口
notify_PORT=7900                                                                    # 分析服务器 监听端口(内控通知端口)
HEARTBEAT=30                                                                        # 心跳间隔
URL='http://192.168.1.31:8080/inforunws/service/rest'                               # 内控URL

### 以下 不要修改
MSI_FILE=$(cd $MSI_DIR && ls -t *.msi|sed -n '1p')                                  # 当前目录下 最新msi
DATA_FILE="/d/"$(date +%Y-%m-%d)".txt"                                              # 生成新的核心数据
SRC_DIR='/c/Program Files/Inforun/analyseServer'                                    # 分析服务器 安装目录
LOG_DIR='D:/Log'                                                                    # 分析服务器 日志目录
default_notify_PORT=7900                                                                                                                        # 配置文件默认设置
default_va_PORT=64000                                                                                                                           # 配置文件默认设置
redis_PORT=6379                                                                     # redis 端口

#############
function usage()
{
    cat <<EOF |GREP_COLOR='01;32' grep --color=always .
Usage:
    ./rock.sh [op] [file]
    分析服务器测试用自动脚本[卸载/安装/修改/克隆/部署/启动/停止/日志分析]
Op:
                无参数命令[-h -m -s -t -a]
    -h          显示usage
    -V          版本信息
    -v          更新版本日志
    -x          日志过滤
    [file]      统计日志[file]
    -l          统计日志 (/d/log/*.rg.log)
    -ll         监测日志统计 (/d/log/*.rg.log)
    -ls         监测处理速度 (cout/min)
    -e          统计日志错误
    -n [msg]    手动通知分析(模拟内控, msg默认222)
    -1          启动所有vaServer64
    -2          启动所有analyserServer64
    -m          修改配置
    -s          停止tomcat
    -t          启动tomcat
    -a          顺序执行后续命令[-k -i -c -r -p]
    -k          杀死进程
    -i          卸载并安装
    -c          克隆副本 (mkcopy)
    -cc         显示克隆信息
    -r          [-1 -2]
    -p          已启动副本进程，TCP连接端口
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
    TIME=$(date +%S" "%M" "%H --date="$parse_time minutes")
    TIME_ECHO=$(date +%X --date="$parse_time minutes")
    echo '修改配置' $DATA_FILE|grep --color=always . && cp $OLD_FILE $DATA_FILE && sed -i 's#|\(2017/[^|]*\)#|'"$(date +%Y/%m/%d --date='1 day ago')"'#' $DATA_FILE && sed -n '1p' $DATA_FILE
    echo '修改配置' $CONFIG_FILE '核心数据解析时间:' $TIME_ECHO "("$parse_time "min之后)"|grep --color=always . && ([ -f ${CONFIG_FILE}.bak ] && [ $(grep -F 'property name="cronExpression" value="03 02 01' ${CONFIG_FILE}.bak|wc -l) == 1 ]) && (cp $CONFIG_FILE{.bak,} && sed -i 's#\(property name="cronExpression" value="\)\(03 02 01\)#\1'"$TIME"'#' $CONFIG_FILE )|| ( ([  -f ${CONFIG_FILE}.bak ] && rm -rf ${CONFIG_FILE}.bak)|( ISOK=$(grep -F 'property name="cronExpression" value="03 02 01' $CONFIG_FILE|wc -l) && [ $ISOK ==  0 ] && echo "脚本无法修改文件[$CONFIG_FILE]:检查到 核心数据解析时间不为 03 02 01" || cp $CONFIG_FILE{,.bak} && sed -i 's#\(property name="cronExpression" value="\)\(03 02 01\)#\1'"$TIME"'#' $CONFIG_FILE) )
    grep --color=always -n "$TIME" $CONFIG_FILE{,}|sort|uniq
}
function print_info()
{
    echo '已启动副本进程' | grep --color=always . && ps -ef |grep --color=always 'build.*64'
    echo '通知监听端口' | grep --color=always . && echo $notify_PORT|sed -n 's#^\(..\).*#\1#p'|xargs.exe -i grep --color=always '\([[:digit:]]\{1,3\}\.\)\{3\}[[:digit:]]\{1,3\}:'{} <(netstat -abon|tr "\n\r" " "|sed 's#TCP#\nTCP#g')
    echo '算法服务端口' | grep --color=always . && echo $va_PORT|sed -n 's#^\(..\).*#\1#p'|xargs.exe -i grep --color=always '\([[:digit:]]\{1,3\}\.\)\{3\}[[:digit:]]\{1,3\}:'{} <(netstat -abon|tr "\n\r" " "|sed 's#TCP#\nTCP#g')
    echo 'redis服务端口' | grep --color=always . && echo $redis_PORT|xargs.exe -i grep --color=always '\([[:digit:]]\{1,3\}\.\)\{3\}[[:digit:]]\{1,3\}:'{} <(netstat -abon|tr "\n\r" " "|sed 's#TCP#\nTCP#g')
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
    ( cd /e/zmy/analyseServer/analyseServer/Release;
    ver_old=$(git tag|sort -rn|sed -n '1p'); ver_new=$(grep PRODUCT ../analyseServer/version.h|sed 's/[^"]*"//;s/"//');
    [ $ver_old == $ver_new ] && (echo 没有增加版本号 $ver_new|GREP_COLOR='03;36' grep --color=always .) ||
    (
    cp 发布日志.md{,.bak};
    new_log=$(echo "##### $ver_new [$(date +%Y-%m-%d)]" && git log "$ver_old".. --oneline |grep -v 'Merge'|grep -v $ver_new|sed 's/[^ ]* //;s/[0-9]*\. /\n/g'|grep -v '^$'|cat -n -|sed 's/^\([ 0-9]*\)\(.*\)/\1.\2/;s/\t/ /g')
    echo "$new_log"
    cat  <(cat 发布日志.md|sed -n '1,2p') <(echo "$new_log") <(cat 发布日志.md|sed -n '3,$p') > 发布日志.md.bak;
    mv 发布日志.md{.bak,}) )
}
function loop()
{
    while true; do $0 $1;echo "========================================="|GREP_COLOR='03;36' grep --color=always .; sleep 3;done
}
[ $# == 0 ] && $0 -h -k -s -m -t -a && exit

until [ -z "$1" ]
do
    [ -f "$1" ] && (echo '日志统计' $1|GREP_COLOR='01;32' grep --color=always . && grep -E 'waiting|推送|数据|上传|缓存|任务|报警|计划' "$1"|awk -F# '{print $2}'|sort|uniq -c|grep --color=always -E 'waiting|推送|数据|上传|缓存|任务|报警|计划' && grep  '\[E\]' "$1"|awk -F# '{print $2}'|sort|uniq -c|GREP_COLOR='01;33' grep --color=always -E .)

    [ "$1" == "-ll" ] && (echo '监测日志统计'|grep --color=always . && loop -l)
    [ "$1" == "-ls" ] && (echo '监测处理速度' "count/min(SMsgVATaskEndNotify)"|grep --color=always . && loop --stat)
    [ "$1" == "-le" ] && (echo '监测日志错误' | grep --color=always . && loop -e)
    [ "$1" == "-cc" ] && (echo '显示克隆信息' | grep --color=always . && mkshow)

    [ "$1" == "-l" ] && ($0 /d/log/*.rg.log)
    [ "$1" == "--stat" ] && (for line in /d/log/*.rg.log; do echo -e $line|grep --color=always . ;time=$(grep -E '消息 处理\[任务\]\[struct SMsgVATaskEndNotify' $line|sed -n '1p;$p'|sed 's/\]\[.*$//g;s/\[//g'|xargs.exe -i date --date='{}' +%s|tr "\n" "-"|sed 's/^/(0-(/;s#-$#))#;s/$/\n/'|bc);count=$(grep -cE '消息 处理\[任务\]\[struct SMsgVATaskEndNotify' $line);speed=$(echo "("$count"-1)*60/"$time|bc);echo "("$count"-1)*60/"$time"="$speed;done;)
    [ "$1" == "-e" ] && (grep --color=always -n '\[E\]' /d/log/*.rg.log|sed 's/:.*:.*#/#/g'|sed 's/失败:.*/失败:/g;s/id:.*/id:/g'|sort|uniq -c| GREP_COLOR='01;32' grep --color=always '#.*';)
    [ "$1" == "-a" ] && ($0 -k -i -c -r -p)
    [ "$1" == "-r" ] && ($0 -1; echo '等待启动 5 sec'|grep --color=always . && sleep 5; $0 -2)
    [ "$1" == "-h" ] && (echo '挂载信息' | grep --color=always . && df -h && usage)
    [ "$1" == "-n" ] && ([ $# == 2 ] && notify $2 && exit || notify 222 && exit)
    [ "$1" == "-m" ] && modconfig
    [ "$1" == "-p" ] && print_info
    [ "$1" == "-V" ] && (echo -e 'rock' $VERSION | GREP_COLOR='01;36' grep --color=always .)
    [ "$1" == "-v" ] && version

    [ "$1" == "-s" ] && (echo '停止tomcat' | grep --color=always . && eval $(tasklist.exe |grep -ia 'java.exe'|awk '{print "-PID "$2}'|tr "\n" " " |xargs.exe -i echo {}|sed 's/^/taskkill -F /'))
    [ "$1" == "-t" ] && (echo "启动tomcat"| grep --color=always . && $TOMCAT) && (echo "等待tomcat完全启动("$sleep_time" sec)"| grep --color=always . && sleep $sleep_time )
    [ "$1" == "-k" ] && (echo '杀死进程[vaServer64 & analyserServer64]'| grep --color=always . && eval $(tasklist.exe |grep -ia er64.exe|awk '{print "-PID "$2}'|tr "\n" " " |xargs.exe -i echo {}|sed 's/^/taskkill -F /'))
    [ "$1" == "-i" ] && (echo '卸载并安装['$MSI_DIR"/"$MSI_FILE']'| grep --color=always . && (msiexec.exe -q -x $(reg query "HKLM\SOFTWARE\Inforun\analyseServer"|grep ProductCode|awk '{print $3}') &> /dev/null );(cd $MSI_DIR && msiexec.exe -q -i $MSI_FILE) )
    [ "$1" == "-c" ] && (echo '克隆副本' | grep --color=always . && mkcopy)
    [ "$1" == "-1" ] && (echo '启动所有vaServer64' | grep --color=always . && eval $(find . -name 'vaServer64.exe'|sed 's#/[^/]*$##;s/\.//;s#^#(cd '\'"$CURR_DIR"\''#g;s#$# \&\& ./vaServer64.exe \&> /dev/null \&)#'|tr "\n" " "|sed 's#) (#) \&\& (#g') )
    [ "$1" == "-2" ] && (echo '启动所有analyserServer64' | grep --color=always . && eval $(find . -name 'analyseServer64.exe'|sed 's#/[^/]*$##;s/\.//;s#^#(cd '\'"$CURR_DIR"\''#g;s#$# \&\& ./analyseServer64.exe \&> /dev/null \&)#'|tr "\n" " "|sed 's#) (#) \&\& (#g'))

    [ "$1" == "-x" ] && [ "$1" == "-x" ] && (echo '过滤:' $2| grep --color=always . && WORD=$(echo $2|sed 's/\[/\\\[/g;s/\]/\\\]/g') && (for line in /d/log/*.rg.log; do echo $line|grep --color=always .;grep --color=always -E ''"$WORD"'' $line|awk -F# '{print $2}'|sort|uniq -c;done;))

    shift
done
```



