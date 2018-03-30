#include <functional>
#include <iostream>
struct X {
    int x;
 
    int&       easy()      {return x;}
    int&       get()       {return x;}
    const int& get() const {return x;}
}; 
struct Foo {
    void display_greeting() {
        std::cout << "Hello, world.\n";
    }
    void display_number(int i) {
        std::cout << "number: " << i << '\n';
    }
    int data = 7;
};
 
int main() {

    auto a = std::mem_fn        (&X::easy); // 完全无问题
//  auto b = std::mem_fn<int&  >(&X::get ); // C++14 中不再能用
    auto c = std::mem_fn<int&()>(&X::get ); // C++11 与 C++14 中可用
    auto d = [] (X& x) {return x.get();};   // 另一种重载函数的手段
 
    X x = {33};
    std::cout << "a() = " << a(x) << '\n';
    std::cout << "c() = " << c(x) << '\n';
    std::cout << "d() = " << d(x) << '\n';

    Foo f;
 
	// std::function<void(Foo &)> greet = &Foo::display_greeting;
    auto greet = std::mem_fn(&Foo::display_greeting);
    greet(f);
	// std::function<void(Foo &, int)> print_num = &Foo::display_number;
    auto print_num = std::mem_fn(&Foo::display_number);
    print_num(f, 42);
    // std::function<int(Foo &)> access_data = &Foo::data;
    auto access_data = std::mem_fn(&Foo::data);
    std::cout << "data: " << access_data(f) << '\n';
}
