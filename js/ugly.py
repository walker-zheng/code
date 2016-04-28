#!/usr/bin/python3

def getMaxN(uglies,count,n):
    ma=count-1
    mi=0
    while mi<ma:
        i=(ma+mi)//2
        maxN=uglies[i]*n
        if maxN>uglies[count-1]:
            ma=i
        else:
            mi=i+1
    i=(ma+mi)//2
    return uglies[i]*n

def getUglyDigit(number):
    uglies=list(range(1,number+1,1))
    for i in range(1,number,1):
        m2=getMaxN(uglies,i,2)
        m3=getMaxN(uglies,i,3)
        m5=getMaxN(uglies,i,5)
        uglies[i]=min(m2,m3,m5)
    return uglies[number-1]

print(getUglyDigit(1500))
