#include <stdio.h>
int A[1000];
int i;
int sum;
void f(int a,int b,int m)
{
    if(a==0&&b!=0)
    {

        return;
    }
    if(a==0&&b==0)
    {
        for(int k=0;k<i;k++)
            printf("%d  ",A[k]);
        printf("\n");
        return ;
    }
    for(int j=m;j<sum;j++)
    {
        A[i-a]=j;
        f(a-1,b-j,j);
    }
    A[i-a]=0;
}
int main()
{
    printf("input i:\n");
    scanf("%d",&i);
    printf("input sum:\n");
    scanf("%d",&sum);

    for(int h=0;h<i;h++)
    {
        A[h]=0;
    }
    f(i,sum,1);
}
