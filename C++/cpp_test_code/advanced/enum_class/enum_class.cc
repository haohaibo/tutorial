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

enum class ALGO : int { kNVALID_ALOG = int(10) };

std::ostream &operator<<(std::ostream &os, const ALGO &obj) {
  os << static_cast<std::underlying_type<ALGO>::type>(obj);
  return os;
}

int main() {
  // enum Direction dir = 1;
  // std::cout << dir << std::endl;

  auto green = false;
  std::cout << green << std::endl;

  ALGO algo;
  algo = ALGO(2);
  std::cout << "ALGO : " << std::endl;
  std::cout << algo << std::endl;

  return 0;
}
