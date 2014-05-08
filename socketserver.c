//下面的代码离生产环境还差内存池和logger哦！
#include "socketserver.h"
#include <dirent.h>
#include <regex.h>
#define DIGIT_PATTERN_STRING "^[0-9]+$"
void *  epollWorkerRoutine(void *);
void *  blockingSendEpollerRoutine(void *);
int isDigitStr(const char *str){
        int ret=-1;
        regex_t regex;
        regmatch_t matchs[1];
        if(!regcomp(&regex,DIGIT_PATTERN_STRING,REG_EXTENDED/*这里不要传0哦，否则nomatch*/)){
                ret=!regexec(&regex,str, 1,matchs,0);
                regfree(&regex);
        }
        return ret;
}

static int setNonBlocking(int sock)
{
        int opts;
        opts=fcntl(sock,F_GETFL);
        if(opts==-1)
        {
                perror("fcntl(sock,GETFL) failed!\n");
                return opts;
        }
        opts = opts|O_NONBLOCK;
        opts=fcntl(sock,F_SETFL,opts);
        if(opts==-1)
        {
                perror("fcntl(sock,SETFL,opts) failed!\n");
                return opts;
        }
        return 1;
}

static void adjustQSSWorkerLimits(QSocketServer *qss){
        //to adjust availabe size.
}
typedef struct{
        QSocketServer * qss;
        pthread_t th;
}QSSWORKER_PARAM;

static WORD addQSSWorker(QSocketServer *qss,WORD addCounter){
        WORD res=0;
        if(qss->workerCounter<qss->minThreads||(qss->currentBusyWorkers==qss->workerCounter&&qss->workerCounter<qss->maxThreads))
        {
                QSSWORKER_PARAM * pParam=NULL;
                int i=0;
                pthread_spin_lock(&qss->g_spinlock);
                if(qss->workerCounter+addCounter<=qss->maxThreads)
                        for(;i<addCounter;i++)
                        {
                                pParam=malloc(sizeof(QSSWORKER_PARAM));

                                if(pParam){
                                        pthread_create(&pParam->th,NULL,epollWorkerRoutine,pParam);
                                        pParam->qss=qss;
                                        qss->workerCounter++,res++;
                                }
                        }
                pthread_spin_unlock(&qss->g_spinlock);
        }
        return res;
}

static void SOlogger(const char * msg,SOCKET s){
        perror(msg);
        if(s>0)
                close(s);
}

static int _InternalProtocolHandler(struct epoll_event * event,BlockingSender_t _blockingSender,void * senderBase){
        QSSEPollEvent *qssEPEvent=event->data.ptr;
        int ret;
        printf("_InternalProtocolHandler START pollRes==1,err:%d, ...cs:%d,,,,,th:%lu,\n",errno,qssEPEvent->client_s,pthread_self());
        if((ret=recv(qssEPEvent->client_s,qssEPEvent->buf,MAX_BUF_SIZE,0))>0){
                //sleep(5);
                ret=_blockingSender(senderBase,qssEPEvent->client_s,qssEPEvent->buf,ret);
        }
        printf("_InternalProtocolHandler END ret=%d,err:%d,%s, ...cs:%d,,,,,th:%lu,\n",ret,errno,strerror(errno),qssEPEvent->client_s,pthread_self());
        return ret;
}

int createSocketServer(QSocketServer ** qss_ptr,WORD passive,WORD port,CSocketLifecycleCallback cslifecb,InternalProtocolHandler protoHandler,WORD minThreads,WORD maxThreads,int workerWaitTimeout)
{

        QSocketServer * qss=malloc(sizeof(QSocketServer));
        qss->passive=passive;
        qss->port=port;
        qss->minThreads=minThreads;
        qss->maxThreads=maxThreads;
        qss->workerWaitTimeout=workerWaitTimeout;
        qss->lifecycleStatus=0;
        pthread_spin_init(&qss->g_spinlock,PTHREAD_PROCESS_PRIVATE);
        qss->workerCounter=0;
        qss->currentBusyWorkers=0;
        qss->CSocketsCounter=0;
        qss->cslifecb=cslifecb,qss->protoHandler=protoHandler;
        if(!qss->protoHandler)
                qss->protoHandler=_InternalProtocolHandler;
        adjustQSSWorkerLimits(qss);
        *qss_ptr=qss;
        return 1;
}

