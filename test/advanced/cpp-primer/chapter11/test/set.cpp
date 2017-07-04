/*
*
*      Filename: set.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-07-04 23:36:16
* Last Modified: 2017-07-04 23:43:02
**/
#include <iostream>
#include <set>

int main(int argc, char* argv[])
{
    std::set<int> s1;
    std::set<int , std::greater<int> > s2;

    for(int i = 1; i < 6; ++i)
    {
        s1.insert(i);
        s2.insert(i);
    }

    std::set<int>::const_iterator it = s1.begin();
    for(; it != s1.end(); ++it)
    {
        std::cout << *it << std::endl;
    }
    it = s2.begin();
    for(; it != s2.end(); ++it)
    {
        std::cout << *it << std::endl;
    }
    return 0;
}

