#include<stdio.h>
#include<stdlib.h>

#ifdef MACRO
#define MAX_THREAD 50
#else
#define MAX_THREAD 10
#endif

int main(int argc, char* argv[]){
    printf("max "
            "thread = %d\n", MAX_THREAD);
    return 0;
}
