/*
*
*      Filename: proj3_3_2.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-11 15:17:24
* Last Modified: 2017-04-11 15:17:24
**/
#include <iostream>
#include <vector>
#include <string>
using std::string;
using std::vector;
using std::cin;
using std::cout;
using std::endl;

int main()
{
    // read words from the standard input and
    // store them as elements in a vector
    string word;
    vector<string> text;
    while(cin >> word)
    {
        text.push_back(word);
    }
    cout << text.size() << endl;
    
    for(vector<string>::size_type index = 0; index != text.size(); ++index)
    {
        cout << text[index] << endl;
    }
    return 0;
}

