#include <iostream>

#define NUM 10
int main(){
    for(int i = 0; i < NUM; ++i){
        static bool flag = true;
        if(flag){
            std::cout << "OK" << std::endl;
        }
        flag = false;
    }
    return 0;
}
