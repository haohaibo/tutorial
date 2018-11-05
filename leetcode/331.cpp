/*
*
*      Filename: 331.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-06-08 22:56:37
* Last Modified: 2017-06-08 23:35:35
**/
#include <stdio.h>
#include <stdlib.h>
#include <algorithm>
#include <iostream>
#include <string>
#include <vector>

int main() {
  std::vector<char> str;
  char ch;
  int diff = 0;
  // get "
  scanf("%c", &ch);

  // get first
  scanf("%c", &ch);
  if (ch == '"') {
    printf("true\n");
    return 0;
  } else {
    if (ch == '#') {
      diff -= 1;
    } else {
      diff += 2;
    }
  }
  while (scanf("%c", &ch)) {
    if (ch == '"') {
      if (diff != 0) {
        printf("false\n");
      } else {
        printf("true\n");
      }
      return 0;
    } else {
      if (ch != '#' && ch != ',') {
        diff += 2;
        diff -= 1;
      } else {
        if (ch == '#') {
          diff -= 1;
        }
      }
    }
  }

  return 0;
}
