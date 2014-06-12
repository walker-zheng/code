#include <iostream>
#include <boost/thread/mutex.hpp>

boost::mutex mtx;
class Singleton
{
    public:
        static Singleton& getInstance();

    private:
        Singleton() {std::cout << "Ctor\n";};
        ~Singleton() {std::cout << "Dtor\n";};
        Singleton(const Singleton&);
        const Singleton& operator=(const Singleton&);
};

Singleton& Singleton::getInstance()
{
    boost::mutex::scoped_lock lock(mtx);
    static Singleton instance;
    return instance;

}

int main()
{
    Singleton &s1 = Singleton::getInstance();
    Singleton &s2 = Singleton::getInstance();
    //std::cout << &s1 << " " << &s2 << std::endl;
    return 0;
}
