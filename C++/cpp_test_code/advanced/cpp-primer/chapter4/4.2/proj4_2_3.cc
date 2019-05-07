/*
*
*      Filename: proj4_2_3.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-12 16:25:11
* Last Modified: 2017-04-12 16:25:11
**/
#include <iostream>
#include <string>
using std::string;
using std::cin;
using std::cout;
using std::endl;

int main() {
  string s("haohaibo");
  string *sp = &s;
  cout << *sp << endl;

  *sp = "goodbye";  // contents of s now changed
  cout << s << endl;

  string s2 = "some value";
  sp = &s2;  //
  cout << *sp << endl;

  int ival = 1024;
  int *pi = &ival;
  int **ppi = &pi;
  int *pi2 = *ppi;

  cout << "The value of ival\n"
       << "direct value: " << ival << "\n"
       << "indirect value: " << *pi << "\n"
       << "yet anthor indirect value: " << *pi2 << "\n"
       << "double indirect value: " << **ppi << endl;
  return 0;
}
