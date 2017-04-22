#include <iostream>
#include <vector>
#include <thread>
#include <future>

using namespace std;

int main()
{
    std::vector<std::thread> pool;
    for(auto i : {1, 2, 3})
        pool.emplace_back([=]()
        { 
            std::this_thread::sleep_for(std::chrono::seconds(i)); 
            std::cout << "hello, world "<< i << std::endl;
        });
    for(auto & task: pool)
    {
        task.join();
    }
    return 0;
}