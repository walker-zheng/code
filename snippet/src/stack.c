#include <iostream>

using namespace std;

namespace Stack{
    const int max_size = 200;
    struct Rep{
        char v[max_size];
        int top;
    };

    const int max = 16;

    Rep stacks[max];
    bool used[max];

    typedef Rep& stack;
    Stack::stack Stack::create(){
        for (int i = 0; i < 16; i++)
            if (!used[i])
            {
                used[i] = true;
                return stacks[i];
            }

    }
    void Stack::destroy(stack s){
        int i = 0; 
        while(!used[16 - i])
            ++i;
        used[i] = 0;
        return ;
    }
    void Stack::push(stack s, char c){
        if (s.top != max_size)
        {
            s.v[s.top] = c;
            s.top++;
        }
    }
    char Stack::pop(stack s){
        if (s.top)
        {
            s.top--;
            return s.v[s.top];
        }
    }
}
int main(){
        class Bad_pop{};
        Stack::stack s1 = Stack::create();
        Stack::stack s2 = Stack::create();


        Stack::push(s1, 'c');
        Stack::push(s2, 'k');


        if (Stack::pop(s1) != 'c') throw Bad_pop();
        if (Stack::pop(s2) != 'k') throw Bad_pop();
        Stack::push(s1, 'c');
        Stack::push(s2, 'k');
        cout<<Stack::pop(s1) ;
        cout<<Stack::pop(s2) ;

        Stack::destroy(s1);
        Stack::destroy(s2);
    }
