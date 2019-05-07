/*
 *
 *      Filename: test2.cpp
 *
 *        Author: Haibo Hao
 *        Email : haohaibo@ncic.ac.cn
 *   Description: ---
 *        Create: 2017-08-20 23:07:26
* Last Modified: 2017-08-21 10:03:23
 **/
#include <cstdio>
#include <iostream>

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

class P {
 public:
  // 手动定义虚构函数
  virtual ~P(){};

 private:
  int p;
};
class Q : public P {
 private:
  int q;
};

class M {
 public:
  // 手动定义虚构函数
  virtual ~M() = default;

 private:
  int p;
};
class N : public M {
 private:
  int n;
};
}
int main(int argc, char* argv[]) {
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

  // 因此，一般情况下，我们需要将基类的析构函数
  // 定义为虚函数，当利用delete语句删除指向派生
  // 类对象的基类指针时，系统会调用相应的派生类
  // 的析构函数(实现多态性)，从而避免内存泄露。
  // 但是编译器隐式生成的析构函数都是非虚函数
  // 需要手动为基类P定义析构函数

  // 当利用delete语句删除指向派生类对象的基类指针
  // p，系统会调用相应的派生类Y的析构函数(有编译器
  // 隐式自动生成)以及基类P的析构函数，从而将派生类
  // 对象完整的销毁
  ns::P* p = new ns::Q;
  delete p;

  ns::M* m = new ns::N;
  delete m;

  return 0;
}
