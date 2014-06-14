#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <errno.h>
#include <netinet/in.h>

//#define PORTNUM 5000
//#define GROUPIP "224.0.1.1"
#define PORTNUM 1900
#define GROUPIP "239.255.255.250"

int main()
{
	int sock_id;
	struct sockaddr_in addr;
	char buf[] = "This is a test message.";
	socklen_t len;
	int ret;
	
	/* open a socket. only udp support multicast */
	if ((sock_id = socket(AF_INET, SOCK_DGRAM, 0)) < 0) 
	{
		perror("socket error");
		exit(1);
	}

	/* build address */
	memset((void*)&addr, 0, sizeof(addr));
	addr.sin_family = AF_INET;
	addr.sin_addr.s_addr = inet_addr(GROUPIP); /* multicast group ip */ 
	addr.sin_port = htons(PORTNUM);
	
	len = sizeof(addr);
	
	while (1) 
	{
		/* it's very easy, just send the data to the address:port */
		ret = sendto(sock_id, buf, strlen(buf), 0,(struct sockaddr *)&addr, len);
		if (ret < 0) 
		{
			perror("sendto error");
			exit(1);
		}
		printf("Send to %s:%u\n",inet_ntoa(addr.sin_addr.s_addr), ntohs(addr.sin_port));
		usleep(2000000); /* wait 2 sec. */
	}
	
	close(sock_id);
	
	return 0;
}
