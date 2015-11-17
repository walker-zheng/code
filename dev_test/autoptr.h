#ifndef AUTOPTR_H_INCLUDED  
#define AUTOPTR_H_INCLUDED  
  
#include <windows.h>  
  
template<typename T>  
class AutoPtr  
{  
public:  
    AutoPtr(void)  
        : _ptr(0), _refCount(0)  
    { }  
  
    explicit AutoPtr(T *ptr)  
        : _ptr(ptr)  
    {  
        _refCount = new long(1);  
    }  
  
    AutoPtr(const AutoPtr &rhs)  
        : _ptr(rhs._ptr), _refCount(rhs._refCount)  
    {  
        if (_ptr && _refCount)  
            ::InterlockedIncrement(_refCount);  // 引用计数加1  
    }  
  
    ~AutoPtr(void)  
    {  
        if (!_ptr)  
            return;  
  
        long refCount = ::InterlockedExchangeAdd(_refCount, -1);  
        if (refCount == 1)  
        {  
            delete _refCount;  
            delete _ptr;  
        }  
    }  
  
    T &operator*(void)  
    {  
        return *_ptr;  
    }  
  
    const T&operator*(void) const  
    {  
        return *_ptr;  
    }  
  
    T *operator->(void)  
    {  
        return _ptr;  
    }  
  
    const T*operator->(void) const  
    {  
        return _ptr;  
    }  
  
    const AutoPtr &operator=(const AutoPtr &rhs);  
  
//    T *get(void)  
//    {  
//        return _ptr;  
//    }  
//  
//    const T *get(void) const  
//    {  
//        return _ptr;  
//    }  
//  
//    T *release(void)  
//    {  
//  
//    }  
//  
//    void reset(T *ptr)  
//    {  
//  
//    }  
  
private:  
    T *_ptr;  
    long *_refCount;  
};  
  
template<typename T>  
const AutoPtr<T> &AutoPtr<T>::operator=(const AutoPtr &rhs)  
{  
    if (_ptr)  
    {  
        long refCount = ::InterlockedExchangeAdd(_refCount, -1);  
        if (refCount == 1)  
        {  
            delete _refCount;  
            delete _ptr;  
        }  
    }  
  
    _ptr = rhs._ptr;  
    _refCount = rhs._refCount;  
    if (_refCount)  
        ::InterlockedIncrement(_refCount);  
  
    return *this;  
}  
  
#endif // AUTOPTR_H_INCLUDED  
