#define _POSIX_C_SOURCE 200809L
#include <stdlib.h>
#include <stdio.h>

int main(void)
{
    char *strbuf = NULL;
    size_t strbuf_size;

    ssize_t length = getline(&strbuf, &strbuf_size, stdin);
    if (length == -1) {
        perror("Input error");
        return 1;
    }


    if (length != 0) {
      if (strbuf[length-1] == '\n')
            strbuf[--length] = '\0';

        if (length != 0) {
            for (size_t right = (size_t) length - 1, left = 0; left < right; right--, left++) {
                char c = strbuf[left];
                strbuf[left] = strbuf[right];
                strbuf[right] = c;
            }

            if (puts(strbuf) == EOF) {
                perror("Output error");
                return 1;
            }
        }
    }

    free(strbuf);

    return 0;
}