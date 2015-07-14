// resizing vector
#include <iostream>
#include <vector>
#include <assert.h>
using namespace std;


int
utest(int o, int n, int m){
    int x = m/o;
    int y = m%o;
    if ((o != 4 && o != 3)
            || (n <= 1 || n > 4)
            || (o < n)
            || (o*o <= m)
       )
    {
        //cout << o << " "<< n << " "<< x << " "<< y << " ";
        //cout << "\t\t\tfailed" << endl;
    }
    else
    {
        if (o == n)
        {
            x = 0;
            y = 0;
            cout << o << " "<< n << " "<< x << " "<< y << " ";
        }
        else
        {
            if (x + n > o)
                x = o - n;
            if (y + n > o)
                y = o - n;
            cout << o << " "<< n << " "<< x << " "<< y << " ";
        }
        cout << "\t\t\tok" << endl;
    }

}


int
utest_run(){
    for(int i = 0; i != 6; i++)
        for(int j = 0; j != 6; j++)
            for(int k = 0; k != 16; k++)
                if(i != 0)
                    utest(i, j, k);
}


int
main(){

    //  int o, n, x, y;
    //  cout << "O*O屏数，N*N合屏，M*M起始屏:";
    //  cin >> o >> n >> x >> y;
    //  utest(o, n, x, y);

    utest_run();
}
