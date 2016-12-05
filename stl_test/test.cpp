#include <iostream>
#include <string>

using namespace std;

int Size(const char str[]){
    return sizeof(str);
}
int ptr_vec_test(){
    // 数组退化为指针
    const char hi_str[20] = "hi, string!";
    const char * strTmp = hi_str;
    cout << sizeof(hi_str) << endl;
    cout << sizeof(strTmp) << endl;
    cout << Size(hi_str) << endl;
    return 0;
}

int Find(int * matrix, int rows, int cols, int num){
    // 排序矩阵中查找数字
    bool found = false;
    if (matrix != NULL && rows >= 0 && cols >= 0)
    {
        /* code */
        int row = 0;
        int col = cols - 1;
        while(row < rows && col >= 0) {
            /* code */
            // cout << row + 1 << ", " << col + 1 << endl;
            if (matrix[row * cols + col] == num)
            {
                found = true;
                break;
            }
            else if(matrix[row * cols + col] > num)
                -- col;
            else
                ++ row;
        }
    }
    return found;
}
template<typename T>
int assert(T result , T expect) {
    if (result == expect) {
        cout << "yes" << endl;
    }
    else {
        cout << "no" << endl;
    }
    return 0;
}
int find_ut(){
    int  sorted_matrix[] = {
        1, 2, 8, 9,
        2, 4, 9, 12,
        6, 7, 10, 13,
        7, 8, 11, 15
    };
    assert(Find(sorted_matrix, 4, 4, 7), 1);
    assert(Find(sorted_matrix, 4, 4, 1), 1);
    assert(Find(sorted_matrix, 4, 4, 5), 0);
    assert(Find((int *)NULL, 4, 4, 1), 0);
    return 0;
}

int replace_blank(char str[], int length){
    // 空格替换
    if (str == NULL || length <= 0)
        return -1;
    int str_len = 0;
    int space = 0;
    int i = 0;
    while(str[i] != '\0') {
        ++str_len;
        if (str[i] == ' ')
            ++space;
        ++i;
    }
    int new_len = str_len + (space<<1);
    if (new_len > length)
        return -1;
    int index = str_len;
    int index_new = new_len;
    while(index >= 0 && index_new > index) {
        if (str[index] == ' ')
        {
            str[index_new -- ] = '0';
            str[index_new -- ] = '2';
            str[index_new -- ] = '%';
        }
        else
        {
            str[index_new -- ] = str[index];
        }
        -- index;
    }
    return 0;
}
int str_vec(){
    // 字符串和数组
    char str_1[] = "hello, world!";
    char str_2[] = "hello, world!";
    const char *str_3 = "hello, world!";
    const char *str_4 = "hello, world!";
    assert(str_1, str_2);
    assert(str_3, str_4);

    char string_1[40] = "  we  r happy !  ";
    char string_2[40] = "werhappy!";
    char string_3[40] = " ";
    char string_4[40] = "    ";
    replace_blank(string_1, 40);
    replace_blank(string_2, 40);
    replace_blank(string_3, 40);
    replace_blank(string_4, 40);
    cout << string_1 << endl;
    cout << string_2 << endl;
    cout << string_3 << endl;
    cout << string_4 << endl;
    assert(replace_blank((char*)NULL, 40), -1);
    assert(replace_blank((char*)string_1, 5), -1);
    assert(replace_blank((char*)string_1, 0), -1);

    return 0;
}

int main(int argc, char const *argv[])
{
    // ptr_vec_test();
    // find_ut();
    str_vec();

    return 0;
}
