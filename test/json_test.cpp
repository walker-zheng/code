#include <nlohmann/json.hpp>
#include <map>
#include <list>
#include <vector>
#include <iostream>

struct FacilityInfo
{
    int facilityId;
    std::string facilityCode;
    std::string facilityName;
    std::string bankCode;
    std::string installPosition;
    std::string factory;
    std::string cameraModel;
    std::string responsible;
    std::string contacts;
    std::string responsibleMail;
    std::string contactTel;
    std::string installDate;
    std::string ip;
    int port;
    int counterNumber;
    int dvrId;
    int channelNo;
    std::vector<std::string> facilityRiskPoint;
};
struct AlarmData
{
    int bussinessCoreId;
    std::string beginTime;
    std::string endTime;
    int cameraId;
    std::string bankCode;
    int type;
    std::string riskPointCode;
    std::string alarmPicturePathHD;
    std::string alarmPicturePathLD;
};
struct TTaskInfo
{
    int taskid;
    AlarmData alarmInfo;
};
void from_json(const nlohmann::json &j, FacilityInfo &data)
{
    data = FacilityInfo{};
    data.facilityId = j.at("facilityId").get<int>();
    data.facilityCode = j.at("facilityCode").get<std::string>();
    data.facilityName = j.at("facilityName").get<std::string>();
    data.bankCode = j.at("bankCode").get<std::string>();
    data.installPosition = j.at("installPosition").get<std::string>();
    data.factory = j.at("factory").get<std::string>();
    data.cameraModel = j.at("cameraModel").get<std::string>();
    data.responsible = j.at("responsible").get<std::string>();
    data.contacts = j.at("contacts").get<std::string>();
    data.responsibleMail = j.at("responsibleMail").get<std::string>();
    data.contactTel = j.at("contactTel").get<std::string>();
    data.installDate = j.at("installDate").get<std::string>();
    data.ip = j.at("ip").get<std::string>();
    data.port = j.at("port").get<int>();
    data.counterNumber = j.at("counterNumber").get<int>();
    data.dvrId = j.at("dvrId").get<int>();
    data.channelNo = j.at("channelNo").get<int>();
    std::vector<std::string> tmp = j.at("facilityRiskPoint").get<std::vector<std::string>>();
    data.facilityRiskPoint = std::move(tmp);
}
void to_json(nlohmann::json &j, const FacilityInfo &data)
{
    j = nlohmann::json{
        {"facilityId", data.facilityId},
        {"facilityCode", data.facilityCode},
        {"facilityName", data.facilityName},
        {"bankCode", data.bankCode},
        {"installPosition", data.installPosition},
        {"factory", data.factory},
        {"cameraModel", data.cameraModel},
        {"responsible", data.responsible},
        {"contacts", data.contacts},
        {"responsibleMail", data.responsibleMail},
        {"contactTel", data.contactTel},
        {"installDate", data.installDate},
        {"ip", data.ip},
        {"port", data.port},
        {"counterNumber", data.counterNumber},
        {"dvrId", data.dvrId},
        {"channelNo", data.channelNo},
        {"facilityRiskPoint", data.facilityRiskPoint}};
}
bool initFacilityIPC(std::vector<FacilityInfo> const &vec)
{
    int count = 0;
    static std::map<int, FacilityInfo> m_mFacilityInfoIPC;
    m_mFacilityInfoIPC.clear();

    for (auto const &dev : vec)
    {
        m_mFacilityInfoIPC[dev.facilityId] = std::move(dev);
        count++;
    }

    std::cout << u8"data read FacilityInfo IPC " + std::to_string(vec.size()) + ", insert " + std::to_string(count);
}

std::list<std::string> to_redis(nlohmann::json const &value, std::string prefix)
{
    std::list<std::string> args;

    if (value.is_object())
    {
        if (!prefix.empty())
        {
            prefix += ".";
        }

        for (auto elem = value.begin(); elem != value.end(); ++elem)
        {
            if ((*elem).is_object())
            {
                auto keyvalue = to_redis(*elem, prefix + elem.key());
                std::copy(keyvalue.begin(), keyvalue.end(), std::back_inserter(args));
                std::cout << "is_object" << std::endl;
            }
            else if ((*elem).is_array())
            {
                std::cout << "is_array" << std::endl;
                // auto keyvalue = to_redis(*elem, prefix + elem.key());
                // std::move(keyvalue.begin(), keyvalue.end(), args.end());
            }
            else if ((*elem).is_number())
            {
                args.push_back(prefix + elem.key());
                int64_t num = elem.value();
                args.push_back(std::to_string(num));
                std::cout << "is_number" << std::endl;
            }
            else if ((*elem).is_string())
            {
                args.push_back(prefix + elem.key());
                args.push_back(elem.value());
                std::cout << "is_string" << std::endl;
            }
            else if ((*elem).is_boolean())
            {
                args.push_back(prefix + elem.key());
                auto boolean = elem.value();

                if (boolean)
                {
                    args.push_back("true");
                }
                else
                {
                    args.push_back("false");
                }

                std::cout << "is_boolean" << std::endl;
            }
            else if ((*elem).is_null())
            {
                std::cout << "is_null" << std::endl;
            }
        }
    }
    else if (value.is_array())
    {
        int count{0};

        for (auto const &el : value)
        {
            auto tmp_prefix = prefix + "[" + std::to_string(count) + "]";
            ++count;

            if (el.is_object())
            {
                std::cout << "is_object" << std::endl;
                auto keyvalue = to_redis(el, tmp_prefix);
                std::copy(keyvalue.begin(), keyvalue.end(), std::back_inserter(args));
            }
            else if (el.is_array())
            {
                // auto keyvalue = to_redis(el, tmp_prefix);
                // std::move(keyvalue.begin(), keyvalue.end(), args.end());
                std::cout << "is_array" << std::endl;
            }
            else if (el.is_number())
            {
                std::cout << "is_number" << std::endl;
                args.push_back(tmp_prefix);
                int64_t num = el;
                args.push_back(std::to_string(num));
            }
            else if (el.is_string())
            {
                std::cout << "is_string" << std::endl;
                args.push_back(tmp_prefix);
                args.push_back(el);
            }
            else if (el.is_boolean())
            {
                std::cout << "is_boolean" << std::endl;
                args.push_back(tmp_prefix);
                bool boolean = el;

                if (boolean)
                {
                    args.push_back("true");
                }
                else
                {
                    args.push_back("false");
                }
            }
            else if (el.is_null())
            {
                std::cout << "is_null" << std::endl;
            }
        }
    }

    return args;
}

