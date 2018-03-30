#include <numeric>
#include <iostream>
#include <vector>
#include <functional>
int main()
{
    std::vector<int> a{0, 1, 2, 3, 4, 8, 9};
    std::vector<int> b{5, 4, 2, 3, 2, 4, 9};
 
    // 先 * 再 +
    int r1 = std::inner_product(a.begin(), a.end(), b.begin(), 0);
    std::cout << "Inner product of a and b: " << r1 << '\n';
 
    // 先 equal_to 再 plus   计数同位置相等的元素对
    int r2 = std::inner_product(a.begin(), a.end(), b.begin(), 0,
                                std::plus<>(), std::equal_to<>());
    std::cout << "Number of pairwise matches between a and b: " <<  r2 << '\n';

    // 先 equal_to 再 plus   计数同位置相等的元素对
    int r3 = std::inner_product(a.begin(), a.end(), b.begin(), 0,
                                std::plus<>(), [](auto e1, auto e2){ return e1 == e2*2;});
    std::cout << "Number of a = 2b matches between a and b: " <<  r3 << '\n';
}
