/*
*
*      Filename: virtual_function.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-09-26 12:05:04
* Last Modified: 2017-09-26 17:02:59
**/
#include <cstdio>
#include <iostream>

class Base {
 public:
  virtual void f() { std::cout << "Base::f" << std::endl; }
  virtual void g() { std::cout << "Base::g" << std::endl; }
  virtual void h() { std::cout << "Base::h" << std::endl; }
};

typedef void (*Fun)(void);
int main() {
  Base b;
  Fun pFun = NULL;
  std::cout << "virtual table address: " << (int*)(&b) << std::endl;
  std::cout << "virtual table - first virtual function address: "
            << (int*)*(int*)(&b) << std::endl;
}
