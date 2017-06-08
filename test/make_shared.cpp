#include <iostream>
#include <memory>
#include <vector>
#include <map>
#include "json.hpp"
struct Vec3
{
	int x, y, z;
	Vec3() : x(0), y(0), z(0) { }
	Vec3(int x, int y, int z) :x(x), y(y), z(z) { }
	friend std::ostream& operator<<(std::ostream& os, Vec3& v) {
		return os << '{' << "x:" << v.x << " y:" << v.y << " z:" << v.z  << '}';
	}
};
void test_container()
{
    using Map = std::map<std::string, std::string>;
	using Vec = std::vector<std::string>;
    Map map = {{"hi","hey"},};
    std::cout << "map.size()  "<< map.size() << '\n';
	map["shit"];
    std::cout << "map.size()  "<< map.size() << '\n';
	Vec vec{"hhh",};
    std::cout << "vec.size()  "<< vec.size() << '\n';
}


int main()
{
    test_container();
}
