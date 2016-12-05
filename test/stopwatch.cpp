#include <iostream>
#include <cmath>
#include "stopwatch.h"

int main()
{
    const int iterations = 1000000;
    double sqrtsum = 0;
    Stopwatch<> sw;
    for (int i=0; i<iterations; ++i)
        sqrtsum += sqrt(i);
    std::cout << "calculated " << sqrtsum << " in " << sw.restart() << " us\n";
    sqrtsum = 0;
    for (int i=0; i<iterations; ++i)
        sqrtsum += pow(i,0.5);
    std::cout << "calculated " << sqrtsum << " in " << sw.stop() << " us\n";
}

