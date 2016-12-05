// resizing vector
#include <stdio.h>
#include <string.h>
#include <time.h>
#include <windows.h>
#include <iostream>
#include <vector>
using namespace std;

typedef struct s_Shit{

}Shit;

#ifdef WIN32
struct timeval {
  long tv_sec;   /* Seconds */
  long tv_usec;  /* Nanoseconds */
};
int
gettimeofday(struct timeval *tp, void *tzp)
{
    time_t clock;
    struct tm tm;
    SYSTEMTIME wtm;

    GetLocalTime(&wtm);
    tm.tm_year     = wtm.wYear - 1900;
    tm.tm_mon     = wtm.wMonth - 1;
    tm.tm_mday     = wtm.wDay;
    tm.tm_hour     = wtm.wHour;
    tm.tm_min     = wtm.wMinute;
    tm.tm_sec     = wtm.wSecond;
    tm. tm_isdst    = -1;
    clock = mktime(&tm);
    tp->tv_sec = clock;
    tp->tv_usec = wtm.wMilliseconds * 1000;

    return (0);
}
#endif

static
double gettime(void)
{
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return (double)(tv.tv_sec + tv.tv_usec*1.0/1000000);
}
#ifndef DEBUG
#define DEBUG 1
#endif
#define db_write(fmt, ...) \
    do {\
    if (DEBUG) \
{ \
    FILE * tmpFile = fopen("c:\\debug.txt","at");\
    fprintf(tmpFile, "%s:%d:" fmt, __FILE__, \
    __LINE__, __VA_ARGS__);\
    fclose(tmpFile);\
}\
    } while (0)


int
test(){

    static long ifrm_cnter = 0;
    static const double start_tm = gettime();
    db_write("%s:%d:%f\n", "RealDataCallBackEx", ++ifrm_cnter, (gettime() - start_tm));
}



int test_1(unsigned int testNum){
    unsigned int table_1[32];
    for (int i = 1; i < 32; ++i)
    {
        table_1[i] = 1 << i;
    }
    int i;
    for (i = 31; i > 0; --i)
    {
        if(testNum >= table_1[i])
           break;
    }

    cout << i << endl;
    // printf("%c%d%c", 16, 16, 9);
}


void printNum(char * number)
{
    bool bFirstNone0 = false;
    int length = strlen(number);
    int i = 0;
    for (i = 0; i < length + 1; ++i)
    {
        if (number[i] != '0')
            break;
    }
    printf("%#3s\t", number + i);
}
// 递归 全排列
void print_n_digit_recursively(char * number, int length, int index)
{
    if (index == length - 1)
    {
        printNum(number);
        return;
    }
    for (int i = 0; i < 10; ++i)
    {
        number[index + 1] = i + '0';
        print_n_digit_recursively(number, length, index + 1);
    }
}

void print_n_digit(int n)
{
    if (n <= 0)
    {
        return;
    }
    char * number = new char[n + 1];
    number[n] = '\0';

    for (int i = 0; i < 10; ++i)
    {
        number[0] = i + '0';
        print_n_digit_recursively(number, n, 0);
    }

    delete [] number;
}

void reorder(int *pData, unsigned int length, bool (*func)(int))
{
    if (pData == NULL || length == 0)
    {
        return;
    }
    int *pBegin = pData;
    int *pEnd = pData + length - 1;
    while(pBegin < pEnd)
    {
        while(pBegin < pEnd && !func(*pBegin))
            pBegin++;
        while(pBegin < pEnd && func(*pEnd))
            pEnd--;
        if (pBegin < pEnd)
        {
            int Tmp = *pEnd;
            *pEnd = *pBegin;
            *pBegin = Tmp;
        }
    }
}
bool isEven(int n)
{
    return (n & 1) == 0;
}

bool isOdd(int n)
{
    return (n & 1) == 1;
}

bool isPosi(int n)
{
    return n >= 0;
}
void test_reorder()
{
    int vec[20] = {-1, 3, 4, -5, -2, 9, 5, 7, 8, 0};
    for (int i = 0; i < 10; ++i)
    {
        cout << vec[i] << "\t";
    }
    cout << endl;
    reorder(vec, 10, isEven);
    for (int i = 0; i < 10; ++i)
    {
        cout << vec[i] << "\t";
    }
    cout << endl;
    reorder(vec, 10, isOdd);
    for (int i = 0; i < 10; ++i)
    {
        cout << vec[i] << "\t";
    }
    cout << endl;
    reorder(vec, 10, isPosi);
    for (int i = 0; i < 10; ++i)
    {
        cout << vec[i] << "\t";
    }
}
int main()
{

    // FILE * tmpFile = fopen("c:\\debug.txt","w");
    // fclose(tmpFile);

    // for(int i = 0; i != 5000; i++)
    //         test();
    // test_1(61);

    // print_n_digit(2);
    // test_reorder();

    cout << endl << "sizeof(Shit):" << sizeof(Shit) << endl;
}
