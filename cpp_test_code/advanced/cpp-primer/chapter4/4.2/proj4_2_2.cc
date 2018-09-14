/*
*
*      Filename: proj4_2_2.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-12 15:58:15
* Last Modified: 2017-04-12 15:58:15
**/
#include <iostream>
#include <cstdlib>
#include <vector>
#include <string>

using std::vector;
using std::string;
using std::cin;
using std::cout;
using std::endl;

int main()
{
    int ival; 
    int zero = 0;
    const int c_ival = 0;
    //int *pi = ival;
    int *pi;
    //pi = zero;
    pi = c_ival;
    pi = 0;

    // cstdlib #defines NULL to 0
    pi = NULL;

    double dval;
    double *pd = &dval; 
    double *pd2 = pd;

    double obj = 3.14;
    double *ptd = &obj;
    void *pv = &obj; // obj can be an object of any type
    pv = ptd;
    return 0;
}

