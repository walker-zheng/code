#include <stdlib.h>
#include <stdio.h>
#include <fcntl.h>

void daemonize(void)
{
    pid_t  pid;

    /*
     *   * Become a session leader to lose controlling TTY.
     *       */
    if ((pid = fork()) < 0) {
        perror("fork");
        exit(1);
    } else if (pid != 0) /* parent */
        exit(0);
    setsid();       // 当前进程不允许是进程组的Leader，一般fork子进程

    /*
     *   * Change the current working directory to the root.
     *       */
    if (chdir("/") < 0) {
        perror("chdir");
        exit(1);
    } 

    /*
     *   * Attach file descriptors 0, 1, and 2 to /dev/null.
     *       */
    close(0);
    open("/dev/null", O_RDWR);
    dup2(0, 1);
    dup2(0, 2);
}

int main(void)
{
    daemonize();
    while(1);
}
