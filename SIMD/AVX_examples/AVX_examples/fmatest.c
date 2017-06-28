#include <immintrin.h>
#include <stdio.h>

int main() {
  
  __m256d veca = _mm256_setr_pd(6.0, 6.0, 6.0, 6.0);

  __m256d vecb = _mm256_setr_pd(2.0, 2.0, 2.0, 2.0);
  
  __m256d vecc = _mm256_setr_pd(7.0, 7.0, 7.0, 7.0);
  
  /* Alternately subtract and add the third vector
     from the product of the first and second vectors */
  __m256d result = _mm256_fmaddsub_pd(veca, vecb, vecc);
  __m256d result2 = _mm256_fmadd_pd(veca, vecb, vecc);
  
  /* Display the elements of the result vector */
  double* res = (double*)&result;
  printf("%lf %lf %lf %lf\n", res[0], res[1], res[2], res[3]);
  
  double* res2 = (double*)&result2;
  printf("%lf %lf %lf %lf\n", res2[0], res2[1], res2[2], res2[3]);
  return 0;
}
