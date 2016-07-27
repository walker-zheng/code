#include <iostream>
#include <tuple>

typedef unsigned char uint8_t;
typedef unsigned char byte_t;

struct MsgData {
    uint8_t num;
    float x;
    uint8_t elevation;

    static const std::size_t buffer_size = sizeof(uint8_t)
                                         + sizeof(float) 
                                         + sizeof(uint8_t);

    std::tuple<uint8_t&,float&,uint8_t&> get_tied_tuple()
    {return std::tie(num, x, elevation);}
    std::tuple<const uint8_t&,const float&,const uint8_t&> get_tied_tuple() const
    {return std::tie(num, x, elevation);}
};

// needed only for test output
inline std::ostream& operator<<(std::ostream& os, const MsgData& msgData)
{
    os << '[' << static_cast<int>(msgData.num) << ' ' 
       << msgData.x << ' ' << static_cast<int>(msgData.elevation) << ']';
    return os;
}

namespace detail {

    // overload the following two for types that need special treatment
    template<typename T>
    const byte_t* read_value(const byte_t* bin, T& val)
    {
        val = *reinterpret_cast<const T*>(bin);
        return bin + sizeof(T)/sizeof(byte_t);
    }
    template<typename T>
    byte_t* write_value(byte_t* bin, const T& val)
    {
        *reinterpret_cast<T*>(bin) = val;
        return bin + sizeof(T)/sizeof(byte_t);
    }

    template< typename MsgTuple, unsigned int Size = std::tuple_size<MsgTuple>::value >
    struct msg_serializer;

    template< typename MsgTuple >
    struct msg_serializer<MsgTuple,0> {
        static const byte_t* read(const byte_t* bin, MsgTuple&) {return bin;}
        static byte_t* write(byte_t* bin, const MsgTuple&)      {return bin;}
    };

    template< typename MsgTuple, unsigned int Size >
    struct msg_serializer {
        static const byte_t* read(const byte_t* bin, MsgTuple& msg)
        {
            return read_value( msg_serializer<MsgTuple,Size-1>::read(bin, msg)
                             , std::get<Size-1>(msg) );
        }
        static byte_t* write(byte_t* bin, const MsgTuple& msg)
        {
            return write_value( msg_serializer<MsgTuple,Size-1>::write(bin, msg)
                              , std::get<Size-1>(msg) );
        }
    };

    template< class MsgTuple >
    inline const byte_t* do_read_msg(const byte_t* bin, MsgTuple msg)
    {
        return msg_serializer<MsgTuple>::read(bin, msg);
    }

    template< class MsgTuple >
    inline byte_t* do_write_msg(byte_t* bin, const MsgTuple& msg)
    {
        return msg_serializer<MsgTuple>::write(bin, msg);
    }
}

template< class Msg >
inline const byte_t* read_msg(const byte_t* bin, Msg& msg)
{
    return detail::do_read_msg(bin, msg.get_tied_tuple());
}

template< class Msg >
inline const byte_t* write_msg(byte_t* bin, const Msg& msg)
{
    return detail::do_write_msg(bin, msg.get_tied_tuple());
}

int main()
{
    byte_t buffer[MsgData::buffer_size];

    std::cout << "buffer size is " << MsgData::buffer_size << '\n';

    MsgData msgData;
    std::cout << "initializing data...";
    msgData.num = 42;
    msgData.x = 1.7f;
    msgData.elevation = 17;
    std::cout << "data is now " << msgData << '\n';
    write_msg(buffer, msgData);

    std::cout << "clearing data...";
    msgData = MsgData();
    std::cout << "data is now " << msgData << '\n';

    std::cout << "reading data...";
    read_msg(buffer, msgData);
    std::cout << "data is now " << msgData << '\n';

    return 0;
}