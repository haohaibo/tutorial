#include <iostream>

//void fun(int * const * fp)
//{
//    std::cout << "fun " << **fp << std::endl;
//}



typedef struct 
{
    int * t;
}Tensor;


void fun(Tensor* const* ptensor)
{
    std::cout <<"Tensor " << *((*ptensor)->t) << std::endl;
}
int main()
{
    int * p;
    int a = 2;
    p = &a;

    int * const * fp = &p;
    std::cout << **fp << std::endl;

    //fun(&p);

    Tensor* tensor = new Tensor;
    //tensor->t = &a;
    //std::cout << "2333" << (tensor->t) << std::endl;
    tensor->t = new int(8);
    fun(&tensor);

    fun(&(new Tensor));
}
