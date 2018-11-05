/*
*
*      Filename: runtime_error.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-21 21:15:37
* Last Modified: 2017-08-21 21:21:57
**/
#include <iostream>
#include <stdexcept>

// ref:
// https://stackoverflow.com/questions/1569726/difference-stdruntime-error-vs-stdexception

int main(int argc, char* argv[]) {
  int badThingHappened = 1;

  try {
    if (badThingHappened) {
      throw std::runtime_error("Something Bad happened here");
    }
  } catch (std::exception const& e) {
    std::cout << "Exception: " << e.what() << std::endl;
  }

  return 0;
}
