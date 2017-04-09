/*
*
*      Filename: proj2_3_6.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-09 16:47:55
* Last Modified: 2017-04-09 16:53:13
**/
#include <iostream>
#include <string>
/*
 * Program for illustration purpose only:
 * It is bad style for a function to use a global varibal 
 * and then define a local varible with the same name
 * */
std::string s1 = "Hello"; // s1 has global scope
int main()
{
    std::string s2 = "world"; // s2 has local scope
    // uses global s1; 
    std::cout << s1 << " " << s2 << std::endl;

    int s1 = 42; // s1 is local and hides global s1
    std::cout << s1 << " " << s2 << std::endl;
    return 0;
}

