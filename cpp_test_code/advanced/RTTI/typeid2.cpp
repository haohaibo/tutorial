/*
*
*      Filename: typeid2.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-16 11:20:40
* Last Modified: 2017-08-16 15:23:45
**/
#include <iostream>
#include <typeinfo>

class A {
 public:
  virtual void Print() { std::cout << "This is class A" << std::endl; }
};

class B : public A {
 public:
  void Print() { std::cout << "This is class B" << std::endl; }
};
int main() {
  A *pA = new B();
  std::cout << typeid(pA).name() << std::endl;
  std::cout << typeid(*pA).name() << std::endl;

  // error: new B()生成一个B*类型，也就是B对象的指针
  // A a = new B();
  // std::cout << typeid(a).name() << std::endl;

  return 0;
}
