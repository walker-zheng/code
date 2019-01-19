#include <sys/epoll.h>
#define IPADDRESS "127.0.0.1"
#define PORT 8787
#define MAXSIZE 1024
#define LISTENQ 5
#define FDSIZE 1000
#define EPOLLEVENTS 100

//事件处理函数
static void handle_events(int epollfd, struct epoll_event *events, int num, int listenfd, char *buf)
{
    int i;
    int fd;
    //进行遍历;这里只要遍历已经准备好的io事件。num并不是当初epoll_create时的FDSIZE。
    for (i = 0; i < num; i++)
    {
        fd = events[i].data.fd;
        //根据描述符的类型和事件类型进行处理
        if ((fd == listenfd) && (events[i].events & EPOLLIN))
        {
            handle_accpet(epollfd, listenfd);
        }
        else if (events[i].events & EPOLLIN)
        {
            do_read(epollfd, fd, buf);
        }
        else if (events[i].events & EPOLLOUT)
        {
            do_write(epollfd, fd, buf);
        }
    }
}

//添加事件
static void add_event(int epollfd, int fd, int state)
{
    struct epoll_event ev;
    ev.events = state;
    ev.data.fd = fd;
    epoll_ctl(epollfd, EPOLL_CTL_ADD, fd, &ev);
}

//处理接收到的连接
static void handle_accpet(int epollfd, int listenfd)
{
    int clifd;
    struct sockaddr_in cliaddr;
    socklen_t cliaddrlen;
    clifd = accept(listenfd, (struct sockaddr *)&cliaddr, &cliaddrlen);
    if (clifd == -1)
    {
        perror("accpet error:");
    }
    else
    {
        printf("accept a new client: %s:%d\n", inet_ntoa(cliaddr.sin_addr), cliaddr.sin_port); //添加一个客户描述符和事件
        add_event(epollfd, clifd, EPOLLIN);
    }
}

//读处理
static void do_read(int epollfd, int fd, char *buf)
{
    int nread;
    nread = read(fd, buf, MAXSIZE);
    if (nread == -1)
    {
        perror("read error:");
        close(fd);                          //记住close fd
        delete_event(epollfd, fd, EPOLLIN); //删除监听
    }
    else if (nread == 0)
    {
        fprintf(stderr, "client close.\n");
        close(fd);                          //记住close fd
        delete_event(epollfd, fd, EPOLLIN); //删除监听
    }
    else
    {
        printf("read message is : %s", buf);
        //修改描述符对应的事件，由读改为写
        modify_event(epollfd, fd, EPOLLOUT);
    }
}

//写处理
static void do_write(int epollfd, int fd, char *buf)
{
    int nwrite;
    nwrite = write(fd, buf, strlen(buf));
    if (nwrite == -1)
    {
        perror("write error:");
        close(fd);                           //记住close fd
        delete_event(epollfd, fd, EPOLLOUT); //删除监听
    }
    else
    {
        modify_event(epollfd, fd, EPOLLIN);
    }
    memset(buf, 0, MAXSIZE);
}

//删除事件
static void delete_event(int epollfd, int fd, int state)
{
    struct epoll_event ev;
    ev.events = state;
    ev.data.fd = fd;
    epoll_ctl(epollfd, EPOLL_CTL_DEL, fd, &ev);
}

//修改事件
static void modify_event(int epollfd, int fd, int state)
{
    struct epoll_event ev;
    ev.events = state;
    ev.data.fd = fd;
    epoll_ctl(epollfd, EPOLL_CTL_MOD, fd, &ev);
}

int main()
{
    int listenfd = socket_bind(IPADDRESS, PORT);

    struct epoll_event events[EPOLLEVENTS];

    //创建一个描述符
    int epollfd = epoll_create(FDSIZE);

    //添加监听描述符事件
    add_event(epollfd, listenfd, EPOLLIN);

    //循环等待
    for (;;)
    {
        //该函数返回已经准备好的描述符事件数目
        ret = epoll_wait(epollfd, events, EPOLLEVENTS, -1);
        //处理接收到的连接
        handle_events(epollfd, events, ret, listenfd, buf);
    }
}

//注：另外一端我就省了