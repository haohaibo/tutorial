/*
*
*      Filename: test.cc
*
*        Author: Haibo Hao
*        Email : haohaibo01@gmail.com
*   Description: ---
*        Create: 2019-04-09 19:21:00
* Last Modified: 2019-04-09 19:21:00
**/
#include <iostream>
#include <memory>
#include <cstdlib>

int main()
{
    int* p;
    p = (int*)malloc(10*sizeof(int));
    free(p);
    free(p);
    return 0;
}

