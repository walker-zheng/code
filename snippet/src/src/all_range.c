//去重全排列的递归实现
#include <stdio.h>
#include <string.h>
void Swap(char *a, char *b)
{
    char t = *a;
    *a = *b;
    *b = t;
}
//在pszStr数组中，[nBegin,nEnd)中是否有数字与下标为nEnd的数字相等
bool IsSwap(char *pszStr, int nBegin, int nEnd)
{
    for (int i = nBegin; i < nEnd; i++)
        if (pszStr[i] == pszStr[nEnd])
            return false;
    return true;
}
//k表示当前选取到第几个数,m表示共有多少数.
void AllRange(char *pszStr, int k, int m)
{
    if (k == m)
    {
        static int s_i = 1;
        printf("  第%3d个排列\t%s\n", s_i++, pszStr);
    }
    else
    {
        for (int i = k; i <= m; i++) //第i个数分别与它后面的数字交换就能得到新的排列
        {
            if (IsSwap(pszStr, k, i))
            {
                Swap(pszStr + k, pszStr + i);
                AllRange(pszStr, k + 1, m);
                Swap(pszStr + k, pszStr + i);
            }
        }
    }
}
void Foo(char *pszStr)
{
    AllRange(pszStr, 0, strlen(pszStr) - 1);
}
int main()
{
    printf("         去重全排列的递归实现\n");
    printf("  --by MoreWindows( http://blog.csdn.net/MoreWindows )--\n\n");
    char szTextStr[] = "122";
    printf("%s的全排列如下:\n", szTextStr);
    Foo(szTextStr);
    return 0;
}
