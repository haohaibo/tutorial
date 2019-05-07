#include <stdio.h>
#include <stdlib.h>
#include <iostream>


int m_value = 1;

void func(int *p)
{

    std::cout << "in func start" << std::endl;
    std::cout << *p << std::endl;
    *p = 9;
    p = &m_value;
    std::cout << *p << std::endl;
    std::cout << "in func end" << std::endl;
}

int main(int argc , char* argv[])
{
    int array[] = {1,2,3,4};
    printf("0x%x\n",array);
    printf("0x%x\n",&array);

    int n = 2;
    int *pn = &n;
    std::cout << *pn << std::endl; 
    func(pn);
    std::cout << *pn << std::endl;
    return 0;
}
