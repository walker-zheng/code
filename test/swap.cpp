#include <iostream>
#include <vector>

int main()
{
    std::vector<int> foo(3, 100);   // three ints with a value of 100
    std::vector<int> bar(5, 200);   // five ints with a value of 200

    foo.swap(bar);

    std::cout << "foo contains:";
    for(unsigned i = 0; i < foo.size(); i++)
    { std::cout << ' ' << foo[i]; }
    std::cout << '\n';

    std::cout << "bar contains:";
    for(unsigned i = 0; i < bar.size(); i++)
    { std::cout << ' ' << bar[i]; }
    std::cout << '\n';
    std::vector<int> vec(100000, 0);
    for(int i = 0; i < 100000 - 2; ++i) { vec.pop_back(); }
    std::cout << vec.capacity() << std::endl;
    // 等价 std::vector<int>(vec).swap(vec);
    vec.shrink_to_fit();
    std::cout << vec.capacity() << std::endl;

    return 0;
}
