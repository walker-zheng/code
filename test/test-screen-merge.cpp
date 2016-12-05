// resizing vector
#include <iostream>
#include <vector>
#include <assert.h>
using namespace std;

int
print_arr(int arr[][4]){
    for(int i = 0; i < 4; i++)
    {
        for(int j = 0; j < 4; j++)
        {
            cout << arr[i][j] << "\t";
        }
        cout << endl;
    }
    cout << endl;
}
int
init_arr(int arr[][4]){
    for(int i = 0; i < 4; i++)
    {
        for(int j = 0; j < 4; j++)
        {
            arr[i][j] = 0;
        }
    }
}
int
set_arr(int arr[][4], int x){
    int i = (x - 1)/3 + 1;
    int j = (x - 1)%3 + 1;
    arr[i][j] = 1;
    // cout << arr[i][j] << "\t";
}
int 
isright(int arr[][4]){
    int not_right = 0;
    for (int i = 1; i < 4; i++)
    {
        for (int j = 1; j < 4; j++)
        {
            arr[0][i] += arr[j][i];
            arr[i][0] += arr[i][j];
        }
    }
    //  print_arr(arr);
    for (int i = 1; i < 4; i++)
    {
        //  if (arr[0][i] == 2)
        //      not_right = 1;
        //  if (arr[i][0] == 2)
        //      not_right = 1;
        if (arr[0][i] == 2)
            if (arr[2][i] != 1)
                not_right = 1;
        if (arr[i][0] == 2)
            if (arr[i][2] != 1)
                not_right = 1;

    }
    int all_2 = 0;
    for (int i = 1; i < 4; i++)
    {
        all_2 += arr[0][i];
        all_2 += arr[i][0];
    }
    // 4个
    if (all_2/2 >= 4)
    {
        if (arr[2][2] != 1)
            not_right = 1;
        for (int i = 1; i < 4; i++)
        {
            if (arr[0][i] == 1)
                not_right = 1;
            if (arr[i][0] == 1)
                not_right = 1;
        }
    }
    // 3个
    if (all_2/2 == 3)
    {
        not_right = 1;
        for (int i = 1; i < 4; i++)
        {
            if (arr[0][i] == 3)
                not_right = 0;
            if (arr[i][0] == 3)
                not_right = 0;
        }
    }
    // 2个
    if (all_2/2 == 2)
    {
        not_right = 1;
        for (int i = 1; i < 4; i++)
        {
            if (arr[0][i] == 2 && arr[2][i] == 1)
                not_right = 0;
            if (arr[i][0] == 2 && arr[i][2] == 1)
                not_right = 0;
        }
    }
    // 1个
    if (all_2/2 == 1)
        not_right = 1;
    // 除3 9，都是偶数
    if (all_2/2 != 3 && all_2/2 != 9 && all_2/2%2 != 0)
        not_right = 1;

    //
    //
    if (not_right == 1)
        cout << "not right!" << endl;
    else
        cout << "right!" << endl;
    return not_right;
}
int test_arr()
{
    int arr[4][4];
    init_arr(arr);
    //  for (int i = 1; i < 10; i++)
    //  {
    //      init_arr(arr);
    //      set_arr(arr, i);
    //      print_arr(arr);
    //  }

    return 0;
}


//  int utest_arr(){
int main(){
    int arr_input[][9] = {
        {1, 2},
        {1, 3},
        {1, 4},
        {1, 5},
        {1, 6},
        {1, 7},
        {1, 8},
        {1, 9},
        {1, 2, 3},
        {1, 2, 4},
        {1, 2, 5},
        {1, 5, 9},
        {1, 2, 4, 5},
        {1, 2, 5, 6},
        {1, 2, 5, 7},
        {1, 2, 5, 9},
        {1, 2, 3, 5, 4, 6},
        {1, 2, 3, 7, 8, 9},
        {1, 2, 3, 4, 5, 6, 7, 8, 9} 
    };
    int arr_assert[] = {
        0, 
        1, 
        0, 
        1, 
        1, 
        1, 
        1, 
        1, 
        0, 
        1, 
        1, 
        1, 
        0, 
        1, 
        1, 
        1, 
        0, 
        1, 
        0
    };
    int arr[4][4];
    init_arr(arr);
    for (int i =0; i < sizeof(arr_input)/sizeof(int)/9; i++)
    {
        init_arr(arr);
        cout << ">";
        for (int j =0; j < 9; j++)
        {
            if (arr_input[i][j] == 0)
                continue;
            set_arr(arr, arr_input[i][j]);
            cout << arr_input[i][j] << "\t";
        }
        cout << endl;
        //  print_arr(arr);
        assert(isright(arr) == arr_assert[i]);
    }


}
int T_main ()
{
    int arr[4][4];
    int input;
    init_arr(arr);
    int haha[] = {1, 3, 4, 5, 7, 9};
    int arr_size = sizeof(haha)/sizeof(int);
    int not_right = 0;
    for (int i = 0; i < arr_size; i++)
        set_arr(arr, haha[i]);
    //  print_arr(arr);
    //  while (cin >> input)
    //      set_arr(arr, input);
    //  print_arr(arr);

    for (int i = 1; i < 4; i++)
    {
        for (int j = 1; j < 4; j++)
        {
            arr[0][i] += arr[j][i];
            arr[i][0] += arr[i][j];
        }
    }
    //  print_arr(arr);
    for (int i = 1; i < 4; i++)
    {
        //  if (arr[0][i] == 2)
        //      not_right = 1;
        //  if (arr[i][0] == 2)
        //      not_right = 1;
        if (arr[0][i] == 2)
            if (arr[2][i] != 1)
                not_right = 1;
        if (arr[i][0] == 2)
            if (arr[i][2] != 1)
                not_right = 1;

    }
    int all_2 = 0;
    for (int i = 1; i < 4; i++)
    {
        all_2 += arr[0][i];
        all_2 += arr[i][0];
    }
    if (all_2/2 > 4)
        if (arr[2][2] != 1)
            not_right = 1;


    //
    //
    if (not_right == 1)
        cout << "not right!" << endl;
    else
        cout << "right!" << endl;

    return 0;
}
