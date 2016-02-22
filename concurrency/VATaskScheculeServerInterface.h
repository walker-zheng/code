/***************************************************************************
**	Contents: 分析任务调度服务器接口
**
**
**	Log:
**	Date		Author			Changes
**	-------------------------------------------------------------
**	2015/12/24	shaoying		Initial implementation.
***************************************************************************/

#pragma once

#include <memory.h>
typedef unsigned short							u16;
typedef unsigned int								u32;
const int		AWAREUSERNAMELEN = 64;
const int		AWAREPASSWORDLEN = 64;
#define			AWARE_MESSAGE_MAGIC		(0x6157)//'a' & 'W'
//消息头
struct SMsgHdr
{
	SMsgHdr() { memset(this, 0x00, sizeof(SMsgHdr)); }

	u16 wMsgLen;		//消息长度(包含消息头) //使用网络字节序
	u16 wMagicNumber;	//消息Magic //使用网络字节序
	u32 uMsgType;		//消息类型  //使用网络字节序
	unsigned int uMsgSeq;	//消息序号  //使用网络字节序
};

//下面都不使用网络字节序
//任务VA类型
enum ETaskVAType
{
	EVATaskType_tableObject = 1, 	//桌面异物检测
	EVATaskType_intrusion = 2, 	//入侵检测
	EVATaskType_MultiPerson = 3, 	//多（双）人检测
	EVATaskType_Seal = 4, 		//印章检测
	EVATaskType_LostObject = 5, 	//遗留物检测
	EVATaskType_VideoAnomaly = 6,	//视频异常检测
};

//任务视频类型
enum ETaskVideoType
{
	ETaskVideoType_realtime = 1, 	//实时
	ETaskVideoType_history = 2, 	//历史
};

//日期时间
struct SDateTime
{
	SDateTime() { memset(this, 0x00, sizeof(SDateTime)); }

	int nSec;     //秒
	int nMin;     //分
	int nHour;    //小时
	int nDay;     //日
	int nMon;     //月
	int nYear;    //年
};

//开启VA检测任务
#define	MSG_START_VA_TASK		1174
struct SMsgStartVATask
{
	SMsgHdr sMsgHeader; 	//消息头
	char sDeviceIP[32];	//进行VA的设备IP
	int nDevicePort;	//进行VA的设备端口号
	int nDeviceChannelID; 	//进行VA的设备通道的ID
	int nTaskPriority; 	//任务优先级
	int nTaskVAType; 	//任务VA类型
	int nTaskVideoType; 	//任务视频类型
	SDateTime sVACheckBeginTime; 	//va开始时间
	SDateTime sVACheckEndTime; 	//va结束时间
};

//开启VA检测任务回应
#define	MSG_START_VA_TASK_ACK		1175
struct SMsgStartVATaskAck
{
	SMsgHdr sMsgHeader; 	//消息头
	int nSuccess; 		//任务开启是否成功 //1：成功；0：失败
	unsigned int nTaskID; 	//任务ID
};

//停止VA检测任务
#define	MSG_STOP_VA_TASK		1176
struct SMsgStopVATask
{
	SMsgHdr sMsgHeader; 	//消息头
	unsigned int nTaskID; 	//任务ID
};

// 检测结果通知
#define MSG_VA_TASK_RESULT_NOTIFY	1178
struct SMsgVATaskResultNotify
{
	SMsgHdr sMsgHeader; 	//消息头
	unsigned int nTaskID; 	//任务ID
	int bIsFinalAlarm;		//是否最终报警	//1：是；0：不是
	SDateTime tStartTime;	//报警触发时间（起始时间）
	SDateTime tStopTime;	//报警触发时间（结束时间）
};

//检测任务结束通知
#define	MSG_VA_TASK_END_NOTIFY	1186
struct SMsgVATaskEndNotify
{
	SMsgHdr sMsgHeader; 	//消息头
	unsigned int nTaskID; 	//任务ID
};

//用户登录命令
#define	MSG_USER_LOGIN 		1080		
#define	MSG_USER_LOGIN_ACK	1081
struct SMsgUserLogin
{
	SMsgHdr sMsgHeader; //消息头
	char strUserName[AWAREUSERNAMELEN];	//用户名
	char strPassword[AWAREPASSWORDLEN];	//密码
};

//用户登录命令响应
struct SMsgUserLoginAck
{
	SMsgHdr sMsgHeader; 	//消息头
	int nResultCode;	//登录是否成功 //1：成功；0：失败
};

#define	MSG_USER_LOGOUT		1082	//用户登出
struct SMsgLogout
{
	SMsgHdr sMsgHeader; //消息头
	char strUserName[AWAREUSERNAMELEN];	//用户名
	char strPassword[AWAREPASSWORDLEN];	//密码
};

//用户心跳
#define	MSG_USER_HEARTBEAT	1084	
struct SMsgDeviceHeartbeat
{
	SMsgHdr sMsgHeader; //消息头
	char strUserName[AWAREUSERNAMELEN];	//用户名
	char strPassword[AWAREPASSWORDLEN];	//密码
};