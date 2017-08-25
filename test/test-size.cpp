#include <cstdint>
#include <iostream>
using u16 = uint16_t;               // for outside api header: VATaskScheculeServerInterface.h
using u32 = uint32_t;
#include "SurGardMLRDG.h"
#include "VATaskScheculeServerInterface.h"
int utf8_strlen(const std::string & str)
{
    int q{ 0 };

    for (auto i = 0; i < str.length(); i++, q++)
    {
        auto c = (unsigned char)str[i];

        if (c >= 0 && c <= 127) { i += 0; }
        else if ((c & 0xE0) == 0xC0) { i += 1; }
        else if ((c & 0xF0) == 0xE0) { i += 2; }
        else if ((c & 0xF8) == 0xF0) { i += 3; }
        //else if (($c & 0xFC) == 0xF8) i+=4; // 111110bb //byte 5, unnecessary in 4 byte UTF-8
        //else if (($c & 0xFE) == 0xFC) i+=5; // 1111110b //byte 6, unnecessary in 4 byte UTF-8
        else { return 0; }//invalid utf8
    }

    return q;
}
int main()
{
    std::cout << u8"数据大小:" << std::endl;
    std::cout << "\t" << sizeof(Surgard) << "\t:Surgard" << std::endl;
    std::cout << "\t" << sizeof(SurgardBasic) << "\t:SurgardBasic" << std::endl;
    std::cout << "\t" << sizeof(SurgardHeartbeat) << "\t:SurgardHeartbeat" << std::endl;
    std::cout << "\t" << sizeof(SurgardContactID) << "\t:SurgardContactID" << std::endl;    

    std::cout << "\t" << sizeof(SMsgHdr) << "\t:SMsgHdr" << std::endl;
    std::cout << "\t" << sizeof(SDateTime) << "\t:SDateTime" << std::endl;
    std::cout << "\t" << sizeof(SMsgStartVATask) << "\t:SMsgStartVATask" << std::endl;
    std::cout << "\t" << sizeof(SMsgStartVATaskAck) << "\t:SMsgStartVATaskAck" << std::endl;
    std::cout << "\t" << sizeof(SMsgStopVATask) << "\t:SMsgStopVATask" << std::endl;
    std::cout << "\t" << sizeof(SMsgVATaskResultNotify) << "\t:SMsgVATaskResultNotify" << std::endl;
    std::cout << "\t" << sizeof(SMsgVATaskEndNotify) << "\t:SMsgVATaskEndNotify" << std::endl;
    std::cout << "\t" << sizeof(SMsgVATaskExecFailNotify) << "\t:SMsgVATaskExecFailNotify" << std::endl;
    std::cout << "\t" << sizeof(SMsgVATaskStartExecNotify) << "\t:SMsgVATaskStartExecNotify" << std::endl;
    std::cout << "\t" << sizeof(SMsgUserLogin) << "\t:SMsgUserLogin" << std::endl;
    std::cout << "\t" << sizeof(SMsgUserLoginAck) << "\t:SMsgUserLoginAck" << std::endl;
    std::cout << "\t" << sizeof(SMsgLogout) << "\t:SMsgLogout" << std::endl;
    std::cout << "\t" << sizeof(SMsgDeviceHeartbeat) << "\t:SMsgDeviceHeartbeat" << std::endl;
    std::cout << "\t" << sizeof(SMsgVPSStatusChangeNotify) << "\t:SMsgVPSStatusChangeNotify" << std::endl;
    std::cout << "\t" << sizeof(SMsgNotifyTaskRuntimeParam) << "\t:SMsgNotifyTaskRuntimeParam" << std::endl;
    std::string hello = u8"呵呵";
    std::string world = u8"唯一B神boboka";
    std::cout << "\t" << utf8_strlen(hello) << "\t" << hello.length() << "\t:" << hello << std::endl;
    std::cout << "\t" << utf8_strlen(world) << "\t" << world.length() << "\t:" << world << std::endl;
    //  std::cout << "\t" << sizeof(SMsgStartVATask) << "\t:SMsgStartVATask" << std::endl;
    //  for (auto i = 0; i < 10; i++)
    //  {

    //      std::cout << "\t\t" << i << std::endl;
    //  switch(i)
    //  {
    //      case 0:
    //      std::cout << i << std::endl;
    //      case 1:
    //      std::cout << i << std::endl;
    //      case 2:
    //      std::cout << i << std::endl;
    //      case 3:
    //      std::cout << i << std::endl;
    //      case 4:
    //      std::cout << i << std::endl;
    //      break;
    //      case 5:
    //      std::cout << i << std::endl;
    //      case 6:
    //      std::cout << i << std::endl;
    //      break;
    //      case 7:
    //      std::cout << i << std::endl;
    //      case 8:
    //      std::cout << i << std::endl;
    //      case 9:
    //      std::cout << i << std::endl;
    //      case 10:
    //      std::cout << i << std::endl;
    //      default:
    //      std::cout << i << std::endl;
    //      break;
    //  }
    //  }
}
