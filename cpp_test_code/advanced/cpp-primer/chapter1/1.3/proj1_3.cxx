/*
*
*      Filename: proj1_3.cxx
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-07 19:09:37
* Last Modified: 2017-04-07 19:09:37
**/
#include <iostream>
/* Simple main function : Read two numbers and write their sum*/
int main()
{
    //prompt user to enter two numbers
    /*
     * 简单主函数：
     * 读取两个数，求它们的和
     */
    std::cout << "Enter two numbers:" << std::endl;
    int v1, v2; //uninitialized
    std::cin >> v1 >> v2; // read input
    int sum = 0;
    sum = v1 + v2;
    std::cout << "v1 + v2 = "
              << v1 + v2 
              << std::endl;
    return 0;
}

