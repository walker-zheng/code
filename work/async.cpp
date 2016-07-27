#include <future>
#include <iostream>
/// cp str
std::string copy_string(std::string const&s)
{
    return s;
}
int async_launch_ref_get()
{
    std::string s="hello";
    auto f=std::async(std::launch::deferred,
                      copy_string,std::ref(s));
    s="goodbye";
    std::cout<<f.get()<<" world!\n";
}
int async_launch_ref_get() {
    std::string s="hello";
    auto f=std::async(std::launch::deferred,
                      copy_string,s);
    s="goodbye";
    std::cout<<f.get()<<" world!\n";
}
int async_launch_ref_get() {
    std::string s="hello";
    auto f=std::async(std::launch::deferred,
                      [&s]()
    {
        return copy_string(s);
    });
    s="goodbye";
    std::cout<<f.get()<<" world!\n";
}
void write_message(std::string const& message)
{
    std::cout<<message;
}
///
int find_the_answer()
{
    return 42;
}


int async_launch_async()
{
    auto f=std::async(
               std::launch::async,
               write_message,
               "hello world from std::async\n");
    write_message("hello world from main\n");
    getchar();
    f.wait();
}

int async_launch_def_wait()
{
    auto f=std::async(
               std::launch::deferred,
               write_message,
               "hello world from std::async\n");
    write_message("hello world from main\n");
    getchar();
    f.wait();

}

int async_get()
{
    auto f=std::async(find_the_answer);
    std::cout<<"the answer is "<<f.get()<<"\n";
}
