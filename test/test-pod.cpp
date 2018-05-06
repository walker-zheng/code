
#include <cstdio>
#include <iostream>
#include <algorithm>
#include <vector>
#include <map>
using namespace std;


typedef struct
{
    int math;
    int english;
    int chinese;
}Student;
#define BOOL int
#define SDK_N_REC_TSECT             6   //录像时间段个数
#define SDK_N_WEEKS                 7   //一周的天数

typedef struct tagTsect
{
    BOOL  bEnable;
    int  iBeginHour;
    int  iBeginMin;
    int  iBeginSec;
    int  iEndHour;
    int  iEndMin;
    int  iEndSec;
} TTsect,*PTTsect;


typedef struct tagScreenTourPlan
{
    int screenType;     ///< 屏幕类型   单屏/拼接屏
    int screenIndex;    ///< 单屏幕 索引
    TTsect      stSect[SDK_N_WEEKS][SDK_N_REC_TSECT];       //NSP
} TScreenTourPlan;


#include <stdio.h>
#include <stdarg.h>

void
foo(char *fmt, ...)
{
    va_list ap;
    int d;
    char c, *s;

    va_start(ap, fmt);
    while (*fmt)
        switch (*fmt++) {
        case 's':              /* string */
            s = va_arg(ap, char *);
            printf("string %s\n", s);
            break;
        case 'd':              /* int */
            d = va_arg(ap, int);
            printf("int %d\n", d);
            break;
        case 'c':              /* char */
            /* need a cast here since va_arg only
               takes fully promoted types */
            c = (char) va_arg(ap, int);
            printf("char %c\n", c);
            break;
        }
    va_end(ap);
}


int main(int argc, char const *argv[])
{

    // std::vector<Student> vec_stu;
    // Student stu;
    // for (int i = 0; i < 10; ++i)
    // {
    //     stu.math = i;
    //     stu.english = i * 2;
    //     stu.chinese = i * 3;
    //     vec_stu.push_back(stu);
    // }
    // sort(vec_stu.begin(), vec_stu.end(),
    //      [](Student & l, Student & r)
    //      {
    //         return l.math > r.math;
    //      }
    //      );

    // for (std::vector<Student>::iterator i = vec_stu.begin(); i != vec_stu.end(); ++i)
    // {
    //     cout << (*i).math << endl;
    // }


    cout << sizeof(TTsect) << endl;
    cout << sizeof(TScreenTourPlan) << endl;

    foo("%s%c%d", "haha", 'A', 0);


    1 || printf("%s\n", "haha");
    0 || printf("%s\n", "world");

    static std::map<int, int> m_test;
    cout << "?? " << std::is_pod<std::map<int, int>>::value <<std::endl;

    return 0;
}
