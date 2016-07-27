#include <iostream>
#include <string>
#include <Windows.h>

class Socket 
{
private:
    WSADATA         wsaData;
    SOCKET          hSocket;
    sockaddr_in     service;
    std::string     addr;
    USHORT          port;
    int             exitCode;

    bool initializeWSA();
    bool initializeSocket();
    bool bind();
    bool listen();
    bool connect();

    /// Modified copy constructor for *accepted* connection sockets
    Socket(Socket& socket, SOCKET hSockect) :   hSocket( hSockect ), 
                                            wsaData( socket.wsaData ),
                                            service( socket.service ),
                                            addr( socket.addr ),
                                            port( socket.port ){}
public:
    bool close();
    Socket* acceptConnection();

    /// Default Constructor
    Socket()
    {}

    /// Main Constructor
    Socket(std::string addr, USHORT port, bool actAsServer = false) : addr( addr ), port( port )
    {
        initializeWSA();
        initializeSocket();

        service.sin_family = AF_INET;
        service.sin_addr.s_addr = inet_addr(addr.c_str());
        service.sin_port = htons(port);

        if( actAsServer )
        {
            bind();
            listen();
        }
        else
            connect();
    }

    template<class T>
    int recvData(T& i) {

        try
        {
            int ret = ::recv( hSocket, reinterpret_cast<char*>(&i), 32, 0 );
            if( ret == SOCKET_ERROR )

             throw   WSAGetLastError();

            return ret;
        }
        catch(std::exception& e)
        {
            std::cerr << "Socket//error while receiving; Error#" << WSAGetLastError() << "." << std::endl;
        }
    }
    /// recv specialization for std::string
    int recvData<std::string>(std::string& i)
    {
        try
        {
            int cread;
            // receive string size
            long length = 0;
            cread = ::recv( hSocket, reinterpret_cast<char*>(&length), sizeof( length ), 0 );
            if( cread == SOCKET_ERROR )
            {
                throw WSAGetLastError();
                return cread;
            }
            length = ntohl( length );
            // receive string
            while( 0 < length ) {
                char buffer[1024];
                int cread;
                cread = ::recv( hSocket, buffer, min( sizeof( buffer ), length ), 0 );
                if( cread == SOCKET_ERROR )
                {
                    throw WSAGetLastError();
                    return cread;
                }
                i.append( buffer, cread );
                length -= cread;
            }
            return i.length();
        }
        catch(std::exception& e)
        {
            std::cerr << "Socket//error while receiving; Error#" << WSAGetLastError() << "." << std::endl;
        }
    }


    template<class T>
    int sendData(T& i) {
        try
        {
        int ret = ::send( _hSocket, reinterpret_cast<const char*>(&i), sizeof(i), 0 );
        if( ret == SOCKET_ERROR )

            throw WSAGetLastError();
        return ret;
        }
        catch(std::exception& e)
        {
            std::cerr << "Socket//error while receiving; Error#" << WSAGetLastError() << "." << std::endl;
        }
    }
    /// send specialization for std::string
    int sendData<std::string>(std::string& i)
    {
        try
        {
        int ret;
        // send length of string
        long length = htonl( i.length() );
        ret = ::send( hSocket, reinterpret_cast<const char*>(&length), sizeof(length), 0 );
        if( ret == SOCKET_ERROR )
        {
            throw WSAGetLastError();

            return ret;
        }
        // send string
        ret = ::send( hSocket, i.data(), i.length(), 0 );
        if( ret == SOCKET_ERROR )
        {
            throw WSAGetLastError();

            return ret;
        }
        return ret;
        }
        catch(std::exception& e)
        {
            std::cerr << "Socket//error while receiving; Error#" << WSAGetLastError() << "." << std::endl;
        }
    }
    template<>
    int sendData<char*>(char*& i)
    {
        std::string data;
        data.append( i );
        sendData( data );
    }

    /// Default Deconstructor, cleans up socket handle
    ~Socket() { close(); }
};