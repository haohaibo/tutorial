/*
*
*      Filename: main.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-15 20:10:16
* Last Modified: 2017-08-15 20:34:17
**/
#include <cstdio>
#include <cstdlib>
#include <iostream>
#include "test.hpp"

struct input_tensor_fixture {
  int data;
  input_tensor_fixture() { data = 2; }
  input_tensor_fixture(int in_data) : data(in_data) {}

  void run() {
    std::cout << "running input_tensor_fixture" << std::endl;
    std::cout << "data = " << data << std::endl;
  }
};

int main() {
  run_test<input_tensor_fixture>();

  return 0;
}
