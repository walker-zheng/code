#include <stdio.h>

struct test{
    int i;
    short c;
    char *p;
    char s[10];
};
// 数组和指针的区别
// 
//     对于char s[0]来说，汇编代码用了lea指令，lea   0×04(%rax),   %rdx
//     对于char*s来说，汇编代码用了mov指令，mov 0×04(%rax),   %rdx
//      lea全称load effective address，是把地址放进去，而mov则是把地址里的内容放进去。
//      访问成员数组名其实得到的是数组的相对地址，而访问成员指针其实是相对地址里的内容
int main(){
    struct test *pt=NULL;
    printf("&s = %x\n", pt->s); //等价于 printf("%x\n", &(pt->s) );
    printf("&i = %x\n", &pt->i); //因为操作符优先级，我没有写成&(pt->i)
    printf("&c = %x\n", &pt->c);
    printf("&p = %x\n", &pt->p);
    return 0;
}
