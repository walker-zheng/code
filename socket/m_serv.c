#include <WINSOCK.H>

#include <stdio.h>

#define HELLO_PORT  7905    

#define HELLO_GROUP "228.4.5.6"    

#define MSGBUFSIZE 256    

#pragma comment(lib, "WSOCK32.lib")

int main(int argc, char *argv[])    

{    

        WSADATA     wsaData;

        WORD wVersionRequested;// Version

        wVersionRequested = MAKEWORD(1,1);//Version Info

        // Initialize Windows socket library

        WSAStartup(wVersionRequested, &wsaData);

        struct sockaddr_in addr;    

        int fd, nbytes,addrlen;    

        struct ip_mreq mreq;    

        char msgbuf[MSGBUFSIZE];    

        u_int yes=1; /*** MODIFICATION TO ORIGINAL */    

        /* create what looks like an ordinary UDP socket */    

        if ((fd=socket(AF_INET,SOCK_DGRAM,0)) < 0)     

        {    

                perror("socket");    

                exit(1);    

        }    

        /**** MODIFICATION TO ORIGINAL */    

        /* allow multiple sockets to use the same PORT number */    

        if (setsockopt(fd,SOL_SOCKET,SO_REUSEADDR,(char *)&yes,sizeof(yes)) < 0)     

        {    

                perror("Reusing ADDR failed");    

                exit(1);    

        }    

        /*** END OF MODIFICATION TO ORIGINAL */    

        /* set up destination address */    

        memset(&addr,0,sizeof(addr));    

        addr.sin_family=AF_INET;    

        addr.sin_addr.s_addr=htonl(INADDR_ANY); /* N.B.: differs from sender */    

        addr.sin_port=htons(HELLO_PORT);    

        /* bind to receive address */    

        if (bind(fd,(struct sockaddr *) &addr,sizeof(addr)) < 0)    

        {    

                perror("bind");    

                exit(1);    

        }    

        /* use setsockopt() to request that the kernel join a multicast group */    

        mreq.imr_multiaddr.s_addr=inet_addr(HELLO_GROUP);    

        mreq.imr_interface.s_addr=htonl(INADDR_ANY);    

        if (setsockopt(fd,IPPROTO_IP,IP_ADD_MEMBERSHIP,(char *)&mreq,sizeof(mreq)) < 0)     

        {    

                int err=GetLastError();

                printf("setsockopt:%d",err);    

                exit(1);    

        }    

        /* now just enter a read-print loop */    

        while (1)     

        {    

                //ssize_t recvfrom(int s, void *buf, size_t len, int flags, struct sockaddr *from, socklen_t *fromlen);    

                addrlen=sizeof(addr);  

                printf("Receiving..."); 

                //if((nbytes=recvfrom(fd,msgbuf,MSGBUFSIZE,0,NULL,NULL))<0)

                if ((nbytes=recvfrom(fd, msgbuf, MSGBUFSIZE, 0, (struct sockaddr *) &addr, (int *)&addrlen)) < 0)     

                {    

                        perror("recvfrom");    

                        exit(1);    

                } msgbuf[nbytes]  ='\0'; 

                printf("%s",msgbuf);    

        }    

        return 0;    

}  
