/*
 *
 *      Filename: proj1.cpp
 *
 *        Author: Haibo Hao
 *        Email : haohaibo@ncic.ac.cn
 *   Description: ---
 *        Create: 2017-05-21 22:27:01
* Last Modified: 2017-05-21 23:20:43
 **/
#include <iostream>
#include <cmath>
#include <vector>
#include <omp.h>

int main( int argc, char* argv[] )
{
    omp_set_num_threads( 8 );

    double pi = acos( -1.0 );

    std::cout << "Allocating memory ..." << std::endl;
    std::vector<double> my_vector( 128000000, 0.0 );
    std::cout << "Done!" << std::endl << std::endl;

    std::cout << "Entering main loop ... " << std::endl;

#pragma omp parallel for
    for( int i=0; i < my_vector.size(); i++ )
    {
        my_vector[i] = exp( -sin( i*i + pi*log(i+1) ) );
    }
    std::cout << "Done!" << std::endl;

    return 0;
}

