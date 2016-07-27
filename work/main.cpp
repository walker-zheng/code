#include "TcpSocket.hpp"

#include <iostream>
#include <exception>
#include <cstring>
#include <memory>

using namespace Socket;
using Socket_p = std::shared_ptr<TcpSocket>;

int main(int argc, char *argv[])
{

    Socket_p sock(new TcpSocket);
    Socket_p client;
    try {
        sock->bind(1170);
        sock->listen(5);
        client = sock->accept();
    }
    catch( std::exception &e)
    {
        std::cout << e.what() << std::endl;
    }

    //Welcoming the new user.
    client->send("Welcome !\n\f", 15, 0);
    //Closing the listening soket, we want nobody else.
    sock->close();

    char data[512];
    memset(&data, 0, 512);
    while( client->receive(data, sizeof data, 0) )
    {
        client->send(data, sizeof data, 0);
        memset(&data, 0, 512);
    }

    client->close();

    return 0;
}