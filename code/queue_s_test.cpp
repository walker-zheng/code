#include <iostream>
#include <thread>
#include <memory>
#include <random>
#include <chrono>
#include <stdio.h>
#include "queue_s.h"


int main ()
{
	std::random_device rd;
	std::mt19937 mt(rd());
	threadsafe_queue<int> queue_int;
	int sum_enq_1 = 0;
	int sum_enq_2 = 0;
	int sum_deq		= 0;
	std::thread en_queue_1 = std::thread(
		[&](threadsafe_queue<int>& queue, int & sum)
	{
		for (int i = 0; i < 20; i++)
		{
			queue.push(i);
			printf("<<%d\n", i);
			std::flush(std::cout);
			sum++;
			//std::cout << "<<" << i << std::endl; std::flush(std::cout);
			//std::this_thread::sleep_for(std::chrono::microseconds(mt()));
		}
	}
		, std::ref(queue_int), std::ref(sum_enq_1));
	std::thread de_queue = std::thread(
		[&](threadsafe_queue<int> & queue, int & sum)
	{
		while (true)
		{
			std::shared_ptr<int> tmp = queue.wait_and_pop();
			printf(">>%d\n", *tmp);
			std::flush(std::cout);
			sum++;
			//std::cout << ">>" << *tmp << std::endl; std::flush(std::cout);
			//std::this_thread::sleep_for(std::chrono::microseconds(mt()));
		}
	}
	, std::ref(queue_int), std::ref(sum_deq));
	std::thread en_queue_2 = std::thread(
		[&](threadsafe_queue<int>& queue, int & sum)
	{
		for (int i = 0; i < 20; i++)
		{
			queue.push(i);
			printf("<<=%d\n", i);
			std::flush(std::cout);
			sum++;
			//std::cout << "<<" << i << std::endl; std::flush(std::cout);
			//std::this_thread::sleep_for(std::chrono::microseconds(mt()));
		}
	}
	, std::ref(queue_int), std::ref(sum_enq_2));
	en_queue_1.join();
	en_queue_2.join();
	de_queue.join();
	std::cout << "[" << sum_enq_2 << "," << sum_enq_2 << "," << sum_deq << "]" << std::endl;
	return 0;
}
