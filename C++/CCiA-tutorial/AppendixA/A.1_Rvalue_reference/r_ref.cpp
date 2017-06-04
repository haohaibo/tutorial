/*
*
*      Filename: r_ref.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-06-04 16:12:42
* Last Modified: 2017-06-04 17:08:55
**/
#include <iostream>
int main()
{
    // 右值引用
    int &&i = 42;
    int j = 2;
    std::cout << "i = " << i << ", j = " << j << std::endl;
    i = 9;
    std::cout << "i = " << i << std::endl;
    return 0;
}

