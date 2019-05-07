/*
*      Filename: proj1_5_1.cxx
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-08 16:35:38
* Last Modified: 2017-04-08 16:35:38
**/
#include <iostream>
#include "Sales_item.h"
/* chapter1 1.5小节 类的简介
 *  C++设计的主要焦点就是使所定义的类类型(class type)
 *  的行为可以像内置类型一样自然
 */
int main() {
  Sales_item book;
  // read ISBN, number of copies sold, and sales price
  std::cin >> book;

  // write ISBN, number of copies sold, total revenue, and sales price
  std::cout << book << std::endl;
  return 0;
}
