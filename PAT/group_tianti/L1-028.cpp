/*
*
*      Filename: L1-028.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-05-06 00:31:03
* Last Modified: 2017-05-06 01:02:25
**/
#include <math.h>
#include <stdio.h>
#include <iostream>
using namespace std;
int main() {
  int N;
  scanf("%d", &N);
  int num;
  bool prime = true;
  while (--N >= 0) {
    prime = true;
    scanf("%d", &num);
    if (num == 1) {
      printf("No\n");
      continue;
    }
    if (num == 2) {
      printf("Yes\n");
      continue;
    }
    for (int i = 2; i <= sqrt(num); ++i) {
      // printf("%d",num%i);
      if ((num % i) == 0) {
        prime = false;
        break;
      }
    }
    if (prime == true) {
      printf("Yes\n");
    } else {
      printf("No\n");
    }
  }
  return 0;
}
