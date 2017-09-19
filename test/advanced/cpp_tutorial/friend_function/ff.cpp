/*
*
*      Filename: ff.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-09-19 21:35:09
* Last Modified: 2017-09-19 21:52:58
**/
#include<iostream>
#include<cstdio>
#include<cstdlib>

namespace ns{
    class Point{
        friend void ChangePrivate(Point &);
        public:
            Point(void) : m_i(0) {}
            void PrintPrivate(void){
                std::cout << m_i << std::endl;
            }
            void inc_point(void){
                ++m_i;
            }
        private:
            int m_i;

    };

    // friend function 可以访问和修改类的对象中的私有成员
    void ChangePrivate(Point &i){
        i.m_i++;
    }
}

int main(){
    ns::Point sPoint;
    sPoint.PrintPrivate();

    ChangePrivate(sPoint);
    sPoint.PrintPrivate();

    sPoint.inc_point();
    sPoint.PrintPrivate();
    return 0;
}

