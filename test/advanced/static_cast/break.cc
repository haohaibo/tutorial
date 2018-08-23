#include <iostream>
#include <typeinfo>
#define NUM 5

int main(){
    for(int i = 0; i < NUM; ++i){
        if(2 == i){
            std::cout << i << std::endl;
            // so for loop will break
            break;
        }
        std::cout << i << " OK" << std::endl;
    }

    int in = 9;
    float out = static_cast<float>(in);
    std::cout << typeid(in).name() << std::endl;
    std::cout << typeid(out).name() << std::endl;
    void* p;
    float* fp;
    *fp = 2.;
    // so void* can receive any TYPE*
    p = fp;
    return 0;
}
