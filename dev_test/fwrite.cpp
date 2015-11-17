#ifdef _MSC_VER
    #include <sys/stat.h>
    #include <io.h>
    #include <Windows.h>
#else
	#include <sys/types.h>
	#include <sys/stat.h>
    #include <unistd.h>
#endif
 
#include <fcntl.h>
#include <ctime>
#include <cstdio>
#include <cstdlib>
#include <fstream>
 
#ifdef _MSC_VER
    #define OPEN(fd, file) \
        fd = open(file, O_CREAT | O_RDWR | O_APPEND, S_IWRITE | S_IREAD)
 
    #define WRITE(fd, data, len) \
        _write(fd, pszData, iDataLen)
 
    #define FLUSH(fd) \
        _commit(fd)
 
    #define CLOSE(fd) \
        _close(fd)
 
    #define SLEEP(s) \
        Sleep(1000 * s)
#else
    #define OPEN(fd, file) \
        umask(002);    \
        fd = open(file, O_CREAT | O_RDWR | O_APPEND, S_IRUSR | S_IWUSR)
 
    #define WRITE(fd, data, len) \
        write(fd, pszData, iDataLen);
 
    //#define FLUSH(fd) \
    //    fsync(fd)         
	#define FLUSH(fd) 

 
    #define CLOSE(fd) \
        close(fd)
 
    #define SLEEP(s) \
        sleep(s)
#endif
 
static int s_iFd = -1;
static FILE * s_pFile = NULL;
static std::ofstream s_ofs;
 
enum TEST_TYPE
{
    TYPE_MIN, 
    TYPE_HANDLE = TYPE_MIN, 
    TYPE_FILE, 
    TYPE_OFSTREAM, 
    TYPE_MAX
};
 
const char * GetType(enum TEST_TYPE enType)
{
    switch (enType)
    {
        case TYPE_HANDLE:
        {
            return("handle");
        }
        case TYPE_FILE:
        {
            return("FILE");
        }
        case TYPE_OFSTREAM:
        {
            return("ofstream");
        }
        default:
        {
            return("unknown");
        }
    }
};
 
void OpenFile(enum TEST_TYPE enType)
{
    switch (enType)
    {
        case TYPE_HANDLE:
        {
            OPEN(s_iFd, "a.txt");
            if (s_iFd < 0)
            {
                fprintf(stderr, "open failed\n");
                exit(1);
            }
            break;
        }
        case TYPE_FILE:
        {
            s_pFile = fopen("b.txt", "w+");
            if (NULL == s_pFile)
            {
                fprintf(stderr, "fopen failed\n");
                exit(2);
            }
            break;
        }
        case TYPE_OFSTREAM:
        {
            s_ofs.open("c.txt", std::ios::binary | std::ios::app);
            if (!s_ofs)
            {
                fprintf(stderr, "ofstream::open failed\n");
                exit(3);
            }
            break;
        }
        default:
        {
            fprintf(stderr, "open: unknown type\n");
            exit(4);
            break;
        }
    }
}
 
void WriteFile(enum TEST_TYPE enType, const char * pszData, int iDataLen)
{
    if (NULL == pszData || 0 >= iDataLen)
    {
        return;
    }
 
    switch (enType)
    {
        case TYPE_HANDLE:
        {
            while (0 < iDataLen)
            {
                int iWirteLen = WRITE(s_iFd, pszData, iDataLen);
                if (0 > iWirteLen)
                {
                    fprintf(stderr, "write failed\n");
                    break;
                }
                pszData  += iWirteLen;
                iDataLen -= iWirteLen;
            }
            FLUSH(s_iFd);
            break;
        }
        case TYPE_FILE:
        {
            while (0 < iDataLen)
            {
                int iWirteLen = fwrite(pszData, 1, iDataLen, s_pFile);
                if (0 > iWirteLen)
                {
                    fprintf(stderr, "fwrite failed\n");
                    break;
                }
                pszData  += iWirteLen;
                iDataLen -= iWirteLen;
            }
            fflush(s_pFile);
            break;
        }
        case TYPE_OFSTREAM:
        {
            s_ofs.write(pszData, iDataLen);
            if (s_ofs.fail())
            {
                fprintf(stderr, "ofstream::write failed\n");
                s_ofs.clear();
            }
            s_ofs.flush();
            break;
        }
        default:
        {
            fprintf(stderr, "write: unknown type\n");
            exit(5);
            break;
        }
    }
}
 
void CloseFile(enum TEST_TYPE enType)
{
    switch (enType)
    {
        case TYPE_HANDLE:
        {
            CLOSE(s_iFd);
            break;
        }
        case TYPE_FILE:
        {
            fclose(s_pFile);
            break;
        }
        case TYPE_OFSTREAM:
        {
            s_ofs.close();
            break;
        }
        default:
        {
            fprintf(stderr, "close: unknown type\n");
            exit(6);
            break;
        }
    }
}
 
int main(int argc, char * argv[])
{
    const char szData[] = "1234567890123456789012345678901234567890123456789012345678901234567890";
    const int iDataLen = sizeof(szData) - 1;
 
    enum TEST_TYPE enIndex = TYPE_MIN;
    while (TYPE_MAX > enIndex)
    {
        const char * pszType = GetType(enIndex);
 
        OpenFile(enIndex);
 
        int iWriteCount = 0;
        int iPrintCount = 0;
        time_t tStartTime = time(NULL);
        time_t tLastTime = tStartTime;
 
        while (10 > iPrintCount)
        {
            WriteFile(enIndex, szData, iDataLen);
            ++iWriteCount;
 
            if (time(NULL) > tLastTime)
            {
                ++iPrintCount;
                tLastTime = time(NULL);
                fprintf(stdout, "type: %9s, speed: %9d\n", pszType, 
                    (iWriteCount / (tLastTime - tStartTime)));
            }
        }
 
        CloseFile(enIndex);
 
        enIndex = static_cast<enum TEST_TYPE>(enIndex + 1);
 
        SLEEP(2);
    };
 
    return(0);
}
