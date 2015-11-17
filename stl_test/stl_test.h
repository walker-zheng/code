#ifndef _STL_TEST_H_
#define _STL_TEST_H_

#include <iostream>
#include <algorithm>
#include <functional>
#include <map>
#include <queue>

#include <winsock2.h>
#pragma comment(lib,"ws2_32.lib")

struct more
{
	bool operator()(const int& _Left, const int& _Right) const
	{	// apply operator< to operands
		return (_Left > _Right);
	}
};

typedef struct s_Ip_Port
{
	unsigned int ip;
	unsigned short port;
}TIp_Port;
struct less_ip
{
	bool operator()(const TIp_Port& _Left, const TIp_Port& _Right) const
	{	// apply operator< to operands
		return (ntohl(_Left.ip) > ntohl(_Right.ip)) || (_Left.ip == _Right.ip) && (ntohs(_Left.port) > ntohs(_Right.port));
	}
};


int map_test();
int queue_test();


#endif // !_STL_TEST_H_
