/*
*
*      Filename: proj2_5.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-09 19:11:22
* Last Modified: 2017-04-09 19:11:22
**/
#include <iostream>
int main()
{
    int ival = 1024;
    int &refVal = ival; // ok: refVal refers to ival
    //int &refVal2;       // error: a reference must be initialized
    //int &refVal3 = 10;  // error: initializer must be an object 
    refVal += 2;
    std::cout << "refVal = " <<refVal << std::endl;
    int ii = refVal;
    std::cout << "ii = " << ii << std::endl; 

    refVal = 6;
    std::cout << "refVal = " <<refVal << std::endl;

    const int data = 1024;
    const int &refData = data; // ok: both reference and object are const
    std::cout << "refData = " << refData << std::endl;
    //int &refData2 = data;      // error: noncosnt reference to a const object 

    int i = 42;
    // legal for const reference only
    const int &r = 42;
    const int &r2 = r + i;

    return 0;
}

