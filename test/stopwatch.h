#ifndef STOPWATCH_H
#define STOPWATCH_H
#include <chrono>

template<typename TimeT = std::chrono::microseconds,
    typename ClockT=std::chrono::high_resolution_clock,
    typename DurationT=double>
    class Stopwatch
{
    private:
        std::chrono::time_point<ClockT> _start, _end;
    public:
        Stopwatch();
        void start();
        DurationT restart();
        DurationT stop();
        DurationT elapsed() const;
};

template<typename TimeT, typename ClockT, typename DurationT>
Stopwatch<TimeT, ClockT, DurationT>::Stopwatch()
{
    start();
}

template<typename TimeT, typename ClockT, typename DurationT>
void Stopwatch<TimeT, ClockT, DurationT>::start()
{
    _start = _end = ClockT::now();
}

template<typename TimeT, typename ClockT, typename DurationT>
DurationT Stopwatch<TimeT, ClockT, DurationT>::stop()
{
    _end = ClockT::now();
    return elapsed();
}

template<typename TimeT, typename ClockT, typename DurationT>
DurationT Stopwatch<TimeT, ClockT, DurationT>::restart()
{
    DurationT ret = stop();
    start();
    return ret;
}

template<typename TimeT, typename ClockT, typename DurationT>
DurationT Stopwatch<TimeT, ClockT, DurationT>::elapsed() const
{
    auto delta = std::chrono::duration_cast<TimeT>(_end-_start);
    return delta.count();
}
#endif