int startSocketServer(QSocketServer *qss)
{
        if(qss==NULL)
                return 0;
        else{
                pthread_spin_lock(&qss->g_spinlock);
                if(qss->lifecycleStatus==0){
                        qss->lifecycleStatus=1;
                        pthread_spin_unlock(&qss->g_spinlock);
                }else{
                        pthread_spin_unlock(&qss->g_spinlock);
                        return 0;
                }
        }
        //bzero(&qss->serv_addr, sizeof(qss->serv_addr));

        qss->serv_addr.sin_family=AF_INET;
        qss->serv_addr.sin_port=htons(qss->port);
        inet_aton("127.0.0.1",&(qss->serv_addr.sin_addr));
        //qss->serv_addr.sin_addr.s_addr=INADDR_ANY;//inet_addr("127.0.0.1");

        qss->server_s=socket(AF_INET,SOCK_STREAM,IPPROTO_IP);
        if(setNonBlocking(qss->server_s)==-1)
        {
                SOlogger("setNonBlocking server_s failed.\n",0);
                return 0;
        }

        if(qss->server_s==INVALID_SOCKET)
        {
                SOlogger("socket failed.\n",0);
                return 0;
        }

        if(bind(qss->server_s,(struct sockaddr *)&qss->serv_addr,sizeof(SOCKADDR_IN))==SOCKET_ERROR)
        {
                SOlogger("bind failed.\n",qss->server_s);
                return 0;
        }

        if(listen(qss->server_s,SOMAXCONN/*这个宏windows也有，这里是128，当然你可以设的小些，它影响开销的*/)==SOCKET_ERROR)
        {
                SOlogger("listen failed.\n",qss->server_s);
                return 0;
        }
        qss->epollFD=epoll_create1(0);/*这里不是epoll_create(size)哦，你可能不知道如何设置size,所以忽略它吧*/
        if(qss->epollFD==-1){
                SOlogger("epoll_create1 0, main epollFD  failed.\n",qss->server_s);
                return 0;
        }
        qss->BSendEpollFD=epoll_create1(0);//for blocking send.
        if(qss->BSendEpollFD==-1){
                SOlogger("epoll_create1 0,BSendEpollFD failed.\n",qss->server_s);
                return 0;
        }

        {//ADD ACCEPT EVENT
                struct epoll_event _epEvent;
                QSSEPollEvent *qssEPEvent=malloc(sizeof(QSSEPollEvent));
                qssEPEvent->client_s=qss->server_s;
                _epEvent.events=qssEPEvent->curEvents=EPOLLIN|EPOLLET;
                _epEvent.data.ptr=qssEPEvent;
                if(epoll_ctl(qss->epollFD,EPOLL_CTL_ADD,qss->server_s,&_epEvent)==-1){
                        SOlogger("epoll_ctl server_s to accept failed.\n",qss->server_s);
                        free(qssEPEvent);
                        return 0;
                }
        }
        {//starup blocking send epoller.
                QSSWORKER_PARAM * pParam=malloc(sizeof(QSSWORKER_PARAM));
                pParam->qss=qss;
                pthread_create(&pParam->th,NULL,blockingSendEpollerRoutine,pParam);
        }

        //initialize worker for epoll events.
        addQSSWorker(qss,qss->minThreads);
        qss->lifecycleStatus=2;
        return 1;
}

