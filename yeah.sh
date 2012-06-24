#! /bin/bash

char_test(){
    let i=0
    while :                     ## NOP
    do
        i=$((i+1))
        echo $i
        ## [[ $i = 5 ]] && break
        [[ $i = 5 ]] && break
        continue 2
    done

    ((i++))
    [[ $i > 5 ]] && echo "OK"

}

math_test(){
     n=1; let --n && echo "True" || echo "False"  # False 
     n=1; let n-- && echo "True" || echo "False"  # False 
     (( t = a<45?7:11 )) && echo $t  # C 风格的 3 元操作. 

}

main()
{
    char_test
    math_test

}

[[ $# -eq 0 ]] && $0 -h && exit -1

case $* in
    --help|-h)
        cat << EOF
Usage:
    $(basename $0) {Options}

Options:
    --help,-h       help
    --version,-v    version 
    --all,-a        all 

EOF
        ;;
    --version|-v)
        echo "$(basename $0) version 0.1"
        ;;

    --all|-a)
        echo "All Done!"
        ;;
esac


main
