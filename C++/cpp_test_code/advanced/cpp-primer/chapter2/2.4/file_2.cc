/*
*
*      Filename: file_2.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-09 18:38:46
* Last Modified: 2017-04-09 18:38:46
**/
#include <iostream>
#include "file_1.cc"
extern int counter;
extern const int buffSize;  // use buffSize from file_1
int main() {
  std::cout << ++counter << std::endl;
  std::cout << "buffSize is " << buffSize << std::endl;
  return 0;
}
