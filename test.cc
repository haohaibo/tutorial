#include <memory.h>
#include <cassert>
#include <cstdio>
#include <cstdlib>
#include <iostream>

#define NUM 100

int main() {
  int *ip;
  ip = (int *)malloc(NUM * sizeof(int));
  std::cout << sizeof(ip) << std::endl;
  std::cout << sizeof(long long) << std::endl;
  assert(1);
  // assert(0);

  return 0;
}
