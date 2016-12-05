#include <unistd.h>
#include <stdlib.h>

int main(void)
{
    execlp("ps", "ps", "pid,ppid,pgrp,session,tpgid,comm", NULL);
    perror("exec ps");
    exit(1);
}
