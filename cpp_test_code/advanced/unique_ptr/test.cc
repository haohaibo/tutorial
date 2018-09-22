#include <stdio.h>
int main()
{
    volatile int *ptr;
    volatile int *ptrd;

    { // Block
        int tmp = 2;
        ptr = &tmp; // Just to see if the memory is cleared
    }

    { // Sibling block
        int d = 4;
        ptrd = &d;
    }

    printf("ptr = %d %d\n",*ptr, *ptrd);
    printf("%p %p\n", ptr, ptrd);
    return 0;
}
