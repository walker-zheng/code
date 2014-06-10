#include <stdio.h>  
#include <sys/socket.h>  
#include <sys/epoll.h>  
#include <netinet/in.h>  
#include <arpa/inet.h>  
#include <fcntl.h>  
#include <unistd.h>  
#include <errno.h>  
#include <stdlib.h>  
#include <string.h>  
#include <errno.h>  

int main(){  
        int fd;  
        struct sockaddr_in clientaddr;  
        char  recvline[1000] = "abcdef";  
        int n = 0;  
        if((fd = socket(AF_INET, SOCK_STREAM, 0)) < 0)  
                perror("socket create error");  

        bzero(&clientaddr, sizeof(clientaddr));  
        clientaddr.sin_family = AF_INET;  
        inet_aton("127.0.0.1",&(clientaddr.sin_addr));  
        clientaddr.sin_port = htons(1235);  

        if(connect(fd, (struct sockaddr *)&clientaddr,sizeof(clientaddr)) < 0)  
                perror("connect error");  
        printf("%d\n",fd);  
        while((n = write(fd, recvline,6))>0){  
                printf("recvline = %s",recvline);  
                if(n > 0)  
                        break;  
        }  
        if (n < 0)  
                perror("write error");  

        exit(0);  
}  
