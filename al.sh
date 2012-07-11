#! /bin/bash

usage() {
    cat << EOF
Usage:
    ${BASH_SOURCE[0]##./} [Options] {Args}

Options:
    --help,-h
    --test,-t
    --verions,-v
    --input,-i

Args:
    sec
    msg
EOF
}
(( $# < 1 )) && usage && exit
# set -x
case $1 in
    --help|-h)
        usage
        exit
        ;;
    --version|-v)
        echo "$0 version 0.1"
        exit
        ;;
    *)
        ;;
esac

List=$(ls -l $(which al)|awk '{print $11}'|sed 's#[^/]*$#al.lst#')
echo $List
[[ -f $List ]] || :>$List

IS_DIGIT=$(echo $1|sed 's/[[:digit:]]*//g')
echo $IS_DIGIT
if [[ -z "$IS_DIGIT" ]] ;then
echo "z??"
    SLEEP_TIME=$1
else
    SLEEP_TIME=$(grep "$1" $List|awk '{print $2}')
    echo $SLEEP_TIME
    if [[ -z $SLEEP_TIME ]] ;then
        echo "input sleep time for $1"
        read SLEEP_TIME
        sed -i '$a\'$1"\t\t"$SLEEP_TIME'' $List
    fi

fi

sleep $SLEEP_TIME;echo "$1";while((1));do echo -n -e "\a";sleep 1;done

