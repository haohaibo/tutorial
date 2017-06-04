/*
*
*      Filename: l_ref.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-06-04 15:59:25
* Last Modified: 2017-06-04 16:04:56
**/
#include <iostream>
#include <cassert>
int main()
{
    int var  = 42;
    // Create a reference to var
    int &ref = var; 
    // Original updated bacause of assignment to reference
    ref = 100;   
    assert(var == 100);
    return 0;
}

