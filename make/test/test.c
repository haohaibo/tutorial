#include<stdio.h>
#include<stdlib.h>

#ifdef MACRO
#define MAX_THREAD 50
#else
#define MAX_THREAD 10
#endif
static const int AUX=2;
int sum(int a, int b, int c=AUX){
    return a + b;
}

int main(int argc, char* argv[]){
    printf("max "
            "thread = %d\n", MAX_THREAD);
    int mysum, a, b;
    a = 9, b = 2;
    mysum = sum(a, b);
    printf("%d + %d = %d\n",a, b, mysum);
    return 0;
}
