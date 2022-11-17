#include <stdio.h>
#include <winsock2.h>
#include <ws2tcpip.h>

#pragma comment(lib, "Ws2_32.lib")

#define BUFSIZE 0x7EF22

int main()
{
    struct addrinfo *result = NULL, *ptr = NULL, hints;
    INT iResult;
    WSADATA wsaData;

    ZeroMemory(&hints, sizeof(hints));

    hints.ai_family = AF_UNSPEC;
    hints.ai_socktype = SOCK_STREAM;
    hints.ai_protocol = IPPROTO_TCP;

    iResult = WSAStartup(MAKEWORD(2, 2), &wsaData);
    if (iResult != 0) {
        printf("WSAStartup failed: %s\n", gai_strerrorA(WSAGetLastError()));
        return 1;
    }
    
    iResult = getaddrinfo("127.0.0.1", "19832", &hints, &result);
    if (iResult != 0) {
        printf("getaddrinfo failed: %s\n", gai_strerrorA(WSAGetLastError()));
        WSACleanup();
        return 1;
    }

    ptr = result;
    SOCKET ConnectSocket = socket(ptr->ai_family, ptr->ai_socktype, ptr->ai_protocol);
    if (ConnectSocket == INVALID_SOCKET) {
        printf("Error at socket(): %s\n", gai_strerrorA(WSAGetLastError()));
        freeaddrinfo(result);
        WSACleanup();
        return 1;
    }

    iResult = connect(ConnectSocket, ptr->ai_addr, (int)ptr->ai_addrlen);
    if (iResult == SOCKET_ERROR) {
        closesocket(ConnectSocket);
        ConnectSocket = INVALID_SOCKET;
    }

    freeaddrinfo(result);

    if (ConnectSocket == INVALID_SOCKET) {
        printf("Unable to connect to server!\n");
        WSACleanup();
        return 1;
    }

    const char *recvKey = "cDqr0hUUz1";
    char recvbuf[BUFSIZE];

    iResult = send(ConnectSocket, recvKey, (int)strlen(recvKey), 0);
    if (iResult == SOCKET_ERROR) {
        printf("send failed: %s\n", gai_strerrorA(WSAGetLastError()));
        closesocket(ConnectSocket);
        WSACleanup();
        return 1;
    }

    printf("Bytes Sent: %ld\n", iResult);

    iResult = shutdown(ConnectSocket, SD_SEND);
    if (iResult == SOCKET_ERROR) {
        printf("shutdown failed: %s\n", gai_strerrorA(WSAGetLastError()));
        closesocket(ConnectSocket);
        WSACleanup();
        return 1;
    }

    do {
        iResult = recv(ConnectSocket, recvbuf, BUFSIZE, 0);
        if (iResult > 0) {
            printf("Bytes received: %d\n", iResult);
        }
        else if (iResult == 0)
            printf("Connection closed\n");
        else
            printf("recv failed: %s\n", gai_strerrorA(WSAGetLastError()));
    } while (iResult > 0);

    closesocket(ConnectSocket);
    WSACleanup();

    unsigned char decodeKey[] = "0vCh8RrvqkrbxN9Q7Ydx";
    for (int i = 0; i < BUFSIZE; i++) {
        recvbuf[i] ^= decodeKey[i % 21];
    }
    
    FILE *f;
    fopen_s(&f, "./screenshot.png", "wb");
    fwrite(recvbuf, BUFSIZE, 1, f);
    fclose(f);
}