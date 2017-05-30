/*
*
*      Filename: list_2.6.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-05-30 16:31:29
* Last Modified: 2017-05-30 18:51:27
**/
#include <thread>

class scoped_thread
{
    std::thread t;
    public:
        explicit scoped_thread(std::thread t_):t(std::move(t_))
    {
        if(!t.joinable())
            throw std::logic_error("No thread");
    }
        ~scoped_thread()
        {
            t.join();
        }
        scoped_thread(scoped_thread const &)=delete;
        scoped_thread& operator=(scoped_thread const &)=delete;
};

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
        for(unsigned j=0;j<1000000;++j)
        {
            do_something(i);
        }
    }
};

void do_something_in_current_thread()
{}

void f()
{
    int some_local_state;
    scoped_thread t(std::thread(func(some_local_state)));

    //func my_func(some_local_state);
    //std::thread t(my_func);
    //scoped_thread s(t);
    /*
    std::thread t2;
    t2 = std::move(t);
    t2.join();
    */
    do_something_in_current_thread();
}

int main()
{
    f();
}

