#include <iostream>
#include <algorithm>
#include <vector>
#include <functional>

using namespace std;

void foo(function<int(int,int)> f)
{

    f(3, 5);
}

int main()
{
    int step = 2;
    int i = -step;
    vector<int> seq(10);
    generate(seq.begin(), seq.end(),
            [&i, step] ()
            {
            i+=step;
            cout << i << endl;
            return i;
            });


    auto add =
        [] (int x, int y)
        {
            cout << x + y << endl;
            return x + y;
        };
    foo(add);
    add(4, 7);
}

