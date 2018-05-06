#include <algorithm>
#include <iostream>
#include <iterator>
#include <vector>
#include <forward_list>

template <class ForwardIt>
void quicksort(ForwardIt first, ForwardIt last)
{
    if(first == last) {return;}
    auto pivot = *std::next(first, std::distance(first, last) / 2);
    ForwardIt middle1 = std::partition(first, last, [pivot](const auto & em) {return em < pivot;});
    ForwardIt middle2 = std::partition(middle1, last, [pivot](const auto & em) {return !(pivot < em);});
    quicksort(first, middle1);
    quicksort(middle2, last);
}
struct Print
{
    template <typename T>
    static T && apply(T && v)
    {
        for(auto & i : v) {
            std::cout << i << " ";
        }
        std::cout << std::endl;
        return v;
    }
} print;
struct Sort
{
    template <typename T>
    static T && apply(T && v)
    {
        std::sort(v.begin(), v.end());
        return v;
    }
} sort;
struct Reverse
{
    template <typename T>
    static T && apply(T && v)
    {
        std::reverse(v.begin(), v.end());
        return v;
    }
} reverse;
struct Double
{
    template <typename T>
    static T && apply(T && v)
    {
        std::for_each(v.begin(), v.end(), [&](auto & e) { e = e * 2; });
        return v;
    }
} double_;
template <typename T, typename U>
T && operator|(T && v, U fn)
{
    U::apply(v);
    return v;
}
int main()
{
    std::vector<int> v = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };
    v | double_ | reverse | print;
    std::cout << "Original vector:\n    ";
    for(int elem : v) {std::cout << elem << ' ';}
    auto it = std::partition(v.begin(), v.end(), [](int i) {return i % 2 == 0;});
    std::cout << "\nPartitioned vector:\n    ";
    std::copy(std::begin(v), it, std::ostream_iterator<int> (std::cout, " "));
    std::cout << " * ";
    std::copy(it, std::end(v), std::ostream_iterator<int> (std::cout, " "));
    std::forward_list<int> fl = {1, 30, -4, 3, 5, -4, 1, 6, -8, 2, -5, 64, 1, 92};
    std::cout << "\nUnsorted list:\n    ";
    for(int n : fl) {std::cout << n << ' ';}
    std::cout << "\nSorted list:\n    ";
    quicksort(std::begin(fl), std::end(fl));
    // std::cout << "Sorted using quicksort:\n    ";
    for(int fi : fl) {std::cout << fi << ' ';}
    std::cout << '\n';
}
