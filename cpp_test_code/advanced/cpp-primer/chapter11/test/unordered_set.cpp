/*
*
*      Filename: unordered_set.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-07-04 21:38:19
* Last Modified: 2017-07-04 21:45:57
**/
#include <iostream>
#include <unordered_set>

struct myHash
{
    size_t operator() (std::pair<int, int> __val) const
    {
        return static_cast<size_t>(__val.second*101 + __val.first);
    }
};
int main(int argc, char* argv[])
{
    std::unordered_set<std::pair<int, int>, myHash> S;
    int x, y;
    while(std::cin >> x >> y)
    {
        S.insert(std::make_pair(x, y));
    }

    for(auto it = S.begin(); it != S.end(); ++it)
    {
        std::cout << it->first << ", " << it->second << std::endl;
    }
    return 0;
}

