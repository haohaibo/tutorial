/*
*
*      Filename: var.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-09-03 10:40:09
* Last Modified: 2017-09-03 12:26:07
**/
#include <cstdio>
#include <iostream>
#include <vector>

namespace ns {

std::vector<int> p = {1, 2, 3};
// std::vector<int> (p);

namespace sub_ns {
std::vector<int>(p);
}

void func(std::vector<int> p) {
  for (auto ele : p) {
    std::cout << ele << std::endl;
  }
}
}

int main(int argc, char* argv[]) {
  std::vector<int>(q);
  q.push_back(4);
  q.push_back(1);

  for (auto ele : ns::p) {
    std::cout << ele << std::endl;
  }

  std::cout << std::endl;

  ns::sub_ns::p.push_back(0);
  for (auto ele : ns::sub_ns::p) {
    std::cout << ele << std::endl;
  }
  std::cout << std::endl;
  for (auto ele : q) {
    std::cout << ele << std::endl;
  }

  std::vector<int> p;
  p.push_back(233);
  ns::func(std::vector<int>(p));

  return 0;
}
