/*
*
*      Filename: proj3_2_1.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-10 20:02:11
* Last Modified: 2017-04-10 20:02:11
**/
#include <iostream>
using std::string;
using std::cin;
using std::cout;
using std::endl;
int main()
{
    string word;
    // read until end-of-file, writing each word to a new line
    while(cin >> word)
    {
        cout << word << endl;
    }
    return 0;
}

