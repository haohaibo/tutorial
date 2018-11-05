/*
 *
 *      Filename: L1-027.cpp
 *
 *        Author: Haibo Hao
 *        Email : haohaibo@ncic.ac.cn
 *   Description: ---
 *        Create: 2017-05-04 17:01:16
* Last Modified: 2017-05-04 17:39:28
 **/
#include <memory.h>
#include <stdio.h>
#include <iostream>
using namespace std;

int main() {
  bool flag[10];
  memset(flag, false, 10);
  string phone_number;
  int count = 0;
  cin >> phone_number;
  for (int i = 0; i < phone_number.size(); ++i) {
    if (flag[phone_number[i] - '0'] == false) {
      flag[phone_number[i] - '0'] = true;
      ++count;
    }
  }

  int *arr;
  arr = (int *)malloc(count * sizeof(int));
  cout << "int[] arr = new int[]{";
  int temp = 0;
  for (int i = 9; i >= 0; --i) {
    if (temp == 0) {
      if (flag[i] == true) {
        printf("%d", i);
        arr[temp] = i;
        ++temp;
      }
    } else {
      if (flag[i] == true) {
        printf(",%d", i);
        arr[temp] = i;
        ++temp;
      }
    }
  }
  printf("};\n");

  cout << "int[] index = new int[]{";
  for (int i = 0; i < phone_number.size(); ++i) {
    for (int j = 0; j < count; ++j) {
      if (arr[j] == (phone_number[i] - '0')) {
        if (i == 0) {
          printf("%d", j);
        } else {
          printf(",%d", j);
        }
        break;
      }
    }
  }
  printf("};\n");
  return 0;
}
