#include <numeric>
#include <vector>
#include <iostream>
#include <functional>
 
int main()
{
    // 默认实现——二个项之间的差
 
    std::vector<int> v{2, 4, 6, 8, 10, 12, 14, 16, 18, 20};
    std::adjacent_difference(v.begin(), v.end(), v.begin());
 
    for (auto n : v) {
        std::cout << n << ' ';
    }
    std::cout << '\n';
 
    // 斐波那契
    // 注意，列表中下一项是当前迭代的结果
 
    v = std::vector<int>(10);
    v[0] = 1;
 
    std::adjacent_difference(v.begin(), v.end() - 1, v.begin() + 1, std::plus<int>());
 
    for (auto n : v) {
        std::cout << n << ' ';
    }
    std::cout << '\n';
}
