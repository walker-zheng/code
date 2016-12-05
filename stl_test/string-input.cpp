#include <list>
#include <algorithm>
#include <iterator>
#include <vector>
#include <string>
#include <iostream>
#include <sstream>
#include <ctype.h>

using namespace  std;


int str_stream() {
    string input("hello,this is a test");
    istringstream is(input);
    string s1,s2,s3,s4;
    is>>s1>>s2>>s3>>s4;//s1="hello,this",s2="is",s3="a",s4="test"
    ostringstream os;
    os<<s1<<s2<<s3<<s4;
    cout<<os.str();
    return 0;
}
int bit_counter(string str) {
    int ii;
    // cout << "<< " << str << endl;
    std::stringstream ss;
    if ((str[0] == '0') && (toupper(str[1]) == 'X'))
    {
        ss << std::hex << str;  // 十六进制 0x123
        ss >> ii;
        // cout << "hex" << str[0] << str[1]<< endl;
    }
    else if (str[0] == '0')
    {
        ss << std::oct << str;  // 十六进制 0x123
        ss >> ii;
        // cout << "oct" << endl;
     }
    else if (str[0] < '9' && str[0] > '0')
    {
        ss << std::dec << str;  // 十六进制 0x123
        ss >> ii;
        // cout << "dec" << endl;
    }
    else
    {
        // cout << "bingo" << endl;
        return 0;
    }
    if (ii != 0)
        return str.length();
    else if (ii == 0 && str[1] == '\0')
        return 1;
    else
        return 0;
}
int char_in_str(string s1, string s2)
{
    vector<char> vs1(s1.begin(), s1.end());
    vector<char> vs2(s2.begin(), s2.end());
    std::sort(vs1.begin(), vs1.end());
    std::sort(vs2.begin(), vs2.end());
    // for (unsigned int i = 0 ; i< vs1.size(); i++)
    //     cout << vs1[i];
    // cout << endl;
    // for (unsigned int i = 0 ; i< vs2.size(); i++)
    //     cout << vs2[i];
    // cout << endl;
    unsigned int i = 0, j = 0;
    for (;  i < vs1.size() && j < vs2.size();  i++)
    {
        for (; j < vs2.size(); j++)
            if (vs1[i] == vs2[j])
                break;
    }
    if (j == vs2.size() && vs1[--i] != vs2[--j])
    {
        // cout << i << ":"<<vs1[i] << " " << j <<":" << vs2[j] << endl;
        return -1;
    }
    else
    {
        --i;
        // cout << i << ":"<<vs1[i] << " " << j <<":" << vs2[j] << endl;
        return 0;
    }
}
void print_assert(int yes){
    if (yes)
        cout << "yes"<<endl;
    else
        cout << "no"<<endl;
}
int main(){

    print_assert(char_in_str("bdac", "bbcdcda") == 0) ;
    print_assert(char_in_str("bdace", "bbcdcda") == -1) ;
    print_assert(char_in_str("bdac", "bbccda") == 0) ;
    print_assert(char_in_str("bdac", "bbcdcda") == 0) ;
    print_assert(char_in_str("bdac", "bbcdcda") == 0) ;

    cout << endl;
    print_assert(bit_counter("0") == 1);
    print_assert(bit_counter("081") == 0);
    print_assert(bit_counter("055") == 3);
    print_assert(bit_counter("0xF") == 3);
    print_assert(bit_counter("10") == 2);
    print_assert(bit_counter("f") == 0);
    print_assert(bit_counter("0ff") == 0);
    // cout << bit_counter("0");

    str_stream();


    int aa;
    cin >> aa;
    return 0;
}
