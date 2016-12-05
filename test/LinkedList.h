#ifndef __LINKED_LIST_H__
#define __LINKED_LIST_H__

// linked list Í·ÎÄ¼þ

template<typename T>
struct Node
{
    T data;
    Node * next;
};
template <typename T>
class LinkedList
{
private:
    node<T> * start;
    unsigned int numElem;


};
class iterator : public std::iterator<std::forward_iterator_tag, node<T>*>
{
    node<T> * itr;
public:
    iterator(node<T>* tmp): itr(tmp) {}
    iterator(const iterator & myitr): itr(myitr.itr) {}
    iterator operator++()
    {
        itr = itr->next;
        return *this;
    }
    bool operator==(const iterator & rhs)
    {
        return itr == rhs.itr;
    }
    bool operator!=(const iterator & rhs)
    {
        return itr != rhs.itr;
    }

};

#endif
