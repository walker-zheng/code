#include <stdio.h>
#include <stdlib.h>

#include <errno.h>
#include <stdarg.h>
#include <string.h>

#define MAXLINE 80

/* err print */
void err_sys(const char *fmt, ...)
{
    int err = errno;
    char buf[MAXLINE+1];
    va_list ap;

    va_start(ap, fmt);

    vsnprintf(buf, MAXLINE, fmt, ap);
    snprintf(buf+strlen(buf), MAXLINE-strlen(buf), ": %s", strerror(err));
    strcat(buf, "\n");
    fputs(buf, stderr);

    va_end(ap);
    exit(1);
}

struct record {
    char name[10];
    int age;
};

/* perror file seek */
int fileseek(void)
{
    FILE* fp;
    if ( (fp = fopen("textfile","r+")) == NULL) {
        perror("Open file textfile");
        exit(1);
    }
    if (fseek(fp, 10, SEEK_SET) != 0) {
        perror("Seek file textfile");
        exit(1);
    }
    fputc('K', fp);
    fclose(fp);
    return 0;
}
/* writerec.c */
int writerec(void)
{
    struct record array[2] = {{"Ken", 24}, {"Knuth", 28}};
    FILE *fp = fopen("recfile", "w");
    if (fp == NULL) {
        perror("Open file recfile");
        exit(1);
    }
    fwrite(array, sizeof(struct record), 2, fp);
    fclose(fp);
    return 0;
}

/* readrec.c */
int readrec(void)
{
    struct record array[2];
    FILE *fp = fopen("recfile", "r");
    if (fp == NULL) {
        perror("Open file recfile");
        exit(1);
    }
    fread(array, sizeof(struct record), 2, fp);
    printf("Name1: %s\tAge1: %d\n", array[0].name, array[0].age);
    printf("Name2: %s\tAge2: %d\n", array[1].name, array[1].age);
    fclose(fp);
    return 0;
}
int main(int argc, char *argv[])
{
    if (argc != 1) {
        fputs("Usage: ./a.out pathname\n", stderr);
        err_sys("%s:%s():%d", __FILE__, __func__, __LINE__);
        exit(1);
    }
    fileseek();
    writerec();
    readrec();
}
