/*
*
*      Filename: proj1_4_2.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-07 20:55:15
* Last Modified: 2017-04-07 20:58:34
**/
#include <iostream>

int main()
{
    int sum = 0;
    // sum values from 1 up to 10 inclusive
    for(int val = 0; val <= 10; ++val)
    {
        sum += val; // equivalent to sum = sum + val
    }
    std::cout << "Sum of 1 to 10 inclusvie is "
              << sum << std::endl;
    return 0;
}

