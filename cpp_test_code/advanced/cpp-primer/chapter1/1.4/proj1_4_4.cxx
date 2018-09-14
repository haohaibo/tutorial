/*
*
*      Filename: proj1_4_4.cxx
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-08 12:03:25
* Last Modified: 2017-04-08 12:03:25
**/
#include <iostream>
int main()
{
    int sum = 0, value;
    // read till end-of-file, calculating a running total of all values read
    while(std::cin >> value)
        sum += value; //equivalent to sum = sum + value
    std::cout << "Sum is: " << sum << std::endl;
    return 0;
}

