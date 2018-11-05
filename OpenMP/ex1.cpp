#include <omp.h>
#include <stdio.h>
#include <time.h>
#include <iostream>

using namespace std;

int main(int argc, char** argv) {
  // set the number of threads, in general, the number
  // of threads set up not more than the number of CPU cores
  omp_set_num_threads(16);

#pragma omp parallel
  {
    // cout << "Hello" << ",I am thread "
    //   <<omp_get_thread_num() << endl;

    printf("I am thread %d\n", omp_get_thread_num());
  }

#pragma omp parallel for
  for (int i = 0; i < 6; i++) {
    printf("i = %d, I am thread %d\n", i, omp_get_thread_num());
  }

  printf("\n\n---------------我是华丽丽的分割线------------------\n\n");
#pragma omp parallel
  {
#pragma omp for
    for (int i = 0; i < 6; i++) {
      printf("i = %d, I am thread %d\n", i, omp_get_thread_num());
    }
  }

  long n = 10000000000;
  long sum1 = 0;
  long sum2 = 0;

  clock_t for1_start, for1_end;
  clock_t for2_start, for2_end;

  double sum_time_for1 = 0;
  double sum_time_for2 = 0;

  for1_start = clock();
#pragma omp parallel
  {
#pragma omp for
    for (long i = 0; i < n; i++) {
#pragma omp critical
      sum1 += 1;
    }
  }

  for1_end = clock();
  sum_time_for1 = (double)(for1_end - for1_start) / CLOCKS_PER_SEC;
  printf("sum_time_for1 = %f secs\n", sum_time_for1);
  printf("sum1 = %ld\n", sum1);
}
