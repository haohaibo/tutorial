/*
*
*      Filename: proj3_2_8.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-11 09:47:39
* Last Modified: 2017-04-11 09:47:39
**/
#include <iostream>
#include <string>
#include <cctype>
using std::string;
using std::cin;
using std::cout;
using std::endl;

int main()
{
    string s("Haibo, Hao!!!!");
    string::size_type punct_cnt = 0;
    for(string::size_type index = 0; index != s.size(); ++index)
    {
        if(ispunct(s[index]))
        {
            ++punct_cnt;
        }
    }
    cout << punct_cnt
         << " punctuation characters in "
         << s << endl;

    // convert s to lowercase
    for(string::size_type index = 0; index != s.size(); ++index)
    {
        s[index] = tolower(s[index]);
    }
    cout << s << endl;
    return 0;
    
}

