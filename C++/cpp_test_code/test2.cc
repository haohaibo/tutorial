/*
*
*      Filename: test2.cc
*
*        Author: Haibo Hao
*        Email : haohaibo01@gmail.com
*   Description: ---
*        Create: 2019-03-28 22:19:58
* Last Modified: 2019-03-28 22:19:58
**/
#include <iostream>

struct A
{
    A() : mX(2), mY(3), mZ(4) { std::cout << mX << ", " << mY << ", " << mZ << std::endl; }
    A(int _mX) : mX(_mX), mY(3), mZ(4) { std::cout << mX << ", " << mY << ", " << mZ << std::endl; }
#if 0
    virtual void foo(int x = 2) { std::cout << "A::foo(" << x << ")" << std::endl; }
#endif
    int mX;
    int mY;
    int mZ;
};

struct B : A
{
    // B(int _a) : a(_a) { std::cout << a << std::endl; }
#if 0 
    virtual void foo(int x) override { std::cout << "B::foo(" << x << ")" << std::endl; }
#endif
    int a;
};

int main()
{
#if 0
    B b;
    A* pb = &b;
    b.foo();
    pb->foo();
#endif
    A a;
    A a2(7);
    return 0;
}
