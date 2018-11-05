/*
*
*      Filename: proj1_5_3.cxx
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-08 17:22:06
* Last Modified: 2017-04-08 17:22:06
**/
#include <iostream>
#include "Sales_item.h"
int main() {
  Sales_item item1, item2;
  std::cin >> item1 >> item2;

  // first check that item1 and item2 represent the same book
  if (item1.same_isbn(item2)) {
    std::cout << item1 + item2 << std::endl;
    return 0;
  } else {
    std::cerr << "Data must refer to same ISBN" << std::endl;
    return -1;  // indicate failure
  }
}
