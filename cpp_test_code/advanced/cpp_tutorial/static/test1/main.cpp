/*
*
*      Filename: main.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-09-22 14:51:36
* Last Modified: 2017-09-22 14:58:04
**/
#include <cstdio>
#include <iostream>
extern void msg();  // msg() implemented in other place
int main() {
  extern char a;  // char a defined in other place
  std::cout << a << std::endl;
  msg();
  return 0;
}
