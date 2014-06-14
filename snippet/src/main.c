#include<stdio.h>
#include <stdlib.h>


int a[100];
 
void prt(int n)
{
    int i;
    for(i=1;i<=n;i++)
      printf("%d ",a[i]);
}
 
void quicksort(int a[],int l,int h)
{
   if (l>=h)return ;
   int j ,i,key;
   i=l;j=h;key=a[i];
   while(i<j)
     {
        while(i<j&&a[j]>key)j--;
        if (i<j) a[i++]=a[j];
        while (i<j&&a[i]<key)i++;
        if (i<j) a[j--]=a[i];
     }
    a[i]=key;
    if (l<i-1)
        quicksort(a,l,i-1);
    if (i+1<h)
        quicksort(a,i+1,h);
 
}
int main()
{
    int i,n;
    scanf("%d",&n);
    for(i=1;i<=n;i++)
      scanf("%d",&a[i]);
    quicksort(a,1,n);
    prt(n);
    scanf("%d",&a[i]);
    
    system("PAUSE");	
    return 0;
}
