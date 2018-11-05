#include <stdio.h>
#include <iostream>
#include <string>
using namespace std;

int main() {
  string A, B;
  getline(cin, A);
  getline(cin, B);
  // cout << A << endl;
  // cout << B << endl;
  for (int i = 0; i < A.size(); ++i) {
    if (B.find(A[i]) != string::npos) {
      A.erase(i, 1);
      --i;
    }
  }
  cout << A << endl;
  return 0;
}
