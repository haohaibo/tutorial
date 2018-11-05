/*
*
*      Filename: proj2_7.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-09 20:10:00
* Last Modified: 2017-04-09 20:10:00
**/
#include <iostream>
// input is 0, output is 1, and append is 2
enum open_modes { input, output, append };

// shape is 1 , sphere is 2, cylinder is 3, polygon is 4
enum Forms { shape = 1, sphere, cylinder, polygon };

// point2d is 2, point2w is 3, point3d is 3, point3w is 4
enum Points { point2d = 2, point2w, point3d = 3, point3w };
int main() {
  std::cout << "intput is " << input << "\n"
            << "output is " << output << "\n"
            << "append is " << append << "\n"
            << std::endl;
  std::cout << "shape is " << shape << "\n"
            << "sphere is " << sphere << "\n"
            << "cylinder is " << cylinder << "\n"
            << "polygon is " << polygon << std::endl;
  Points pt3d = point3d;  // ok: point3d is a Points enumerator
  // Points pt2w = 3;       // error: pt2w initialized with int
  Points pt2w;
  // pt2w = polygon;        // error: polygon is not a Points numerator
  pt2w = pt3d;  // ok: both are ojects of Points enum type

  return 0;
}
