#!/bin/bash

ls -1d config.*|while read config
do 
    imgproc="img-proc"
    end=$(echo $config|awk -F- '{print $2}') 
    [[ X"$end" == X"weixin" ]] && imgproc="img-proc.weixin"
    [[ X"$1" == X"1" ]] && imgproc="img-proc.cont"
    ./proc.sh $imgproc $config
    sleep 2
done|tee stat.txt
ERRLOG="$CURRDIR/errlog.txt"
BAKDIR="log/""$(date +%Y%m%d-%H%M%S)"
mkdir -p $BAKDIR && ls |grep '.txt'|xargs -i mv {} $BAKDIR &> $ERRLOG

ls -1d config.*|while read config
do
    eval $(cat $config|grep -v '^#'|grep -v '^ *$'|grep 'DESTDIR'|sed 's/ *//g'|awk -F= '{print $0}')
    RENAME=$(echo $DESTDIR|sed 's#/$##g'|sed 's#$#-ren#g')
    ./rename-id.sh $DESTDIR $RENAME
done
