#include <signal.h>
#include <stdio.h>
#include <unistd.h>

void printsigset(const sigset_t *set)
{
    int i;
    for (i = 1; i < 32; i++)
        if (sigismember(set, i) == 1)
            putchar('1');
        else
            putchar('0');
    puts("");
}

/* 阻塞了SIGINT信号，按Ctrl-C将会使SIGINT信号处于未决状态，
 * 按Ctrl-\仍然可以终止程序，因为SIGQUIT信号没有阻塞 */
int main(void)
{
    sigset_t s, p;
    sigemptyset(&s);
    sigaddset(&s, SIGINT);
    sigprocmask(SIG_BLOCK, &s, NULL);
    while (1) {
        sigpending(&p);
        printsigset(&p);
        sleep(1);
    }
    return 0;
}
