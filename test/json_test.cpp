#include "json.hpp"
#include <map>

struct FacilityInfo
{
	// 设备ID
	int facilityId;
	// 设备编号
	std::string facilityCode;
	// 设备名称
	std::string facilityName;
	// 所属机构代码
	std::string bankCode;
	// 设备安装位置
	std::string installPosition;
	// 厂商
	std::string factory;
	// 设备型号
	std::string cameraModel;
	// 责任人
	std::string responsible;
	// 联系人
	std::string contacts;
	// 责任人邮箱
	std::string responsibleMail;
	// 责任人电话
	std::string contactTel;
	// 安装日期
	std::string installDate;
	// 摄像头IP地址
	std::string ip;
	// 摄像头端口
	int port;
	// 柜台号
	int counterNumber;
	// 硬盘录像机id
	int dvrId;
	// 通道号 设备类型是摄像头时有值
	int channelNo;
	std::vector<std::string> facilityRiskPoint;
}; 

void from_json(const nlohmann::json & j, FacilityInfo & data)
{
    data = FacilityInfo{};

    if (j.find("facilityId") != j.end())
    {
        data.facilityId = j["facilityId"];
    }

    if (j.find("facilityCode") != j.end())
    {
        data.facilityCode = j["facilityCode"];
    }

    if (j.find("facilityName") != j.end())
    {
        data.facilityName = j["facilityName"];
    }

    if (j.find("bankCode") != j.end())
    {
        data.bankCode = j["bankCode"];
    }

    if (j.find("installPosition") != j.end())
    {
        data.installPosition = j["installPosition"];
    }

    if (j.find("factory") != j.end())
    {
        data.factory = j["factory"];
    }

    if (j.find("cameraModel") != j.end())
    {
        data.cameraModel = j["cameraModel"];
    }

    if (j.find("responsible") != j.end())
    {
        data.responsible = j["responsible"];
    }

    if (j.find("contacts") != j.end())
    {
        data.contacts = j["contacts"];
    }

    if (j.find("responsibleMail") != j.end())
    {
        data.responsibleMail = j["responsibleMail"];
    }

    if (j.find("contactTel") != j.end())
    {
        data.contactTel = j["contactTel"];
    }

    if (j.find("installDate") != j.end())
    {
        data.installDate = j["installDate"];
    }

    if (j.find("ip") != j.end())
    {
        data.ip = j["ip"];
    }

    if (j.find("port") != j.end())
    {
        data.port = j["port"];
    }

    if (j.find("counterNumber") != j.end())
    {
        data.counterNumber = j["counterNumber"];
    }

    if (j.find("dvrId") != j.end())
    {
        data.dvrId = j["dvrId"];
    }

    if (j.find("channelNo") != j.end())
    {
        data.channelNo = j["channelNo"];
    }

	if (j.find("facilityRiskPoint") != j.end() && j["facilityRiskPoint"].is_array())
	{
        std::vector<std::string> tmp = j["facilityRiskPoint"]; 
        data.facilityRiskPoint  = std::move(tmp);
	}
}
void to_json(nlohmann::json & j, const FacilityInfo & data)
{
    j["facilityId"] = data.facilityId;
    j["facilityCode"] = data.facilityCode;
    j["facilityName"] = data.facilityName;
    j["bankCode"] = data.bankCode;
    j["installPosition"] = data.installPosition;
    j["factory"] = data.factory;
    j["cameraModel"] = data.cameraModel;
    j["responsible"] = data.responsible;
    j["contacts"] = data.contacts;
    j["responsibleMail"] = data.responsibleMail;
    j["contactTel"] = data.contactTel;
    j["installDate"] = data.installDate;
    j["ip"] = data.ip;
    j["port"] = data.port;
    j["counterNumber"] = data.counterNumber;
    j["dvrId"] = data.dvrId;
    j["channelNo"] = data.channelNo;
    j["facilityRiskPoint"] = data.facilityRiskPoint;
}
bool initFacilityIPC(std::vector<FacilityInfo> const & vec)
{
    int count = 0;
    static std::map<int, FacilityInfo> m_mFacilityInfoIPC;
    m_mFacilityInfoIPC.clear();

    for (auto const & dev : vec)
    {
        m_mFacilityInfoIPC[dev.facilityId] = std::move(dev);
        count++;
    }

    std::cout << u8"data read FacilityInfo IPC " + std::to_string(vec.size()) + ", insert " + std::to_string(count);
}
int main()
{
    int test = 1 << (1-1);
    std::cout << test  << std::endl;
    std::cout << (1 << (1 - 1))  << std::endl;
    // create a JSON value with different types
    nlohmann::json json_types = u8R"({"Result":{"errorMessage":"","errorCode":0,"businessList":[{}],"count":0}})"_json;
    std::vector<FacilityInfo> vec;
    std::vector<FacilityInfo> vec_1 = nlohmann::json{FacilityInfo{}};
    std::cout << typeid(FacilityInfo).name()  << std::endl;
    std::cout << typeid(vec).name()  << std::endl;
    std::cout << typeid(vec_1).name()  << std::endl;
    std::map<std::string, int> m_haha = {
        {"A001", 0},
        {"A002", 2},
    };
    std::cout << m_haha["A001"] << std::endl;
    std::cout << m_haha["A002"] << std::endl;
    std::cout << m_haha["A003"] << std::endl;
   auto dev = std::unique_ptr<FacilityInfo>(); 
   if(!dev)
   {
       std::cout << u8"数据为空"  << std::endl;
   }

    // std::vector<FacilityInfo> vec{};
    // use implicit conversions

    // print the conversion results
    //  std::cout << json_types["Result"]["businessList"].is_array()<< std::endl;
    std::cout << json_types.dump(4) << std::endl;
    std::cout << json_types.count("/Result/businessList")<< std::endl;
}
