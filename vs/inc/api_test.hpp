##ifndef __API_TEST_H__
#define  __API_TEST_H__

class IMsgAdpt;
class CHelloMsgAdpt: public IMsgAdpt
 {
public:
static CHelloMsgAdpt* getInstance();
static void destoryInstance();
~CHelloMsgAdpt();

void onConnectNtf();
void onDisconnectNtf();
void onSendErrorNtf();
void onRecvMsg();

private:
CHelloMsgAdpt();

static CHelloMsgAdpt* m_pHelloAdpt;
};


#endif
