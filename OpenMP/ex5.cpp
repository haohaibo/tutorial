#include <iostream>
#include <stdio.h>
#include <omp.h>
#include <time.h>

using namespace std;

int main(int argc, char ** argv)
{

    double for1_start, for1_end;
    double for2_start, for2_end;
	//set the number of threads, in general, the number 
	//of threads set up not more than the number of CPU cores
//	omp_set_num_threads(32);   
	

    long n = 220000;
    long sum1 = 0;
    long sum2 = 0;


    double sum_time_for1 = 0;
    double sum_time_for2 = 0;
    
    for2_start = omp_get_wtime();

//#pragma omp parallel
 //   {
//#pragma omp for reduction(+:sum2)
	    for(long i=0;i<n;i++)
	    {
		    sum2 += 1;
	    }
//    }
    for2_end = omp_get_wtime();
    sum_time_for2 = (double)(for2_end - for2_start);
    printf("sum_time_for2 = %f secs\n",sum_time_for2);
    printf("sum2 = %ld\n",sum2);
    
}
