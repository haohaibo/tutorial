/*
*
*      Filename: test1.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-16 23:35:47
* Last Modified: 2017-08-16 23:44:56
**/
#include <iostream>
#include <cstdio>
#include <cstdlib>

int main()
{
    int i = 4;
    decltype(i) a; //推导结果为int a类型为int
    a = 9;    
    std::cout << a << std::endl;
}

