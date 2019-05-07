/*
*
*      Filename: test1.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-21 10:12:03
* Last Modified: 2017-08-21 11:00:57
**/
#include <cstdio>
#include <iostream>

namespace ns {
class X {
 public:
  X() = default;
};

class Y {
 public:
  Y() = default;

  Y(double) {}
  //不支持参数为int类型的转换构造函数
  Y(int) = delete;

  // 声明拷贝构造函数为deleted函数
  Y(const Y&) = delete;
  // 声明拷贝赋值操作符为deleted函数
  Y& operator=(const Y&) = delete;

  // 禁用new操作符
  void* operator new(size_t) = delete;
  // 禁用new[]操作符
  void* operator new[](size_t) = delete;
};

int add(int, int) = delete;
double add(double a, double b);
}
double ns::add(double a, double b) { return a + b; }

int main(int argc, char* argv[]) {
  ns::X x1;
  // 调用编译器隐式生成的默认拷贝构造函数
  ns::X x2 = x1;

  ns::X x3;
  // 调用编译器隐式生成的默认拷贝赋值操作符
  x3 = x1;

  ns::Y y1;
  // ns::Y y2 = y1;
  ns::Y y3;
  // y3 = y1;

  ns::Y y4(1.3);
  // 参数为int类型的转换构造函数被禁用
  // ns::Y y5(2);

  // ns::Y *py = new ns::Y;
  // ns::Y *py2 = new ns::Y[3];

  // std::cout << ns::add(2, 4) << std::endl;
  std::cout << ns::add(2.3, 4.5) << std::endl;
  return 0;
}
