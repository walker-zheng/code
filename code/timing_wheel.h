#include <list>
#include <boost/shared_ptr.hpp>
#include <boost/thread.hpp>

namespace global
{
    typedef unsigned int uint;

    class TimeoutHandler
    {
    public:
        virtual ~TimeoutHandler() {}
        virtual void onTimeout() = 0;
    };

    class TimingWheel
    {
    public:
        TimingWheel();
        ~TimingWheel();

        void setTimer(uint inteval, boost::shared_ptr<TimeoutHandler> handler);
        void step();

    private:

        typedef boost::shared_ptr<TimeoutHandler> Handler;
        struct ListNode
        {
            uint inteval;
            Handler handler;
            ListNode(int inteval_, Handler handler_)
                : inteval_r(inteval_)
                , handler(handler_)
            {
            }
        };

        enum { BUCKET_CNT = 5 };
        uint newest[BUCKET_CNT];
        std::list<ListNode> * buckets[BUCKET_CNT];
        boost::recursive_mutex mtx;
    };

}