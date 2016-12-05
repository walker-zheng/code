#include <iostream>

int main()
{
	std::vector<int> intVector;

	intVector.push_back(1);
	intVector.push_back(2);

	auto v = map_container(intVector, [] (int value) { return value + 1; });

	for (int i : v) { std::cout << i << " "; }
}

