#include <algorithm>
#include <iterator>
#include <iostream>
#include <fstream>
#include <sstream>
#include <string>
#include <map>
#include <cctype>

class Car
{
	public:
		bool operator<(Car const& rhs) const {return name < rhs.name;}
	private:
		friend std::istream& operator>>(std::istream& stream, Car& self);
		friend std::ostream& operator<<(std::ostream& stream, Car const& self);
		std::string   name;
};
std::istream& operator>>(std::istream& stream, Car& self)
{
	std::string   line;
	std::getline(stream, line);

	std::stringstream linestream(line);
	linestream >> self.name;  // This strips white space

	// Lowercase the name
	std::transform(self.name.begin(), self.name.end(), self.name.begin(), ::tolower);
	// Uppercase first letter because most are proper nouns
	self.name[0] = ::toupper(self.name[0]);
	return stream;
}
std::ostream& operator<<(std::ostream& stream, Car const& self)
{
	return stream << self.name << "\n";
}

//Print out map members
struct MapPrinter
{
	MapPrinter(std::map<Car,int>::value_type const& d): data(d) {}
	std::map<Car,int>::value_type const& data;
};
std::ostream& operator<<(std::ostream& stream, MapPrinter const& item)
{
	return   stream << item.data.second << ":   "  << item.data.first;
}

int main(int argc, char* argv[])
{
	if (argc < 2)
	{    exit(1);
	}
	std::ifstream      cars(argv[1]);
	std::map<Car,int>  count;

	Car  nextCar;
	while(cars >> nextCar)
	{
		++count[nextCar];
	}

	// PS deliberately left the sorting by inverse order as an exercise.
	std::copy(count.begin(),
			count.end(),
			std::ostream_iterator<MapPrinter>(std::cout));
}
