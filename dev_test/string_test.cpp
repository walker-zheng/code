#include "string_test.h"

int atoi_s(const char *c)
{
	int value = 0;
	int sign = 1;
	if (*c == '+' || *c == '-')
	{
		if (*c == '-')
			sign = -1;
		c++;
	}
	while (isdigit(*c))
	{
		value *= 10;
		value += (int)(*c - '0');
		c++;
	}
	return (value * sign);
}
int atoi(const char *string)
{
	int num = 0;
	int sign = 0;
	int i = 0;
	int len = strlen(string);
	while (string[i] == ' ' && i < len)
		i++;
	if (string[i] == '+')
		i++;
	if (string[i] == '-')
	{
		i++;
		sign = -1;
	}
	for (; i < len; i++)
	{
		if (string[i] < '0' || string[i] > '9')
		{
			break;
		}
		if (num < INT_MIN / 10 ||
			(num > INT_MAX / 10 && string[i] - '0' > INT_MAX % 10))
		{
			return sign == -1 ? INT_MIN : INT_MAX;
		}
		num = num * 10 + string[i] - '0';
	}
	return num;
}
int main()
{
	UT(-121313, atoi("-121313"), true);
	UT(-13232, atoi("-13232;s"), true);
	UT(2147483647, atoi("+2147483647;s"), true);
	return 0;
}