int shutdownSocketServer(QSocketServer *qss){
        //change qss->lifecycleStatus
        if(qss==NULL)
                return 0;
        else{
                pthread_spin_lock(&qss->g_spinlock);
                if(qss->lifecycleStatus==2){
                        qss->lifecycleStatus=3;
                        pthread_spin_unlock(&qss->g_spinlock);
                }else{
                        pthread_spin_unlock(&qss->g_spinlock);
                        return 0;
                }
        }
        /*shutdown server-listening socket,这里优雅的做法是shutdown--notify-->epoll-->close.记得shutdown会发送EOF的哦*/
        shutdown(qss->server_s,SHUT_RDWR);

        // /proc/getpid/fd  shutdown all socket cs != serv_s
        {
                char dirBuf[64];
                struct dirent * de;
                DIR *pd=NULL;
                int sockFD;
                sprintf(dirBuf,"/proc/%d/fd/",getpid());
                pd=opendir(dirBuf);
                if(pd!=NULL){
                        while((de=readdir(pd))!=NULL){
                                if(isDigitStr(de->d_name)){
                                        sockFD=atoi(de->d_name);
                                        if(isfdtype(sockFD,S_IFSOCK))
                                                shutdown(sockFD,SHUT_RDWR);
                                }
                        }
                        closedir(pd);
                }
                /*fstat(ret,&_stat);S_ISSOCK(_stat.st_mode)======isfdtype(sockFD,S_IFSOCK)*/
        }
        return 1;
}

static int onAcceptRoutine(QSocketServer * qss)
{
        SOCKADDR_IN client_addr;
        unsigned int client_addr_leng=sizeof(SOCKADDR_IN);
        SOCKET cs;
        struct epoll_event _epEvent;
        QSSEPollEvent *qssEPEvent=NULL;
        cs=accept(qss->server_s,(struct sockaddr *)&client_addr,&client_addr_leng);
        if(cs==INVALID_SOCKET)
        {
                printf("onAccept failed:%d,%s\n",errno,strerror(errno));
                epoll_ctl(qss->epollFD,EPOLL_CTL_DEL,qss->server_s,NULL);//EINVAL 22  Invalid argument
                return 0;
        }
        if(setNonBlocking(cs)==-1)
        {
                printf("onAccept setNonBlocking client_s failed.cs:%d\n",cs);
                return 0;
        }

        {// set keepalive option
                int keepAlive = 1;
                int keepIdle = QSS_SIO_KEEPALIVE_VALS_TIMEOUT;
                int keepInterval = QSS_SIO_KEEPALIVE_VALS_INTERVAL;
                int keepCount = QSS_SIO_KEEPALIVE_VALS_COUNT;
                if(setsockopt(cs, SOL_SOCKET, SO_KEEPALIVE, (void *)&keepAlive, sizeof(keepAlive))||
                                setsockopt(cs, SOL_TCP, TCP_KEEPIDLE, (void *)&keepIdle, sizeof(keepIdle))||
                                setsockopt(cs, SOL_TCP, TCP_KEEPINTVL, (void *)&keepInterval, sizeof(keepInterval))||
                                setsockopt(cs, SOL_TCP, TCP_KEEPCNT, (void *)&keepCount, sizeof(keepCount)))
                {
                        printf("onAccept set keepalive option client_s failed.cs:%d,err:%s\n",cs,strerror(errno));
                        return 0;
                }
        }
        qssEPEvent=malloc(sizeof(QSSEPollEvent));
        qssEPEvent->client_s=cs;
        {
                _epEvent.events=qssEPEvent->curEvents=EPOLLIN|EPOLLET|EPOLLONESHOT;
                qssEPEvent->BSendEpollFDRelated=0;
                _epEvent.data.ptr=qssEPEvent;/*这里又和教科的不一样哦，真正的user data用ptr,而不是单一的fd*/
                if(epoll_ctl(qss->epollFD,EPOLL_CTL_ADD,cs,&_epEvent)==-1){
                        printf("onAccept epoll_ctl client_s failed.cs:%d,err:%d\n",cs,errno);
                        free(qssEPEvent);
                        return 0;
                }else{
                        pthread_spin_lock(&qss->g_spinlock);
                        qss->CSocketsCounter++;
                        pthread_spin_unlock(&qss->g_spinlock);
                        if(qss->cslifecb)
                                qss->cslifecb(cs,0);
                }
        }
        printf("onAccepted flags:err:%d ,cs:%d.\n",errno,cs);
        return 1;
}

typedef struct{
        QSocketServer * qss;
        QSSEPollEvent * event;
}InternalSenderBase_t;

