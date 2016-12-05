#include <cassert>      // assert
#include <cstddef>      // ptrdiff_t
#include <iterator>     // iterator
#include <type_traits>  // remove_cv
#include <utility>      // swap

template
<
    class Type,
    class UnqualifiedType = std::remove_cv_t<Type>
>
class ForwardIterator 
    : public std::iterator<std::forward_iterator_tag,
                           UnqualifiedType,
                           std::ptrdiff_t,
                           Type*,
                           Type&>
{
    node<UnqualifiedType>* itr;

    explicit ForwardIterator(node<UnqualifiedType>* nd) 
        : itr(nd) 
    { 
    }

public:

    ForwardIterator()   // Default construct gives end.
        : itr(nullptr) 
    { 
    }

    void swap(ForwardIterator& other) noexcept
    {
        using std::swap;
        swap(itr, other.iter);
    }

    ForwardIterator& operator++ () // Pre-increment
    {
        assert(itr != nullptr && "Out-of-bounds iterator increment!");
        itr = itr->next;
        return *this;
    }

    ForwardIterator operator++ (int) // Post-increment
    {
        assert(itr != nullptr && "Out-of-bounds iterator increment!");
        ForwardIterator tmp(*this);
        itr = itr->next;
        return tmp; 
    }

    // two-way comparison: v.begin() == v.cbegin() and vice versa
    template<class OtherType>
    bool operator == (const ForwardIterator<OtherType>& rhs) const
    {
        return itr == rhs.itr;
    }

    template<class OtherType>
    bool operator != (const ForwardIterator<OtherType>& rhs) const
    {
        return itr != rhs.itr;
    }

    Type& operator* () const
    {
        assert(itr != nullptr && "Invalid iterator dereference!");
        return itr->data;
    }

    Type& operator-> () const
    {
        assert(itr != nullptr && "Invalid iterator dereference!");
        return itr->data;
    }

    // One way conversion: iterator -> const_iterator
    operator ForwardIterator<const Type>() const
    {
        return ForwardIterator<const Type>(itr);
    }
};

// `iterator` and `const_iterator` used by your class:
typedef ForwardIterator<T> iterator;
typedef ForwardIterator<const T> const_iterator;

