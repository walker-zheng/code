#include <string>
#include <iostream>
using namespace std;

struct emitter {
	string str;
	emitter(const string& s) : str(s) { cout << "Created " << str << endl; }
	~emitter() { cout << "Destroyed " << str << endl; }
};

void foo(bool skip_first)
{
	if (!skip_first)
		static emitter a("in if");
	static emitter b("in foo");
}

int main(int argc, char*[])
{
	foo(argc != 2);
	if (argc == 3)
		foo(false);
}
