/*
*
*      Filename: template.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-19 02:23:38
* Last Modified: 2017-08-27 23:29:48
**/
#include <iostream>
#include <cstdio>
#include <cstdlib>

namespace ns{
    
    // class template
    template <class T1, class T2>
        class A{
            T1 data1;
            T2 data2;
        };

    // function template
    template <class T>
        T max(const T lhs, const T rhs){
            return lhs > rhs ? lhs : rhs;
        }
        
}

int main(int argc, char* argv[])
{
    
    std::cout << ns::max<float>(4.2,9.5) << std::endl;
    // 可以自动推导类型
    std::cout << ns::max(4.3,9.2) << std::endl;

    return 0;
}

