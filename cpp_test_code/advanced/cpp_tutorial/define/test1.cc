/*
*
*      Filename: test1.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-12 20:54:12
* Last Modified: 2017-08-12 20:54:12
**/
#include <stdio.h>
#include <stdlib.h>
#include <iostream>

#define A
#define B

#define FATAL(msg)                                  \
  {                                                 \
    std::cerr << "[!FATAL!]  " << msg << std::endl; \
    exit(EXIT_FAILURE);                             \
  }                                                 \
  while (0)
#define INFO(msg) std::cout << "[INFO]  " << msg << std::endl;

int main() {
#ifdef A
  std::cout << "define A" << std::endl;
#ifdef B
  std::cout << "define B" << std::endl;
  int a = 9;
  std::cout << a << std::endl;
#endif
  std::cout << "check" << std::endl;

#endif

#if 1
  std::cout << "check 233" << std::endl;
#if 0 

        std::cout << "check ..."<<std::endl;
#endif

#endif

  INFO("OK");
  FATAL("ERROR");
}
