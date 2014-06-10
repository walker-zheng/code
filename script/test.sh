#! /bin/bash

main()
{
    :
}
set +x
[[ $# -eq 0 ]] && $0 -h && exit -1

NAME=$(basename ${BASH_SOURCE[0]})
case $* in 
    --help|-h)
        cat << EOF
Usage:
   ${0##*/} [Options] 
    
Options:
    --help,-h
    --version,-v
    --all,-a
    
EOF
        ;;
    --version|-v)
        echo $NAME "version 0.1"
        ;;
    --all|-a)
        main
        echo "All done"
        ;;
    *)
        $0 -h
        ;;
esac
    
