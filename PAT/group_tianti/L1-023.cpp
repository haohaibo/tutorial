/*
 *
 *      Filename: L1-023.cpp
 *
 *        Author: Haibo Hao
 *        Email : haohaibo@ncic.ac.cn
 *   Description: ---
 *        Create: 2017-05-04 11:06:36
* Last Modified: 2017-05-04 11:29:42
 **/
#include <stdio.h>
#include <iostream>
#include <string>
using namespace std;
int main() {
  string str;
  cin >> str;
  int G = 0, P = 0, L = 0, T = 0;
  for (int i = 0; i < str.size(); ++i) {
    if (str[i] == 'G' || str[i] == 'g') {
      ++G;
    }
    if (str[i] == 'P' || str[i] == 'p') {
      ++P;
    }
    if (str[i] == 'L' || str[i] == 'l') {
      ++L;
    }
    if (str[i] == 'T' || str[i] == 't') {
      ++T;
    }
  }

  while (G > 0 || P > 0 || L > 0 || T > 0) {
    if (G > 0) {
      printf("G");
      --G;
    }
    if (P > 0) {
      printf("P");
      --P;
    }
    if (L > 0) {
      printf("L");
      --L;
    }
    if (T > 0) {
      printf("T");
      --T;
    }
  }
  printf("\n");
  return 0;
}
