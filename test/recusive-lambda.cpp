#include<iostream>
template<typename Functor>
struct wrapper_type
{
	Functor functor;
	template<typename... Args>
		decltype(auto) operator()(Args&&... args) const&
		{
			return functor(functor, std::forward<Args>(args)...);
		}
};

template<typename Functor>
wrapper_type<typename std::decay<Functor>::type> wrapper(Functor&& functor)
{
	return{ std::forward<Functor>(functor) };
}

int main()
{
	auto fac = wrapper([&](auto&& self, int x)->int{
			return x < 1 ? 1 : x * self(self, x - 1);
			});
	std::cout << fac(3) << std::endl; //6
	return 0;
}
