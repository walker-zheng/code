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

#define BUFLEN 1024
#define TESTNUM 10

int main()
{
	int sock_id;
	struct sockaddr_in addr, sender;
	struct ip_mreq ipmr;
	char buf[BUFLEN];
	socklen_t len;
	int ret;
	int count;

	/* Step 1: open a socket, and bind */
	if ((sock_id = socket(AF_INET, SOCK_DGRAM, 0)) < 0) 
	{
		perror("socket error");
		exit(1);
	}

	memset((void*)&addr, 0, sizeof(addr));
	addr.sin_family = AF_INET;
	addr.sin_addr.s_addr = htonl(INADDR_ANY);
	addr.sin_port = htons(PORTNUM);
	
	if (bind(sock_id, (struct sockaddr *)&addr, sizeof(addr)) < 0) 
	{
		perror("bind error");
		exit(1);
	}

	/* Step 2: fill in a struct ip_mreq */
	memset((void*)&ipmr, 0, sizeof(ipmr));
	ipmr.imr_multiaddr.s_addr = inet_addr(GROUPIP); /* multicast group ip */
	ipmr.imr_interface.s_addr = htonl(INADDR_ANY);
	
	/* Step 3: call setsockopt with IP_ADD_MEMBERSHIP to support receiving multicast */
	if (setsockopt(sock_id, IPPROTO_IP, IP_ADD_MEMBERSHIP, &ipmr, sizeof(ipmr)) < 0) 
	{
		perror("setsockopt:IP_ADD_MEMBERSHIP");
		exit(1);
	}

	/* Step 4: call recvfrom to receive multicast packets */
	len = sizeof(sender);
	count = 0;
	while (count < TESTNUM) 
	{
		ret = recvfrom(sock_id, buf, BUFLEN, 0, (struct sockaddr *)&sender, &len);
		buf[ret] = '\0';
		if (ret < 0) 
		{
			perror("recvfrom error");
			exit(1);
		}
		printf("%d. Receive from %s:%u\n", count,
		inet_ntoa(sender.sin_addr.s_addr), ntohs(sender.sin_port));
		printf("\tpacket data: %s\n", buf);
	}

	/* Step 5: call setsockopt with IP_DROP_MEMBERSHIP to drop from multicast */
	if (setsockopt(sock_id, IPPROTO_IP, IP_DROP_MEMBERSHIP, &ipmr, sizeof(ipmr)) < 0) 
	{
		perror("setsockopt:IP_DROP_MEMBERSHIP");
		exit(1);
	}

	/* Step 6: close the socket */
	close(sock_id);
	
	return 0;
}
