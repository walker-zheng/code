#include "stdafx.h"
#include "ScopedLogMessage.h"
#include <map>
#include <functional>

template<typename Key = std::string, typename Ret = std::string, typename... Args>
class Functors
{
private:
    using Functor = std::function<Ret(Args...)>;
    using FunctorMap = std::map<Key, Functor>;
    FunctorMap                      _calls;
    ScopedLogMessage    &   m_msg;
public:
    Functors(ScopedLogMessage & msg) :
        m_msg(msg)
    {
        m_msg.Message(" CommandDispatcher start");
    }
    virtual ~Functors()
    {
        _calls.clear();
        m_msg.Message(" CommandDispatcher end");
    }
    void connect(Key name, Functor fct)
    {
        _calls.insert(std::make_pair(name, fct));
    }

    template<typename Object>
    void connect(Key name, std::string(Object::*method)(Args...), Object * object)
    {
        _calls.insert(std::make_pair(name, [object, method](Args... args) {(*object.*method)(args...); }));
    }

    template<typename Object>
    void connect(Key name, std::string(Object::*method)(Args...) const, Object * object)
    {
        _calls.insert(std::make_pair(name, [object, method](Args... args) {(*object.*method)(args...); }));
    }

    template<typename Object>
    void connect(Key name, std::string(Object::*method)(Args...) const, const Object * object)
    {
        _calls.insert(std::make_pair(name, [object, method](Args... args) {(*object.*method)(args...); }));
    }

    Ret emit(Key name, Args... args)
    {
        auto it = _calls.find(name);

        if (it != _calls.end())
        {
            auto & func = it->second;
            return func(args...);
        }

        return Ret("cmd: " + name + "not found.");
    }
};