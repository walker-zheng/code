// Engine core:
#include "Engine/Core/Utilities.hpp"
#include "Engine/Core/Common.hpp"

// Networking:
#include "Engine/Networking/NetCommon.hpp"
#include "Engine/Networking/Sockets.hpp"

// This will automatically add the network
// library for a Windows build on Visual Studio.
#ifdef _MSC_VER
    #pragma comment(lib, "Ws2_32.lib")
#endif

namespace Engine {

// ======================================================
// Socket exception type:
// ======================================================

SocketError::SocketError(const std::string & message)
    #ifdef _WIN32
    : std::runtime_error(message + std::string(" | sys error: ") + std::to_string(WSAGetLastError()))
    #else // !_WIN32
    : std::runtime_error(message + std::string(" | sys error: ") + std::strerror(errno))
    #endif // _WIN32
{
    // Socket error message will be formated as:
    //   user message | sys error: return from strerror(errno) or WSAGetLastError()
    //
    // List of WSA error codes:
    //   http://msdn.microsoft.com/en-us/library/windows/desktop/ms740668(v=vs.85).aspx
}

// ======================================================
// Static network initialization:
// ======================================================

int Socket::numAliveSockets = 0;

void Socket::NetInit()
{
    if (numAliveSockets == 0)
    {
        common->PrintF("-------- Socket::NetInit() ---------");

        #ifdef _WIN32
        WSADATA info;
        if (WSAStartup(MAKEWORD(2, 0), &info) != 0)
        {
            throw SocketError("Couldn't start WSA!");
        }
        #endif // _WIN32
    }

    ++numAliveSockets;
}

void Socket::NetShutdown()
{
    assert(numAliveSockets == 0);
    common->PrintF("------ Socket::NetShutdown() -------");

    #ifdef _WIN32
    WSACleanup();
    #endif // _WIN32
}

// ======================================================
// Socket:
// ======================================================

Socket::Socket()
    : socketId(NET_INVALID_SOCKET_ID)
{
    NetInit();

    // `AF_INET` is for IPv4.
    // UDP would use `SOCK_DGRAM` instead of `SOCK_STREAM`.
    //
    // About the last parameter `protocol`:
    //   "If a value of 0 is specified, the caller does not wish to specify
    //   a protocol and the service provider will choose the protocol to use."
    //
    socketId = socket(AF_INET, SOCK_STREAM, /* protocol = */ 0);
    if (socketId == NET_INVALID_SOCKET_ID)
    {
        throw SocketError("Failed to create socket with 'socket(AF_INET, SOCK_STREAM, 0)'!");
    }
}

Socket::Socket(const NetSocketId sid)
    : socketId(NET_INVALID_SOCKET_ID)
{
    NetInit();
    socketId = sid;
}

Socket::Socket(Socket && other) noexcept
{
    socketId       = other.socketId;
    other.socketId = NET_INVALID_SOCKET_ID;
}

Socket & Socket::operator = (Socket && other) noexcept
{
    socketId       = other.socketId;
    other.socketId = NET_INVALID_SOCKET_ID;
    return *this;
}

Socket::~Socket()
{
    Close();

    // Finalize the network when the last connection closes.
    if (--numAliveSockets == 0)
    {
        NetShutdown();
    }
}

void Socket::Close()
{
    if (socketId != NET_INVALID_SOCKET_ID)
    {
        int result;

        #ifdef _WIN32
        result = closesocket(socketId);
        #else // !_WIN32
        result = close(socketId);
        #endif // _WIN32

        if (result == 0)
        {
            common->PrintF("Closed socket connection...");
        }
        else
        {
            common->WarningF("Failed to close a socket connection!");
        }

        socketId = NET_INVALID_SOCKET_ID;
    }
}

void Socket::ReceiveBytes(void * buffer, const size_t numBytes) const
{
    assert(socketId != NET_INVALID_SOCKET_ID);
    assert(buffer   != nullptr);
    assert(numBytes != 0);

    const long result = recv(socketId, buffer, numBytes, 0);

    if (result == NET_SOCKET_ERROR)
    {
        throw SocketError("Failed to 'recv()' bytes! NET_SOCKET_ERROR!");
    }
    else if (static_cast<size_t>(result) != numBytes)
    {
        throw SocketError("Failed to 'recv()' bytes! Not enough bytes read!");
    }
    // Successful recv().
}

void Socket::SendBytes(const void * buffer, const size_t numBytes) const
{
    assert(socketId != NET_INVALID_SOCKET_ID);
    assert(buffer   != nullptr);
    assert(numBytes != 0);

    const long result = send(socketId, buffer, numBytes, 0);

    if (result == NET_SOCKET_ERROR)
    {
        throw SocketError("Failed to 'send()' bytes! NET_SOCKET_ERROR!");
    }
    else if (static_cast<size_t>(result) != numBytes)
    {
        throw SocketError("Failed to 'send()' bytes! Couldn't send all the data!");
    }
    // Successful send().
}

// ======================================================
// ClientSocket:
// ======================================================

ClientSocket::ClientSocket(const std::string & hostNameOrIpAddress, const HostShort & portNumber)
{
    // Should have been initialized by the superclass.
    assert(socketId != NET_INVALID_SOCKET_ID);

    // Must have an IP address or URL.
    assert(!hostNameOrIpAddress.empty());

    //
    // Note: `gethostbyname()` is deprecated in WinSock2 in favor
    // of `getaddrinfo()`. So this is a possible future improvement.
    //
    hostent * hostEntity = gethostbyname(hostNameOrIpAddress.c_str());
    if (hostEntity == nullptr)
    {
        Close();
        throw SocketError("Failed to get hostent for " + hostNameOrIpAddress);
    }

    sockaddr_in addr;
    std::memset(&addr, 0, sizeof(addr));

    addr.sin_family = AF_INET;
    addr.sin_port   = portNumber.ToNetShort().GetRawValue();
    addr.sin_addr   = *reinterpret_cast<in_addr *>(hostEntity->h_addr);

    if (connect(socketId, reinterpret_cast<sockaddr *>(&addr), sizeof(addr)) != 0)
    {
        Close();
        throw SocketError("Failed to connect with host " + hostNameOrIpAddress +
                " at port #" + std::to_string(portNumber.GetRawValue()));
    }
}

// ======================================================
// ServerSocket:
// ======================================================

ServerSocket::ServerSocket(const HostShort & portNumber, const int pendingQueueSize, const Socket::ConnectionType type)
{
    // Should have been initialized by the superclass.
    assert(socketId != NET_INVALID_SOCKET_ID);

    sockaddr_in addr;
    std::memset(&addr, 0, sizeof(addr));

    addr.sin_family = PF_INET;
    addr.sin_port   = portNumber.ToNetShort().GetRawValue();

    // Optionally set non-blocking.
    // Windows requires a different system call.
    if (type == Socket::ConnectionType::NonBlocking)
    {
        #ifdef _WIN32
        u_long arg = 1;
        ioctlsocket(socketId, FIONBIO, &arg);
        #else // !_WIN32
        fcntl(socketId, F_SETFL, O_NONBLOCK);
        #endif // _WIN32
    }

    // Bind server to the port and start listening at it:
    //
    if (bind(socketId, reinterpret_cast<sockaddr *>(&addr), sizeof(addr)) != 0)
    {
        Close();
        throw SocketError("Failed to 'bind()' socket to port #" +
                std::to_string(portNumber.GetRawValue()));
    }

    if (listen(socketId, pendingQueueSize) != 0)
    {
        Close();
        throw SocketError("Failed to 'listen()' at port #" +
                std::to_string(portNumber.GetRawValue()));
    }
}

SocketPtr ServerSocket::AcceptConnection() const
{
    assert(socketId != NET_INVALID_SOCKET_ID);

    errno = 0;
    const NetSocketId newSocket = accept(socketId, nullptr, nullptr);
    if (newSocket == NET_INVALID_SOCKET_ID)
    {
        // Non-blocking call / no request pending
        #ifdef _WIN32
        if (WSAGetLastError() == WSAEWOULDBLOCK)
        {
            return nullptr;
        }
        #else // !_WIN32
        if (errno == EAGAIN)
        {
            return nullptr;
        }
        #endif // _WIN32

        throw SocketError("'accept()' failed with an invalid socketId!");
    }

    return SocketPtr(new Socket(newSocket));
}

} // namespace Engine {}