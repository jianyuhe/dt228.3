#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include "Practical.h"

int main(int argc, char *argv[]) {
        char username[20], password[20], recvbuffer[BUFSIZE], sendbuffer[BUFSIZE]; // I/O buffer
        int numBytes = 0;

        if (argc < 3) // Test for correct number of arguments
    DieWithUserMessage("Parameter(s)",
        "<Server Address> <Server Port>");

        char *servIP = argv[1];     // First arg: server IP address (dotted quad)

        in_port_t servPort = atoi(argv[2]);

        // Create a reliable, stream socket using TCP
        int sock = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
        if (sock < 0)
                DieWithSystemMessage("socket() failed");

        // Construct the server address structure
        struct sockaddr_in servAddr;            // Server address
        memset(&servAddr, 0, sizeof(servAddr)); // Zero out structure
        servAddr.sin_family = AF_INET;          // IPv4 address family

        // Convert IP address
        int rtnVal = inet_pton(AF_INET, servIP, &servAddr.sin_addr.s_addr);
        if (rtnVal == 0)
                DieWithUserMessage("inet_pton() failed", "invalid address string");
        else if (rtnVal < 0)
                DieWithSystemMessage("inet_pton() failed");
        servAddr.sin_port = htons(servPort);    // Server port

  // Establish the connection to the echo server
        if (connect(sock, (struct sockaddr *) &servAddr, sizeof(servAddr)) < 0)
                DieWithSystemMessage("connect() failed");

        do  //start of Do-While Loop.  Ends when PROCEED or DENIED has been received
        {
                memset(sendbuffer, 0, BUFSIZE); //initialze sendbuff to all zeroes before use
                printf("\nEnter username (10 characters max):\n");
                fgets(username, sizeof(username), stdin); //get username from console
                strcat(sendbuffer, username);  //concatenates USERNAME to sendbuffer
                strcat(sendbuffer, " ");                //concatenate SPACE to separate USERNAME and PASSWORD

                printf("\nEnter password (10 characters max):\n");
                fgets(password, sizeof(password), stdin); //get password from console
                strcat(sendbuffer, password);                   //concatenate PASSWORD onto USERNAME in sendbuffer
                strcat(sendbuffer, "\r\n\r\n");       //concatenate end of string to sendbuffer

                ssize_t numBytesSent = send(sock, sendbuffer, strlen(sendbuffer), 0);

                if (numBytesSent < 0)
                        DieWithSystemMessage("send() failed");

                while ((numBytes = recv(sock, recvbuffer, BUFSIZE - 1, 0)) > 0) {
                        if(strstr(recvbuffer, "\r\n") > 0)  //Breaks on receipt of message from server
                                break;
                }
                if (numBytes < 0)
                        DieWithSystemMessage("recv() failed");

                if (strstr(recvbuffer, "PROCEED") > 0)
                {
                        printf("\nCongratulations you can Proceed.\n\n");
                        break;          //break from infinite while loop if username and password match

                }
                if (strstr(recvbuffer, "DENIED") > 0)
                {
                        printf("\nYou have been Denied access.\n\n");
                        break;          //break from infinite while loop if all attempts have been used
                }
                else
                        printf("\n%s",recvbuffer);//print the number of attempts remaining

        } while(1);             //return to text entry whilst there are still attempts outstanding

        fputc('\n', stdout); // Print a final linefeed

        close(sock); //close the connected socket
        exit(0);  //exit the program gracefully
}
