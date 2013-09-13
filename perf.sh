#!/bin/bash

imgproc=$
_t=0
_n=0
while read -r line
do 
    _time=${line#*:}
    _num=${line%:*}
    #   echo $_time $_num
    sleep 2
    _t=$((_t + _time))
    _n=$((_n + _num))
done < <(cat log/201308*/stat.txt|grep '\<processed\>'|sort|uniq |awk '{print $2":"$3}' )
# echo $_t $_n
nps=$(echo 'scale=3;'$_n"/"$_t''|bc)
spn=$(echo 'scale=3;'$_t"/"$_n''|bc)
npm=$(echo 'scale=3;'$nps"*60"''|bc)
wpm=$(echo 'scale=3;'$npm"/10000"''|bc)
spw=$(echo 'scale=3;'$spn"*10000"''|bc)
mpw=$(echo 'scale=3;'$spw"/60"''|bc)

echo -e $nps"\t\tpic/s"
echo -e $spn"\t\ts/pic"
echo -e $npm"\tpic/m"
echo -e $wpm"\t\twpic/m"
echo -e $spw"\t\ts/wpic"
echo -e $mpw"\t\tm/wpic"
