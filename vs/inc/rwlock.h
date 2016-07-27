#pragma once
#include <tuple>
#include <deque>
#include <boost/thread/mutex.hpp>
#include <boost/thread/locks.hpp>
#include <boost/thread/condition_variable.hpp>


template <typename T>
class task_queue
{
	private:
		std::deque<T> tasks;
		boost::mutex tasks_mutex;
		boost::condition_variable cv;
	public:

		void add(const  T&  t)
		{
			boost::unique_lock<boost::mutex> lock(tasks_mutex);

			tasks.push_back(t);
			lock.unlock();
			cv.notify_one();
		}
		std::tuple<bool, T> get_nonblock()
		{
			boost::lock_guard<boost::mutex> lock(tasks_mutex);
			std::tuple<bool,T> ret;
			if (!tasks.empty())
			{
				ret=std::make_tuple(true,tasks.front());
				tasks.pop_front();
			}
			else
			{
				T tmp;
				ret=std::make_tuple(false,tmp);
			}
			return ret;
		}
		T get_block()
		{
			boost::unique_lock<boost::mutex> lock(tasks_mutex);
			while (tasks.empty())
			{
				cv.wait(lock);
			}
			T ret=tasks.front();
			tasks.pop_front();
			return ret;
		}

};
