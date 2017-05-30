/*
*
*      Filename: list_2.7.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-05-30 19:09:38
* Last Modified: 2017-05-30 19:36:16
**/
#include <thread>
#include <vector>
#include <algorithm>
#include <functional>

void do_work(unsigned id)
{}

void f()
{
    std::vector<std::thread> threads;
    // 创建20个线程
    for(unsigned i=0;i < 20; ++i)
    {
        threads.push_back(std::thread(do_work,i));
    }

    // std::mem_fn(&std::thread::join)让threads中的
    //每个线程对象都执行一遍join方法
    std::for_each(threads.begin(),threads.end(),std::mem_fn(&std::thread::join)); 
}

int main()
{
    f();
}

