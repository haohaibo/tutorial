#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <iostream>
using namespace std;
int main() {
  int n;
  scanf("%d", &n);
  printf("2^%d = %d\n", n, (int)(pow(2, n)));
  return 0;
}
