# 代码片段

## json 例子

```
{% raw %}
using nlohmann::json;
namespace ns {
    void to_json(json& j, const person& p) {
        j = json{
        {"name", p.name}, {"address", p.address}, {"age", p.age}
        };
    }

    void from_json(const json& j, person& p) {
        p.name = j.at("name").get<std::string>();
        p.address = j.at("address").get<std::string>();
        p.age = j.at("age").get<int>();
    }
} // namespace ns
{% endraw %}
```

# json & redis 转换 hmset/hgetall\(非数组\)

## to\_redis

```
std::list<std::string> to_redis(nlohmann::json const & value, std::string const & pref)
{
    std::list<std::string> args;
    auto prefix = pref;

    if (value.is_object())
    {
        if (!prefix.empty()) { prefix += "."; }

        for (auto elem = value.begin(); elem != value.end(); ++elem)
        {
            if ((*elem).is_object())
            {
                auto keyvalue = to_redis(*elem, prefix + elem.key());
                std::copy(keyvalue.begin(), keyvalue.end(), std::back_inserter(args));
            }
            else if ((*elem).is_array())
            {
                logger.error(u8"to_redis 不支持 json array");
                // auto keyvalue = to_redis(*elem, prefix + elem.key());
                // std::copy(keyvalue.begin(), keyvalue.end(), std::back_inserter(args));
            }
            else if ((*elem).is_number())
            {
                args.push_back(prefix + elem.key());
                int64_t num = elem.value();
                args.push_back(std::to_string(num));
            }
            else if ((*elem).is_string())
            {
                args.push_back(prefix + elem.key());
                args.push_back(elem.value());
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
            }
        }
    }
    return args;
}
```

## from\_redis

```
nlohmann::json from_redis(std::vector<std::string> const & values)
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
            else if (keys.size() == 5)
            {
                data[keys[0]][keys[1]][keys[2]][keys[3]][keys[4]] = values[i + 1];
            }
            else
            {
                logger.error(u8"redis 深度超过5层");
            }
        }
    }
    else
    {
        logger.error(u8"redis 返回字符串行数 应为偶数个");
    }

    return data;
}
```

## to\_lower

```
std::string tolower(const std::string & data)
{
    std::string tmp(data);
    std::transform(data.begin(), data.end(), tmp.begin(), (int(*)(int))std::tolower);
    return tmp;
}
```

## to\_upper

```
std::string toupper(const std::string & data)
{
    std::string tmp(data);
    std::transform(data.begin(), data.end(), tmp.begin(), (int(*)(int))std::toupper);
    return tmp;
}
```

## join

```
std::string join(const std::vector<std::string> & s, const std::string & token)
{
    size_t count{ 0 };
    std::string tmp;

    for (const auto & str : s)
    {
        count++;
        tmp += str;

        if (count != s.size())
        {
            tmp += token;
        }
    }

    return tmp;
}
```

## trim

```
std::string trimDir(const std::string & s, char ch)
{
    return std::string(s.begin(),
    std::find_if(s.rbegin(), s.rend(), [ = ](int c) {return ch == c; }).base());
}
std::string trim(const std::string & s, char ch)
{
    return std::string(std::find_if_not(s.begin(), s.end(), [ = ](int c) {return ch == c; }),
    std::find_if_not(s.rbegin(), s.rend(), [ = ](int c) {return ch == c; }).base());
}
std::string trim(const std::string & s)
{
    return trim(s, ' ');
}
```

## split

```
std::vector<std::string> split(const std::string & s, char delim)
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
```



