/*
*
*      Filename: proj4_2.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-12 12:24:07
* Last Modified: 2017-04-12 12:24:07
**/
#include <iostream>
#include <vector>
#include <string>

using std::vector;
using std::string;
using std::cin;
using std::cout;
using std::endl;

int main()
{
    string s("haohaibo");
    string *sp = &s;  // sp holds the address of s

    vector<int> *pvec; // pvec can point to a vector<int>
    int *ip1, *ip2;
    string *pstring;
    double *dp;
    
    // 4.2.2 4 指针的可能取值
    int ival = 1024;
    int *pi = 0;        // pi initialized to address no object
    int *pi2 = &ival;   // pi2 initialized to address of ival
    int *pi3;           // ok, but dangerous, pi3 is uninitialized
    pi = pi2;           // pi and pi2 address the same object, e.g. ival
    pi2 = 0;            // pi2 now addresss no oject
    cout << *pi << endl;

    return 0;
}

