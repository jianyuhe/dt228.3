#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include "Practical.h"
#include <unistd.h>

static const int MAXPENDING = 5; // Maximum outstanding connection requests

int main(int argc, char *argv[]) {

        char buffer[BUFSIZE]; // Buffer for receiving and sending data from/to the client
        int numBytes = 0;

        if (argc != 2) // Test for correct number of arguments
                DieWithUserMessage("Parameter(s)", "<Server Port>");

        in_port_t servPort = atoi(argv[1]); // First arg:  local port

                // Create socket for incoming connections
        int servSock; // Socket descriptor for server
        if ((servSock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0)
                DieWithSystemMessage("socket() failed");

        // Construct local address structure
        struct sockaddr_in servAddr;                  // Local address
        memset(&servAddr, 0, sizeof(servAddr));       // Zero out structure
        servAddr.sin_family = AF_INET;                // IPv4 address family
        servAddr.sin_addr.s_addr = htonl(INADDR_ANY); // Any incoming interface
        servAddr.sin_port = htons(servPort);          // Local port

        // Bind to the local address
        if (bind(servSock, (struct sockaddr*) &servAddr, sizeof(servAddr)) < 0)
                DieWithSystemMessage("bind() failed");

        // Mark the socket so it will listen for incoming connections
        if (listen(servSock, MAXPENDING) < 0)
                DieWithSystemMessage("listen() failed");

        for (;;) { // Run forever

    // Wait for a client to connect
    int clntSock = accept(servSock, (struct sockaddr *) NULL, NULL);
    if (clntSock < 0)
      DieWithSystemMessage("accept() failed");

        while ((numBytes = recv(clntSock, buffer, BUFSIZE - 1, 0)) > 0) {  //receive echo string from client into the buffer
                buffer[numBytes] = '\0';    // Terminate the string!
                fputs(buffer, stdout);      // Print the echo string to the local terminal

                if (strstr(buffer, "\r\n")>0)  //break from recv() loop when terminating characters are received
                        break;

                        /* Receive up to the buffer size (minus 1 to leave space for
                                a null terminator) bytes from the sender */
                }
    if (numBytes < 0)
      DieWithSystemMessage("recv() failed");

    // clntSock is connected to a client!
    ssize_t numBytesSent = send(clntSock, buffer, strlen(buffer), 0); //Send echo string  back to the client
    if (numBytesSent < 0)
      DieWithSystemMessage("send() failed");

        close(clntSock); // Close client socket

  }   //end infinite for loop
  // NOT REACHED
}
