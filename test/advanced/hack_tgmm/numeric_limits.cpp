/*
*
*      Filename: numeric_limits.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-07 16:44:23
* Last Modified: 2017-04-07 21:35:22
**/
#include <iostream>
#include <limits>

int main(int argc, char* argv[])
{
    unsigned int e1, e2;
    e1 = std::numeric_limits<unsigned int>::max();
    std::cout << "e1 = " << e1 << std::endl;
    return 0;
}

