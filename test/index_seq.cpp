#include <iostream>
#include <tuple>
#include <utility>
 
template<typename Func, typename Tup, std::size_t... index>
decltype(auto) invoke_helper(Func&& func, Tup&& tup, std::index_sequence<index...>)
{
    return func(std::get<index>(std::forward<Tup>(tup))...);
}
 
template<typename Func, typename Tup>
decltype(auto) invoke(Func&& func, Tup&& tup)
{
    constexpr auto Size = std::tuple_size<typename std::decay<Tup>::type>::value;
    return invoke_helper(std::forward<Func>(func),
                         std::forward<Tup>(tup),
                         std::make_index_sequence<Size>{});
}
 
void foo(int a, const std::string& b, float c)
{
    std::cout << a << " , " << b << " , " << c << '\n';
}
 
int main()
{
    auto args = std::make_tuple(2, "Hello", 3.5);
    invoke(foo, args);
}
