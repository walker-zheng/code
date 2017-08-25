// bitset::test
#include <iostream>       // std::cout
#include <string>         // std::string
#include <cstddef>        // std::size_t
#include <bitset>         // std::bitset

int main ()
{
	std::bitset<16> shit;
	std::bitset<16> bar (0xfa2);
	std::bitset<16> foo (std::string("0101111001"));

	std::cout << "shit: \t" << shit << '\n';
	std::cout << "bar: \t" << bar << '\n';
	std::cout << "f: \t" << foo << '\n';
	std::cout << "flip f:\t" << foo.flip() << '\n';
	std::cout << "test f:\t";
	for (std::size_t i=0; i<foo.size(); ++i)
		std::cout << foo.test(foo.size() - 1 - i) << ' ';

	std::cout << std::endl;
	std::cout << "to_str:\t" << foo.to_string() << std::endl;
	std::cout << "to_ul:\t" << foo.to_ulong() << std::endl;
	std::cout << "to_ull:\t" << foo.to_ullong() << std::endl;
	std::cout << std::boolalpha;
	std::cout << "all: \t" << foo.all() << '\n';
	std::cout << "any: \t" << foo.any() << '\n';
	std::cout << "none: \t" << foo.none() << '\n';
	std::cout << "ones: \t" << foo.count() << '\n';
	std::cout << "zeros: \t" << (foo.size()-foo.count()) << '\n';
	std::cout << "set: \t" << foo.set() << '\n';
	std::cout << "reset: \t" << foo.reset() << '\n';

	return 0;
}
