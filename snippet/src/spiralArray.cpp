#include <iostream>
#include <time.h>
using namespace std;
void SpiralArray(int size, int** ar)
{   
    int a=size/2*2+1;//保证边长为奇数
    int y=a/2,x=a/2;//从中心点开始
    for (int i=1;i<=size*size;i++)//(int i=size*size;i>=1;i--)
    {
        if (x<=a-y-1&&x>=y)
        {
            ar[y][x]=i;
            x++;
        }
        else if (x>a-y-1&&x>y)
        {
            ar[y][x]=i;
            y++;
        }      
        else if (x>a-y-1&&x<=y)
        {
            ar[y][x]=i;
            x--;
        }
        else if (x<=a-y-1&&x<y)
        {
            ar[y][x]=i;
            y--;
        }
    }
}
int main()
{
    int n;
    do
    {
        cout<<"Please input a number(\"0\" is exit):";
        cin>>n;
        if (n==0)break;
     
        int a=n/2*2+1;//保证边长为奇数
        int **g=new int *[a];
        for (int i=0;i<a;i++)
            g[i]=new int[a];
        for (int p=0;p<a;p++)
            for (int q=0;q<a;q++)
                g[p][q]=0;
         
         
 
        clock_t start,finish;
        start = clock();
 
        SpiralArray(n, g);
 
        finish = clock();
        double duration = (double)(finish - start) / CLOCKS_PER_SEC;
        printf( "%f seconds\n", duration );
 
        char c;
        // cout<<"Output ?(y/n):";
        // cin>>c;
        // if ('n'==c)continue;
        int ws=2;
        if (n*n/100>=1)
            ws=4;
        else if (n*n/10>=1)
            ws=3;
        for (int y=0;y<a;y++)
        {
            for (int x=0;x<a;x++)
            {
                if (g[y][x]==0)
                {
                    cout.width(ws);
                    cout<<' ';
                }
                else
                {
                    cout.width(ws);
                    cout<<g[y][x];
                }
            }
            cout<<endl;
        }
 
        for (int i=0;i<a;i++)
        {
            delete g[i];
            g[i]=NULL;
        }
        delete g;
        g=NULL;
    }
    while (1);
    return 0;
}
