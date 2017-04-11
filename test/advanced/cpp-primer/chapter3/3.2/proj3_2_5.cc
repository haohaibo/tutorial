/*
*
*      Filename: proj3_2_5.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-10 21:29:01
* Last Modified: 2017-04-10 21:29:01
**/
#include <iostream>
#include <string>
using std::string;
using std::cin;
using std::cout;
using std::endl;

int main()
{
    string s1("hello, ");
    string s2("world\n");

    string s3 = s1 + s2;
    s1 += s2;
    cout << s3 << endl;
    cout << s1 << endl;
    return 0;
}

