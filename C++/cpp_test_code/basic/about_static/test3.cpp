#include <iostream>
#include <string>
using namespace std;

int main(int argc, char** argv) {
  int k = 10;
  static int acc = 0;
  while (k > 0) {
    acc += 1;
    k--;
  }
  cout << "acc = " << acc << endl;
  return 0;
}
