#ifndef __LOG_H__
#define __LOG_H__

#include <stdio.h>
#include <tchar.h>
#include <crtdbg.h>
#include <windows.h>
#include <time.h>
#include <sys/timeb.h>

class CLog
{
public:
    ~CLog();
    static CLog* get(TCHAR* path = NULL);
    void printf(const char* format, ...);

private:
    CLog(FILE* handle);

private:
    static CLog* _log;
    FILE* _handle;
};

enum
{
    LOG_DEBUG,
    LOG_INFO,
    LOG_WARN,
    LOG_ERROR,
    LOG_FATAL
};

#ifdef _DEBUG
static unsigned int log_level = LOG_DEBUG;
#else
static unsigned int log_level = LOG_INFO;
#endif

#define PRINT_LINE(type, format, datetime, ms, ...) \
printf("%lu::%s::%s,%.3d::%s::" format "\n", GetCurrentThreadId(), type, datetime, ms, \
__FUNCTION__, ## __VA_ARGS__);

#define LOG(type, format, ...) do { \
if (type >= log_level && type <= LOG_FATAL) { \
CLog* log = CLog::get(); \
const char *type_as_char[] = { "DEBUG", "INFO", "WARN", "ERROR", "FATAL" }; \
struct _timeb now; \
struct tm today; \
char datetime_str[20]; \
_ftime_s(&now); \
localtime_s(&today, &now.time); \
strftime(datetime_str, 20, "%Y-%m-%d %H:%M:%S", &today); \
if (log) { \
log->PRINT_LINE(type_as_char[type], format, datetime_str, now.millitm, ## __VA_ARGS__); \
} else { \
PRINT_LINE(type_as_char[type], format, datetime_str, now.millitm, ## __VA_ARGS__); \
} \
} \
} while(0)


#define log_printf(format, ...) LOG(LOG_INFO, format, ## __VA_ARGS__)
#define LOG_INFO(format, ...) LOG(LOG_INFO, format, ## __VA_ARGS__)
#define LOG_WARN(format, ...) LOG(LOG_WARN, format, ## __VA_ARGS__)
#define LOG_ERROR(format, ...) LOG(LOG_ERROR, format, ## __VA_ARGS__)

#define DBGLEVEL 1000

#define DBG(level, format, ...) do { \
if (level <= DBGLEVEL) { \
LOG(LOG_DEBUG, format, ## __VA_ARGS__); \
} \
} while(0)

#define ASSERT(x) _ASSERTE(x)
#endif