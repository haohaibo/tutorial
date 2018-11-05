/*
*
*      Filename: proj4_2_4.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-12 22:43:36
* Last Modified: 2017-04-12 22:43:36
**/
#include <iostream>
#include <string>
using std::cin;
using std::cout;
using std::endl;

int main() {
  const size_t arr_size = 5;
  int int_array[arr_size] = {0, 1, 2, 3, 4};

  for (int *pbegin = int_array, *pend = int_array + arr_size; pbegin != pend;
       ++pbegin) {
    cout << *pbegin << " ";
  }
  cout << endl;
  return 0;
}
