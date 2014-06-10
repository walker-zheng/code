#include <sys/types.h>  
#include <sys/socket.h>  
#include <string.h>  
#include <netinet/in.h>  
#include <stdio.h>  
#include <stdlib.h>  
#include <arpa/inet.h>  
#include <unistd.h>  

#define MAXLINE 1024  
#define SERV_PORT 4000  

void do_cli(FILE *fp, int sockfd, struct sockaddr *pservaddr, socklen_t servlen)  
{  
        int n;  
        char sendline[MAXLINE], recvline[MAXLINE + 1];  


        if(connect(sockfd, (struct sockaddr *)pservaddr, servlen) == -1)  
        {  
                perror("connect error");  
                exit(1);  
        }  
        else  
        {  
                printf("connect OK\n");  
        }  

        fgets(sendline, MAXLINE, fp);  
        n = write(sockfd, sendline, strlen(sendline)-1);  
        if ( n <= 0)  
                perror("write error\n");  
        printf("write %s \n",sendline);  

}  

int main(int argc, char **argv)  
{  
        int sockfd;  
        struct sockaddr_in servaddr;  

        bzero(&servaddr, sizeof(servaddr));  
        servaddr.sin_family = AF_INET;  
        servaddr.sin_port = htons(SERV_PORT);  
        inet_aton("127.0.0.1",&(servaddr.sin_addr));  

        sockfd = socket(AF_INET, SOCK_DGRAM, 0);  

        do_cli(stdin, sockfd, (struct sockaddr *)&servaddr, sizeof(servaddr));  

        return 0;  
}  
