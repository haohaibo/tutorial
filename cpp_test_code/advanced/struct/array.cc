/*
*
*      Filename: array.cc
*
*        Author: Haibo Hao
*        Email : haohaibo01@gmail.com
*   Description: ---
*        Create: 2018-11-05 23:51:13
* Last Modified: 2018-11-05 23:51:13
**/
#include <iostream>

typedef struct S {
  static const int MAX_DIMS = 9;
  int nbElements;
  size_t i[MAX_DIMS];
} Array;

int main() {
  int nbDims = 4;
  Array a{1 + nbDims, {size_t(0)}};
  std::cout << a.nbElements << std::endl;
  for (int i = 0; i < a.MAX_DIMS; ++i) {
    std::cout << a.i[i] << std::endl;
  }
  return 0;
}
