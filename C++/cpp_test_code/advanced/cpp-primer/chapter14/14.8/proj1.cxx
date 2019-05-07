/*
 * Author: Haibo Hao
 * Date  : 2017.4.5
 * Email : haohaibo@ncic.ac.cn
 * */
#include <iostream>
using namespace std;

struct absInt {
  int operator()(int val) { return val < 0 ? -val : val; }
};
int main(int argc, char* argv) {
  int i = -42;
  absInt absObj;                // object that defines function call operator
  unsigned int ui = absObj(i);  // calls absInt::Operator(int)
  cout << "ui = " << ui << endl;
  return 0;
}
