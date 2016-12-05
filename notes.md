### c++/cli (managed c++)

## 动态编程和refelection
## gc
## bcl (.net基础库)

    SomeManagedClass^ handle = gcnew SomeManagedClass( ... );
    handle->someMethod();
    SomeManagedClass% ref = *handle;

    ref struct D
    {
        D(){System::Console::WriteLine(“in D::D()/n”);}
        ~D(){System::Console::WriteLine(“in D::~D()/n”);}
        !D(){System::Console::WriteLine(“Finalized!/n”);}
    };


## ref class底层的对象模型和Native世界的对象模型根本就不一致
### T*，pin_ptr，interior_ptr是C++/CLI中三种最为重要的指针形式
### pin_ptr——它告诉GC：在压缩堆的时候请不要移动该对象; Native&Managed数据传递
    array<char>^ arr = gcnew array<char>(3); //托管类
    arr[0] = 'C';
    arr[1] = '+';
    arr[2] = '+';
    pin_ptr<char> p = &arr[0];   // 整个arr都被定在堆上
    char* pbegin=p;
    std::sort(pbegin,pbegin+3); //复用Native的算法！
    std::cout<<pbegin[0]<<pbegin[1]<<pbegin[2]; //输出 “++C”

### interior_ptr指向托管堆，在GC时interior_ptr能够得到更新，除此之外，interior_ptr允许你进行指针运算，允许你解 引用，一切和Native指针并无二致
    template<typename T>
    void sort2(interior_ptr<T> begin,interior_ptr<T> end)
    {
        ... //排序算法
        for(interior_ptr<T> pn=begin;pn!=end;++pn)
        {
           System::Console::WriteLine(*pn);
        }
    }
    int main()
    {
        array<char>^ arr = gcnew array<char>(3);
        interior_ptr<char> begin = &arr[0]; //指向头部的指针
        interior_ptr<char> end = begin + 3;  //注意，不能写&arr[3]，会下标越界
        sort2(begin,end); //类似STL的排序方式！
    }


## 显式override
    class B
    {
    public:
           virtual void f() ;
           virtual void g() abstract; //纯虚函数，需要派生类重写，否则派生类就是纯虚类
           virtual void h() sealed; //阻止派生类重写该函数
           virtual void i() ;
    }
    class D:public B
    {
           virtual void f() new ; //新版本的f，虽然名字和B::f相同，但是并没有重写B::f。
           virtual void h() override ; //错误！sealed函数不能被重写
           virtual void k() = B::i ; //“命名式”重写！
    }

##　值类型&封箱和拆箱
### 原则是：要修改栈上的值类型实例，优先使用“%”，而不是“^”。这样你将获得最好的效率和程序的正确性
