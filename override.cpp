
#include "override.h" 


void override_test(void)
{
     Derived d;
     Base *pb = &d; 
     Derived *pd = &d; 
     
     // ���� 
     pb->f(3.14f); 
     pd->f(3.14f); 
     // ���� 
     pb->g(3.14f); 
     pd->g(3.14f); 
     // ���� 
     pb->h(3.14f); 
     pd->h(3.14f); 
     
     } 
