/*
*
*      Filename: pointer.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-09-04 15:55:25
* Last Modified: 2017-09-04 16:30:14
**/
#include <cstdio>
#include <iostream>

#define cl_mem void*

namespace ns {
class A {
 public:
  A(int x) { a = x; }
  A() = default;

 private:
  int a;
};
}

int main() {
  int* var = nullptr;
  std::cout << var << std::endl;
  // std::cout << *var << std::endl;

  ns::A* a = nullptr;
  std::cout << a << std::endl;
  // std::cout << (*a) << std::endl;

  // ns::A s2 = nullptr;

  void* ptr = &a;
  std::cout << ptr << std::endl;

  void* varptr = &ptr;
  std::cout << varptr << std::endl;
  // std::cout << *varptr << std::endl;

  std::cout << sizeof(ptr) << std::endl;

  int c = 9;
  int* pc = &c;
  int** ppc = &pc;
  std::cout << *pc << std::endl;
  std::cout << **ppc << std::endl;

  cl_mem mtx_a = nullptr;
  std::cout << a << std::endl;
  return 0;
}
