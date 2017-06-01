/*
*
*      Filename: swap0.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-06-01 10:35:33
* Last Modified: 2017-06-01 10:42:43
**/
#include <cstdio>
#include <iostream>

void swap(int &a, int &b)
{
    int temp = a;
    a = b;
    b = temp;
}
int main(int argc, char *argv[])
{
    int a = 2, b = 6;
    swap(a,b); 
    std::cout << "a = " << a << ", b = " << b << std::endl;
    return 0;
}

