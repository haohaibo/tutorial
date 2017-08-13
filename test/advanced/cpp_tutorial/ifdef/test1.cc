/*
*
*      Filename: test1.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-12 20:54:12
* Last Modified: 2017-08-12 20:54:12
**/
#include <iostream>
#include <stdio.h>
#include <stdlib.h>

#define A
#define B



int main()
{

#ifdef A
    std::cout << "define A"<< std::endl;
    #ifdef B
        std::cout << "define B"<< std::endl;
        int a = 9;
        std::cout << a << std::endl;
    #endif
        std::cout << "check"<<std::endl;

#endif

#if 1 
        std::cout << "check 233"<<std::endl;
#if 0 

        std::cout << "check ..."<<std::endl;
#endif

#endif
    std::cout << "[INFO]  " << "OK" << std::endl; 
    std::cerr << "[!FATAL!]  " << "ERROR" << std::endl;
}

