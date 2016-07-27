    class Socket {
    protected:


        Socket(SOCKET s);
        Socket();
        SOCKET s_;
        sockaddr_in sa_;
        int* count_;

    private:
        static void StartSocket();
        static void EndSocket();
        static int  totalNumberSockets_;



    public:

        virtual ~Socket();
        Socket(const Socket&);


        std::string RecvData();
        void SendData(std::string);

        void Close();

    };

using namespace std;




//start sockect 
void Socket::StartSocket() {
    if (!totalNumberSockets_) {
        WSADATA info;
        if (WSAStartup(MAKEWORD(2, 0), &info)) {
            throw "Could not start WSA";
        }
    }
    ++totalNumberSockets_;
}


//end end the socket
void Socket::EndSocket() {
    WSACleanup();
}

Socket::Socket() : s_(0) {
    StartSocket();
    s_ = socket(AF_INET, SOCK_STREAM, 0);

    if (s_ == INVALID_SOCKET) {
        cerr << "Error at Socket(): " << WSAGetLastError() << endl;
        throw "INVALID_SOCKET";
    }

    count_ = new int(1);
}

Socket::Socket(SOCKET s) : s_(s) {
    StartSocket();
    count_ = new int(1);
};

Socket::~Socket() {
    if (!--(*count_)) {
        Close();
        delete count_;
    }
    --totalNumberSockets_;
    if (!totalNumberSockets_)
        EndSocket();
}

Socket::Socket(const Socket& o) {
    count_ = o.count_;
    (*count_)++;
    s_ = o.s_;


    totalNumberSockets_++;
}



void Socket::Close() {
    closesocket(s_);
}



std::string Socket::RecvData() {
    std::string strBuffer;
    do{
        char buffer;
        int recvInt = recv(s_, &buffer, 1, 0);
        if (recvInt == INVALID_SOCKET)
        {
            return "";
        }
        if (recvInt == SOCKET_ERROR)
        {
            if (errno == EAGAIN) {
                return strBuffer;
            }
            else {
                // not connected anymore
                return "";
            }
        }

        strBuffer += buffer;
        if (buffer == '\n')  return strBuffer;
    } while (true);
}
void Socket::SendData(std::string s) {
    s += "\n";
    send(s_, s.c_str(), s.length(), 0);
}