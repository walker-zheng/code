// pp 99-100, sec 99-100

// a very simple associative array (for real programs use std::map)

// (06/20/02: Yes, this program is legal according to the standard
//  - there is a nasty bug in some popular compilers, which has been
//  reported and is fixed for the next release)

// it would be an improvement to replace "int i" with "vector<Pair>::size_type"

// No guarantees offered. Constructive comments to bs@research.att.com

#include<vector>
#include<string>
#include<iostream>
using namespace std;

struct Pair {
	string name;
	double val;
};

vector<Pair> pairs;

double& value(const string& s)
/*
	maintain a set of Pairs:
	search for s, return its value if found;
	otherwise make a new Pair and return the default value 0
*/
{
	for (int i = 0; i < pairs.size(); i++)
		if (s == pairs[i].name) return pairs[i].val;

	Pair p = { s, 0 };
	pairs.push_back(p);	// add Pair at end (_tour2.list_)

	return pairs[pairs.size()-1].val;
}

int main() // count the number of occurrences of each word on input
{
	string buf;

	while (cin>>buf) value(buf)++;

	for (vector<Pair>::const_iterator p = pairs.begin(); p!=pairs.end(); ++p)
		cout << p->name << ": " << p->val << '\n';
}
