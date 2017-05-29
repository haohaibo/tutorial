/*
*
*      Filename: 1_1.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-05-29 13:37:50
* Last Modified: 2017-05-29 15:23:55
**/
#include <iostream>
// 管理线程的函数和类在<thread>中声明
#include <thread>
void hello()
{
    std::cout << "Hello Concurrent World" << std::endl;
}
int main()
{
    std::thread t(hello);
    t.join();
}
