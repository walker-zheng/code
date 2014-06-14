#include <stdlib.h>
#include <stdio.h>
#include <sys/mman.h>
#include <fcntl.h>

/* mmap 磁盘文件到内存页的映射。关闭fd不影响已建立的映射 */
int main(void)
{
    int *p;
    int fd = open("hello", O_RDWR);
    if (fd < 0) {
        perror("open hello");
        exit(1);
    }
    p = mmap(NULL, 6, PROT_WRITE, MAP_SHARED, fd, 0);
    if (p == MAP_FAILED) {
        perror("mmap");
        exit(1);
    }
    close(fd);
    p[0] = 0x30313233;
    munmap(p, 6);
    printf("hehe");

    return 0;
}
