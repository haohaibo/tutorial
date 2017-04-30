#include <stdio.h>
#include <stdlib.h>

int main(int argc , char* argv[])
{
    int array[] = {1,2,3,4};
    printf("0x%x\n",array);
    printf("0x%x\n",&array);
    return 0;
}
