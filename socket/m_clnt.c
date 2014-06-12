#include <WINSOCK.H>

#include <stdio.h>

#define HELLO_PORT  7905    

#define HELLO_GROUP "228.4.5.6"    

#pragma comment(lib, "WSOCK32.lib")



int main(int argc, char *argv[])    

{    

        WSADATA     wsaData;

        WORD wVersionRequested;

        wVersionRequested = MAKEWORD(1,1);

        // Initialize Windows socket library

        WSAStartup(0x0202, &wsaData);

        struct sockaddr_in addr;    

        int fd, cnt;    

        char *message="Hello, World!";    

        /* create what looks like an ordinary UDP socket */    

        if ((fd=socket(AF_INET,SOCK_DGRAM,0)) < 0)     

        {    

                perror("socket");    

                exit(1);    

        }    

        /* set up destination address */    

        memset(&addr,0,sizeof(addr));    

        addr.sin_family=AF_INET;    

        addr.sin_addr.s_addr=inet_addr(HELLO_GROUP);    

        addr.sin_port=htons(HELLO_PORT);    

        /* now just sendto() our destination! */    

        while (1)    

        {    

                if (sendto(fd,message, strlen(message), 0, (struct sockaddr *) &addr, sizeof(addr)) < 0)     

                {    

                        perror("sendto");    

                        exit(1);    

                }    

                printf("Send %s\n",message);

                Sleep(1000);    

        }    

        return 0;    

}    
