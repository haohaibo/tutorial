/*
*
*      Filename: wtime.h
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2018-04-01 11:15:30
* Last Modified: 2018-04-01 11:15:30
**/
#ifdef _OPENMP
#include <omp.h>
#else
#include <sys/time.h>
#endif

double wtime() {
#ifdef _OPENMP
  /* Use omp_get_wtime() if we can*/
  return omp_get_wtime();
#else
  static int sec = -1;
  struct timeval tv;
  gettimeofday(&tv, NULL);
  if (sec < 0) {
    sec = tv.tv_sec;
  }
  return (tv.tv_sec - sec) + 1.0e-6 * tv.tv_usec;
#endif
}
