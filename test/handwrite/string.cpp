#include <assert.h>
#include <string>

int atoi_s(const char *c)
{
    int value = 0;
    int sign = 1;
    if (*c == '+' || *c == '-')
    {
        if (*c == '-')
            sign = -1;
        c++;
    }
    while (isdigit(*c))
    {
        value *= 10;
        value += (int)(*c - '0');
        c++;
    }
    return (value * sign);
}

int atoi(char *str)
{
    int res = 0; // Initialize result

    // Iterate through all characters of input string and
    // update result
    for (int i = 0; str[i] != '\0'; ++i)
        res = res * 10 + str[i] - '0';

    // return result.
    return res;
}
char *strcpy(char *dst, const char *src)
{
    assert((dst != NULL) && (src != NULL));
    char *ret = dst;
    int size = strlen(src) + 1;
    if (dst > src || dst < src + size)
    {
        //考虑重叠的
        dst = dst + size - 1;
        src = src + size - 1;
        while (size--)
        {
            *dst-- = *src--;
        }
    }
    else
    {
        while (size--)
        {
            *dst++ = *src++;
        }
    }
    return ret;
}
char *strcat(char *dst, const char *src)
{
    char *ret = dst;

    while (*dst != '\0')
    {
        ++dst;
    }

    while ((*dst++ = *src) != '\0')
        ;
    return ret;
}
int strcmp(const char *str1, const char *str2)
{

    while (*str1 == *str2 && *str1 != '\0')
    {
        ++str1;
        ++str2;
    }
    return *str1 - *str2;
}

void *memcpy(void *dst, const void *src, size_t size)
{
    if (dst == NULL || src == NULL)
    {
        return NULL;
    }
    void *ret = dst;
    char *pdst = (char *)dst;
    char *psrc = (char *)src;

    if (pdst > psrc && pdst < psrc + size)
    { //重叠
        pdst = pdst + size - 1;
        psrc = pdst + size - 1;
        while (size--)
        {
            *pdst-- = *psrc--;
        }
    }
    else
    { //无重叠
        while (size--)
        {
            *pdst++ = *psrc++;
        }
    }
    return ret;
}
void *memmove(void *dest, const void *src, size_t n)
{
    char *d = (char *)dest;
    const char *s = (const char *)src;

    if (s > d)
    {
        // start at beginning of s
        while (n--)
        {
            *d++ = *s++;
        }
    }
    else if (s < d)
    {
        // start at end of s
        d = d + n - 1;
        s = s + n - 1;

        while (n--)
        {
            *d-- = *s--;
        }
    }
    return dest;
}
