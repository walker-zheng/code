
#include "priority_queue.h"
#include <stdio.h>

using namespace std;

priority_queue<T_IP_Port, vector<T_IP_Port>, less_ip> q_ip1;

int main(int argc, char* argv[])
{
	// map_test();
	queue_test();

	return 0;
}
DWORD WINAPI Th_Push_IP(LPVOID lpParam)
{
	// 以网络字节序存储
	T_IP_Port ip_tmp;
	in_addr tmp;
	unsigned long ul_tmp;
	int count = 100;
	while (count--)
	{
		ul_tmp = rand();
		while (ul_tmp >10 )
		{
			ul_tmp = rand();
		}
		ip_tmp.ip = htonl(ul_tmp + 0xc0a80000);
		tmp.s_addr = ip_tmp.ip;

		ul_tmp = rand();
		while (ul_tmp >10 )
		{
			ul_tmp = rand();
		}
		ip_tmp.port = htons(ul_tmp);
		//cout << inet_ntoa(tmp) << "..." << ntohs(ip_tmp.port) << endl;
		q_ip1.push(ip_tmp);

		//Sleep(100);
	}
	return 0;
}
int queue_test()
{
	in_addr tmp;
	T_IP_Port ip_tmp;
	DWORD threadID;
	HANDLE hThread;
	hThread = CreateThread(NULL,0, Th_Push_IP, NULL, 0, &threadID);
	Sleep(500);
	while (1)
	{
		while (!q_ip1.empty())
		{
			ip_tmp = q_ip1.top();
			tmp.s_addr = ip_tmp.ip;
			q_ip1.pop();
			cout << inet_ntoa(tmp) << ":" << ntohs(ip_tmp.port) << endl;

			Sleep(100);
		}
		Sleep(100);
	}
	return 0;
}
int map_test()
{
	multimap<int, char> map1;
	map1.insert(pair<int, char>(2, 'c'));
	map1.insert(pair<int, char>(1, 'x'));
	map1.insert(pair<int, char>(1, 'd'));
	map1.insert(pair<int, char>(9, 'b'));
	map1.insert(pair<int, char>(3, 'p'));
	map1.insert(pair<int, char>(0, 'l'));
	map1.insert(pair<int, char>(1, 'u'));

	int last = -1;
	for (multimap<int, char>::const_iterator it = map1.begin(); it != map1.end(); it++)
	{
		cout << (*it).first << " => " << (*it).second << endl;
		if ((*it).first != last)
		{
			pair<multimap<int, char>::const_iterator, multimap<int, char>::const_iterator> ret = map1.equal_range((*it).first);
			for (multimap<int, char>::const_iterator it_1 = ret.first ; it_1 != ret.second; it_1++)
			{
				cout << "\t" << (*it_1).second << endl;
			}
		}
		last = (*it).first;
	}

	return 0;
}
