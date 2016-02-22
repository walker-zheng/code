/***************************************************************************
**	Contents: ����������ȷ������ӿ�
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
//��Ϣͷ
struct SMsgHdr
{
	SMsgHdr() { memset(this, 0x00, sizeof(SMsgHdr)); }

	u16 wMsgLen;		//��Ϣ����(������Ϣͷ) //ʹ�������ֽ���
	u16 wMagicNumber;	//��ϢMagic //ʹ�������ֽ���
	u32 uMsgType;		//��Ϣ����  //ʹ�������ֽ���
	unsigned int uMsgSeq;	//��Ϣ���  //ʹ�������ֽ���
};

//���涼��ʹ�������ֽ���
//����VA����
enum ETaskVAType
{
	EVATaskType_tableObject = 1, 	//����������
	EVATaskType_intrusion = 2, 	//���ּ��
	EVATaskType_MultiPerson = 3, 	//�ࣨ˫���˼��
	EVATaskType_Seal = 4, 		//ӡ�¼��
	EVATaskType_LostObject = 5, 	//��������
	EVATaskType_VideoAnomaly = 6,	//��Ƶ�쳣���
};

//������Ƶ����
enum ETaskVideoType
{
	ETaskVideoType_realtime = 1, 	//ʵʱ
	ETaskVideoType_history = 2, 	//��ʷ
};

//����ʱ��
struct SDateTime
{
	SDateTime() { memset(this, 0x00, sizeof(SDateTime)); }

	int nSec;     //��
	int nMin;     //��
	int nHour;    //Сʱ
	int nDay;     //��
	int nMon;     //��
	int nYear;    //��
};

//����VA�������
#define	MSG_START_VA_TASK		1174
struct SMsgStartVATask
{
	SMsgHdr sMsgHeader; 	//��Ϣͷ
	char sDeviceIP[32];	//����VA���豸IP
	int nDevicePort;	//����VA���豸�˿ں�
	int nDeviceChannelID; 	//����VA���豸ͨ����ID
	int nTaskPriority; 	//�������ȼ�
	int nTaskVAType; 	//����VA����
	int nTaskVideoType; 	//������Ƶ����
	SDateTime sVACheckBeginTime; 	//va��ʼʱ��
	SDateTime sVACheckEndTime; 	//va����ʱ��
};

//����VA��������Ӧ
#define	MSG_START_VA_TASK_ACK		1175
struct SMsgStartVATaskAck
{
	SMsgHdr sMsgHeader; 	//��Ϣͷ
	int nSuccess; 		//�������Ƿ�ɹ� //1���ɹ���0��ʧ��
	unsigned int nTaskID; 	//����ID
};

//ֹͣVA�������
#define	MSG_STOP_VA_TASK		1176
struct SMsgStopVATask
{
	SMsgHdr sMsgHeader; 	//��Ϣͷ
	unsigned int nTaskID; 	//����ID
};

// �����֪ͨ
#define MSG_VA_TASK_RESULT_NOTIFY	1178
struct SMsgVATaskResultNotify
{
	SMsgHdr sMsgHeader; 	//��Ϣͷ
	unsigned int nTaskID; 	//����ID
	int bIsFinalAlarm;		//�Ƿ����ձ���	//1���ǣ�0������
	SDateTime tStartTime;	//��������ʱ�䣨��ʼʱ�䣩
	SDateTime tStopTime;	//��������ʱ�䣨����ʱ�䣩
};

//����������֪ͨ
#define	MSG_VA_TASK_END_NOTIFY	1186
struct SMsgVATaskEndNotify
{
	SMsgHdr sMsgHeader; 	//��Ϣͷ
	unsigned int nTaskID; 	//����ID
};

//�û���¼����
#define	MSG_USER_LOGIN 		1080		
#define	MSG_USER_LOGIN_ACK	1081
struct SMsgUserLogin
{
	SMsgHdr sMsgHeader; //��Ϣͷ
	char strUserName[AWAREUSERNAMELEN];	//�û���
	char strPassword[AWAREPASSWORDLEN];	//����
};

//�û���¼������Ӧ
struct SMsgUserLoginAck
{
	SMsgHdr sMsgHeader; 	//��Ϣͷ
	int nResultCode;	//��¼�Ƿ�ɹ� //1���ɹ���0��ʧ��
};

#define	MSG_USER_LOGOUT		1082	//�û��ǳ�
struct SMsgLogout
{
	SMsgHdr sMsgHeader; //��Ϣͷ
	char strUserName[AWAREUSERNAMELEN];	//�û���
	char strPassword[AWAREPASSWORDLEN];	//����
};

//�û�����
#define	MSG_USER_HEARTBEAT	1084	
struct SMsgDeviceHeartbeat
{
	SMsgHdr sMsgHeader; //��Ϣͷ
	char strUserName[AWAREUSERNAMELEN];	//�û���
	char strPassword[AWAREPASSWORDLEN];	//����
};