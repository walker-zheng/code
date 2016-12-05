#include<iostream>
using namespace std;
template<int N,int M>
class A
{
	public:
		enum{ mid = (N+M) /2};
		static const int result = M+ A<N, mid>::result+A<mid,M-1>::result;
		//这里运用了二分法大大的减少了递归的深度。
		//哈哈，这里任意大的数字都不会报错了，因为这里类似于完全二叉树的形式
		//递归下去，深度减少，运算的数字可以很大，只不过花费的时间比较多，像
		//我用20000来测试，大概等了30秒钟。我劝大家不要测试太大的数字，虽然
		//不会报错，但是对资源消耗的过多会使电脑卡死，我卡死2次，用200000测试的。
};
template<int M>
class A<M,M>
{
	public:
		static const int result = 0;
};
int main()
{
	cout << A<0, 50000>::result << endl;
	return 0;
}
