#include <iostream>

int64_t sum = 0;
void hello()
{
    std::cout << "\t" << ++sum << std::flush;
    return hello();
}
int main()
{
    hello();
    return 0;
}