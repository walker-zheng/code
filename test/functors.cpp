#include "stdafx.h"

#include "functors.h"
#include "ScopedLogMessage.h"
#include <iostream>

std::string shit()
{
    return "print shit";
}
struct world
{
    std::string operator()()
    {
        return "print world";
    }
};
int main(void)
{
    ScopedLogMessage msg("msg>", "msg start", "msg end");
    Functors<std::string, std::string, std::string, int> functors(msg);
    functors.connect("hello", [&](std::string nick, int age)
    {
        std::cout << "print hello, " << nick << ", R U" << age << "years old?" << std::endl;
        return "print hello";
    });
    //functors.connect("shit", shit);
    //functors.connect("world", world());
    //std::cout << functors.emit("hello") << std::endl;
    //std::cout << functors.emit("shit") << std::endl;
    //std::cout << functors.emit("world") << std::endl;
    return 0;
}