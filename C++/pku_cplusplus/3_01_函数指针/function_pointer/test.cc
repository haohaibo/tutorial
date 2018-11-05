/*
* Author: Haibo Hao
* Email : haohaibo@ncic.ac.cn
* Copyright (C) 2017 NCIC
**/

#include <stdio.h>

void PrintMin(int a, int b) {
  if (a < b)
    printf("%d\n", a);
  else
    printf("%d\n", b);
}

int main() {
  // define a function pointer
  void (*pf)(int, int);
  int x = 4, y = 5;
  pf = PrintMin;
  pf(x, y);
  return 0;
}
