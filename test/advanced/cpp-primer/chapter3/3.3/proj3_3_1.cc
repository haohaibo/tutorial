/*
*
*      Filename: proj3_3_1.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-11 11:14:52
* Last Modified: 2017-04-11 11:14:52
**/
#include <iostream>
#include <string>
#include <vector>
using std::string;
using std::vector;
using std::cin;
using std::cout;
using std::endl;
int main()
{
   vector<int> ivec1;
   vector<int> ivec2(ivec1); // ok: copy elements of ivect1 into ivect2
   //vector<string> svec(ivec1);
   vector<int> ivec4(10, -1); // 10 elements, each initialized to -1
   vector<string> svec(10, "hi"); // 10 elements, each initialized to "hi"

   vector<int> fvec(10); // 10 elements, each initialized to 0
   vector<string> strvec(10); // 10 elements, each an empty string

   return 0;
}

