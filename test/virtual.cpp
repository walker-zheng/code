#include <iostream>
#include <string.h>

using namespace std;
struct Nothing
{
};
struct Virtual
{
    virtual void base1_fun1() {}
    virtual void base1_fun2() {}
};
struct A
{
public:
    int i;
};
struct AA: public A
{
};
struct A1_V: virtual public A     //此处采用虚继承
{
};
struct A2_V: virtual public A     //此处采用虚继承
{
};
struct AA_V: public A1_V, public A2_V
{
};
class Base_0
{
public:
    int base1_1{ 1 };
    int base1_2{ 2 };

};
class Base_v1
{
public:
    int base1_1{1};
    int base1_2{ 2 };
    virtual void base1_fun1() {}
    virtual void base1_fun2() {}
};
class Base_v2
{
public:
    int base2_1{3};
    int base2_2{4};

    virtual void base2_fun1() {}
    virtual void base2_fun2() {}
};

// 多继承
class Derive_0_v2 : public Base_0, public Base_v2
{
public:
    int derive1_1{5};
    int derive1_2{6};

    // 基类虚函数覆盖
    virtual void base1_fun1() {}
    virtual void base2_fun2() {}

    // 自身定义的虚函数
    virtual void derive1_fun1() {}
    virtual void derive1_fun2() {}
};
class Derive_v2_v1 : public Base_v2, public Base_v1
{
public:
    int derive1_1{ 5 };
    int derive1_2{ 6 };

    // 基类虚函数覆盖
    virtual void base1_fun1() {}
    virtual void base2_fun2() {}

    // 自身定义的虚函数
    virtual void derive1_fun1() {}
    virtual void derive1_fun2() {}
};
template<typename T>
void size_of(const T & t)
{
    std::cout << "sizeof(" << typeid(t).name() << ") = " << sizeof(t) << std::endl;
}
template<typename T>
void size(const T & t)
{
    unsigned int nLen = sizeof(t);
    const int nBytePerLine = 16;
    unsigned char * p = (unsigned char *)&t;
    char szHex[3 * nBytePerLine + 1] = { 0 };
    std::cout << "sizeof(" << typeid(t).name() << ") = " << sizeof(t) << std::endl;
    for(unsigned int i = 0; i < nLen; ++i) {
        int idx = 3 * (i % nBytePerLine);
        if(0 == idx) {
            memset(szHex, 0, sizeof(szHex));
        }
        snprintf(&szHex[idx], 4, "%02x ", p[i]); // buff长度要多传入1个字节
        // 以16个字节为一行，进行打印
        if(0 == ((i + 1) % nBytePerLine)) {
            printf("%s\n", szHex);
        }
    }
    // 打印最后一行未满16个字节的内容
    if(0 != (nLen % nBytePerLine)) {
        printf("%s\n", szHex);
    }
}
class Parent
{
public:
    int iparent;
    Parent() : iparent(10) {}
    virtual void f() { cout << " Parent::f()" << endl; }
    virtual void g() { cout << " Parent::g()" << endl; }
    virtual void h() { cout << " Parent::h()" << endl; }

};

class Child : public Parent
{
public:
    int ichild;
    Child() : ichild(100) {}
    virtual void f() { cout << "Child::f()" << endl; }
    virtual void g_child() { cout << "Child::g_child()" << endl; }
    virtual void h_child() { cout << "Child::h_child()" << endl; }
};

class GrandChild : public Child
{
public:
    int igrandchild;
    GrandChild() : igrandchild(1000) {}
    virtual void f() { cout << "GrandChild::f()" << endl; }
    virtual void g_child() { cout << "GrandChild::g_child()" << endl; }
    virtual void h_grandchild() { cout << "GrandChild::h_grandchild()" << endl; }
};
class Base1
{
public:
    int ibase1;
    Base1() : ibase1(10) {}
    virtual void f() { cout << "Base1::f()" << endl; }
    virtual void g() { cout << "Base1::g()" << endl; }
    virtual void h() { cout << "Base1::h()" << endl; }

};

class Base2
{
public:
    int ibase2;
    Base2() : ibase2(20) {}
    virtual void f() { cout << "Base2::f()" << endl; }
    virtual void g() { cout << "Base2::g()" << endl; }
    virtual void h() { cout << "Base2::h()" << endl; }
};

class Base3
{
public:
    int ibase3;
    Base3() : ibase3(30) {}
    virtual void f() { cout << "Base3::f()" << endl; }
    virtual void g() { cout << "Base3::g()" << endl; }
    virtual void h() { cout << "Base3::h()" << endl; }
};

class Derive : public Base1, public Base2, public Base3
{
public:
    int iderive;
    Derive() : iderive(100) {}
    virtual void f() { cout << "Derive::f()" << endl; }
    virtual void g1() { cout << "Derive::g1()" << endl; }
};
class B
{
public:
    int ib;
    char cb;
public:
    B() : ib(0), cb('B') {}

