/*
** FileName     : SingletonPatternDemo5
** Author       : Jelly Young
** Date         : 2013/11/20
** Description  : More information, please go to http://www.jellythink.com
*/

#include <iostream>
using namespace std;

class Singleton
{
public:
    static Singleton *GetInstance()
    {
        return m_Instance;
    }

    int GetTest()
    {
        return m_Test;
    }

private:
    Singleton(){ m_Test = 10; }
    static Singleton *m_Instance;
    int m_Test;

    // This is important
    class GC
    {
    public :
        ~GC()
        {
            // We can destory all the resouce here, eg:db connector, file handle and so on
            if (m_Instance != NULL )
            {
                cout<< "Here is the test" <<endl;
                delete m_Instance;
                m_Instance = NULL ;
            }
        }
    };
    static GC gc;
};

Singleton *Singleton ::m_Instance = new Singleton();
Singleton ::GC Singleton ::gc;

class SingletonStatic
{
  private:
      static const SingletonStatic* m_instance;
      SingletonStatic(){}
  public:
      static const SingletonStatic* getInstance()
      {
          cout << "get Instance" << endl;
          return m_instance;
     }
};

//外部初始化 before invoke main
const SingletonStatic* SingletonStatic::m_instance = new SingletonStatic;

int main(int argc , char *argv [])
{
    Singleton *singletonObj = Singleton ::GetInstance();
    cout<<singletonObj->GetTest()<<endl;


    return 0;
}

