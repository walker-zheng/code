#include <iostream>
#include <string>

using namespace std;

class singleton {
public:
       static singleton& instance() {
               static singleton s;
               return s;
       }
       int check() {return initialized;}

private:
       singleton() : initialized(1) {
               if ( counter++ == 0 ) throw "just for the heck of it";
               initialized = 2;
       }
       singleton( const singleton& rhs );
       void operator=( const singleton& rhs );
       int initialized;
       static int counter;
};

int singleton::counter;

int main()
{
       while (1) {
               try {
                   cout << singleton::instance().check()-2 << endl;;
               } catch (...) {}
       }
}


