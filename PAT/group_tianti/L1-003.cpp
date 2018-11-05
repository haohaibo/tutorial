/*
*
*      Filename: L1-003.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-26 09:19:30
* Last Modified: 2017-04-26 09:19:30
**/
#include <stdio.h>
#include <string.h>
#include <iostream>
#include <string>

using namespace std;

int main() {
  string str;
  int out[10];
  memset(out, 0, sizeof(out));
  cin >> str;
  char ch;
  int index;
  for (int i = 0; i < str.size(); ++i) {
    ch = str[i];
    index = (int)(ch - '0');
    // cout << index << endl;
    out[index]++;
  }
  for (int i = 0; i < 10; ++i) {
    if (out[i] > 0) {
      printf("%d:%d\n", i, out[i]);
    }
  }
  return 0;
}
