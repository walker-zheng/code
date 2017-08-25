// duration constructor
#include <iostream>
#include <ratio>
#include <chrono>

int main ()
{
    typedef std::chrono::duration<int> seconds_type;
    typedef std::chrono::duration<int,std::milli> milliseconds_type;
    typedef std::chrono::duration<int,std::micro> microseconds_type;
    typedef std::chrono::duration<int,std::nano>  nanoseconds_type;
    typedef std::chrono::duration<int,std::ratio<24*60*60>> days_type;
    typedef std::chrono::duration<int,std::ratio<60*60>> hours_type;
    typedef std::chrono::duration<int,std::ratio<60>> mins_type;

    hours_type h_oneday (24);                  // 24h
    mins_type min_oneday (60*24);              // 86400s
    seconds_type s_oneday (60*60*24);          // 86400s
    milliseconds_type ms_oneday (s_oneday);
    milliseconds_type ms_onesec (seconds_type(1));
    microseconds_type us_onesec (seconds_type(1));
    nanoseconds_type ns_onesec (seconds_type(1));

    seconds_type s_onehour (60*60);            // 3600s
    //hours_type h_onehour (s_onehour);          // NOT VALID (type truncates), use:
    hours_type h_onehour (std::chrono::duration_cast<hours_type>(s_onehour));
    milliseconds_type ms_onehour (s_onehour);  // 3600000ms (ok, no type truncation)

    std::cout << "1s:\t" << ms_onesec.count() << "ms\t" << us_onesec.count() << "us\t" << ns_onesec.count() << "ns\t" << std::endl;
    std::cout << "1day:\t" << h_oneday.count() << "h\t" << min_oneday.count() << "min\t\t" << s_oneday.count() << "s\t\t" << ms_oneday.count() << "ms\t" << std::endl;

    std::cout << "duration:\t" << "\n";
    std::cout << "\tzero:\t" << seconds_type::zero().count() << "\n";
    std::cout << "\tmin:\t" << seconds_type::min().count() << "\n";
    std::cout << "\tmax:\t" << seconds_type::max().count() << "\n";
    std::cout << "system_clock:\t" << "\n";
    std::cout << "\tzero:\t" << std::chrono::system_clock::duration::zero().count() << "\n";
    std::cout << "\tmin: \t" << std::chrono::system_clock::duration::min().count() << "\n";
    std::cout << "\tmax: \t" << std::chrono::system_clock::duration::max().count() << "\n";


    return 0;
}
