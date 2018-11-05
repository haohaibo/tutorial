/*
*
*      Filename: enum_class.cc
*
*        Author: Haibo Hao
*        Email : haohaibo01@gmail.com
*   Description: ---
*        Create: 2018-08-06 08:08:45
* Last Modified: 2018-08-06 08:08:45
**/
#include <cstdio>
#include <iostream>

enum Direction { TOP_LEFT, TOP_RIGHT, BOTTOM_LEFT, BOTTOM_RIGHT };

// enum WindowsCorner {TOP_LEFT, TOP_RIGHT, BOTTOM_LEFT, BOTTOM_RIGHT};

enum class Color { red, green, blue };

int main() {
  // enum Direction dir = 1;
  // std::cout << dir << std::endl;

  auto green = false;
  std::cout << green << std::endl;

  return 0;
}
