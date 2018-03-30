#include <iostream>

using namespace std;
struct A
{
    public:
        int i;
};
struct B:virtual public A      //此处采用虚继承
{
    public:
        int j;
};
struct C:virtual public A      //此处采用虚继承
{
    public:
        int k;
};
struct D:public B,public C
{
    public:
        int m;
};
template<typename T>
void size(T & t)
{ std::cout << "i = "<< t.i << ", sizeof(" << typeid(t).name() << ") = "<< sizeof(t) << std::endl;}

int main()
{
    A a;
    B b;
    C c;
    D d;
    a.i=1;
    b.i=2;
    c.i=3;
    d.i=4;
    size(a);
    size(b);
    size(c);
    size(d);

    return 0;
}

