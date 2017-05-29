/*
*
*      Filename: 1_1.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-05-29 13:37:50
* Last Modified: 2017-05-29 16:41:31
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
    // 创建线程对象
    std::thread t(hello);
    // 初始线程等待新线程结束
    t.join();
}
