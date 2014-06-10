#ifndef __Q_SOCKET_SERVER__
#define __Q_SOCKET_SERVER__
#include <errno.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <arpa/inet.h>
#include <sys/types.h>
#include <string.h>
#include <sys/epoll.h>
#include <pthread.h>
#include <unistd.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#define SOCKET_ERROR -1
#define INVALID_SOCKET -1
typedef int SOCKET;
typedef struct sockaddr_in SOCKADDR_IN;
typedef unsigned short WORD;
typedef unsigned int DWORD;

#define QSS_SIO_KEEPALIVE_VALS_TIMEOUT 30*60
#define QSS_SIO_KEEPALIVE_VALS_INTERVAL 5
#define QSS_SIO_KEEPALIVE_VALS_COUNT 3
#define MAX_THREADS 100
#define MAX_THREADS_MIN  10
#define MIN_WORKER_WAIT_TIMEOUT  20*1000
#define MAX_WORKER_WAIT_TIMEOUT  60*MIN_WORKER_WAIT_TIMEOUT
#define MAX_THREADPOOLS  32

#define MAX_BUF_SIZE 1024
/* ulimit -n opened FDs per process.记得修改哦，否则还是select效果,就不是epoll效果了哦，呵呵*/
#define BLOCKING_SEND_TIMEOUT 20

typedef void (*CSocketLifecycleCallback)(int cs,int lifecycle);//lifecycle:0:OnAccepted,-1:OnClose
typedef int (*BlockingSender_t)(void * senderBase,int cs, void * buf, size_t nbs);
typedef int (*InternalProtocolHandler)(struct epoll_event * event,BlockingSender_t _blockingSender,void * senderBase);//return -1:SOCKET_ERROR

typedef struct {
        WORD passive;
        WORD port;//uint16_t
        WORD minThreads;
        WORD maxThreads;
        pthread_spinlock_t g_spinlock;//PTHREAD_PROCESS_PRIVATE
        volatile int lifecycleStatus;//0-created,1-starting, 2-running,3-stopping,4-exitSignaled,5-stopped
        int  workerWaitTimeout;//wait timeout
        volatile int workerCounter;
        volatile int currentBusyWorkers;
        volatile int CSocketsCounter;
        CSocketLifecycleCallback cslifecb;
        InternalProtocolHandler protoHandler;
        SOCKET server_s;
        SOCKADDR_IN serv_addr;
        int epollFD;//main epoller.
        int BSendEpollFD;//For blocking send.
}QSocketServer;

typedef struct {
        SOCKET client_s;
        SOCKADDR_IN client_addr;
        uint32_t curEvents;

        char buf[MAX_BUF_SIZE];
        DWORD numberOfBytesTransferred;
        char * data;

        int BSendEpollFDRelated;
        pthread_mutex_t writableLock;
        pthread_cond_t  writableMonitor;
}QSSEPollEvent;//for per connection

int createSocketServer(QSocketServer ** qss_ptr,WORD passive,WORD port,CSocketLifecycleCallback cslifecb,InternalProtocolHandler protoHandler,WORD minThreads,WORD maxThreads,int workerWaitTimeout);
int startSocketServer(QSocketServer *qss);
int shutdownSocketServer(QSocketServer *qss);
#endif

