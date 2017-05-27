/*
*
*      Filename: proj1.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-05-22 14:15:11
* Last Modified: 2017-05-22 17:31:18
**/
#include <boost/thread.hpp>
#include <unistd.h>
#include <sys/syscall.h>
#include <iostream>
using namespace std;

void show(){
    cout << "hello world " << syscall(SYS_gettid) << endl;
}
int main(){
    // 这里也可以用t(&show)也能成功和pthread_create一样
    boost::thread t(show);
    cout << "main pid " << syscall(SYS_gettid)<<" "<<t.get_id()<<endl;
    // t.detach();
    if(!t.joinable()){
        cout << "thread unjoinable"<<endl;
    }else{
        cout << "thread joinable"<<endl;
        t.join();
    }
    return 0;
}


