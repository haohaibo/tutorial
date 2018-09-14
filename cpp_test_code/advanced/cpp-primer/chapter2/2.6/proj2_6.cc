/*
*
*      Filename: proj2_6.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-09 19:32:42
* Last Modified: 2017-04-09 19:32:42
**/
#include <iostream>
typedef double wages;
typedef int exam_score;
typedef wages salary;
int main()
{
   wages hourly, weekly;
   hourly  = 4.3;
   weekly  =2.9;
   exam_score test_result;
   test_result = 99;
   std::cout <<"hourly = " << hourly << "\n"
             << "weekly = " << weekly << "\n"
             << "test_result = " << test_result << "\n";
   return 0;
}

