#include <iostream>
#include <memory.h>
#include <malloc.h>

#define NUM 5

void func(int& a){
    ++a;
}
// static_cast,const_cast
int main(){
    float* fa = new float[NUM]; 
    fa[0] = 0.1;
    fa[1] = 2.1;
    fa[2] = 3.0;
    fa[3] = 4.0;
    fa[4] = 5.1;
    double* db = static_cast<double*>(malloc(4*sizeof(double)));
    for(int i = 0; i < NUM; ++i){
        db[i] = fa[i];
    }
    for(int i = 0; i < NUM; ++i){
        std::cout << db[i] << std::endl;
    }

    double* dc = new double[NUM]; 
    dc[0] = 0.1;
    dc[1] = 2.1;
    dc[2] = 3.0;
    dc[3] = 4.0;
    dc[4] = 5.1;
    float* fd = static_cast<float*>(malloc(4*sizeof(float)));
    for(int i = 0; i < NUM; ++i){
        fd[i] = dc[i];
    }
    for(int i = 0; i < NUM; ++i){
        std::cout << fd[i] << std::endl;
    }

    const void* cv;
    float* pf;
    pf = static_cast<float*>(*(const_cast<void**>(&cv)));
    //*pf = 4.0;
    //std::cout << "cv = " << *cv << std::endl;
    //
    int a = 3;
    func(a);
    std::cout << "a = " << a << std::endl;

    return 0;

}
