#include <functional>
#include <iostream>

template<typename... ARGS>
class Func
{
	std::function<void(ARGS...)> m_f;
	public:
	Func(std::function<void(ARGS...)> f) : m_f(f) {}
	void operator()(ARGS... args) const { m_f(args...); }
};

template<typename... ARGS>
Func<ARGS...> MakeFoo(void(*f)(ARGS...)) { return Func<ARGS...>(f); }

void func1(double * a1, double * a2, double * b)
{
	//do something
	std::cout << *a1 << " " << *a2 << " " << *b << std::endl;
}

int main(void)
{
	auto func1_functor = MakeFoo(func1);
	double a1[3] = { 2., 3., 4. };
	double a2[3] = { 2.2, 3.2, 4.2 };
	double b[3] = { 1.5, 2.5, 3.5 };
	func1_functor(a1, a2, b);
	func1_functor(a1 + 1, a2 + 1, b + 1);
	func1_functor(a1 + 2, a2 + 2, b + 2);
	return 0;
}
