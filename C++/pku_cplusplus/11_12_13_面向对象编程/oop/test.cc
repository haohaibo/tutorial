/*
* Author: Haibo Hao
* Email : haohaibo@ncic.ac.cn
* Copyright (C) 2017 NCIC
**/

#include <iostream>

class A {
  // 默认是private
  int v;
  A* next;
  void Func() {}
};
int main(int argc, char* argv[]) {
  A a;
  // a.v = 3;
  return 0;
}
