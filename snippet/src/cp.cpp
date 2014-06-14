
#include <iostream>
#include <limits>

using namespace std;


template<class In, class Out>
void cp(In from, In end, Out to){
    while(from != end){
        *to = *from;
        ++from;
        ++to;
    }
}

template<class C, class T>
int count(const C& v, T val){
    typename C::const_iterator i = find(v.begin(), v.end(), val);
    int n = 0;
    while(i != v.end){
        ++n;
        ++i;
        i = find(v.begin(), v.end(), val);
    }
    return n;
}
void print_cp(){
    char vc1[200] = "ni hao ,hello, jsidjf ijsidjf ifjijijf";
    char vc2[200];
    cp(&vc1[0], &vc1[200], &vc2[0]);

    cout << "vc1 = " << vc1 << endl;
    cout << "vc2 = " << vc2 << endl;

    cout << "vc1 has " << endl;
    //  << count(&vc1[0], &vc1[200], 'j') << "j's" << endl
    //  << count(&vc1[0], &vc1[200], 'f') << "f's" << endl
    //  << count(&vc1[0], &vc1[200], 'o') << "o's" << endl;

}
void print_limits(){
    cout << "largest float = "
        << numeric_limits<float>::max() << endl
        << "char is signed = "
        << numeric_limits<char>::is_signed << endl;

}

void print_decl(){
    int* x,y;
    int a = 10;
    x = &a;
    y = *x;
    cout << x << " " << y << " " << *x << endl;

}

void print_test(){
    const int a = 3;
    //int *p1 = &a;   //转换失败

    int ii = 0;
    int& rr = ii;
    rr++;
    int* p = &rr;
    cout << "ii = " << ii << endl
        << "rr = " << rr << endl
        << "*p = " << *p << endl;

}
int main(){
    //print_cp();
    print_limits();
    //print_decl();
    print_test();

}
