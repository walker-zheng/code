#include <iostream>
#include <vector>
#include <future>
#include <chrono>
#include "ThreadPool.h"

using namespace std;

int main()
{
    auto timeout = std::chrono::seconds(2);
    ThreadPool pool(4);
    std::vector<std::future<int>> result;
    for(auto i : {1, 2, 3, 4, 5})
        result.emplace_back(pool.enqueue([=]()
        { 
            // std::cout << std::to_string(i) + " start\n";
            std::this_thread::sleep_for(std::chrono::seconds(i)); 
            // std::cout << std::to_string(i) + " done\n";
            return i;
        }));
    int i = 0;
    for(auto & fut: result)
    {
        i++;
        std:async(std::launch::async, [&]()
        {
            auto status = fut.wait_for(timeout);
            if( status == std::future_status::ready)
            {
                std::cout << std::to_string(fut.get()) + " result\n";
            }
            else if (status == std::future_status::timeout) 
            {
                std::cout <<  std::to_string(i) + " timeout\n";
            }
            else if (status == std::future_status::deferred) {
                std::cout << std::to_string(i) + " deferred\n";
            } 
        });
    }
    return 0;
}