/***************************************************************************
**  Contents: 分析任务调度服务器接口
**
**
**  Log:
**  Date        Author          Changes
**  -------------------------------------------------------------
**  2015/12/24  shaoying        Initial implementation.
***************************************************************************/

#pragma once

#include <memory.h>

const int AWAREUSERNAMELEN = 64;
const int AWAREPASSWORDLEN = 64;

#define     AWARE_MESSAGE_MAGIC     (0x6157)//'a' & 'W'
//消息头
struct SMsgHdr
{
    SMsgHdr() { memset( this, 0x00, sizeof(SMsgHdr) ); }

    u16 wMsgLen;        //消息长度(包含消息头) //使用网络字节序
    u16 wMagicNumber;   //消息Magic //使用网络字节序
    u32 uMsgType;       //消息类型  //使用网络字节序
    unsigned int uMsgSeq;   //消息序号  //使用网络字节序
};

//下面都不使用网络字节序
/*
序号  功能点                                       缩写
1   多（双）人检测                               MP（multiple/double persons)
2   入侵检测                                        I（intrusion)
3   遗留物检测                                 OLB（Object left behind)
4   事件次数                                        EC（Event count)
5   客户身份验证（人脸，身份证，核心系统信息统一）   PIV（Person, identification verification)
6   防尾随门双开                                  DDO（double door open)
7   门开启，关闭状态检测                          DO（door open)
8   运钞车识别                                 MVI（money vehicle identificaiton)
9   制服识别                                        UI（Uniform Identificaiton)
10  破坏，打架检测                               VFD（Vandalism,fight detection)
11  视频异常检测                                  VAD（video abnormality detection)
12  异常音频检测                                  AAD（Abnormal audio detection)
13  电子登记簿                                 EBK（Electronic bookkeeping)
14  柜员（顾客）在座位检测                           TCOS（Teller customer on seat)
15  印章检测                                        SD（Stamp detection）
16  电话录音                                        PR(Phone recording)
17  叫号机（含柜员按钮）定制化及接入                NDM（Number dispensing machine)
18  桌面异物检测                                  DFOD(Desktop foreign object detection)
19  款箱开启检测                                  MBOD（Money box open detection)
20  指纹识别集成                                  FPV（Fingerprint verificaiton)
21  事件录像审核                                  EVR（Event Video Review）
22  自助设备状态接入                                ATMI（ATM Integration）
23  屏幕状态检测                                  SSD（Screen status detection)
24  取款槽内异物检测                                GFOD（Groove foreign object detection)
25  温湿度检测                                 TMM（Temperature, moisture monitoring )
26  披肩发检测                                 HV(Hairstyle verification)
27  手势识别                                        GI（Gesture identification)
28  电子款箱                                        EMB（Electronic money box)
29  人脸比对                                        FR(Face recognition)
30  手检测                                       HR(hand recognition)
31  设备状态检测                                  DSM(Device status monitoring)
32  时间同步                                        TS（Time synchronization)
33  点钞机状态检测                               MCSD(Money Counter Status Detection)
34  款箱交接PC客户端系统                           MBES(Money Box Exchange System)
35  个人物品检测                                  PGD(Personal Goods Detection)
36  杂物检测                                        GD(Goods Detection)
37  票据影像系统                                  CIS（Check imaging system)
38  后督系统                                        CASS（Compliance afterwards supervision system)
39  验印系统                                        SVS(Stamp verificaiton system)
40  指纹验证系统                                  FAS（Fingerprint Authentication System）
41  凭证检测                                        CD（Certificate Detection)
42  现金检测                                        MD（Money Detection）
43  柜员卡检测                                 TID（Teller ID Detection）
//*/

//20160314 modify
//任务VA类型
enum EVAFunction
{
    EVAFunction_TCOS_MD_CD_SD   = 1,    // 人员离岗桌面异物
    EVAFunction_I               = 2,    // 入侵
    EVAFunction_TCOS            = 3,    // 顾客在座检测
    EVAFunction_MP              = 4,    // 多人检测，包括授权，双人签到签退，双人配额，双人加钞
    EVAFunction_DFOD            = 5,    // 异物检测，目前不单独使用
    EVAFunction_OLB             = 6,    // 遗留物检测
    EVAFunction_VAD             = 7,    // 视频质量检测
    EVAFunction_ImageCapture    = 8,    // 打标签截图
    EVAFunction_FHD_DFOD        = 9,    // 手胳膊，现金票据检测
    EVAFunction_SCD_BCCD        = 10,   // 屏幕变化，冠字号检测，现金收付款与记账先后顺序
    EVAFunction_FHD_SCD         = 11,   // 屏幕变化，手胳膊检测，提供回单和提交记账先后顺序
    EVAFunction_CDD             = 12,   // 人群密度检测
    EVAFunction_APD             = 13,   // 武装人员，押运人员检测
    EVAFunction_LL_CASH         = 14,  // 长时间现金遗留检测
    EVAFunction_DDO             = 15, //双开门
    EVAFunction_MAX
};

//20160314 add
//DFOD的检测类型
//每个占一位 //同时做现金、印章，则是0x003(0x001+0x002)
enum CheckTypeOfDFOD
{
    CheckTypeOfDFOD_SD      = 0x001,        //印章检测
    CheckTypeOfDFOD_MD      = 0x002,        //现金检测
};

//任务视频类型
enum ETaskVideoType
{
    ETaskVideoType_realtime = 1,    //实时
    ETaskVideoType_history = 2,     //历史
};

//日期时间
struct SDateTime
{
    SDateTime() { memset( this, 0x00, sizeof(SDateTime) ); }

    int nSec;     //秒
    int nMin;     //分
    int nHour;    //小时
    int nDay;     //日
    int nMon;     //月
    int nYear;    //年
};

