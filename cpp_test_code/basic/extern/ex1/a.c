#include <stdio.h>
#include "b.c"
int main(int argc, char** argv)
{
    extern int v;
    //v = 5;
    printf("v = %d\n",v);
    return 0;
}
