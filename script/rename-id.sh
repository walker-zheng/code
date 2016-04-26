#!/bin/bash


if [ $# != 2 ]
then
	echo Usage: $0 SRCDIR DSTDIR
    cat <<EOF
    check args!
EOF
	exit 1
fi
SCRIPT=$0
SOURCEDIR=$1
DESTDIR=$2
TYPE_ARGS=""'.*\.(png|jpg|jpeg|bmp)$'""

SRCDIR=$(mkdir -p "$SOURCEDIR";cd $SOURCEDIR;pwd)
DSTDIR=$(mkdir -p "$DESTDIR";cd $DESTDIR;pwd)
_i=$(echo "($(date +%s) - 1378880000)*100000"|bc)
echo -e '\033[01;32m'"$SOURCEDIR "'\033[01;33m'"=>"'\033[01;32m'" $DSTDIR"'\033[0m'


echo -e '\033[01;32m'"start.[$(date +%Y%m%d-%H:%M:%S)]"'\033[0m'
#   find "$SRCDIR" -type f -regextype "posix-egrep" -regex "$TYPE_ARGS" > "all.txt"
find "$SRCDIR" -type f -regextype "posix-egrep" -regex "$TYPE_ARGS" -printf '%s =%p\n' |sort|awk -F= '{print $2}' > "all.txt"
cat "all.txt"|while read LINE
do
    DST_NAME=$(printf "$DSTDIR/LY%08d.jpg" $_i)
    #   echo $DST_NAME
    #   mv -v "$LINE" "$DST_NAME"
    cp "$LINE" "$DST_NAME"
    # _log "img-proc处理实时计数.."
    _i=$(($_i + 1)); echo $_i > pc-num
    # set +x
done
echo -e '\033[01;32m'"done.[$(date +%Y%m%d-%H:%M:%S)]"'\033[0m'
chown -R nobody:nogroup $DSTDIR
