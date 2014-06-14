#include<stdio.h>
#include<stdlib.h>
#include<errno.h>
#include<string.h>
#include<sys/types.h>
#include<netinet/in.h>
#include<sys/socket.h>
#include<sys/wait.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<unistd.h>
#include <arpa/inet.h>
#include<netdb.h>

#define PORT 9999

int main(int argc,char* argv[])
{
	int sockfd;
	struct sockaddr_in their_addr;
	struct in_addr addr;
	struct hostent *he;
	int broadcast = 1;
	int num = 0;
	
	if( (sockfd = socket(AF_INET,SOCK_DGRAM,0)) == -1 )
	{
        perror("socket function!\n");
        exit(1);
	}
	
	if( setsockopt(sockfd,SOL_SOCKET,SO_BROADCAST,&broadcast,sizeof(broadcast)) == -1)
	{
        perror("setsockopt function!\n");
        exit(1);
	}
	
	their_addr.sin_family = AF_INET;
	their_addr.sin_port = htons(PORT);
	//their_addr.sin_addr.s_addr=htonl(INADDR_ANY);
	 their_addr.sin_addr.s_addr=inet_addr("255.255.255.255");
	 
	while(1)
	{
		if( (num = sendto( sockfd,"hello 123!",10,0,(struct sockaddr *)&their_addr,sizeof(struct sockaddr) )) == -1)
		{
	        perror("sendto function!\n");
	        exit(1);
		}
		
		printf("Send %d bytes to %s\n",num,inet_ntoa(their_addr.sin_addr) );
		
		usleep(5000000);
	}
	
	close(sockfd);
	
	return 0;
}