static int internalBlockingSender(void * senderBase,int cs, void * _buf, size_t nbs){
        InternalSenderBase_t *sb=(InternalSenderBase_t *)senderBase;
        char * _sbuf=_buf;
        int ret=0,sum=0,curEpoll_ctl_opt,*errno_ptr=&errno;

        QSSEPollEvent *qssEPEvent=NULL;
        struct epoll_event _epEvent;

        struct timespec sendTimeo;

        while(1){
                *errno_ptr=0;
                while(sum<nbs&&(ret=send(cs,_sbuf,nbs-sum,0))>0)
                        sum+=ret,_sbuf+=ret;
                if(sum==nbs||ret==0)
                        break;
                else if(ret==-1){
                        if(errno==EAGAIN&&sum<nbs){
                                qssEPEvent=sb->event;
                                _epEvent.data.ptr=qssEPEvent;
                                _epEvent.events=EPOLLOUT|EPOLLET|EPOLLONESHOT;
                                if(qssEPEvent->BSendEpollFDRelated==0){
                                        pthread_mutex_init(&qssEPEvent->writableLock,NULL);
                                        pthread_cond_init(&qssEPEvent->writableMonitor,NULL);
                                        qssEPEvent->BSendEpollFDRelated=1;
                                        curEpoll_ctl_opt=EPOLL_CTL_ADD;
                                }else{
                                        curEpoll_ctl_opt=EPOLL_CTL_MOD;
                                }

                                {//wait writable.
                                        int flag=0;
                                        pthread_mutex_lock(&qssEPEvent->writableLock);
                                        if(epoll_ctl(sb->qss->BSendEpollFD,curEpoll_ctl_opt,qssEPEvent->client_s,&_epEvent)==0){
                                                sendTimeo.tv_nsec=0,sendTimeo.tv_sec=time(NULL)+BLOCKING_SEND_TIMEOUT;
                                                int err=pthread_cond_timedwait(&qssEPEvent->writableMonitor,&qssEPEvent->writableLock,&sendTimeo);
                                                if(err)
                                                        flag=-1;
                                        }else
                                                flag=-1;
                                        pthread_mutex_unlock(&qssEPEvent->writableLock);
                                        if(flag==-1)
                                                break;
                                }

                        }else{
                                if(errno==EAGAIN&&sum==nbs)
                                        ret=nbs;//it is ok;
                                break;
                        }
                }
        }//end while.
        return ret;
}
void *  blockingSendEpollerRoutine(void *_param){
        QSSWORKER_PARAM * pParam=(QSSWORKER_PARAM *)_param;
        QSocketServer * qss=pParam->qss;
        //pthread_t * curThread=&pParam->th;
        struct epoll_event epEvents[qss->maxThreads];
        QSSEPollEvent *qssEPEvent=NULL;
        int pollRes,*errno_ptr=&errno;

        pthread_setcancelstate(PTHREAD_CANCEL_DISABLE,NULL);

        free(pParam);
        while(1){

                pollRes=epoll_wait(qss->BSendEpollFD,epEvents,qss->maxThreads,-1);
                if(pollRes>=1){
                        int i=0;
                        for(;i<pollRes;i++)
                                if(epEvents[i].events&EPOLLOUT){//这个epollfd只应该做以下的事情，少做为快!
                                        qssEPEvent=epEvents[i].data.ptr;
                                        pthread_mutex_lock(&qssEPEvent->writableLock);
                                        pthread_cond_signal(&qssEPEvent->writableMonitor);
                                        pthread_mutex_unlock(&qssEPEvent->writableLock);
                                }

                }else if(pollRes==-1){//errno 
                        printf("blockingSendEpollerRoutine pollRes==-1,err:%d, errno...%s\n",*errno_ptr,strerror(*errno_ptr));
                        break;
                }

        }

        return NULL;
}

