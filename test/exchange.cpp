// atomic::exchange example
#include <iostream>       // std::cout
#include <atomic>         // std::atomic
#include <thread>         // std::thread
#include <vector>         // std::vector

std::atomic<bool> ready (false);
std::atomic<bool> connected (false);

void change(bool status) {
	if (connected.exchange(status) != status) { 
		if (status)
			std::cout << "changed " << status << "\n"; 
		else 
			std::cout << "changed " << status << "\n"; 
	}
};

int main ()
{
	std::vector<std::thread> threads;
	std::cout << "spawning 10 threads that count to 1 million...\n";
	for (int i=1; i<=1000; ++i) threads.push_back(std::thread(change, (bool)(i%2)));
	for (auto& th : threads) th.join();

	return 0;
}
