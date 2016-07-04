// accessing mapped values
#include <iostream>
#include <map>
#include <string>

int main ()
{
	std::map<char,std::string> mymap;

	mymap['a']="an element";
	mymap['b']="another element";
	mymap['c']=mymap['b'];

	std::cout << "mymap['a'] is " << mymap['a'] << '\n';
	std::cout << "mymap['b'] is " << mymap['b'] << '\n';
	std::cout << "mymap['c'] is " << mymap['c'] << '\n';
	std::cout << "mymap['d'] is " << mymap['d'] << '\n';

	std::cout << "mymap now contains " << mymap.size() << " elements.\n";

	std::map<char,bool> b_map;
	b_map['a']=true;
	b_map['b']=false;
	std::cout << "b_map['a'] is " << b_map['a'] << '\n';
	std::cout << "b_map['b'] is " << b_map['b'] << '\n';
	std::cout << "b_map['c'] is " << b_map['c'] << '\n';
	std::cout << "b_map['c'] is " << b_map['d'] << '\n';
	std::cout << "b_map['c'] is " << b_map['e'] << '\n';
	std::cout << "b_map['c'] is " << b_map['f'] << '\n';
	std::cout << "b_map['c'] is " << b_map['z'] << '\n';
	return 0;
}
