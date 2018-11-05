#include <omp.h>
#include <stdio.h>
#include <iostream>

int main(int argc, char** argv) {
  printf("Masterthread started\n");
#pragma omp parallel
  { printf("Hello, OpenMP\n"); }

  printf("Masterthread ended\n");
  return (0);
}
