/*
*
*      Filename: proj2_3_3.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-09 13:02:52
* Last Modified: 2017-04-09 16:14:05
**/
#include <iostream>
#include <string>
int main() {
  int val(1024);  // direct-initialization
  // int val = 1024; // copy-initialization
  std::cout << "val = " << val << std::endl;

  // alternative ways to initialize string from a character string literal
  std::string titleA = "C++ Primer, 4th Ed.";
  std::string titleB("C++ Primer, 4th Ed.");
  std::cout << "titleA = " << titleA << std::endl;
  std::cout << "titleB = " << titleB << std::endl;

  std::string all_six(6, '6');
  std::cout << "all_six = " << all_six << std::endl;

  // ok: salary defined and initialized before it is used to initialize wage
  double salary = 9999.99, wage(salary + 0.01);
  std::cout << "salary = " << salary << std::endl;
  std::cout << "wage = " << wage << std::endl;

  // ok: mix of initialized and uninitialized
  int interval, month = 8, day = 7, year = 2017;

  // ok: both forms of initialization syntax used
  std::string title("C++ primer, 4th Ed."), publisher = "A-W";
  std::cout << "title = " << title << std::endl;
  std::cout << "publisher = " << publisher << std::endl;

  return 0;
}
