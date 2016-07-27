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
    if(r) {		// -1 ?
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
void server(string ip) {

	#ifdef WIN32
    WSADATA wsaData;
    if ((WSAStartup(MAKEWORD(2,2), &wsaData)!=0)) {
        cout << SRV_WSA_ERR;
        return;
    }
	#endif

    SOCKET sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if(sock<0) {
        cout << SRV_SOCK_ERR;
        return;
    } else cout << SRV_SOCK_OK;

    sockaddr_in server_addr, client_addr;


    server_addr.sin_family=AF_INET;
    server_addr.sin_addr.s_addr = inet_addr(ip.c_str());
    server_addr.sin_port=htons(40000);

    socklen_t client_addr_size = sizeof(client_addr);

    struct timeval tv;
    tv.tv_sec = 5;
    setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO, (char *)&tv, sizeof(struct timeval));

    if(bind (sock, (struct sockaddr *)&server_addr, sizeof(server_addr)) < 0) {
        cout << SRV_BIND_ERR;
        return;
    } else cout << SRV_BIND_OK;

    int sb;

    if(listen(sock,0)<0) cout << SRV_LISTEN_ERR;
    else cout << SRV_LISTEN_OK;

    SOCKET a = accept(sock, (struct sockaddr *)&client_addr, &client_addr_size);
    if(a<0) cout << SRV_ACCEPT_ERR;
    else cout << SRV_ACCEPT_OK << " " << inet_ntoa(client_addr.sin_addr) << ":" << ntohs(client_addr.sin_port) << "\n";

    while(b_server) {

        sb = recv(a, buffmsg, MTUSIZE, 0);
        if(sb>0) {

            boost::mutex::scoped_lock lock(io_mutex);

            cout << "Received:\n" << buffmsg << "\n";
        }

         Wait(1);
    }
    boost::mutex::scoped_lock lock(io_mutex);
    #ifdef __linux__
        close(sock); close(a);
    #else
        closesocket(a); closesocket(sock);
        WSACleanup();
    #endif

}


int main(int argc, char* argv[]) {


    int s;

    ip=string(argv[1]);
    boost::thread wt_server = boost::thread(boost::bind(server,ip));

    	#ifdef WIN32
    WSADATA wsaData;
    if ((WSAStartup(MAKEWORD(2,2), &wsaData)!=0)) {
        cout << CL_WSA_ERR;
        return 0;
    }
	#endif

    SOCKET sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
    if(sock<0) {
        cout << CL_SOCK_ERR;
        return 0;
    } else cout << CL_SOCK_OK;

    sockaddr_in client_addr;

    Wait(100);
    ip=string(argv[2]);

    client_addr.sin_family=AF_INET;
    client_addr.sin_addr.s_addr = inet_addr(ip.c_str());
    client_addr.sin_port=htons(40000);

    struct timeval tv;
    tv.tv_sec = 5;
    setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO, (char *)&tv, sizeof(struct timeval));

	
    if(connect(sock, (struct sockaddr *)&client_addr, sizeof(client_addr))<0)
   	cout << CL_CONNECT_ERR;
    else cout << CL_CONNECT_OK;

    while(b_client) {

        cin.getline(getCmd,1000);

        if(strcmp(getCmd,"exit")==0) {
            b_server = b_client = false;
            wt_server.join();
			#ifdef __linux__
			close(sock);
			#else
            closesocket(sock); WSACleanup();
			#endif
        }
        else if(strlen(getCmd)>0) {

            s = send(sock, getCmd, strlen(getCmd)+1, 0);
            if(s<0) cout << CL_SEND_ERR;

        }

        Wait(1);
    }

    return 0;
}