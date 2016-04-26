#include <fcntl.h>
#include <sys/mman.h>
#include <sys/stat.h>
#include <unistd.h>

/* Map the contents of file into memory: if successful, update
 * *contents to point to the file contents, update *size to be the
 * size of the file, and return 0. Otherwise, return -1.
 */
int getFileContents(const char *file, void **contents, size_t *size)
{
    int fd = open(file, O_RDONLY);
    if (fd < 0)
        goto fail_open;

    struct stat st;
    if (fstat(fd, &st) < 0)
        goto fail_fstat;

    void *result = mmap(NULL, st.st_size, PROT_READ, MAP_PRIVATE, fd, 0);
    if (result == MAP_FAILED)
        goto fail_mmap;

    *contents = result;
    *size = st.st_size;
    close(fd);
    return 0;

fail_mmap:
fail_fstat:
    close(fd);
fail_open:
    return -1;
}       