    virtual void f() { cout << "B::f()" << endl; }
    virtual void Bf() { cout << "B::Bf()" << endl; }
};
class B1 : public B
{
public:
    int ib1;
    char cb1;
public:
    B1() : ib1(11), cb1('1') {}

    virtual void f() { cout << "B1::f()" << endl; }
    virtual void f1() { cout << "B1::f1()" << endl; }
    virtual void Bf1() { cout << "B1::Bf1()" << endl; }

};
class B2 : public B
{
public:
    int ib2;
    char cb2;
public:
    B2() : ib2(12), cb2('2') {}

    virtual void f() { cout << "B2::f()" << endl; }
    virtual void f2() { cout << "B2::f2()" << endl; }
    virtual void Bf2() { cout << "B2::Bf2()" << endl; }

};

class B1_V : virtual public B
{
public:
    int ib1;
    char cb1;
public:
    B1_V() : ib1(11), cb1('1') {}

    virtual void f() { cout << "B1::f()" << endl; }
    virtual void f1() { cout << "B1::f1()" << endl; }
    virtual void Bf1() { cout << "B1::Bf1()" << endl; }

};
class B2_V : virtual public B
{
public:
    int ib2;
    char cb2;
public:
    B2_V() : ib2(12), cb2('2') {}

    virtual void f() { cout << "B2::f()" << endl; }
    virtual void f2() { cout << "B2::f2()" << endl; }
    virtual void Bf2() { cout << "B2::Bf2()" << endl; }

};

class D : public B1, public B2
{
public:
    int id;
    char cd;
public:
    D() : id(100), cd('D') {}

    virtual void f() { cout << "D::f()" << endl; }
    virtual void f1() { cout << "D::f1()" << endl; }
    virtual void f2() { cout << "D::f2()" << endl; }
    virtual void Df() { cout << "D::Df()" << endl; }

};
class D_ : public B2, public B1
{
public:
    int id;
    char cd;
public:
    D_() : id(100), cd('D') {}

    virtual void f() { cout << "D::f()" << endl; }
    virtual void f1() { cout << "D::f1()" << endl; }
    virtual void f2() { cout << "D::f2()" << endl; }
    virtual void Df() { cout << "D::Df()" << endl; }

};
class D_V : public B1_V, public B2_V
{
public:
    int id;
    char cd;
public:
    D_V() : id(100), cd('D') {}

    virtual void f() { cout << "D::f()" << endl; }
    virtual void f1() { cout << "D::f1()" << endl; }
    virtual void f2() { cout << "D::f2()" << endl; }
    virtual void Df() { cout << "D::Df()" << endl; }

};
int main()
{
    cout << "derive" << endl;
    GrandChild gc;
    size(gc);
    cout << "multi_derive" << endl;
    Derive dd;
    size(dd);
    cout << "multi_derive_dup" << endl;
    D d;
    size(d);
    cout << "multi_derive_dup order_r" << endl;
    D_ dr;
    size(dr);
    cout << "multi_derive_dup_virtual" << endl;
    D_V dv;
    size(dv);
    B1_V bv;
    size(bv);
    //std::cout << u8"\n基本类型" << std::endl;
    //Nothing nothing;
    //Virtual vtl;
    //void * ptr;
    //size_of(nothing);
    //size_of(vtl);
    //size_of(ptr);
    //size_of('a');
    //size_of(22);
    //size_of(22u);
    //size_of(22l);
    //size_of(22ll);
    //size_of(22.0);
    //size_of(22.0f);
    //size_of(22.0l);
    //A a;
    //A1_V a1_v;
    //A2_V a2_v;
    //AA_V aa_v;
    //AA aa;
    //a.i = 1;
    //a1_v.i = 2;
    //a2_v.i = 3;
    //aa_v.i = 4;
    //aa.i = 5;
    //A2_V * aa_v_2v = &aa_v;
    //A1_V * aa_v_1v = &aa_v;
    //A * aa_v_0 = &aa_v;
    //aa_v_2v->i = 9;
    //aa_v_1v->i = 8;
    //aa_v_0->i = 7;
    //std::cout << u8"\n虚继承菱形继承" << std::endl;
    //size(a);
    //size(a1_v);
    //size(a2_v);
    //size(aa_v);
    //size(aa);
    //Derive_0_v2 d_0_v2;
    //Derive_v2_v1 d_v2_v1;
    //Base_0 * pb1 = &d_0_v2;
    //Base_v2 * pb2 = &d_0_v2;
    //Base_0 bNone;
    //Base_v1 b_v1;
    //Base_v2 b_v2;
    //std::cout << u8"\n虚函数多继承" << std::endl;
    //size(bNone);
    //size(b_v1);
    //size(b_v2);
    //size(d_0_v2);
    //size(d_v2_v1);
    //std::cout << u8"\n如果typeid操作符的操作数是至少包含一个虚拟函数的类类型时，并且该表达式是一个基类的引用，则typeid操作符指出底层对象的派生类类型" << std::endl;
    //size_of(pb1);
    //size_of(*pb1);
    //size_of(pb2);
    //size_of(*pb2);
    return 0;
}