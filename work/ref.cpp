#include <thread>
#include <iostream>
#include <functional> // for std::ref

class PrintThis
{
	public:
		void operator()() const
		{
			std::cout<<"this="<<this<<std::endl;
		}
};

void increment(int& i)
{
	++i;
}
void test_ref()
{
	int x=42;
	std::thread t(increment,std::ref(x));
	t.join();
	std::cout<<"x="<<x<<std::endl;
	//	std::thread t_2(increment,x);
	//	t_2.join();
	//	std::cout<<"x="<<x<<std::endl;
}
int main()
{
	PrintThis x;
	x();
	std::thread t(std::ref(x));
	t.join();
	std::thread t2(x);
	t2.join();

	test_ref();

}
