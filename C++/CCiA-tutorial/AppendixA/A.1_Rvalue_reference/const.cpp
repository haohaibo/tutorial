/*
*
*      Filename: const.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-06-04 15:47:36
* Last Modified: 2017-06-04 17:52:27
**/
#include <iostream>

void print(std::string const &s)
{
    std::cout << s << std::endl;
}
int main()
{
    int const &i = 42;
    std::cout << i << std::endl;
    // error: assignment of read-only reference 'i'
    // 说明i是只读的，不能被修改
    //i = 3;
    
    print("hhb"); // 创建了临时std::string 对象
    return 0;
}

