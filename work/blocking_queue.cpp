#include <iostream>
#include <thread>
#include <future>
#include "blocking_queue.h"

int main (int argc, char* argv[])
{
	BlockingQueue<int> q;
	auto t1 = std::async (std::launch::async, [&q] () {
			for (int i = 0; i < 10; ++i) {
			q.Put (i);
			}
			});

	auto t2 = std::async (std::launch::async, [&q] () {
			while (q.Size ()) {
			std::cout << q.Take () << std::endl;
			}
			});

	auto t3 = std::async (std::launch::async, [&q] () {
			while (q.Size ()) {
			std::cout << q.Take () << std::endl;
			}
			});

	t1.wait ();
	t2.wait ();
	t3.wait ();

	return 0;
}
