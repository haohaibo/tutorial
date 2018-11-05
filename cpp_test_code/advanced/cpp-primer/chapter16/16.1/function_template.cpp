/*
 * Author: Haibo Hao
 * Date  : 2017.4.3
 * Email : haohaibo@ncic.ac.cn
 * */
#include <iostream>
using namespace std;

// implement strcmp-like generic compare function
// return 0 if the values are equal, 1 is v1 is larger,
//-1 id v1 is smaller
template <typename T>
inline int compare(const T &v1, const T &v2) {
  if (v1 < v2) {
    return -1;
  } else {
    if (v1 == v2) {
      return 0;
    } else {
      return 1;
    }
  }
}

int main(int argc, char **argv) {
  // T is int
  // compiler instantiates int compare(const int&, const int&)
  cout << compare(1, 0) << endl;

  // T is string
  // compiler instantiates int compare(const string&, const string&)
  string s1 = "Haibo", s2 = "Hao";
  cout << compare(s1, s2) << endl;
  return 0;
}