//开启VA检测任务
#define MSG_START_VA_TASK       1174
struct SMsgStartVATask
{
    SMsgHdr sMsgHeader;     //消息头
    char sDeviceIP[32];     //进行VA的设备IP
    int nDevicePort;        //进行VA的设备端口号
    int nDeviceChannelID;   //进行VA的设备通道的ID
    int nTaskPriority;      //任务优先级
    int nTaskVAType;        //任务VA类型

    /* 对于不同的功能，此参数含义不一致
    对于桌面异物(人员离岗桌面异物)，由于使用了5个风险点合成一个任务，因此此值为固定的3

    功 能(值)        1                               2                           3                     4
    MP            普通授权                      4308授权                  双人签到签退(A168，A169)    双人配款(E005)
    scd_bccd     先收款后记账(A012)               先记账后付款(A013)
    cdd          双开门尾随(A034)                  大厅挤兑(S007)
    I            非工作时间金库凭证室(S002,S006)   工作时间金库(S001)        工作时间加钞间(E001)
    */
    unsigned int nTaskDetectParam1;

    int nTaskVideoType;             //任务视频类型
    SDateTime sVACheckBeginTime;    //va开始时间
    SDateTime sVACheckEndTime;      //va结束时间
};

//开启VA检测任务回应
#define MSG_START_VA_TASK_ACK       1175
struct SMsgStartVATaskAck
{
    SMsgHdr sMsgHeader;     //消息头
    int nSuccess;       //任务开启是否成功 //1：成功；0：失败
    unsigned int nTaskID;   //任务ID
};

//停止VA检测任务
#define MSG_STOP_VA_TASK        1176
struct SMsgStopVATask
{
    SMsgHdr sMsgHeader;     //消息头
    unsigned int nTaskID;   //任务ID
};

// 检测结果，按位表示不同的情况,用以后续扩展
// 0 表示不报警
//                      1                   2                4      8
//  TCOS            顾客中途离开(A007)  顾客一直不在(A011)
//  TCOS+MD+CD+SD     印章                票据                  钞票    凭证
//
//  如TCOS+MD+CD+SD功能，值为1+2+4=7，则表示印章，票据，钞票都有，以此类推

//检测结果通知
#define MSG_VA_TASK_RESULT_NOTIFY   1178
struct SMsgVATaskResultNotify
{
    SMsgHdr sMsgHeader;             //消息头
    unsigned int nTaskID;           //任务ID
    int bIsFinalAlarm;              //是否最终报警    //1：是；0：不是
    unsigned int detectResult;      //检测结果，注释详见上面 //20160726 modify
    SDateTime tStartTime;           //报警开始时间
    SDateTime tStopTime;            //报警结束事件
    char sAlarmPicturePathHD[256];  //高分辨率报警图片的存储路径 //20160527 modify
    char sAlarmPicturePathLD[256];  //低分辨率报警图片的存储路径 //20160527 add
};

//检测任务结束通知
#define MSG_VA_TASK_END_NOTIFY  1186
struct SMsgVATaskEndNotify
{
    SMsgHdr sMsgHeader;     //消息头
    unsigned int nTaskID;   //任务ID
};

//20160324 add
//检测任务执行失败通知
#define     MSG_VA_TASK_EXEC_FAIL_NOTIFY        1198
struct SMsgVATaskExecFailNotify
{
    SMsgHdr sMsgHeader;     //消息头
    unsigned int nTaskID;   //任务ID
    unsigned int nErrorCode;    //错误码
};

//20160526 add
//检测任务开始执行通知
#define     MSG_VA_TASK_START_EXEC_NOTIFY       1200
struct SMsgVATaskStartExecNotify
{
    SMsgHdr sMsgHeader;     //消息头
    unsigned int nTaskID;   //任务ID
};

//用户登录命令
#define MSG_USER_LOGIN      1080
#define MSG_USER_LOGIN_ACK  1081
struct SMsgUserLogin
{
    SMsgHdr sMsgHeader; //消息头
    char strUserName[AWAREUSERNAMELEN]; //用户名
    char strPassword[AWAREPASSWORDLEN]; //密码
};

//用户登录命令响应
struct SMsgUserLoginAck
{
    SMsgHdr sMsgHeader;     //消息头
    int nResultCode;    //登录是否成功 //1：成功；0：失败
};

#define MSG_USER_LOGOUT     1082    //用户登出
struct SMsgLogout
{
    SMsgHdr sMsgHeader; //消息头
    char strUserName[AWAREUSERNAMELEN]; //用户名
    char strPassword[AWAREPASSWORDLEN]; //密码
};

//用户心跳
#define MSG_USER_HEARTBEAT  1084
struct SMsgDeviceHeartbeat
{
    SMsgHdr sMsgHeader; //消息头
    char strUserName[AWAREUSERNAMELEN]; //用户名
    char strPassword[AWAREPASSWORDLEN]; //密码
};

//VPS状态变化 //20161104 add
#define MSG_VPS_STATUS_CHANGE_NOTIFY    1202
struct SMsgVPSStatusChangeNotify
{
    SMsgHdr sMsgHeader; //消息头
    unsigned int nCurStatus;    //当前状态， 1:在线 0:掉线
};

//通知任务运行参数 //20170314 add
// 二期用于双开门，门打开后传递此消息，消息体中，运行参数目前可以不用复制，用以后期扩展
#define MSG_NOTIFY_TASK_RUNTIME_PARAM   1204
struct SMsgNotifyTaskRuntimeParam
{
    SMsgHdr sMsgHeader;     //消息头
    unsigned int nTaskID;   //任务ID
    unsigned int nTaskRuntimeParam1;    //任务运行参数1
    unsigned int nTaskRuntimeParam2;    //任务运行参数2
};