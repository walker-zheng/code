#include <assert.h>
#include <string>

char * strcpy(char * dst, const char * src)
{
    assert((dst != NULL) && (src != NULL));
    char * ret = dst;
    int size = strlen(src) + 1;
    if(dst > src || dst < src + size) {
        //考虑重叠的
        dst = dst + size - 1;
        src = src + size - 1;
        while(size--) {
            *dst-- = *src--;
        }
    }
    else {
        while(size--) {
            *dst++ = *src++;
        }
    }
    return ret;
}
char * strcat(char * dst, const char * src)
{
    char * ret = dst;

    while(*dst != '\0')
    { ++dst; }

    while((*dst++ = *src) != '\0');
    return ret;
}
int strcmp(const char * str1, const char * str2)
{

    while(*str1 == *str2 && *str1 != '\0') {
        ++str1;
        ++str2;
    }
    return *str1 - *str2;
}

void * memcpy(void * dst, const void * src, size_t size)
{
    if(dst == NULL || src == NULL) {
        return NULL;
    }
    void * ret = dst;
    char * pdst = (char *)dst;
    char * psrc = (char *)src;

    if(pdst > psrc && pdst < psrc + size) { //重叠
        pdst = pdst + size - 1;
        psrc = pdst + size - 1;
        while(size--) {
            *pdst-- = *psrc--;
        }
    }
    else { //无重叠
        while(size--) {
            *pdst++ = *psrc++;
        }
    }
    return ret;
}
void * memmove(void * dest, const void * src, size_t n)
{
    char   *  d  = (char *) dest;
    const char * s = (const char *) src;

    if(s > d) {
        // start at beginning of s
        while(n--)
        { *d++ = *s++; }
    }
    else
        if(s < d) {
            // start at end of s
            d = d + n - 1;
            s = s + n - 1;

            while(n--)
            { *d-- = *s--; }
        }
    return dest;
}
