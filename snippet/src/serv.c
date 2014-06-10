#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <netinet/in.h>
#include <sys/socket.h>
#include <sys/wait.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <fcntl.h>
#include <sys/epoll.h>
#include <sys/time.h>
#include <sys/resource.h>


#define MAXLINE 100
#define OPEN_MAX 100
#define LISTENQ 20
#define SERV_TPORT 5000
#define SERV_UPORT 5001

#define INFTIM 1000


int setnonblocking(int sockfd)
{
    if (fcntl(sockfd, F_SETFL, fcntl(sockfd, F_GETFD, 0)|O_NONBLOCK) == -1)
    {
        return -1;
    }
    return 0;
}

int main(int argc, char* argv[])
{
    int i, tfd_listener, connfd, ufd_listener, sockfd,epfd,nfds, portnumber;
    ssize_t n;
    char line[MAXLINE] = "abcdefg";
    socklen_t clilen;

    int count = 0;

    struct epoll_event ev,events[20];
    struct sockaddr_in clientaddr;
    struct sockaddr_in serveraddr;
    struct sockaddr_in my_addr;

    tfd_listener = socket(AF_INET, SOCK_STREAM, 0);
    if(tfd_listener < 0)
        perror("tfd_listener create error\n");

    ufd_listener = socket(PF_INET,  SOCK_DGRAM, 0);
    if(ufd_listener < 0)
        perror("ufd_listener create error\n");

    int opt=SO_REUSEADDR;
    setsockopt(ufd_listener,SOL_SOCKET,SO_REUSEADDR,&opt,sizeof(opt));

    setnonblocking(ufd_listener);
    setnonblocking(tfd_listener);

    bzero(&my_addr, sizeof(my_addr));
    my_addr.sin_family = PF_INET;
    my_addr.sin_port = htons(4000);
    my_addr.sin_addr.s_addr = INADDR_ANY;


    bzero(&serveraddr, sizeof(serveraddr));
    serveraddr.sin_family = AF_INET;
    serveraddr.sin_addr.s_addr = INADDR_ANY;
    serveraddr.sin_port=htons(1235);

    if (bind(ufd_listener, (struct sockaddr *) &my_addr, sizeof(struct sockaddr)) == -1)
        perror("ufd_listener bind error\n");

    if(bind(tfd_listener,(struct sockaddr *)&serveraddr, sizeof(struct sockaddr))== -1)
        perror("tfd_listener bind error\n");

    epfd=epoll_create(256);

    ev.data.fd=tfd_listener;
    ev.events=EPOLLIN|EPOLLET;
    epoll_ctl(epfd,EPOLL_CTL_ADD,tfd_listener,&ev);

    ev.data.fd = ufd_listener;
    ev.events = EPOLLIN|EPOLLET;
    epoll_ctl(epfd,EPOLL_CTL_ADD,ufd_listener,&ev);

    listen(tfd_listener, LISTENQ);

    for ( ; ; ) {

        nfds=epoll_wait(epfd,events,20,500);

        printf("wait end nfds = %d\n",nfds);

        for(i=0;i<nfds;++i)
        {
            if(events[i].data.fd == tfd_listener)
            {
                connfd = accept(tfd_listener,(struct sockaddr *)&clientaddr, &clilen);
                if(connfd<0){
                    perror("connfd<0");
                    exit(1);
                }
                setnonblocking(connfd);
                char *str = inet_ntoa(clientaddr.sin_addr);
                printf("accept a connection from %s\n", str);

                ev.data.fd=connfd;
                ev.events=EPOLLIN|EPOLLET;
                epoll_ctl(epfd,EPOLL_CTL_ADD,connfd,&ev);

            }
            else if(events[i].data.fd == ufd_listener)
            {
                printf("udp\n");
                if( events[i].events && EPOLLIN )
                    printf( "udp receive begin!\n" );
                n = recvfrom(ufd_listener, line,MAXLINE, 0,
                        (struct sockaddr *)&clientaddr, &clilen);
                if(n < 0)
                    perror( "udp receive ERROR\n" );
                else
                    printf( "udp receive right!\n" );

            }
            else if(events[i].events&EPOLLIN)//如果是已经连接的用户，并且收到数据，那么进行读入。
            {
                printf("count == %d\n",count);
                count ++;
                if ( (sockfd = events[i].data.fd) < 0)
                    continue;
                if ( (n = read(sockfd, line, MAXLINE)) < 0) {
                    if (errno == ECONNRESET) {
                        close(sockfd);
                        events[i].data.fd = -1;
                    }
                    else
                        printf("readline error\n");
                }
                else if (n == 0) {
                    printf("close tcp port\n");
                    close(sockfd);
                    events[i].data.fd = -1;
                }
                else
                {
                    printf("read OK %s\n", line);
                    line[n] = '/0';
                }
                ev.data.fd=sockfd;
                ev.events=EPOLLOUT|EPOLLET;
                epoll_ctl(epfd,EPOLL_CTL_ADD,connfd,&ev);
            }else if(events[i].events&EPOLLOUT) // 如果有数据发送

            {
                printf("write \n");
                sockfd = events[i].data.fd;
                write(sockfd, line, n);
                //设置用于读操作的文件描述符

                ev.data.fd=sockfd;
                //设置用于注测的读操作事件

                ev.events=EPOLLIN|EPOLLET;
                //修改sockfd上要处理的事件为EPOLIN

                epoll_ctl(epfd,EPOLL_CTL_MOD,sockfd,&ev);
            }
        }
    }
    return 0;
}
