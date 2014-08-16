// stl_test.cpp : 定义控制台应用程序的入口点。
//

#include "stdafx.h"

#include "stl_test.h"

using namespace std;

priority_queue<TIp_Port, vector<TIp_Port>, less_ip> q_ip1;

int _tmain(int argc, _TCHAR* argv[])
{
	//map_test();
	queue_test();

	getchar();
	return 0;
}
DWORD WINAPI Th_Push_IP(LPVOID lpParam)
{
	// 以网络字节序存储
	TIp_Port ip_tmp;
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
		//cout << inet_ntoa(tmp) << ":" << ip_tmp.port << endl;
		q_ip1.push(ip_tmp);

		//Sleep(100);
	}
	return 0;
}
int queue_test()
{
	in_addr tmp;
	TIp_Port ip_tmp;
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
			cout << inet_ntoa(tmp) << "\t" << ntohs(ip_tmp.port) << endl;

			Sleep(200);
		}
		Sleep(200);
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
			for (multimap<int, char>::const_iterator it_1 = map1.equal_range((*it).first).first; it_1 != map1.equal_range((*it).first).second; it_1++)
			{
				cout << "\t" << (*it_1).second << endl;
			}
		}
		last = (*it).first;
	}

	return 0;
}
