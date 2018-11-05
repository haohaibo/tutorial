/*
*
*      Filename: main.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-06-01 10:48:32
* Last Modified: 2017-06-01 11:36:48
**/
#include <stdio.h>
#include <iostream>
#include <string>
#include "method.h"
#include "stack.h"

int main() {
  float data1 = 0.3, data2 = 0.6;
  swap<float>(data1, data2);
  std::cout << "data1 = " << data1 << ", data2 = " << data2 << std::endl;

  Stack<int> intStack;
  intStack.push(2);
  intStack.push(4);
  intStack.push(1);

  while (!intStack.isEmpty()) {
    std::cout << "num: " << intStack.pop() << std::endl;
  }
  return 0;
}
