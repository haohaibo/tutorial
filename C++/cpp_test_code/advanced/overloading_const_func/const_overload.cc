/*
*
*      Filename: const_overload.cc
*
*        Author: Haibo Hao
*        Email : haohaibo01@gmail.com
*   Description: ---
*        Create: 2018-08-07 03:50:48
* Last Modified: 2018-08-07 03:50:48
**/
#include <cstdio>
#include <iostream>
using namespace std;

class Test {
 protected:
  int x;

 public:
  Test(int i) : x(i) {}
  void func() const { cout << "func() const called" << endl; }
  void func() { cout << "func() called" << endl; }
};

int main() {
  Test t1(10);
  const Test t2(20);
  t1.func();
  t2.func();

  return 0;
}
