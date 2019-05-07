/*
*
*      Filename: fclass.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-09-19 23:02:51
* Last Modified: 2017-09-19 23:13:44
**/
#include <cstdio>
#include <iostream>

namespace ns {
class B;

class A {
 public:
  int func1(B& b);

 private:
  int func2(B& b);
};

class B {
 private:
  int _b;

  friend int A::func1(B& b);
};

int A::func1(B& b) { return b._b; }
int A::func2(B& b) {
  //非友元函数不能访问私有成员
  // return b._b; //error
}
}

int main() {
  ns::A a;
  ns::B b;
  a.func1(b);
  // a.func2(b);

  return 0;
}
