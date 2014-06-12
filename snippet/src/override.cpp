
#include "override.h"


int
main(void)
{
    Derived d;
    Base *pb = &d;
    Derived *pd = &d;

    // ¸²¸Ç
    pb->f(3.14f);
    pd->f(3.14f);
    // Òþ²Ø
    pb->g(3.14f);
    pd->g(3.14f);
    // Òþ²Ø
    pb->h(3.14f);
    pd->h(3.14f);

}
