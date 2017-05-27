/*
*
*      Filename: 2.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-05-27 11:06:05
* Last Modified: 2017-05-27 15:35:53
**/
#include <boost/thread.hpp>
#include <iostream>
using namespace std;
using namespace boost;
class test{
    public:
        void operator() () const{
            cout << "operator() " << *data << endl;
        }
        test(int a = 10){
            cout << "constructor" << endl;
            data = new int(a);
        }
        int get() const{
            return *data;
        }
        test(const test& one){
            cout << "copy constructor" << endl;
            // 深拷贝，否则段错误
            data = new int(one.get()); 
        }
    private:
        int *data;
};

int main(){
    test one;
    // 函数对象被拷贝到进程空间
    thread myThread(one);
    myThread.join();
    return 0;
}
