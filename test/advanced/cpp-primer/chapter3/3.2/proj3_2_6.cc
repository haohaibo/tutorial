/*
*
*      Filename: proj3_2.6.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-11 08:49:20
* Last Modified: 2017-04-11 08:49:20
**/
#include <iostream>
#include <string>
using std::string;
using std::cin;
using std::cout;
using std::endl;
int main()
{
    string s1("Haibo");
    string s2("Hao");
    // + 操作数的左右操作数必须至少有一个是string类型
    string s3 = s1 + ", " + s2 + "\n";
    cout << s3 << endl;
    string s4 = s1 + ", " + "hao";
    cout << s4 << endl;
    return 0;
}

