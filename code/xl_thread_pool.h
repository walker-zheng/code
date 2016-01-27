#ifndef SRC_COMMON_THREAD_POOL_H_
#define SRC_COMMON_THREAD_POOL_H_
#include <boost/thread.hpp>
#include <boost/shared_ptr.hpp>
#include <boost/noncopyable.hpp>

#include <vector>
#include "xl_blocking_queue.h"

typedef boost::function<void (void)> thread_do_func;

class xl_thread_pool
:boost::noncopyable
{
	public:
		xl_thread_pool(int thread_num)
			:num_(thread_num), run_(false)
		{

		}
		~xl_thread_pool()
		{
			if (run_)
			{
				stop();
			}
		}

		void start()
		{
			if (num_ <= 0) return;
			int i = 0;
			run_ = true;
			for(i=0;i<num_;i++)
			{
				boost::shared_ptr<boost::thread> thread(new boost::thread(boost::BOOST_BIND(&xl_thread_pool::run, this)));
				thread_arr_.push_back(thread);
			}
		}

		void stop()
		{
			run_ = false;
			queue_.notify_all();
		}

		void post(const thread_do_func& task)
		{
			if (thread_arr_.size() == 0)
			{
				task();
			}
			else
			{
				queue_.put(task);
			}
		}
	private:
		xl_blocking_queue<thread_do_func> queue_;
		std::vector<boost::shared_ptr<boost::thread> > thread_arr_;
		int num_;
		bool run_;

		void run()
		{
			while(run_)
			{
				thread_do_func task = queue_.get();
				task();
			}
		}
};


#endif
