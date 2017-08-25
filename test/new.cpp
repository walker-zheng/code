// new_handler example
#include <iostream>     // std::cout
#include <cstdlib>      // std::exit
#include <new>          // std::set_new_handler
#include <vector>

void no_memory () {
	std::cout << "Failed to allocate memory!\n";
	std::exit (1);
}

int main () {
	std::set_new_handler(no_memory);
	std::vector<char*> vc(100, nullptr);
	for	(auto & it : vc)
	{
		std::cout << "Attempting to allocate 1 GiB...";
		it = new char [1024*1024*1024];
		std::cout << "Ok\n";
	}
	for	(auto & it : vc)
	{
		delete[] it; 
		it = nullptr;
	}
	return 0;
}
