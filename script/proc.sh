#!/bin/bash


##  for debug
#   export PS4='+${BASH_SOURCE}:${LINENO}:${FUNCNAME[0]}: '
#   _DEBUG=true ./proc.sh
_log() 
{
    if [ "$_DEBUG" == "true" ]; then
        echo 1>&2 "$@"
    fi
}

# set -x
_log "检查文件是否存在config/img-proc..."
if [ $# != 2 ]
then
    _log "config/img-proc文件不存在"
	echo Usage: $0 img-proc config
    cat <<EOF
        no config or img-proc
    config input in file 'config'
    call img-proc to recursively cut-white-edge & resize image
    for more info see img-proc --help
EOF
	exit 1
fi

## get val
# set -x
_log "读取config和变量初始化..."
# set base args
# set -x
SCRIPT=$0
IMGPROC=$1
CONFIG=$2
# set +x
SUFFIX=jpg
CURRDIR=$(pwd)
CUTSUF="/*.$SUFFIX"
ERRLOG="$CURRDIR/errlog.txt"


eval $(cat $CONFIG|grep -v '^#'|grep -v '^ *$'|sed 's/ *//g'|awk -F= '{print $0}')
# set +x
# echo $SOURCEDIR $DESTDIR $CUTWHITE $RESIZE $WIDTH $HEIGTH
[ "X"$SOURCEDIR == "X" ]    && echo 'no src dir'        && exit 100
[ "X"$DESTDIR == "X" ]      && echo 'no dst dir'        && exit 100
[ "X"$CUTWHITE == "X" ]     && echo 'no cut-white val'  && exit 100
[ "X"$RESIZE == "X" ]       && echo 'no resize val'     && exit 100
[ "X"$TYPE == "X" ]          && echo 'no image type'     && exit 100
(( $RESIZE == 1 ))          && (( $WIDTH == 0 ))        && echo 'no cut-white val' && exit 100
(( $RESIZE == 1 ))          && ARGS=$ARGS" -r -x $WIDTH -y $HEIGTH "
(( $CUTWHITE == 1 ))        && ARGS=$ARGS" -c "
echo "$TYPE"
TYPE_ARGS=""'.*\.('$(echo "$TYPE"|sed 's#-#|#g')')$'""
# echo $TYPE_ARGS

# echo $ARGS
# set -x
echo -e '\033[01;32m'"config:"'\033[0m'$CONFIG
echo -e '\033[01;32m'"img-proc:"'\033[0m'$IMGPROC "-s" $SOURCEDIR'/*'" -t "$TEMPLDIR'/*'" -d "$DESTDIR $ARGS""
# set +x

_log "取得绝对路径..."
DSTDIR=$(mkdir -p "$DESTDIR";cd $DESTDIR;pwd)
SRCDIR=$(mkdir -p "$SOURCEDIR";cd $SOURCEDIR;pwd)
echo -e '\033[01;32m'"$SOURCEDIR "'\033[01;33m'"=>"'\033[01;32m'" $DSTDIR"'\033[0m'


# _log "备份旧的统计文件..."
## backup
BAKDIR="log/""$(date +%Y%m%d-%H%M%S)"
mkdir -p $BAKDIR && ls |grep '.txt'|xargs -i mv {} $BAKDIR &> $ERRLOG

STAT="stat.txt"
echo -e '\033[01;32m'"start.[$(date +%Y%m%d-%H:%M:%S)]"'\033[0m'|tee $STAT
## src dir: img-proc to dst dir , mv noproc to dst dir
NOPROCFILE="$CURRDIR/noproc.txt"
_log "切换到"$SRCDIR"目录..."
cd $SRCDIR
_log "生成"$NOPROCFILE"和"$ERRLOG"文件..."
TOUCH=$(>"$NOPROCFILE";>"$ERRLOG")
_log "find "$SUFFIX"，并调用img-proc处理文件，处理后放到"$DSTDIR"，失败的则被img-proc写到"$NOPROCFILE"..."
START_TIME=$(date +%s)

find $SRCDIR -regextype "posix-egrep" -regex "$TYPE_ARGS"> "all.txt"
cat "all.txt"|while read LINE
do
    dstname=$(echo $LINE|sed 's#'$SRCDIR'#'$DSTDIR'#'|sed 's#/[^/]*$##')
    # set -x
    if [ -d "$dstname" ]
    then
        $CURRDIR/$IMGPROC $ARGS -d "$dstname" -s "$LINE" &>> $ERRLOG #|| exit 102
    else
        rm -rf "$dstname"
        mkdir -p "$dstname" #|| exit 101
        $CURRDIR/$IMGPROC $ARGS -d "$dstname" -s "$LINE" &>> $ERRLOG #|| exit 102
    fi
    # _log "img-proc处理实时计数.."
    _i=$(($_i + 1)); echo $_i > $CURRDIR/pc-num
    # set +x
done
PROC_TIME=$(date +%s)



_log "移动img-proc未做处理的"$SUFFIX"("$NOPROCFILE")，到"$DSTDIR"..."
# cd "$SRCDIR"
cp $ERRLOG $NOPROCFILE
cat "$NOPROCFILE" |grep 'image not'|awk -F: '{print $2}'|while read LINE
do
    dstname=$(echo $LINE|sed 's#'$SRCDIR'#'$DSTDIR'#'|sed 's#/[^/]*$##')
    # echo $dstname
	if [ -d "$dstname" ]
	then
	    # cp "$i" "$dstname" &>> $ERRLOG #|| exit 100       ## cp unstat error
        # set -x
	    cp "$LINE" "$dstname" &>> $ERRLOG #|| exit 100
        # set +x
	else
        rm -rf "$dstname"
        # set -x
		mkdir -p "$dstname" #|| exit 101
	    cp "$LINE" "$dstname" &>> $ERRLOG #|| exit 100
        # set +x
	fi
    # _log "mv处理实时计数.."
    _j=$(($_j + 1)) ; echo $_j > $CURRDIR/cp-num
done
FINISH_TIME=$(date +%s)
chown -R nobody:nogroup $DSTDIR


_log "处理和统计收集的信息.."
# stat & 
cd $CURRDIR
NOPROC=$(grep 'image not' $NOPROCFILE |wc -l)
NOCUTWHITE=$(grep -c "image not cut white" $NOPROCFILE)
NORESIZE=$(grep -c "image not resize" $NOPROCFILE)
OPENFAILED=$(grep -c "open failed" $NOPROCFILE)
SAVEFAILED=$(grep -c "save failed" $NOPROCFILE)
# DUNU=$(($TOTAL - $PROCESS - $OPENFAILED - $NOCUTWHITE))

ALLFILE="all.txt"
TOBEFILE="tobe.txt"
BEENFILE="been.txt"
ERRFILE="errfile.txt"
# NOCUTFILE="nocutfile.txt"
DUFILE="dufile.txt"
REDUFILE="redufile.txt"
touch $ALLFILE $TOBEFILE $BEENFILE $ERRFILE $DUFILE
find $SOURCEDIR -name "*.$SUFFIX" |sed 's#^ *##g'|sed 's#.*/##g'|sort >$ALLFILE
find $DESTDIR   -name "*.$SUFFIX" |sed 's#^ *##g'|sed 's#.*/##g'|sort >$BEENFILE
TOTAL=$(wc -l $ALLFILE |awk '{print $1}')
TOBE=$(uniq $ALLFILE|tee $TOBEFILE|wc -l)
BEEN=$(wc -l $BEENFILE|awk '{print $1}')

DUNU=$(comm -3 $ALLFILE $BEENFILE |grep -v '^\s'|tee $DUFILE|wc -l)
REDUNU=$(comm -3 $TOBEFILE $BEENFILE |grep '^\s'|tee $REDUFILE|wc -l)
# NOCUTWHITE=$(comm -3 $TOBEFILE $BEENFILE |grep -v '^\s'|tee $NOCUTFILE|wc -l)

_log "输出统计.."
echo -e '\033[01;32m'"done.[$(date +%Y%m%d-%H:%M:%S)]"'\033[0m'|tee -a $STAT
echo -e "stat:
    -               num\t\ttime/s
    total           $TOTAL\t$(( $FINISH_TIME - $START_TIME ))
    processed       $BEEN\t$(( $PROC_TIME - $START_TIME ))
    noprocessed     $NOPROC\t\t$(( $FINISH_TIME - $PROC_TIME ))
    nocutwhite      $NOCUTWHITE
    noresize        $NORESIZE
    openfailed      $OPENFAILED
    savefailed      $SAVEFAILED
    dule-file       $DUNU
    redufile        $REDUNU"|
    tee -a $STAT
cat $STAT|grep 'done' && echo -e '\033[01;32m'"successed!"'\033[0m'|tee -a $STAT
_log "完成所有过程.."
