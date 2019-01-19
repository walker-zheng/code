#include <iostream>
using namespace std;

struct LinkedList
{
    int data;
    LinkedList *next;
};

LinkedList *head;

LinkedList *Create()
{ //start of CREATE()
    LinkedList *p = NULL;
    LinkedList *q = NULL;
    head = NULL;
    int data = 10;
    for (int i = 0; i != data; i++)
    {
        p = new LinkedList;
        //类似表达:  TreeNode* node = new TreeNode;//Noice that [new] should be written out.
        p->data = i;
        if (head == NULL)
        {
            head = p;
        }
        else
        {
            q->next = p;
        }
        q = p;
    }
    if (head != NULL)
        q->next = NULL;
    return head;

} //end of CREATE()

void DisplayList(LinkedList *head)
{ //start of display
    cout << "show the list of programs." << endl;
    while (head != NULL)
    {
        cout << head->data << "\t" << flush;
        head = head->next;
    }
    cout << endl;
} //end of display

LinkedList *ReverseList2(LinkedList *head)
{
    // 使用p和q连个指针配合工作，使得两个节点间的指向反向，同时用r记录剩下的链表。
    //LinkedList* temp=new LinkedList;
    if (NULL == head || NULL == head->next)
        return head;
    LinkedList *p;
    LinkedList *q;
    LinkedList *r;
    p = head;
    q = head->next;
    head->next = NULL;
    while (q)
    {
        r = q->next; //
        q->next = p;
        p = q; //
        q = r; //
    }
    head = p;
    return head;
}

LinkedList *ReverseList3(LinkedList *head)
{
    // 对于一条链表，从第2个节点到第N个节点，依次逐节点插入到第1个节点(head节点)之后，(N-1)次这样的操作结束之后将第1个节点挪到新表的表尾即可
    LinkedList *p;
    LinkedList *q;
    p = head->next;
    while (p->next != NULL)
    {
        q = p->next;
        p->next = q->next;
        q->next = head->next;
        head->next = q;
    }

    p->next = head;       //相当于成环
    head = p->next->next; //新head变为原head的next
    p->next->next = NULL; //断掉环
    return head;
}
int main(int argc, char *argv[])
{
    DisplayList(Create());
    DisplayList(ReverseList2(Create()));
    DisplayList(ReverseList3(Create()));
    return 0;
}
