#include "stack.h"
#include <complex.h>

// template<class T> Stack<T>::Stack(int s){
//     top = 0;
//     if (s<0||1000<s)
//         throw Bad_size();
//     max_size = s;
//     v = new char[s];
// }
// template<class T> Stack<T>::~Stack(){
//     delete[] v;
// }
template<class T> void Stack<T>::push(T c){
    if (top == max_size) 
        throw Overflow();
    v[top] = c;
    ++top;
}
template<class T> T Stack<T>::pop(){
    if (!top) 
        throw Underflow();
    --top;
    return v[top];
}

int main(){
    class Bad_pop{};
    Stack<char> sc(200);
    Stack<complex<int> > scplx(30);
    //Stack<list<int> > sli(45);

    sc.push('c');
    if(sc.pop() != 'c')
        throw Bad_pop();
    scplx.push(complex<int>(1,2));
    if(sc.pop() != complex<int>(1,2))
        throw Bad_pop();



}
