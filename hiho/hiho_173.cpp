/*
 *
 *      Filename: hiho_173.cpp
 *
 *        Author: Haibo Hao
 *        Email : haohaibo@ncic.ac.cn
 *   Description: ---
 *        Create: 2017-10-28 00:49:45
* Last Modified: 2017-10-28 00:50:35
 **/
#include <algorithm>
#include <cstdio>
#include <iostream>

using namespace std;
int main() {
  int n;
  cin >> n;
  int s[n], prefixsum[n];
  int psum = 0;

  for (int i = 0; i < n; ++i) {
    cin >> s[i];
    psum += s[i];
    prefixsum[i] = psum;
  }
  int f[n][n];

  for (int i = 0; i < n; ++i) {
    f[i][i] = s[i];
  }

  for (int l = 2; l <= n; ++l) {
    for (int i = 0; i < n - l + 1; ++i) {
      int j = i + l - 1;

      f[i][j] = max(prefixsum[j] - prefixsum[i - 1] - f[i + 1][j],
                    prefixsum[j] - prefixsum[i - 1] - f[i][j - 1]);
    }
  }

  cout << f[0][n - 1] << endl;
}
