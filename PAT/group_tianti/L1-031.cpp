/*
*
*      Filename: L1-031.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-05-08 00:43:37
* Last Modified: 2017-05-08 01:18:35
**/
#include <math.h>
#include <stdio.h>
#include <algorithm>
#include <iostream>
#include <string>
using namespace std;

int main() {
  int N;
  scanf("%d", &N);
  float H, W, S;
  for (int i = 0; i < N; ++i) {
    scanf("%f", &H);
    scanf("%f", &W);
    W = W / 2.0;
    S = (H - 100) * 0.9;
    if (fabs(S - W) < S * 0.1) {
      printf("You are wan mei!\n");
    } else {
      if (W > S) {
        printf("You are tai pang le!\n");
      } else {
        printf("You are tai shou le!\n");
      }
    }
  }
  return 0;
}
