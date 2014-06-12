#include <unistd.h>
#include <stdlib.h>
#include <signal.h>


int main(void)
{
    pid_t pid=fork();
    if(pid<0) {
        perror("fork");
        exit(1);
    }
    if(pid>0) { /* parent */
        /* 僵尸清理
         *  自定义SIGCHLD处理函数，wait/waitpid处理
         *  设置处理函数为忽略，子进程终止时会自动清理，不通知父进程，不僵尸
         * */
        struct sigaction newact, oldact;
        newact.sa_handler = SIG_IGN;    
        sigaction(SIGALRM, &newact, &oldact);
        //  sigaction(SIGALRM, &oldact, NULL);

        while(1);

    }
    /* child */
    return 0;     
}
