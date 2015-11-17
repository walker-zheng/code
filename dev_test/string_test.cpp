#include "string_test.h"

int atoi(const char * string){
	int num = 0;
	int sign = 0;
	int i = 0;
	int len = strlen(string);
	while(string[i] == ' ' && i < len) i++;
	if (string[i] == '+') i++;
	if (string[i] == '-'){
		i++;
		sign = -1;
	}
	for (; i < len; i++){
		if (string[i] < '0' || string[i] > '9'){
			break;
		}
		if (num < INT_MIN/10 ||
			(num > INT_MAX/10 && string[i] - '0' > INT_MAX%10)){
				return sign == -1 ? INT_MIN : INT_MAX;
			}
			num = num * 10 + string[i] - '0';
	}
	return num;
}
void atoi_test(void){
	UT(-121313, atoi("      -121313;s"), true);
	UT(-13232, atoi("      -13232d313;s"), true);
	UT(2147483647, atoi("      +2147483649;s"), true);
	UT(-121313, atoi("      -2147483657;s"), true);
}