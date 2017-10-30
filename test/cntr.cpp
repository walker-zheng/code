#include <iostream>

struct constructor
{
    constructor(int callback, float when, bool duration = 0, double times = 0)
        : callback(callback), when(when), duration(duration), times(times)
    {
    }

    void operator()() const
    {
        std::cout << callback << "\t" << when << "\t" << duration << "\t" << times << std::endl;
    }

    int         callback;
    float       when;
    bool        duration;
    double      times;
};
int main()
{
    constructor hello(1, 2.2, true, 4.4);
    hello();
    return 0;
}
