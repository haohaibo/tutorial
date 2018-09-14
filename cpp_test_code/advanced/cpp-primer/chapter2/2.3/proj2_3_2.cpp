/*
*
*      Filename: proj2_3_2.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-09 10:33:08
* Last Modified: 2017-04-09 12:54:46
**/
#include <iostream>
int main()
{
    // local objects of type int 
    int value = 2;
    int pow = 10;
    int result = 1;
    // repeat calculation of result until count is equal to pow
    for (int count = 0; count != pow; ++count)
    {
        result *= value; 
    }
    std::cout << value 
              << " raised to the power of "
              << pow << ": \t"
              << result << std::endl;
    return 0;
}

