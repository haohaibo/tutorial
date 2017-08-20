/*
 *
 *      Filename: test1.cpp
 *
 *        Author: Haibo Hao
 *        Email : haohaibo@ncic.ac.cn
 *   Description: ---
 *        Create: 2017-08-20 20:50:14
* Last Modified: 2017-08-20 23:07:18
 **/
#include <iostream>
#include <cstdio>

// ref: https://www.ibm.com/developerworks/cn/aix/library/1212_lufang_c11new/

namespace ns{
    // class X没有定义类的默认构造函数,
    // 但在创建类X的对象x的时候，又需要
    // 用到类X的默认构造函数，此时，编
    // 译器会隐式的为类X生成一个默认构
    // 造函数 X::X(){} 虽然自动生成的默
    // 认构造函数仅有一个空函数体，但仍
    // 可用来创建类X的对象x  
    class X{
        private:
            int a;
    };

    // Y已经有了自定义构造函数，编译器将不再
    // 会为它隐式的生成默认构造函数，如果需要
    // 用到默认构造函数来创建类的对象时，程序
    // 员必须显式的定义默认构造函数
    class Y{
        public:
            Y(int i){
                a = i;
            }
        private:
            int a;
    };

    class Z{
        public:
            Z(int _a){
                a = _a;
            }
            // 手动定义默认构造函数
            Z(){
                std::cout << "user defined default constructor" 
                    << std::endl; 
            }
        private:
            int a;
    };

    class P{
        public:
            P(int _a){
                a = _a;
            }

            // 编译器会生成默认构造函数P(){}
            // default函数比用户手动定义的默认
            // 构造函数有更高的代码效率
            P() = default;
        private:
            int a;
    };

    // default函数既可以在类体里(inline)定义，
    // 也可以在类体外(out-of-line)定义
    class Q{
        public:
            // inline default 默认构造函数
            Q() = default; 
            Q(const Q&);
            Q& operator = (const Q&);
            // inline default 默认析构函数
            ~Q() = default; 
    };
    // out-of-line default 拷贝构造函数
    Q::Q(const Q&) = default; 
    // out-of-line default 拷贝赋值操作符
    Q& Q::operator = (const Q&) = default; 

    // default函数既可以在类体里(inline)定义，
    // 也可以在类体外(out-of-line)定义
    class M{
        public:
            // inline default 默认构造函数
            M() = default; 
            M(const M&);
            M& operator = (const M&);
            // inline default 默认析构函数
            ~M() = default; 
    };
}

// out-of-line default 拷贝构造函数
ns::M::M(const ns::M&) = default; 
// out-of-line default 拷贝赋值操作符
ns::M& ns::M::operator = (const ns::M&) = default; 

int main(int argc, char* argv[])
{
    ns::X x;

    // 类Y显式的自定义了非默认构造函数，
    // 却没有定义非默认构造函数,编译错误
    //ns::Y y; //错误：默认构造函数ns::Y::Y()不存在

    ns::Z z;

    ns::P p;
    ns::Q q;
    ns::M m;
    return 0;
}
