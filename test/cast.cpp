#include <iostream>

#define u16 unsigned short
#define u32 unsigned int
struct SMsgHdr
{
	u16 wMsgLen;        //消息长度(包含消息头) //使用网络字节序
	u16 wMagicNumber;   //消息Magic //使用网络字节序
	u32 uMsgType;       //消息类型  //使用网络字节序
	unsigned int uMsgSeq;   //消息序号  //使用网络字节序
};


struct SMsgUserLogin: public SMsgHdr
{
	char strUserName[20]; //用户名
	char strPassword[20]; //密码
};

//用户登录命令响应
struct SMsgUserLoginAck: public SMsgHdr
{
	int nResultCode;    //登录是否成功 //1：成功；0：失败
};


template<class T>
std::string toString(T & msg)
{
	decltype(auto) hdr = dynamic_cast<SMsgHdr&>(msg);

	return std::string("")
		+ "[len:" + std::to_string(msg.wMsgLen)
		+ "][magic:" + std::to_string(msg.wMagicNumber)
		+ "][type:" + std::to_string(msg.uMsgType)
		+ "][seq:" + std::to_string(msg.uMsgSeq)
		+ "]";
}
int main()
{

	using namespace std;
	SMsgUserLoginAck msg{};
	msg.wMsgLen = 1;
	msg.wMagicNumber = 2;
	msg.uMsgType = 3;
	msg.uMsgSeq = 4;
	msg.nResultCode = 5;
	cout << toString(msg) << endl;

}
