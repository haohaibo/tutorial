/*
* Author: Haibo Hao
* Email : haohaibo@ncic.ac.cn
* Copyright (C) 2017 NCIC
**/

#include <stdio.h>
#include <stdlib.h>
#define NUM 5

int MyCompare(const void *elem1, const void *elem2) {
  unsigned int *p1, *p2;
  p1 = (unsigned int *)elem1;
  p2 = (unsigned int *)elem2;

  return (*p1 % 10) - (*p2 % 10);
}

int main() {
  unsigned int an[NUM] = {8, 1234, 11, 10, 9};
  qsort(an, NUM, sizeof(unsigned int), MyCompare);
  for (int i = 0; i < NUM; ++i) {
    printf("%d ", an[i]);
  }
  printf("\n");
  return 0;
}
