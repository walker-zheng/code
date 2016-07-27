void client (string ip, int port, string msg) {

    #ifdef WIN32
    WSADATA wsaData;
    if ((WSAStartup(MAKEWORD(2,2), &wsaData)!=0)) {
        cout << CL_WSA_ERR;
        return;
    }
	#endif

    SOCKET sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if(sock<0) {
        cout << CL_SOCK_ERR;
        return;
    } else cout << CL_SOCK_OK;

    sockaddr_in client_addr;

    client_addr.sin_family=AF_INET;
    client_addr.sin_addr.s_addr = inet_addr(ip.c_str());
    client_addr.sin_port=htons(port);

    struct timeval tv;
    tv.tv_sec = 5;
    setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO,(char *)&tv,sizeof(struct timeval));

    if(connect(sock, (struct sockaddr *)&client_addr, sizeof(client_addr))<0) {
        cout << "\nconnect - " << strerror(errno) << "\n";
        return;
    }//cout << CL_CONNECT_ERR;
    else cout << CL_CONNECT_OK;

    char buffer[100];
    int s = send(sock, msg.c_str(), msg.size()+1, 0);
        if(s<0) {
            cout << "\nsend - " << strerror(errno) << " - " << errno << "\n"; //cout << CL_SEND_ERR;
            #ifdef __linux__
            close(sock);
            #else
            closesocket(sock); WSACleanup();
            #endif
            return;
        }

    int r = recv(sock, buffer, sizeof(buffer), 0);
    if(r) {
        buffer[r]='\0',
        cout << "Received:" << buffer << endl;
    }

    #ifdef __linux__
    close(sock);
    #else
    closesocket(sock); WSACleanup();
    #endif
return;
}
