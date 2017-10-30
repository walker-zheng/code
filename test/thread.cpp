#include <vector>
#include <atomic>
#include <thread>
#include <functional>
#include <iostream>

struct C : std::atomic<int>
{
    C() : std::atomic<int>(0) {}
    void increase_member(int n) { for (int i = 0; i < n; ++i) fetch_add(1); }
};
int main()
{

    std::vector<std::thread> threads;
    std::cout << "increase global counter with 10 threads...\n";
    C bar;

    for (int i = 1; i <= 10; ++i)
    {
        threads.push_back(std::thread(&C::increase_member, &bar, 1000));
    }


    for (int i = 1; i <= 10; ++i)
    {
        threads.push_back(std::thread(&C::increase_member, std::ref(bar), 1000));
    }

    for (auto& th : threads) { th.join(); }

    std::cout << "bar: " << bar << '\n';
    return 0;
}
