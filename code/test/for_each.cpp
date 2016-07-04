// transform algorithm example
#include <iostream>     // std::cout
#include <algorithm>    // std::transform
#include <vector>       // std::vector
#include <functional>   // std::plus

int op_increase(int i) { return ++i; }
template <class InputIterator, class OutputIterator, class UnaryOperator>
OutputIterator transform_s(InputIterator first1, InputIterator last1,
    OutputIterator result, UnaryOperator op)
{
    while (first1 != last1)
    {
        *result = op(*first1);  // or: *result=binary_op(*first1,*first2++);
        ++result;
        ++first1;
    }

    return result;
}
template<class InputIterator, class OutputIterator>
OutputIterator copy_s(InputIterator first, InputIterator last, OutputIterator result)
{
    while (first != last)
    {
        *result = *first;
        ++result;
        ++first;
    }

    return result;
}
template<class InputIterator, class Function>
Function for_each_s(InputIterator first, InputIterator last, Function fn)
{
    while (first != last)
    {
        fn(*first);
        ++first;
    }

    return fn;      // or, since C++11: return move(fn);
}
int main()
{
    std::vector<int> foo;
    std::vector<int> bar;

    // set some values:
    for (int i = 1; i < 6; i++)
    {
        foo.push_back(i * 10);    // foo: 10 20 30 40 50
    }

    bar.resize(foo.size());                         // allocate space
    for_each_s(std::begin(foo), std::end(foo), [](auto elem) {std::cout << elem << " "; });
    std::cout << std::endl;
    transform_s(foo.begin(), foo.end(), bar.begin(), op_increase);
    for_each_s(std::begin(bar), std::end(bar), [](auto elem) {std::cout << elem << " "; });
    std::cout << std::endl;
    // bar: 11 21 31 41 51
    // std::plus adds together its two arguments:
    copy_s(foo.begin(), foo.end(), bar.begin());
    // foo: 21 41 61 81 101
    for_each_s(std::begin(bar), std::end(bar), [](auto elem) {std::cout << elem << " "; });
    std::cout << std::endl;
    return 0;
}