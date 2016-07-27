#include "timing_wheel.h"
#include "xassert.h"
#include <stdexcept>
#include <vector>

namespace global
{
    static const uint ELEMENT_CNT_PER_BUCKET[] = { 256, 64, 64, 64, 64 };
    static const uint RIGHT_SHIFT_PER_BUCKET[] = { 8, 6, 6, 6, 6 };
    static const uint BASE_PER_BUCKET[] = { 1, 256, 256 * 64, 256 * 64 * 64, 256 * 64 * 64 * 64 };

    TimingWheel::TimingWheel()
    {
        for (int bucket_no = 0; bucket_no < BUCKET_CNT; bucket_no++)
        {
            newest[bucket_no] = 0;
            buckets[bucket_no] = new std::list<ListNode>[ELEMENT_CNT_PER_BUCKET[bucket_no]];
        }
    }

    TimingWheel::~TimingWheel()
    {
        for (int bucket_no = 0; bucket_no < BUCKET_CNT; bucket_no++)
        {
            delete[] buckets[bucket_no];
        }
    }

    void TimingWheel::setTimer(uint inteval, boost::shared_ptr<TimeoutHandler> handler)
    {
        boost::recursive_mutex::scoped_lock lock(mtx);
        XASSERT(inteval > 0);
        uint bucket_no = 0;
        uint offset = inteval;
        uint left = inteval;

        while (offset >= ELEMENT_CNT_PER_BUCKET[bucket_no])
        {
            offset >>= RIGHT_SHIFT_PER_BUCKET[bucket_no];
            left -= BASE_PER_BUCKET[bucket_no] * (ELEMENT_CNT_PER_BUCKET[bucket_no] - newest[bucket_no] - (bucket_no == 0 ? 0 : 1));
            ++bucket_no;
        }

        XASSERT(offset >= 1);
        XASSERT(inteval >= BASE_PER_BUCKET[bucket_no] * offset);
        left -= BASE_PER_BUCKET[bucket_no] * (offset - 1);
        uint pos = (newest[bucket_no] + offset) % ELEMENT_CNT_PER_BUCKET[bucket_no];
        buckets[bucket_no][pos].push_back(ListNode(left, handler));
    }

    void TimingWheel::step()
    {
        std::vector<Handler> handlers;
        {
            boost::recursive_mutex::scoped_lock lock(mtx);

            for (int bucket_no = 0; bucket_no < BUCKET_CNT; bucket_no++)
            {
                newest[bucket_no] = (newest[bucket_no] + 1) % ELEMENT_CNT_PER_BUCKET[bucket_no];
                std::list<ListNode> & cur_list(buckets[bucket_no][newest[bucket_no]]);

                while (!cur_list.empty())
                {
                    if (bucket_no == 0 || cur_list.front().inteval == 0)
                    {
                        handlers.push_back(cur_list.front().handler);
                    }
                    else
                    {
                        setTimer(cur_list.front().inteval, cur_list.front().handler);
                    }

                    cur_list.pop_front();
                }

                if (newest[bucket_no] != 0)
                {
                    break;
                }
            }
        }

        for (std::size_t i = 0; i < handlers.size(); i++)
        {
            handlers[i]->onTimeout();
        }
    }
}