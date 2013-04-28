#include <cstdlib>
#include <iostream>
#include <cstring>

#include "override.h" 
#include "string.h" 

using namespace std;
void 
test(){
     
     
    float *p = NULL;
    int i = 0; 
    while (1){
          p = new float[100000]; 
          cout << "eat mem!! " << ++i << endl;
          if (p == NULL){
                cout << i * sizeof(float) * 100000 << endl; 
                system("PAUSE");              
                exit(1); 
                } 
          } 
    } 

int main(int argc, char *argv[])
{
    //test(); //ºÄ¾¡ÄÚ´æ 
    //override_test(); 
    //String str1 = new String();
    //String str2 = new String("hello, walker"); 
    
    
    system("PAUSE");
    return EXIT_SUCCESS;
}
