#include <stdio.h>
#include <stdlib.h>
#include <iostream>

using namespace std;

long fact(int n) {
  int sum = 1;
  while (n >= 1) {
    sum *= n;
    --n;
  }
  return sum;
}

int main() {
  int N;
  scanf("%d", &N);
  long sum = 0;
  while (N >= 1) {
    sum += fact(N);
    --N;
  }
  printf("%ld\n", sum);
  return 0;
}
