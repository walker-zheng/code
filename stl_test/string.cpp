#include <iostream>
#include <algorithm>
#include <functional>
#include <map>
#include <queue>
#include <stdio.h>

using namespace std;

class TestVoid
{
public:
    TestVoid(){}
    ~TestVoid(){}

};
class A
{
public:
    A(int n):value(n){}
    A(const A& other):value(other.value){}
    void print(){ std::cout << value << std::endl;}
private:
    int value;
};

class MyString
{
public:
    MyString(char *m_pData = NULL);
    MyString(const MyString& str);
    ~MyString();
    MyString operator=(const MyString &str);
private:
        char *m_pData;
};

// MyString MyString::operator=(const MyString &str){
//     if (this == &str)
//         return *this;
//     delete m_pData;
//     m_pData = NULL;
//     m_pData = new char[length(str.m_pData) + 1];
//     strcpy(m_pData, str.m_pData);
//     return *this;
MyString MyString::operator=(const MyString &str){
    if (this != &str){
        MyString strTmp(str);
        char *pTmp = strTmp.m_pData;
        strTmp = m_pData;
        m_pData = pTmp;
    }
    return *this;
}
int main(int argc, char const *argv[])
{
    /* code */
    TestVoid test;
    cout << sizeof(test)<< endl;
    return 0;
}
