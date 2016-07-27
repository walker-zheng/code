#ifndef SOCK2_INCLUDED_
#define SOCK2_INCLUDED_

#include <string>
#include <iostream>
#include <winsock2.h>
#include <algorithm>

#pragma comment(lib, "ws2_32.lib")

namespace IP {
struct socket_user { 
    WSADATA data;
    socket_user() {
        WSAStartup(MAKEWORD(2, 2), &data);
    }
    ~socket_user() { 
        WSACleanup();
    }
};

class address {
    socket_user u;
    struct sockaddr_in dest;
    struct in_addr addr;

    hostent *lookup(std::string const &hostname) { 
        hostent *host;

        if (isdigit(hostname[0])) {
            addr.s_addr = inet_addr(hostname.c_str());
            host = gethostbyaddr((char const *)&addr, sizeof(addr), AF_INET);
        }
        else 
            host = gethostbyname(hostname.c_str());
        return host;
    }

public:

    address(std::string const &hostname, short port=80) {
        hostent *host = lookup(hostname);

        dest.sin_family = AF_INET;
        dest.sin_port = htons(port);

        addr.S_un.S_un_b.s_b1 = host->h_addr_list[0][0];
        addr.S_un.S_un_b.s_b2 = host->h_addr_list[0][1];
        addr.S_un.S_un_b.s_b3 = host->h_addr_list[0][2];
        addr.S_un.S_un_b.s_b4 = host->h_addr_list[0][3];
        dest.sin_addr = addr;
    }

    address(unsigned char b0, unsigned char b1, unsigned char b2, unsigned char b3, short port)
    {
        addr.S_un.S_un_b.s_b1 = b0;
        addr.S_un.S_un_b.s_b2 = b1;
        addr.S_un.S_un_b.s_b3 = b2;
        addr.S_un.S_un_b.s_b4 = b3;
        dest.sin_family = AF_INET;
        dest.sin_port = htons(port);
        dest.sin_addr = addr;
    }

    operator SOCKADDR *() const { return (SOCKADDR *)&dest; }

    size_t size() const { return sizeof(dest); }

    friend std::ostream &operator<<(std::ostream &os, address const &a) {
        return os << (short)a.addr.S_un.S_un_b.s_b1
            << "." << (short)a.addr.S_un.S_un_b.s_b2
            << "." << (short)a.addr.S_un.S_un_b.s_b3
            << "." << (short)a.addr.S_un.S_un_b.s_b4;
    }
};

namespace UDP { 
class socket { 
    SOCKET s;
    socket_user u;
public:
    socket() : s(::socket(AF_INET, SOCK_DGRAM, IPPROTO_UDP)) {}

    int setopt(int option, char const *val=NULL, int len = 0) {
        return setsockopt(s, SOL_SOCKET, option, val, len);
    }

    template <class T>
    int setopt(int option, T val) {
        return setsockopt(s, SOL_SOCKET, option, (char *) &val, sizeof(val));
    }

    template <class T>
    int send(T const &t, address const &a) { 
        return sendto(s, (char *)&t, sizeof(t), 0, a, a.size());
    }

    template <class T>
    void read(address const &a, T &buffer) {
        connect(s, a, a.size());
        recv(s, (char *)&buffer, sizeof(buffer), 0);
    }

    ~socket() { closesocket(s); }
};
}

namespace TCP {
class socket { 
    socket_user u;
    SOCKET s;
    address a;
    bool connected;

    void connect() { 
        if (connected) 
            return;
        ::connect(s, a, a.size()); 
        connected = true; 
    }

    void disconnect() {
        closesocket(s);
        connected = false;
    }

public:
    socket(address const &a_) 
        : s(::socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)), a(a_), connected(false) 
    {
        connect();
    }

    int send(std::string const &str) {
        return ::send(s, str.data(), str.size(), 0);
    }

    int read(void *buffer, size_t size) { 
        return ::recv(s, (char *)buffer, size, 0);
    }

    template <class T>
    int read(T &b) {
        return ::recv(s, (char *) &b, sizeof(b), 0);
    }

    ~socket() { closesocket(s); }
};
}

}

#endif