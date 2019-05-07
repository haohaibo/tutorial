/*
*
*      Filename: test2.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-16 23:50:32
* Last Modified: 2017-08-17 00:03:56
**/
#include <cstdio>
#include <cstdlib>
#include <iostream>

struct A {
  double x;
};
const A* a = new A{0};

decltype(a->x) y;        // y的类型是double (声明类型)
decltype((a->x)) z = y;  // z的类型是const double& (左值表达式)

template <typename T, typename U>
auto add(T t, U u) -> decltype(t + u);  //返回类型依赖于参数模板

int main() {
  int i = 233;
  decltype(i) j = i * 3;

  std::cout << "i = " << i << ", "
            << "j = " << j << std::endl;

  auto f = [](int a, int b) -> int { return a * b; };

  decltype(f) g = f;  // lambda的类型是唯一的且无名
  i = f(2, 3);
  j = g(3, 3);

  std::cout << "i = " << i << ", "
            << "j = " << j << std::endl;
}
