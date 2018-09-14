/*
*
*      Filename: 11.1.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-07-04 07:08:43
* Last Modified: 2017-07-04 07:19:42
**/
#include <iostream>
#include <map>
#include <string>

int main(int argc, char* argv[])
{
    // 
    std::map<std::string, size_t> word_count;
    std::string word;
    while(std::cin >> word)
    {
        ++word_count[word];
    }
    for(const auto &w : word_count)
    {
        std::cout << w.first << " occurs " << w.second
            << ((w.second > 1)? " times":" time") << std::endl;
    }
    std::cout << "test" << std::endl;
    return 0;
}

