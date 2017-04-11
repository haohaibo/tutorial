/*
*
*      Filename: proj3_2_4.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-10 21:06:48
* Last Modified: 2017-04-10 21:06:48
**/
#include <iostream>
#include <string>
using std::string;
using std::cin;
using std::cout;
using std::endl;

int main()
{
    string big = "big", small = "small";
    string s1 = big; // s1 is a copy of big
    if(big == small)
    {
        cout << big << " is equal to " << small << endl;
    }
    if(big <= s1)
    {
        cout << big << " is less than or equal to " << s1 << endl;
    }
    
    // st1 is an empty string, st2 is a copy of the literal
    string st1, st2 = "The expense of spirit";
    st1 = st2; // replace st1 by a copy of st2
    cout << st1 << endl;

    return 0;
}

