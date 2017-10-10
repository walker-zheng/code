# c++/cli

## 1. String^ 与 char\*

```
//将char*转换为System::String^
String^ str1= System::Runtime::InteropServices::Marshal::PtrToStringAnsi((IntPtr)ch1);
//System::String^转换为char*
char* ch2 = (char*)(void*)System::Runtime::InteropServices::Marshal::StringToHGlobalAnsi(str1);
```

## 2. native回调转托管

```
#pragma unmanaged
typedef int (__stdcall *pMK_Notify_CB)(char *ipAddr, NET_MSG_NOTETYPE_E MsgType, NET_MSG_NOTEINFO *UploadMsg, void *pUserdata);
#pragma managed
public delegate int GetNofiyDelegate(char *ipAddr, NET_MSG_NOTETYPE_E MsgType, NET_MSG_NOTEINFO *UploadMsg, void *pUserdata);
// decl
pMK_Notify_CB m_cb;
static GCHandle gch;
static GetNofiyDelegate^ fp;
// init
CheckForIllegalCrossThreadCalls = false;
fp = gcnew GetNofiyDelegate(GetNotifyMSG);
gch = GCHandle::Alloc(fp);
IntPtr ip = Marshal::GetFunctionPointerForDelegate(fp);
m_cb = static_cast<pMK_Notify_CB>(ip.ToPointer());
fp_up = gcnew GetUpgradeDelegate(GetUpgradeMSG);
```

## 3. 编码转换

* `System::Text::Encoding::Default->GetBytes(sFullPath)`

## 4. 打开文件

```
OpenFileDialog^ openFileDialog1 = gcnew OpenFileDialog;
openFileDialog1->InitialDirectory = "c:\\";
openFileDialog1->Filter = "upf files (*.upf)|*.upf|All files (*.*)|*.*";
openFileDialog1->FilterIndex = 1;
openFileDialog1->RestoreDirectory = true;
if ( openFileDialog1->ShowDialog() == 
    System::Windows::Forms::DialogResult::OK )
{
    String ^ sFullPath = openFileDialog1->FileName;
    if (sFullPath->Substring(sFullPath->LastIndexOf("."))->Equals(".upf"))
    {
    size_t pos =0;
    sFullPath = sFullPath->Replace(L"\\", L"\\\\");
    }
}
```

## 5. 绑定数据显示

```
private: System::Windows::Forms::DataGridView^  dataGridView2;
System::Collections::Generic::List<array<String^>^ >^ listDevSearched;
System::Collections::Generic::List<array<String^>^ >^ listDevAdded;
System::Data::DataTable ^ dataTable1;
System::Data::DataTable ^ dataTable2;

this->dataGridView2->DataSource = nullptr;
this->listDevAdded->Clear();
this->dataTable2->Rows->Clear();
this->dataTable2->Columns->Clear();
this->dataTable2->Columns->Add("*addr");
this->dataTable2->Columns->Add("*IP");

array<String^>^ strTmpDev = gcnew array<String^>(2);
strTmpDev[0] = gcnew String("" + cfgDevCheck[i].base.addr);
strTmpDev[1] = gcnew String((char *)cfgDevCheck[i].ex.linkIP);
this->listDevAdded->Add(strTmpDev);
for  each(array<String^>^ devInfo in this->listDevAdded)
{
    DataRow^ newRow = this->dataTable2->NewRow();
    newRow[0] = devInfo[0];
    newRow[1] = devInfo[1];
    this->dataTable2->Rows->Add(newRow);
}
this->dataGridView2->DataSource = this->dataTable2;
// 获取
this->dataGridView1->CurrentRow->Cells[0]->Value->ToString();
```

# **c++ socket**

## 1. 广播搜索

```
SOCKADDR_IN   servAddr;
servAddr.sin_family           = AF_INET;
servAddr.sin_addr.S_un.S_addr = htonl(INADDR_BROADCAST);
servAddr.sin_port             = htons(5555);
int addrLen = sizeof(servAddr);
m_cSocket_DevSearch.socket_open();
m_cSocket_DevSearch.socket_create(AF_INET,SOCK_DGRAM,IPPROTO_UDP);
m_cSocket_DevSearch.socket_setblocking();
m_cSocket_DevSearch.socket_setsockopt(SOL_SOCKET,SO_BROADCAST,(char*)&optval,sizeof(bool));
int iConnectRet = m_cSocket_DevSearch.socket_bind((SOCKADDR*)&servAddr,sizeof(servAddr));
m_cSocket_DevSearch.socket_sendto(&SearchDeviceMsg[0], iHeaderLen, &iSendSize, (SOCKADDR*)&servAddr, addrLen);
while()
{        
    m_cSocket_DevSearch.socket_recvfrom(recvBuf, sizeof(recvBuf), &iSendSize, (SOCKADDR*)&servAddr, &addrLen);
}
```



