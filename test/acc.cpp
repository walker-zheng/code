#include <iostream>
#include <vector>
#include <numeric>
#include <string>
#include <functional>

int main()
{
	std::vector<int> v{1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

	int sum = std::accumulate(v.begin(), v.end(), 0);

	int product = std::accumulate(v.begin(), v.end(), 1, std::multiplies<int>());

	std::string s = std::accumulate(std::next(v.begin()), v.end(),
			std::to_string(v[0]), // 以首元素开始
			[](std::string a, int b) {
			return a + '-' + std::to_string(b);
			});

	std::cout << "sum: " << sum << '\n'
		<< "product: " << product << '\n'
		<< "dash-separated string: " << s << '\n';
}
