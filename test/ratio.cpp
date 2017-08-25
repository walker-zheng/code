// ratio_add example
#include <iostream>
#include <ratio>
#include <string>

using std::to_string;
template<typename T>
std::string to_string()
{
    return to_string(T::num) + "/" + to_string(T::den);
}
int main ()
{
    typedef std::ratio<1, 2> _1r2;
    typedef std::ratio<1, 3> _1r3;
    typedef std::ratio_add<_1r2, _1r3> _add;
    typedef std::ratio_divide<_1r2, _1r3> _div;
    typedef std::ratio_multiply<_1r2, _1r3> _mut;
    typedef std::ratio_subtract<_1r2, _1r3> _sub;
    typedef std::ratio_equal<_1r2, _1r3> _eq;
    typedef std::ratio_not_equal<_1r2, _1r3> _neq;
    typedef std::ratio_greater<_1r2, _1r3> _gt;
    typedef std::ratio_greater_equal<_1r2, _1r3> _ge;
    typedef std::ratio_less<_1r2, _1r3> _lt;
    typedef std::ratio_less_equal<_1r2, _1r3> _le;
    std::cout << to_string<_1r2>() << " ? " << to_string<_1r3>() << std::endl;
    std::cout << "add\t" << to_string<_add>() << std::endl;
    std::cout << "sub\t" << to_string<_sub>() << std::endl;
    std::cout << "mut\t" << to_string<_mut>() << std::endl;
    std::cout << "div\t" << to_string<_div>() << std::endl;
    std::cout << "eq \t" << to_string(_eq::value) << std::endl;
    std::cout << "neq\t" << to_string(_neq::value) << std::endl;
    std::cout << "gt \t" << to_string(_gt::value) << std::endl;
    std::cout << "ge \t" << to_string(_ge::value) << std::endl;
    std::cout << "lt \t" << to_string(_lt::value) << std::endl;
    std::cout << "le \t" << to_string(_le::value) << std::endl;
    return 0;
}

