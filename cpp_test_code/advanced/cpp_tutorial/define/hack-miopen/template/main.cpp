/*
*
*      Filename: main.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-28 00:08:30
* Last Modified: 2017-09-02 14:42:42
**/
#include <iostream>
#include <vector>
#include "set_abcw.hpp"

int main(int argc, char* argv[]) {
  double d;
  float s;
  MIOpenGEMM::setabcw::test<double>(d);
  MIOpenGEMM::setabcw::test<float>(s);

  MIOpenGEMM::setabcw::print<double>();
  MIOpenGEMM::setabcw::print<float>();

  std::vector<float> a;
  std::vector<float> b;
  std::vector<float> c;

  MIOpenGEMM::setabcw::set_multigeom_abc<float>(a, b, c);
  return 0;
}
