/*
*
*      Filename: proj3_2_2.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-10 20:22:32
* Last Modified: 2017-04-10 20:22:32
**/
#include <iostream>
#include <string>

using std::string;
using std::cin;
using std::cout;
using std::endl;
int main() {
  string line;
  // read line at time until end-of-file
  while (getline(cin, line)) {
    cout << line << endl;
  }
  return 0;
}
