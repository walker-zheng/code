#include <iostream>
#include <typeinfo>

/*
 *
 */
int main(void) {

	auto sum = [](int x, int y) -> int {return x + y;}; // 将创建的匿名函数赋值给sum

	std::cout << typeid(sum).name() << std::endl;

	int x = 10, y = 20;
	auto result = sum(x, y);

	std::cout << "result : " << result << std::endl;

	[]{
		std::cout << "Done1" << std::endl;
	};
	// 只是声明了一个lambda函数，但未调用

	[]{
		std::cout << "Done2" << std::endl;
	}();
	// 声明并调用一个lambda函数

	int a = 1, b = 10;
	//    无法通过编译
	//    [] {
	//        return a + b; // 错误：‘a’未被捕获      错误：‘b’未被捕获
	//    };
	[=] {       // [=] 通过捕捉，获得上下文的数据，所以可以使用变量a，b，但无法修改a，b
		return a + b;
	};

	std::cout << "b = " << b << std::endl;

	[&] (int c) { // [&] 捕捉上下文，并且可以修改a，b
		b = a + c;
	}(50);

	std::cout << "b = " << b << std::endl;

	//    [&a, b] (int c) {   // a可以在函数体中被修改，而b不能
	//        b = a + c;
	//    }(1000);

	auto b2 = [a, &b] (int c) -> int{ // a只读， b读写
		b = a + c;
		return a + c;
	}(1000);

	std::cout << "b = " << b << "  b2 = " << b2 << std::endl;

	return 0;
}
