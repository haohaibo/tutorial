/*
*
*      Filename: 12.1.2.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: 动态内存与智能指针
*        Create: 2017-06-07 19:35:46
* Last Modified: 2017-06-07 20:37:17
**/
#include <iostream>
#include <list>
#include <memory>
#include <string>
#include <vector>

int main() {
  // std::shared_ptr 允许多个指针指向同一个对象
  std::shared_ptr<std::string> p1;
  std::shared_ptr<std::list<int> > p2;
  return 0;
}
