// test.cpp: 定义控制台应用程序的入口点。
//

#include <vector>
#include <iostream>
#include <algorithm>
#include <thread>

int sum(int a, int b)
{
    //函数调用 汇编堆栈信息
    std::cout << a << ":" << std::this_thread::get_id() << std::endl;
    getchar();
    return a + b;
}
void reserve()
{
    // 内存增长
    std::vector<int> vec;
    vec.reserve(10000000);
    for(auto i = 0; i != 10000000; ++i) {
        vec.push_back(i);
        //std::cout << vec.capacity() << std::endl;
    }
    //for(auto it = vec.begin(); it != vec.end(); ++it)
    //{std::cout << *it << std::endl; }
}
void thread()
{
    // 线程大小查看
    std::cout << "main:" << std::this_thread::get_id() << std::endl;
    std::vector<std::thread> tasks;
    for(auto i = 0; i != 10; i++) {
        tasks.emplace_back(&sum, i, 3);
    }
    for(auto & task : tasks) {
        task.join();
    }
}
int main()
{
    // thread();
    // sum(2, 3);
    //reserve();
    return 0;
}