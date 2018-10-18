#include <stdio.h>
#include <stdlib.h>

void ctest1(void *i);
void ctest2(void *i);

int main(int argc, char** argv)
{
    int x;
    ctest1(&x);
    printf("Valx=%d\n",x);
    return 0;
}
