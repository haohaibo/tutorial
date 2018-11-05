/*
*
*      Filename: proj3_2_7.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-11 09:27:07
* Last Modified: 2017-04-11 09:27:07
**/
#include <iostream>
#include <string>
using std::cin;
using std::cout;
using std::endl;
using std::string;

int main() {
  string str("some string");
  for (string::size_type index = 0; index != str.size(); ++index) {
    cout << str[index] << endl;
  }

  for (string::size_type index = 0; index != str.size(); ++index) {
    str[index] = '*';
    cout << str[index] << endl;
  }
  return 0;
}
