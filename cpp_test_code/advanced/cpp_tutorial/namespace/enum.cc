/*
*
*      Filename: enum.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-22 21:59:14
* Last Modified: 2017-08-22 21:59:14
**/
#include <cstdio>
#include <iostream>

namespace ns {
enum eMat { matA, matB, matC, nMats };
}

int main(int argc, char* argv[]) {
  std::cout << ns::matA << std::endl;
  std::cout << ns::matB << std::endl;
  std::cout << ns::matC << std::endl;
  std::cout << ns::nMats << std::endl;

  return 0;
}
