/*
 *
 *      Filename: proj2_3_4.cpp
 *
 *        Author: Haibo Hao
 *        Email : haohaibo@ncic.ac.cn
 *   Description: ---
 *        Create: 2017-04-09 16:14:21
* Last Modified: 2017-04-09 16:54:30
 **/
#include <iostream>

std::string global_str;
int global_int;
int main() {
  int local_int;
  std::string local_str;  // local_str is the empty string; local_str = ""
  std::cout << "global_str = " << global_str << std::endl;
  std::cout << "global_int = " << global_int << std::endl;
  std::cout << "local_int = " << local_int << std::endl;
  std::cout << "local_str = " << local_str << std::endl;
  return 0;
}
