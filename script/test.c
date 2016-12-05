#include <stdio.h>

typedef struct list_t
{
    int value;
    struct list_t *next;
}list;

list *f(list *input)
{
    list *head;
    
    if (input == NULL){
        head = NULL;
        
    }
    else{
        head = (void *)malloc(sizeof(list));
        head->value = input->value;
        head->next  = f(input->next);
        
    }
    
    return head;
}


int factoriacl(int n)
{
    if (n == 0)
        return 1;
    else
        return n*factoriacl(n-1);
}

int factoriacl_tail_recursion(int n)
{
    if (n == 0)
        return 1;
    else
        return n*factoriacl(n-1);
}

int
list_test(void)
{
    list *plist = (void *)malloc(sizeof(list)*10);
    list *head  = plist;

    for (int i = 0; i != 10; i++){
        printf("%d:%x -> %x\n", i, head, head->next);
        head->value = i;
        head->next = head + 1;
        head = head->next;
    }
    head->next = NULL;
    head = plist;
    
    while (head){
        printf("%d:%x -> %x\n", head->value, head, head->next);
        head = head->next;
        
    }
    
}


int main (int argc, char * argv[]) 
{
    printf("factoriacl:%d,",factoriacl(6));
    
    return 0;
}
