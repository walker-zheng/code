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

pick_card(){
    # 取出一张牌,任何一张. 

    Suites="Clubs 
    Diamonds 
    Hearts 
    Spades" 

    Denominations="2 
    3 
    4 
    5 
    6 
    7 
    8 
    9 
    10 
    Jack 
    Queen 
    King 
    Ace" 
  
    # 注意变量的多行展开. 

    suite=($Suites)                # 读到数组变量中. 
    denomination=($Denominations) 

    num_suites=${#suite[*]}        # 计算有多少个元素. 
    num_denominations=${#denomination[*]} 

    echo -n "${denomination[$((RANDOM%num_denominations))]} of " 
    echo ${suite[$((RANDOM%num_suites))]} 
    
    
}
loops_test(){
    
    for file in *.[s][h]
    do
        echo $file
    done

    Denominations="2 
    3 
    4 
    5 
    6 
    7 
    8 
    9 
    10 
    Jack 
    Queen 
    King 
    Ace" 

    for i in $Denominations
    do
        set -- $i
        original_params=("$@")
        echo $1
    done

    LIMIT=10
    for ((a=0, b=9; a < LIMIT ; a++, b--))  # 逗号将同时进行 2 条操作. 
    do 
        echo -n "[$a,$b] " 
    done 
    echo

    a=0
    while (( a < LIMIT ))   # 双圆括号, 变量前边没有"$". 
    do 
        echo -n "$a " 
        ((a += 1))   # let "a+=1" 
    # Yes, 看到了吧. 
    # 双圆括号允许像 C 风格的语法一样增加变量的值. 
    done
    echo

    a=0
    until (( a == LIMIT ))   # 双圆括号, 变量前边没有"$". 
    do 
        echo -n "$a " 
        ((a += 1))   # let "a+=1" 
    # Yes, 看到了吧. 
    # 双圆括号允许像 C 风格的语法一样增加变量的值. 
    done
    echo
### break/continue N 跳出循环的层数

    
}

main()
{
    # char_test
    # math_test
    # pick_card
    loops_test

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
        main
        ## echo "All Done!"
        ;;
esac


