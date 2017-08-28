// make_move_iterator example
#include <iostream>     // std::cout
#include <iterator>     // std::make_move_iterator
#include <vector>       // std::vector
#include <deque>
#include <list>
#include <string>       // std::string
#include <algorithm>    // std::copy

int inserter_test()
{
	std::list<int> foo,bar;
	for (int i=1; i<=5; i++)
	{ foo.push_back(i); bar.push_back(i*10); }

	std::list<int>::iterator it = foo.begin();
	advance (it,3);

	std::copy (bar.begin(),bar.end(),std::inserter(foo,it));

	std::cout << "[list](insert/inserter):\n";
	for ( std::list<int>::iterator it = foo.begin(); it!= foo.end(); ++it )
		std::cout << ' ' << *it;
	std::cout << '\n';
	return 0;
}
int front_test()
{
	std::deque<int> foo,bar;
	for (int i=1; i<=5; i++)
	{ foo.push_back(i); bar.push_back(i*10); }

	std::copy (bar.begin(),bar.end(),std::front_inserter(foo));

	std::cout << "[deque](push_front/front_inserter):\n";
	for ( std::deque<int>::iterator it = foo.begin(); it!= foo.end(); ++it )
		std::cout << ' ' << *it;
	std::cout << '\n';
	return 0;
}
int main () {
	inserter_test();
	front_test();
	std::vector<std::string> foo;
	std::vector<std::string> bar {"one","two","three"};

	std::cout << "[vector](push_back/back_inserter):\n";
	std::copy ( bar.begin(), bar.end(), back_inserter(foo) ); 
	for (std::string& x : foo) std::cout << ' ' << x;
	std::cout << '\n';


	std::cout << "[vector](move/make_move_iterator):\n";
	foo.clear();
	foo.resize(3);			// 需要预分配大小
	std::copy ( make_move_iterator(bar.begin()),
			make_move_iterator(bar.end()),
			foo.begin() );
	// bar now contains unspecified values; clear it:
	bar.clear();

	for (std::string& x : foo) std::cout << ' ' << x;
	std::cout << '\n';

	return 0;
}
