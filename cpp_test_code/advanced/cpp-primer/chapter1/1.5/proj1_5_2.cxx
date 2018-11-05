/*
*
*      Filename: proj1_5_2.cxx
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-08 16:59:19
* Last Modified: 2017-04-08 16:59:19
**/
#include <iostream>
#include "Sales_item.h"
int main() {
  Sales_item item1, item2;
  std::cin >> item1 >> item2;               // read a pair of transactions
  std::cout << item1 + item2 << std::endl;  // print their sum
  return 0;
}
