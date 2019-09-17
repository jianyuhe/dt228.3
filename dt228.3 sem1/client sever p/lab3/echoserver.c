#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include "Practical.h"
#include <unistd.h>
#include <time.h>

static const int MAXPENDING = 5;

int main(int argc, char *argv[])
{
	time_t ticks;
		int numBytes = 0;
	char sendbufer[BUFSIZE];
	char recvbuffer[BUFSIZE];
	
	if (argc != 2)
		DieWithUserMessage("Paramet(s)","<Server Port>");
	
	in_port_t servPort = atoi(argv[1]);
	
	int servSock;
	if((servSock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0)
		DieWithSystemMessage("socket() failed");
	
	
	
    struct sockaddr_in servAddr;
	memset(&servAddr, 0, sizeof(servAddr));
	servAddr.sin_family = AF_INET;
	servAddr.sin_addr.s_addr = htonl(INADDR_ANY);
	servAddr.sin_port = htons(servPort);
	
	if(bind(servSock, (struct sockaddr*) &servAddr, sizeof(servAddr)) < 0)
		DieWithSystemMessage("bind() failed");
	
	if(listen(servSock, MAXPENDING) < 0)
	    DieWithSystemMessage("listen() failed");
	
	for(;;)
	{
		int clntSock = accept(servSock, (struct sockaddr *) NULL, NULL);
		if(clntSock <0)
			DieWithSystemMessage("accept() failed");
		
		while ((numBytes = recv(servSock, recvbuffer, BUFSIZE - 1, 0)) > 0)
	{
		recvbuffer[numBytes] = '\0';
		fputs(recvbuffer, stdout);
	}
	
	if(numBytes <0)
		DieWithSystemMessage("recv() failed");
	
		snprintf(sendbufer, sizeof(sendbufer), "%.24s\r\n", ctime(&ticks));
		ssize_t numBytesSent = send(clntSock, sendbufer, strlen(sendbufer), 0);
		if(numBytesSent <0)
		  DieWithSystemMessage("send() failed");
	  close(clntSock);
	}
}