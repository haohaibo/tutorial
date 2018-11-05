/*
*
*      Filename: L1-032.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-05-21 00:35:30
* Last Modified: 2017-05-21 01:15:36
**/
#include <stdio.h>
#include <string.h>
#include <algorithm>
#include <iostream>
#include <string>
using namespace std;

int main() {
  int N;
  char ch;
  string ori_str, pad_str;
  scanf("%d %c", &N, &ch);
  getchar();
  getline(cin, ori_str);
  if (ori_str.size() < N) {
    string temp_str(N - ori_str.size(), ch);
    pad_str = temp_str + ori_str;
    cout << pad_str << endl;
  } else {
    string temp_str = ori_str.substr(ori_str.size() - N, N);
    pad_str = temp_str;
    cout << pad_str << endl;
  }
  return 0;
}
