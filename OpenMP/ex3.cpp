#include <iostream>
#include "omp.h"
using namespace std;
int main(int argc, char **argv) {
  int n = 10000;
  int sum = 0;
  omp_set_num_threads(4);
#pragma omp parallel
  {
#pragma omp for reduction(+ : sum)
    for (int i = 0; i < n; i++) {
      { sum += 1; }
    }
  }
  cout << " sum = " << sum << endl;
}
