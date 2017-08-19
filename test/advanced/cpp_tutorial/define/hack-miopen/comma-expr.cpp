/*
*
*      Filename: comma-expr.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-19 01:50:18
* Last Modified: 2017-08-19 02:19:14
**/
#include <iostream>
#include <cstdio>
#include <cstdlib>

int main(int argc, char* argv[])
{
    int x = 1;
    int a;
    std::cout << (x == 1, a = 3) << std::endl;
    return 0;
}