void *  epollWorkerRoutine(void * _param){
        QSSWORKER_PARAM * pParam=(QSSWORKER_PARAM *)_param;
        QSocketServer * qss=pParam->qss;
        pthread_t * curThread=&pParam->th;
        struct epoll_event _epEvent;
        QSSEPollEvent *qssEPEvent=NULL;
        InternalSenderBase_t _senderBase;
        int pollRes=0,handleCode=0,exitCode=0,SOErrOccurred=0,*errno_ptr=&errno;
        _senderBase.qss=qss;
        pthread_setcancelstate(PTHREAD_CANCEL_DISABLE,NULL);

        free(pParam);
        while(!exitCode){

                *errno_ptr=0,SOErrOccurred=0,qssEPEvent=NULL;
                pollRes=epoll_wait(qss->epollFD,&_epEvent,1,qss->workerWaitTimeout);
                if(pollRes==1){
                        qssEPEvent=(QSSEPollEvent *)_epEvent.data.ptr;

                        if(qssEPEvent->client_s==qss->server_s)
                        {//Accepted Socket.
                                onAcceptRoutine(qss);
                                continue;
                        }else{
                                if(qss->protoHandler){
                                        _senderBase.event=_epEvent.data.ptr;
                                        pthread_spin_lock(&qss->g_spinlock);
                                        qss->currentBusyWorkers++;
                                        pthread_spin_unlock(&qss->g_spinlock);

                                        addQSSWorker(qss,1);
                                        handleCode=qss->protoHandler(&_epEvent,internalBlockingSender,&_senderBase);

                                        pthread_spin_lock(&qss->g_spinlock);
                                        qss->currentBusyWorkers--;
                                        pthread_spin_unlock(&qss->g_spinlock);

                                        if(handleCode>0){
                                                _epEvent.events=EPOLLIN|EPOLLET|EPOLLONESHOT;
                                                if(epoll_ctl(qss->epollFD,EPOLL_CTL_MOD,qssEPEvent->client_s,&_epEvent)==-1)
                                                        SOErrOccurred=2;
                                        }else{
                                                SOErrOccurred=1;//maybe socket closed 0. Or -1 socket error.
                                        }
                                }
                        }

                }else if(pollRes==0){//timeout
                        printf("pollRes==0,err:%d, timeout...th:%lu\n",*errno_ptr,*curThread);
                        if(qss->lifecycleStatus<=3&&qss->currentBusyWorkers==0&&qss->workerCounter>qss->minThreads)
                        {
                                pthread_spin_lock(&qss->g_spinlock);
                                if(qss->lifecycleStatus<=3&&qss->currentBusyWorkers==0&&qss->workerCounter>qss->minThreads){
                                        qss->workerCounter--;//until qss->workerCounter decrease to qss->minThreads
                                        exitCode=2;
                                }
                                pthread_spin_unlock(&qss->g_spinlock);
                        }else if(qss->lifecycleStatus>=4)
                                exitCode=4;

                }else if(pollRes==-1){//errno
                        printf("pollRes==-1,err:%d, errno...%s\n",*errno_ptr,strerror(*errno_ptr));
                        exitCode=1;
                }

                if(SOErrOccurred){
                        if(qss->cslifecb)
                                qss->cslifecb(qssEPEvent->client_s,-1);
                        /*if(qssEPEvent)*/{
                                epoll_ctl(qss->epollFD,EPOLL_CTL_DEL,qssEPEvent->client_s,NULL);
                                epoll_ctl(qss->BSendEpollFD,EPOLL_CTL_DEL,qssEPEvent->client_s,NULL);
                                close(qssEPEvent->client_s);
                                if(qssEPEvent->BSendEpollFDRelated){
                                        pthread_cond_destroy(&qssEPEvent->writableMonitor);
                                        pthread_mutex_destroy(&qssEPEvent->writableLock);
                                }
                                free(qssEPEvent);
                        }
                        pthread_spin_lock(&qss->g_spinlock);
                        if(--qss->CSocketsCounter==0&&qss->lifecycleStatus>=3){
                                //for qss workerSize,
                                qss->lifecycleStatus=4;
                                exitCode=3;
                        }
                        pthread_spin_unlock(&qss->g_spinlock);
                }//SOErrOccurred handle;

        }//end main while.

        if(exitCode!=2){
                int clearup=0;
                pthread_spin_lock(&qss->g_spinlock);
                if(!--qss->workerCounter&&qss->lifecycleStatus>=4){//clearup QSS
                        clearup=1;
                }
                pthread_spin_unlock(&qss->g_spinlock);
                if(clearup){
                        close(qss->epollFD);
                        close(qss->BSendEpollFD);
                        pthread_spin_destroy(&qss->g_spinlock);
                        free(qss);
                }
        }//exitCode handle;
        return NULL;
}
