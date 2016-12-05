#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>


#define NLOOP 5000

int counter;                /* incremented by threads */
pthread_mutex_t counter_mutex = PTHREAD_MUTEX_INITIALIZER;
/* 对线程访问冲突，引入互斥锁，使'读-修改-写'是原子操作 */

/* 为了实现互斥锁操作，大多数体系结构都提供了swap或exchange指令，
 * 该指令的作用是把寄存器和内存单元的数据相交换，由于只有一条指令，保证了原子性 */

void *doit(void *);

int main(int argc, char **argv)
{
    pthread_t tidA, tidB;

    pthread_create(&tidA, NULL, doit, NULL);
    pthread_create(&tidB, NULL, doit, NULL);

    /* wait for both threads to terminate */
    pthread_join(tidA, NULL);
    pthread_join(tidB, NULL);

    return 0;
}

void *doit(void *vptr)
{
    int     i, val;

    /*
     *   * Each thread fetches, prints, and increments the counter NLOOP times.
     *       * The value of the counter should increase monotonically.
     *           */

    for (i = 0; i < NLOOP; i++) {
        pthread_mutex_lock(&counter_mutex);

        val = counter;
        printf("%x: %d\n", (unsigned int)pthread_self(), val + 1);
        counter = val + 1;

        pthread_mutex_unlock(&counter_mutex);
    }

    return NULL;
}
