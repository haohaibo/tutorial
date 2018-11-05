/*
* Author: Haibo Hao
* Email : haohaibo@ncic.ac.cn
* Copyright (C) 2017 NCIC
**/

#include <iostream>
//       定义2个引用类型
void swap(int &a, int &b) {
  int temp;
  temp = a;
  a = b;
  b = temp;
}
int main(int argc, char *argv[]) {
  int a = 3, b = 5;
  swap(a, b);
  std::cout << "a = " << a << ", b = " << b << std::endl;
  return 0;
}
