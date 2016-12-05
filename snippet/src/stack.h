#ifndef _STACK_H_
#define _STACK_H_

template<class T>
class Stack{
    T* v;
    int max_size;
    int top;
    public:
    class Overflow{};
    class Underflow{};
    class Bad_size{};

    Stack(int s);
    ~Stack();

    void push(T);
    T pop();
};
#endif
