#pragma once

#ifdef _WIN32
    // Windows, any version:
    #include <WinSock2.h>
    typedef SOCKET NetSocketId;
    #define NET_INVALID_SOCKET_ID INVALID_SOCKET
    #define NET_SOCKET_ERROR      SOCKET_ERROR
#else // !_WIN32
    // Assume a Unix-like system:
    #include <sys/types.h>
    #include <sys/socket.h>
    #include <unistd.h>
    #include <fcntl.h>
    #include <netdb.h>
    #include <errno.h>
    #include <netinet/in.h>
    #include <arpa/inet.h>
    typedef int NetSocketId;
    #define NET_INVALID_SOCKET_ID (-1)
    #define NET_SOCKET_ERROR      (-1)
#endif // _WIN32

#include <stdexcept>
#include <string>

namespace Engine {

    // ======================================================
    // Socket exception type:
    // ======================================================

    class SocketError
        : public std::runtime_error {

    public:

        SocketError(const std::string & message);
    };

    // ======================================================
    // Socket base class:
    // ======================================================

    class Socket {

    public:

        // Underlaying socket connection types:
        enum class ConnectionType { Blocking, NonBlocking };

        // Construction / destructor:
        explicit Socket(NetSocketId sid);
        virtual ~Socket();

        // Copy is disallowed.
        Socket(const Socket & other) = delete;
        Socket & operator = (const Socket & other) = delete;

        // Is movable.
        Socket(Socket && other) noexcept;
        Socket & operator = (Socket && other) noexcept;

        // Read and write bytes to the socket stream:
        void ReceiveBytes(void * buffer, size_t numBytes) const;
        void SendBytes(const void * buffer, size_t numBytes) const;

        // Manually close a connection.
        // Note: This is done automatically by the destructor.
        void Close();

    protected:

        Socket();

        // Underlaying socket handle, specific to the platform.
        NetSocketId socketId;

    private:

        // Shared states management.
        // Network is initialized when the fist socket is created
        // and terminated when the last connection is closed.
        static void NetInit();
        static void NetShutdown();
        static int  numAliveSockets;
    };

    using SocketPtr = std::unique_ptr<Socket>;

    // ======================================================
    // ClientSocket:
    // ======================================================

    class ClientSocket
        : public Socket {

    public:

        ClientSocket(const std::string & hostNameOrIpAddress, const HostShort & portNumber);
    };

    using ClientSocketPtr = std::unique_ptr<ClientSocket>;

    // ======================================================
    // ServerSocket:
    // ======================================================

    class ServerSocket
        : public Socket {

    public:

        ServerSocket(const HostShort & portNumber, int pendingQueueSize, Socket::ConnectionType type);

        // Returns null if this is a non-blocking socket and there are no pending
        // connections. Block and wait for a connection if this is a blocking socket.
        SocketPtr AcceptConnection() const;
    };

    using ServerSocketPtr = std::unique_ptr<ServerSocket>;

} // namespace Engine {}