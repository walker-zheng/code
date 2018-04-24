#include <iostream>
#include <vector>
#include <chrono>
#include <string>
#include <future>
#include <numeric>
#include <thread>
#include <algorithm>

#include "ThreadPool.h"

int sum_all(int n){
    int sum{0};
    for(auto i = 0; i != n; i++)
        sum +=i;
    return sum;
}
int main()
{
    std::vector<std::future<int>> fut;
    ThreadPool pool(8);
    for(int i = 0; i < 8; ++i) {
        fut.emplace_back(
            pool.enqueue([i]{
                std::cout << "hello " + std::to_string(i) << std::endl;
                std::this_thread::sleep_for(std::chrono::seconds(1));
                std::cout << "world " + std::to_string(i) << std::endl;
                return i*i;
        }));
    }
    // std::for_each(fut.begin(), fut.end(), [](auto & el){ std::cout << el.get() << std::endl;});
    for (auto && el : fut) 
    {
        std::cout << el.get() << std::endl;
    }
    return 0;
}
