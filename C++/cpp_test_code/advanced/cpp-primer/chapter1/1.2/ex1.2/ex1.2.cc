/*
*
*      Filename: ex1.2.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-10-02 10:31:40
* Last Modified: 2017-10-02 10:31:40
**/
#include <cstdio>
#include <iostream>

int main() {
  // 1.3
  std::cout << "hello, world" << std::endl;
  // 1.4
  std::cout << "Enter two number:" << std::endl;
  int v1, v2;
  std::cin >> v1 >> v2;
  std::cout << "The product of " << v1 << " and " << v2 << " is " << v1 * v2
            << std::endl;
  return 0;
}
