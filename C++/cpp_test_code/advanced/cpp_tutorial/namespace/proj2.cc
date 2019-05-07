/*
*
*      Filename: proj1.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-07-27 00:55:09
* Last Modified: 2017-07-27 00:55:09
**/
#include <iostream>
using namespace std;

// first namespace
namespace first_space {
void func() { cout << "Inside first_space" << endl; }
}

namespace second_space {
void func() { cout << "Inside second_space" << endl; }
}

using namespace first_space;
int main() {
  // call func() in first_space
  first_space::func();

  // call func() in second_space
  second_space::func();

  func();
  return 0;
}
