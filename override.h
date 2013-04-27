// ÷ÿ‘ÿ°¢∏≤∏«°¢“˛≤ÿ 
#ifndef _OVERRIDE_H_ 
#define _OVERRIDE_H_ 


#include <iostream>

class Base{
      public:
             virtual void f(float x) {std::cout << "Base::f(float) " << x << std::endl;} 
                     void g(float x) {std::cout << "Base::g(float) " << x << std::endl;} 
                     void h(float x) {std::cout << "Base::h(float) " << x << std::endl;} 
      } ; 

class Derived : public Base{
      public:
             virtual void f(float x) {std::cout << "Derived::f(float) " << x << std::endl;} 
                     void g(int x)   {std::cout << "Derived::g(int) " << x << std::endl;} 
                     void h(float x) {std::cout << "Derived::h(float) " << x << std::endl;} 
      } ; 
 

void override_test(void);

#endif 
