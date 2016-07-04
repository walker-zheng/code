#include <iostream>
#include <queue>
#include <memory>
#include <poco\ByteOrder.h>
using namespace std;
enum class VAMsg
{
    MSG_START_VA_TASK_ACK,
};



typedef unsigned short  u16;
typedef unsigned int    u32;

typedef struct SMsgHdr
{
    u16 wMsgLen;        //��Ϣ����(������Ϣͷ) //ʹ�������ֽ���
    u16 wMagicNumber;   //��ϢMagic //ʹ�������ֽ���
    u32 uMsgType;       //��Ϣ����  //ʹ�������ֽ���
    unsigned int uMsgSeq;   //��Ϣ���  //ʹ�������ֽ���
} Header;
typedef struct SMsgStartVATask
{
    SMsgHdr sMsgHeader;     //��Ϣͷ
    char sDeviceIP[32];     //����VA���豸IP
    int nDevicePort;        //����VA���豸�˿ں�
    int nDeviceChannelID;   //����VA���豸ͨ����ID
    int nTaskPriority;      //�������ȼ�
    int nTaskVAType;        //����VA����
    int nCheckTypeOfDFOD;   //DFOD�ļ������, ֻ��nTaskVAType��ETaskVAType_DFODʱ��Ч //20160314 add
    int nTaskVideoType;     //������Ƶ����
} VATaskStart;

#define  AWARE_MESSAGE_MAGIC        0x6157        //'a' & 'W'
enum class E_MsgType
{
    MSG_START_VA_TASK = 1174,
    MSG_START_VA_TASK_ACK = 1175,
};
struct message_base
{
    virtual ~message_base()
    {}
};

template<typename Msg>
struct wrapped_message :
    message_base
{
    Msg contents;
    explicit wrapped_message(Msg const & contents_) :
        contents(contents_)
    {}
};

template<typename Msg>
bool dispatch(std::shared_ptr<message_base> const & msg)
{
    if (wrapped_message<Msg> * wrapper =
        dynamic_cast<wrapped_message<Msg>*>(msg.get()))
    {
        f(wrapper->contents);
        cout << "dispath: " << wrapper->contents.getType << endl;
        return true;
    }
    else
    {
        return prev->dispatch(msg);
    }
}
class MsgHeader : public Header
{
public:
    MsgHeader() {}
    u32 getLength()
    {
        return Poco::ByteOrder::fromNetwork(wMsgLen);
    }
    E_MsgType getType()
    {
        return (E_MsgType)Poco::ByteOrder::fromNetwork(uMsgType);
    }
    u32 getSeq()
    {
        return Poco::ByteOrder::fromNetwork(uMsgSeq);
    }
    u32 getMagic()
    {
        return Poco::ByteOrder::fromNetwork(wMagicNumber);
    }
};

template<typename T>
void push(T const & msg)
{
    q.push(std::make_shared<wrapped_message<T>>(msg));
}
class MsgStartVATask : public VATaskStart
{
public:
    MsgStartVATask() {}
    MsgHeader * getHeader()
    {
        return reinterpret_cast<MsgHeader *>(this);
    }
};
template<class T>
T makeVAMsg(int seq, int type, char * buf = nullptr, int length = 0)
{
    T msg;
    memset(&msg, 0, sizeof(msg));
    SMsgHdr & hdr = *reinterpret_cast<SMsgHdr *> (&msg);
    hdr.wMsgLen = (Poco::ByteOrder::toNetwork(static_cast<u16> (sizeof(msg))));
    hdr.wMagicNumber = Poco::ByteOrder::toNetwork(static_cast<u16> (AWARE_MESSAGE_MAGIC));
    hdr.uMsgType = Poco::ByteOrder::toNetwork(static_cast<u32> (type));
    hdr.uMsgSeq = Poco::ByteOrder::toNetwork(static_cast<u32> (seq));

    if (buf != nullptr && length == sizeof(T))
    {
        std::swap(*(T *)&msg, *(T *)buf);
    }

    return msg;
}
int main()
{
    SMsgStartVATask msgStart = makeVAMsg<SMsgStartVATask>(0, (int)VAMsg::MSG_START_VA_TASK_ACK);
    strcpy(&msgStart.sDeviceIP[0], "wtf");
    msgStart.nDevicePort = 1234;
    msgStart.nDeviceChannelID = 1;
    msgStart.nTaskPriority = 5;
    msgStart.nTaskVAType = 0;
    msgStart.nCheckTypeOfDFOD = 1;
    msgStart.nTaskVideoType = 2;
    SMsgStartVATask msgStart_new = makeVAMsg<SMsgStartVATask>(0, (int)VAMsg::MSG_START_VA_TASK_ACK);
    //  cout << sizeof(struct SMsgHdr) << endl;
    //  cout << sizeof(MsgHeader) << endl;
    //  cout << sizeof(struct SMsgStartVATask) << endl;
    //  cout << sizeof(MsgStartVATask) << endl;
    //  std::queue<std::shared_ptr<message_base>> q;
    //  MsgHeader header;
    //  MsgStartVATask taskStart;
    //  push(header);
    //  push(taskStart);
    //  auto _hdr = q.front();
    //  q.pop;
    //  dispatch(_hdr);
    return 0;
}