std::vector<std::string> split(const std::string &s, char delim)
{
    std::stringstream ss(s);
    std::string item;
    std::vector<std::string> elems;

    while (std::getline(ss, item, delim))
    {
        elems.push_back(item);
    }

    return elems;
}
nlohmann::json from_redis(std::vector<std::string> const &values)
{
    nlohmann::json data;

    if (!(values.size() % 2))
    {
        for (auto i = 0; i + 1 < values.size(); i += 2)
        {
            auto keys = split(values[i], '.');

            if (keys.size() == 1)
            {
                data[keys[0]] = values[i + 1];
            }
            else if (keys.size() == 2)
            {
                data[keys[0]][keys[1]] = values[i + 1];
            }
            else if (keys.size() == 3)
            {
                data[keys[0]][keys[1]][keys[2]] = values[i + 1];
            }
            else if (keys.size() == 4)
            {
                data[keys[0]][keys[1]][keys[2]][keys[3]] = values[i + 1];
            }

            // std::cout << keys.size() << std::endl;
            // std::cout << values[i] << ":" << values[i+1] << std::endl;
        }
    }

    return data;
}
int main()
{
    //  int test = 1 << (1-1);
    //  std::cout << test  << std::endl;
    //  std::cout << (1 << (1 - 1))  << std::endl;
    //  // create a JSON value with different types
    //  nlohmann::json json_types = u8R"({"Result":{"errorMessage":"","errorCode":0,"businessList":[{}],"count":0}})"_json;
    //  std::vector<FacilityInfo> vec;
    //  std::vector<FacilityInfo> vec_1 = nlohmann::json{FacilityInfo{}};
    //  std::cout << typeid(FacilityInfo).name()  << std::endl;
    //  std::cout << typeid(vec).name()  << std::endl;
    //  std::cout << typeid(vec_1).name()  << std::endl;
    //  std::map<std::string, int> m_haha = {
    //      {"A001", 0},
    //      {"A002", 2},
    //  };
    //  std::cout << m_haha["A001"] << std::endl;
    //  std::cout << m_haha["A002"] << std::endl;
    //  std::cout << m_haha["A003"] << std::endl;
    //  auto dev = std::unique_ptr<FacilityInfo>();
    //  if(!dev)
    //  {
    //      std::cout << u8"数据为空"  << std::endl;
    //  }
    FacilityInfo shit;
    shit.facilityId = 12222;
    shit.facilityCode = "sssh";
    // shit.facilityName;
    // shit.bankCode;
    // shit.installPosition;
    // shit.factory;
    // shit.cameraModel;
    // shit.responsible;
    // shit.contacts;
    // shit.responsibleMail;
    // shit.contactTel;
    // shit.installDate;
    // shit.ip;
    // shit.port;
    // shit.counterNumber;
    // shit.dvrId;
    // shit.channelNo;
    // std::vector<std::string> facilityRiskPoint;
    nlohmann::json dev = R"({
        "facilityId": true,
        "facilityii": false,
        "facilityCode": null,
        "facilityName": 22122,
        "bankCode": "0901",
        "installPosition": "档案室摄像机",
        "factory": "智诺",
        "facilityRiskPoint": ["S011","A006","A169","A168","A021","A013","A012","A010"],
        "hehe":{
            "cameraModel": "1",
            "counterNumber": 10,
            "dvrId": 4348632,
            "channelNo": 9,
            "facilityRiskPoint": "S011,A006,A169,A168,A021,A013,A012,A010"
        }
    })"_json;
    // std::cout << dev.dump(4) << std::endl;
    nlohmann::json hello = R"({
        "boolean": true,
        "integer": 5,
        "floatpoint": 3.0,
        "doublepoint": 4.0,
        "str": "hehe",
        "v_str": [ "哇哈哈", "哟呵呵" ]
    })"_json;
    std::cout << hello.dump(4) << std::endl;
    std::list<std::string> newdump = to_redis(dev, "");
    std::vector<std::string> other(newdump.begin(), newdump.end());
    int count{0};

    for (auto elem : other)
    {
        if (!(count % 2))
        {
            std::cout << elem << ":";
        }
        else
        {
            std::cout << elem << std::endl;
        }

        count++;
    }

    auto newjson = from_redis(other);
    std::cout << newjson.dump(2) << std::endl;
    // std::cout << nlohmann::json(shit) << std::endl;
    // std::vector<FacilityInfo> vec{};
    // use implicit conversions
    // print the conversion results
    //  std::cout << json_types["Result"]["businessList"].is_array()<< std::endl;
    // std::cout << json_types.dump(4) << std::endl;
    // std::cout << json_types.count("/Result/businessList")<< std::endl;
}
