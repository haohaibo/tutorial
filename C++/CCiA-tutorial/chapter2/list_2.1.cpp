/*
*
*      Filename: list_2.1.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-05-29 17:03:52
* Last Modified: 2017-05-29 17:12:06
**/
#include <iostream>
#include <thread>

void do_something(int &i)
{
    ++i;
}

struct func
{
    int &i;

    func(int &i_):i(i_)
    {}

    void operator() ()
    {
        for(unsigned j = 0;j<1000000;++j)
        {
            do_something(i);
        }
    }

};

void oops()
{
    int some_local_state = 0;
    func my_func(some_local_state);
    std::thread my_thread(my_func);
    //my_thread.detach();
    my_thread.join();
}

int main()
{
    oops();
    return 0;
}

