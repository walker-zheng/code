// type_index example
#include <iostream>       // std::cout
#include <typeinfo>       // operator typeid
#include <typeindex>      // std::type_index
#include <unordered_map>  // std::unordered_map
#include <string>         // std::string
#include <vector>

struct C {};

int main()
{
	using std::string;
	std::unordered_map<std::string,std::string> mytypes;
	struct A{int a;};
	std::vector<int> vi;
	std::vector<A> va;
	mytypes[string(typeid(vi).name())]=string(typeid(vi).name());
	mytypes[string(typeid(va).name())]=string(typeid(va).name());

	for (auto it : mytypes)
	{
		std::cout << it.first << "\t" << it.second << '\n';
	}

	return 0;
}
