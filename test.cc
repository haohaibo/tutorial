#include <iostream>
#include <cstdio>
#include <cstdlib>
#include <memory.h>

#define NUM 100

int main(){
    int *ip;
    ip = (int*)malloc(NUM*sizeof(int));
    std::cout << sizeof(ip) << std::endl;
    std::cout << sizeof(long long) << std::endl;
    while(1){
        std::cout << "runing" << std::endl;
    }
    return 0;
}
