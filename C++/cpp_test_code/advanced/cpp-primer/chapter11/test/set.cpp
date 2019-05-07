/*
*
*      Filename: set.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-07-04 23:36:16
* Last Modified: 2017-07-05 00:24:40
**/
#include <iostream>
#include <set>
#include <unordered_set>

int main(int argc, char* argv[]) {
  std::set<int> s1;
  std::set<int, std::greater<int> > s2;
  std::unordered_set<int> s3;
  for (int i = 1; i < 6; ++i) {
    s1.insert(i);
    s2.insert(i);
    s3.insert(i);
  }

  std::set<int>::const_iterator it = s1.begin();
  for (; it != s1.end(); ++it) {
    std::cout << *it << std::endl;
  }
  it = s2.begin();
  for (; it != s2.end(); ++it) {
    std::cout << *it << std::endl;
  }

  std::unordered_set<int>::const_iterator uit = s3.begin();
  for (; uit != s3.end(); ++uit) {
    std::cout << *uit << std::endl;
  }
  return 0;
}
