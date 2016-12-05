#include<iostream>
#include<vector>
using namespace std;

int min3(int a,int b,int c)
{
    int tmp=(a<b?a:b);
    return (tmp<c?tmp:c);
}
int main()
{
    vector<int> uglyNum;
    uglyNum.push_back(1);  //初始只有1在数组中
    int t2=0,t3=0,t5=0; //每个因子开始相乘的下标位置
    int i,j,k;
    while(uglyNum.size()!=1500)
    {
        int m2,m3,m5;  //保存每个因子得到的值
        for(i=t2;i<uglyNum.size();i++)
            if(2*uglyNum[i]>uglyNum.back())
            {
                m2=2*uglyNum[i];
                break;
            }
        for(j=t3;j<uglyNum.size();j++)
            if(3*uglyNum[j]>uglyNum.back())
            {
                m3=3*uglyNum[j];
                break;
            }
        for(k=t5;k<uglyNum.size();k++)
            if(5*uglyNum[k]>uglyNum.back())
            {
                m5=5*uglyNum[k];
                break;
            }
        int tmp = min3(m2,m3,m5);
        uglyNum.push_back(tmp);
        if(tmp==m2)
            t2=i+1;  //下标位置进行更新
        if(tmp==m3)
            t3=j+1;
        if(tmp==m5)
            t5=k+1;
    }
    for(int i=0;i<uglyNum.size();i++)
        cout<<uglyNum[i]<<" ";
    cout<<endl;
    return 0;
}
