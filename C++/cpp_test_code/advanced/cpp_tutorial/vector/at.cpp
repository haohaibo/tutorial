/*
*
*      Filename: at.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-22 19:20:38
* Last Modified: 2017-08-22 22:04:09
**/
#include <cstdio>
#include <iostream>
#include <vector>

// ref: http://www.cplusplus.com/reference/vector/vector/at/
int main(int argc, char* argv[]) {
  // 10 zero-initialized ints
  std::vector<int> myvector(10);

  // assign some value
  for (unsigned i = 0; i < myvector.size(); i++) {
    myvector.at(i) = i;
  }

  std::cout << "myvector contains:";
  for (unsigned i = 0; i < myvector.size(); i++) {
    std::cout << " " << myvector.at(i);
  }
  std::cout << std::endl;
  return 0;
}
