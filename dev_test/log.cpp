#include "Log.h"
#include <stdio.h>
#include <stdarg.h>
#include <share.h>

#define LOG_ROLL_SIZE (1024 * 1024)

CLog* CLog::_log = NULL;

CLog::CLog(FILE* handle)
    : _handle(handle)
{
    _log = this;
}

CLog::~CLog()
{
    if (_log && _handle)
    {
        fclose(_handle);
        _log = NULL;
    }
}

CLog* CLog::get(char* path)
{
    if (_log)
    {
        return _log;
    }
    if(!path)
    {
        path = "dll.log";
    }
    DWORD size = 0;
    HANDLE file = CreateFile(path, GENERIC_READ, 0, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL,
                             NULL);
    if (file != INVALID_HANDLE_VALUE)
    {
        size = GetFileSize(file, NULL);
        CloseHandle(file);
    }
    if (size != INVALID_FILE_SIZE && size > LOG_ROLL_SIZE)
    {
        TCHAR roll_path[MAX_PATH];
        sprintf(roll_path, "%s.1", path);
        if (!MoveFileEx(path, roll_path, MOVEFILE_REPLACE_EXISTING))
        {
            return NULL;
        }
    }
    FILE* handle = fopen(path, "a+");
    if (!handle)
    {
        return NULL;
    }
    _log = new CLog(handle);
    return _log;
}

void CLog::printf(const char* format, ...)
{
    va_list args;

    va_start(args, format);
    vfprintf(_handle, format, args);
    va_end(args);
    fflush(_handle);
}