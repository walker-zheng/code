#ifndef TCPSOCKET_H
#define TCPSOCKET_H

#include <netdb.h>
#include <string>
#include <memory>

namespace Socket {

    /**
     * TcpSocket class implementation to facilitate the use of sockets
     */

    class TcpSocket
    {
    public:
        TcpSocket();
        TcpSocket(int family, int flags);
        TcpSocket(int socket, addrinfo info, bool connected, bool bound);
        virtual ~TcpSocket();

        //Avoiding copy
        TcpSocket(const TcpSocket &socket) = delete;
        TcpSocket &operator=(const TcpSocket &socket) = delete;

        void bind(int port);
        void connect(std::string adress, int port);
        void listen(int maxQueue);
        std::shared_ptr<TcpSocket> accept();
        void send(const char *data, unsigned int length, int flags);
        /**
         * Receive data (blocking)
         *@return true if socket is still open, false otherwise
         */
        bool receive(char* msg, int len, int flags);
        void close();

    private:
        void setInfo(int port);
        void setInfo(std::string adress, int port);
        void openSocket(addrinfo *info);
        addrinfo * mInfo;
        int mSock = -1;
        bool mSockCreated = false;
        bool mBound = false;
        bool mConnected = false;
        bool mClosed = false;
    };

}

#endif