/*
*
*      Filename: proj4_1_2.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-12 10:51:37
* Last Modified: 2017-04-12 10:51:37
**/
#include <iostream>
using std::cin;
using std::cout;
using std::endl;

int main() {
  const size_t array_size = 10;
  int ia[array_size];

  for (size_t index = 0; index != array_size; ++index) {
    ia[index] = index;
  }

  for (size_t index = 0; index != array_size; ++index) {
    cout << ia[index] << "\t";
  }
  cout << endl;
  return 0;
}
