/*
*
*      Filename: list_2.5.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-05-30 14:47:04
* Last Modified: 2017-05-30 14:51:51
**/
#include <thread>
#include <iostream>

void some_function()
{}

void some_other_function(int)
{}

std::thread f()
{
    void some_function();
    return std::thread(some_function);
}

std::thread g()
{
    void some_other_function(int);
    std::thread t(some_other_function, 42);
    return t;
}

int main()
{
    std::thread t1 = f();
    t1.join();
    
    std::thread t2 = g();
    t2.join();
}

