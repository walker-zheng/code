#include <stdio.h>
#include <mutex>
#include <thread>
#include <atomic>
#include <vector>
#include <algorithm>
#include <condition_variable>
#include <chrono>
#include <random>

int main()
{
	std::vector<std::thread> threads;
	std::condition_variable condition;
	std::mutex mutex;
	std::atomic<unsigned int> thread_count(0);
	std::mt19937 generator;

	for (int i = 0; i < 20; i++) {
		std::unique_lock<std::mutex> lock (mutex);
		condition.wait(lock, [&]{ return thread_count < 8; });
		// random sleep delay
		auto delay = generator() % 10000;

		std::thread t = std::thread([&, i, delay]() {
				printf("I am Thread #: %d with current thread count: %u\n", i, unsigned(thread_count));
				// ok to access the generator here because
				std::this_thread::sleep_for(std::chrono::milliseconds(delay));
				printf("I am Thread #: %d and I am done\n", i);

				// signal that this thread is done
				std::unique_lock<std::mutex> lock(mutex);
				thread_count--;
				condition.notify_one();
				});

		threads.push_back(std::move(t));
		thread_count++;
	}

	for (auto& t : threads) {
		t.join();
	}
	return 0;
}

