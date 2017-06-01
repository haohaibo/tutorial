/*
*
*      Filename: main.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-06-01 10:48:32
* Last Modified: 2017-06-01 10:59:24
**/
#include "method.h"
#include <stdio.h>
#include <iostream>

int main()
{
    float data1 = 0.3, data2 = 0.6;
    swap<float>(data1, data2);
    std::cout << "data1 = " << data1 << ", data2 = " << data2 << std::endl;
    return 0;
}

