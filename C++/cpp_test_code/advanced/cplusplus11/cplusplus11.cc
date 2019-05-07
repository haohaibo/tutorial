/*
*
*      Filename: cplusplus11.cc
*
*        Author: Haibo Hao
*        Email : haohaibo01@gmail.com
*   Description: ---
*        Create: 2018-08-06 04:49:02
* Last Modified: 2018-08-06 04:49:02
**/

#include <cstdio>
#include <iostream>

#if __cplusplus <= 201103L
#define VERSION 1.0
#else
#define VERSION 2.0
#endif

int main() {
  std::cout << VERSION << std::endl;
  return 0;
}
