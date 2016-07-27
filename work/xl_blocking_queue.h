fndef SRC_COMMON_BLOCKING_QUEUE_H_
#define SRC_COMMON_BLOCKING_QUEUE_H_
#include <boost/thread.hpp>
#include <boost/noncopyable.hpp>
#include <queue>

template<typename T>
class xl_blocking_queue
:boost::noncopyable
{
    public:
        xl_blocking_queue()
            :mutex_(), queue_(), cond_()
        {

        }
        ~xl_blocking_queue(){}

        void put(const T& func)
        {
            boost::unique_lock<boost::mutex> lock(mutex_);
            queue_.push(func);
            cond_.notify_all();
        }

        T get()
        {
            boost::unique_lock<boost::mutex> lock(mutex_);
            if (queue_.size() == 0)
            {
                cond_.wait(lock);
            }
            T front(queue_.front());
            queue_.pop();
            return front;
        }

        unsigned size()
        {
            return queue_.size();
        }

        void notify_all()
        {
            cond_.notify_all();
        }
    private:
        std::queue<T> queue_;
        boost::condition_variable_any cond_;
        boost::mutex mutex_;
};


#endif
