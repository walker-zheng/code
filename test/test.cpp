#include <iostream>     // std::cout
#include <functional>   // std::ref

int main () {
  int foo (10);

  auto bar = std::cref(foo);

  ++foo;

  std::cout << bar << '\n';

  return 0;
}
