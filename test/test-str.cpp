#include <iostream>
#include <fstream>
#include <sstream>
#include <algorithm>
#include <iterator>
#include <vector>
#include <string>
#include <list>


using namespace std;


int args_sort() {
    vector<string> v;
    string tmp;
    while(getline(cin, tmp)){
        v.push_back(tmp);
        sort(v.begin(), v.end());
        copy(v.begin(), v.end(), ostream_iterator<string>(cout, "\n"));
    }
    return 0;
}
int erase_list() {

    int arr[] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
    std::list<int> lst(arr, arr + 10);

    for ( std::list<int>::iterator iter = lst.begin();
          iter != lst.end(); )
        if ( *iter % 2 == 0 )
            lst.erase(iter++);
        else
            ++iter;

    std::copy(lst.begin(), lst.end(),
        std::ostream_iterator<int>(std::cout, " "));
    cout << endl;

    return 0;
}

int trans_case() {
    string s("heLLo");
    transform(s.begin(), s.end(), s.begin(), ::toupper);
    cout << s << endl;
    transform(s.begin(), s.end(), s.begin(), ::tolower);
    cout << s << endl;

    return 0;
}

int str_trim() {
    string s("   hello   ");

    cout << s << endl << s.size() << endl;
    s.erase(0, s.find_first_not_of(' '));
    cout << s.size() << endl;
    s.erase(s.find_last_not_of(' ') + 1);
    cout << s.size() << endl;

    return 0;
}

int erase_char() {

    string s("   hello, world. say bye   ");
    cout << s << endl;
    s.erase(remove_if(s.begin(),s.end(),
        bind2nd(equal_to<char>(), ' ')),
    s.end());
    cout << s << endl;

    return 0;
}

int replace_str() {
    string s("hello, world");
    string sub("ello, ");
    s.replace(s.find(sub), sub.size(), "appy ");
    cout << s << endl;

    return 0;
}

int read_line() {
    string input;
    input.reserve(1000);
    ifstream ifs("input.txt");
    getline(ifs, input);

    return 0;
}

int out_iter() {
    double darray[] = {1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.9};
    vector<double> vdouble(10);
    vector<double>::iterator out_it = vdouble.begin();
    copy(darray, darray + 10, out_it);
    // vector<double> vdouble({1.0, 1.1, 1.2, 1.3, 1.4, 1.5, 1.6, 1.7, 1.8, 1.91});
    // vector<double>::iterator out_it = vdouble.begin();
    while(out_it != vdouble.end()) {
        cout << *out_it++ << endl;
    }
    // for (auto x: vdouble)
    //     cout << x << endl;
    return 0;
}


int main(int argc, char const *argv[])
{
    // erase_list();
    // trans_case();
    // str_trim();
    // erase_char();
    // replace_str();
    out_iter();
    // read_line();
    // args_sort();

    char a;
    cin >> a;
    return 0;
}
