#include <string>
#include <map>
#include <memory>
#include <utility>
#include <iostream>

using namespace std;

template<typename BaseT, typename...ARGs>
class Factory
{
public:
    static Factory* instance()
    {
        static Factory inst;
        return &inst;
    }
    template<typename T>
    void reg(const string& name)
    {
        m_stock[name].reset(new Creator<T>);
    }
    BaseT* create(const string& name, ARGs&&...args)
    {
        return m_stock[name]->create(forward<ARGs>(args)...);
    }
private:
    struct ICreator
    {
        virtual BaseT* create(ARGs&&...) = 0;
    };
    template<typename T>
    struct Creator : public ICreator
    {
        virtual BaseT* create(ARGs&&...args) override
        {
            return new T(forward<ARGs>(args)...);
        }
    };
    std::map<string, std::unique_ptr<ICreator>> m_stock;
};

template<typename BaseT, typename T, typename...ARGs>
class Register
{
public:
    Register(const string& name)
    {
        auto instance = Factory<BaseT, ARGs...>::instance();
        instance->template reg<T>(name);
    }
};

template <typename BaseT, typename...ARGs>
BaseT* create(const string& name, ARGs&&...args)
{
    return Factory<C, ARGs...>::instance()->create(name, forward<ARGs>(args)...);
}

struct C
{
    virtual char const * whoAmI() const = 0;
};

struct A : public C
{
    A(int a1, int a2)
    {
        cout << "Creating A(" << a1 << ", " << a2 << ")" << endl;
    }

    virtual char const * whoAmI() const override
    {
        return "A";
    }
};

struct B : public C
{
    B(int b1, int b2)
    {
        cout << "Creating B(" << b1 << ", " << b2 << ")" << endl;
    }
    B(int b1, int b2, int b3)
    {
        cout << "Creating B(" << b1 << ", " << b2 << ", " << b3 << ")" << endl;
    }
    virtual char const * whoAmI() const override
    {
        return "B";
    }
};
int main()
{
    C* a = create<C>("a", 1, 2);
    C* b = create<C>("b", 3, 4);
    C* b3 = create<C>("b", 3, 4, 5);
    cout << "I am a " << a->whoAmI() << endl;
    cout << "I am a " << b->whoAmI() << endl;
    cout << "I am a " << b3->whoAmI() << endl;
    return 0;
}