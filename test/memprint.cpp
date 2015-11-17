#include <iostream>
using namespace std;

class Base
{
public:
    int a;
    virtual void fcn() {};
};

class Derived : public Base
{
public:
    virtual void fcn2() {};
private:
    int d;
    void fcn3() { }
};

class A
{
    virtual void a()
    {
    }
};
class A1
{
    virtual void a()
    {
    }
};

class B : public A , virtual public A1
{
};
void main()
{
    cout<<"sizeof A: "<<sizeof(A)<<endl;
    cout<<"sizeof A1: "<<sizeof(A1)<<endl;
    cout<<"sizeof B: "<<sizeof(B)<<endl;     //
}
