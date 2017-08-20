/*
 *
 *      Filename: test2.cpp
 *
 *        Author: Haibo Hao
 *        Email : haohaibo@ncic.ac.cn
 *   Description: ---
 *        Create: 2017-08-20 23:07:26
* Last Modified: 2017-08-20 23:59:05
 **/
#include <iostream>
#include <cstdio>

// 在C++代码编译过程中，如果程序员没有为类定义
// 析构函数，但是在销毁Y对象的时候又需要调用Y的
// 析构函数时，编译器会隐式的为该类生成一个析构
// 函数。该析构函数没有参数，包含一个空的函数体
// 即 ns::X::~X(){}
namespace ns {
    class X {
        private:
            int x;
    };
    class Y : public X {
        private:
            int y;
    };
}
int main(int argc, char* argv[])
{
    // 没有为基类ns::X和派生类ns::Y定义析构函数，
    // 当在主函数内delete基类指针x的时候，需要调
    // 用基类的析构函数。于是，编译器会隐式自动的
    // 为类X生成一个析构函数，从而可以成功的销毁x
    // 指向的派生类对象中的基类子对象(即int型成员
    // 变量x)
    
    // 这段代码存在内存泄露问题，当利用delete语句
    // 删除指向派生类对象的指针x时，系统调用的是基
    // 类的析构函数，而非派生类Y类的析构函数,因此
    // 编译器无法析构派生类的int型成员变量y
    ns::X* x = new ns::Y;
    delete x;
    return 0;
}

