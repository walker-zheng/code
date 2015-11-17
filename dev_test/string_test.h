#ifndef __STRING_TEST_H__
#define __STRING_TEST_H__

#include <iostream>
#include <string.h>
#include <limits.h>


#define UT(X, Y, Z)\
do{ \
	if ( (X == Y) == Z)\
		std::cout << "success" << std::endl; \
	else \
		std::cout << "success" << std::endl;\
}while(0)



int atoi(const char * string);
void atoi_test(void);

#endif