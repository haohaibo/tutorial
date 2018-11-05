/*
*
*      Filename: typeid.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-15 22:06:47
* Last Modified: 2017-08-16 11:13:46
**/
#include <iostream>
#include <typeinfo>

/*C++ RTTI机制*/
// ref : http://www.jellythink.com/archives/330
// RTTI : RunTime Type Information运行时信息类型

// typeid函数 查看当前变量类型

class A {
 public:
  void Print() { std::cout << "This is class A." << std::endl; }
};

class B : public A {
 public:
  void Print() { std::cout << "This is class B." << std::endl; }
};

struct C {
  void Print() { std::cout << "This is struct C." << std::endl; }
};

int main() {
  short s = 3;
  unsigned ui = 9;
  int i = 9;
  char ch = 'b';
  wchar_t wch = L'b';
  float f = 2.0f;
  double d = 3;

  std::cout << typeid(s).name() << std::endl;
  std::cout << typeid(ui).name() << std::endl;
  std::cout << typeid(i).name() << std::endl;
  std::cout << typeid(ch).name() << std::endl;
  std::cout << typeid(wch).name() << std::endl;
  std::cout << typeid(f).name() << std::endl;
  std::cout << typeid(d).name() << std::endl;

  A *pA1 = new A();
  A a2;
  A *pA = new B();

  std::cout << typeid(pA1).name() << std::endl;
  std::cout << typeid(a2).name() << std::endl;

  std::cout << "pA typeid : " << typeid(pA).name() << std::endl;
  std::cout << "*pA typeid : " << typeid(*pA).name() << std::endl;

  B *pB1 = new B();
  B b2;

  std::cout << typeid(pB1).name() << std::endl;
  std::cout << typeid(b2).name() << std::endl;

  C *pC1 = new C();
  C c2;

  std::cout << typeid(pC1).name() << std::endl;
  std::cout << typeid(c2).name() << std::endl;

  return 0;
}
