#include  "observer.h"
#include  <string>
#include  <iostream>
#include  <iterator>
#include  <algorithm>
using namespace std;
class ConcreteObserver1: public observer<string>
{
    public :
        void update( const string& message)
        {cout<<message<<endl;}
};
class ConcreteObserver2: public observer<string>
{
    public :
        void update( const string& message)
        {
            copy(message.rbegin(), message.rend(), ostream_iterator<string::value_type>(cout));
            cout<<endl;
        }
};
class ConcreteSubject: public subject<string>
{
    public :
        void set( const string& str)
        {message(str); }
};
int main()
{
    ConcreteSubject subject;
    ConcreteObserver1 o1;
    ConcreteObserver2 o2;
    subject.attach(o1);
    subject.attach(o2);
    subject.set("show me the money");
    subject.notify();
}
