/*
*
*      Filename: pure_function.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-09-03 19:25:01
* Last Modified: 2017-09-03 19:34:56
**/
#include <cstdio>
#include <iostream>

namespace ns {
class Base {
 public:
  virtual void Vfunc() = 0;
  int x;
};
void Base::Vfunc() {
  x = 3;
  std::cout << x << std::endl;
}

class Derived : public Base {
 public:
  void Vfunc() { Base::Vfunc(); }
};
}
int main(int argc, char* argv[]) {
  // invalid new-expression of abstract class type ‘ns::Base’
  // ns::Base* pb = new ns::Base;

  ns::Base* pb = new ns::Derived;
  pb->Vfunc();
  delete pb;

  return 0;
}
