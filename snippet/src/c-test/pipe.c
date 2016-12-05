#include <stdlib.h>
#include <unistd.h>
#define MAXLINE 80

/* 使用管道在父子进程间通信 
 * 不能双工通信，需要继承fd
 * 管道在阻塞I/O时，读空，写满，fd关闭后读/写 等特殊情况
 * */
int main(void)
{
    int n;
    int fd[2];
    pid_t pid;
    char line[MAXLINE];

    if (pipe(fd) < 0) {
        perror("pipe");
        exit(1);
    }
    if ((pid = fork()) < 0) {
        perror("fork");
        exit(1);
    }
    if (pid > 0) { /* parent */
        close(fd[0]);
        write(fd[1], "hello world\n", 12);
        wait(NULL);
    } else {       /* child */
        close(fd[1]);
        n = read(fd[0], line, MAXLINE);
        write(STDOUT_FILENO, line, n);
    }
    return 0;
}
