/*
*
*      Filename: test_hhb.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-13 15:49:54
* Last Modified: 2017-08-13 15:49:54
**/
#include <iostream>
#include <stdio.h>
#include <dirent.h>
//#include <regex>
#include <string>
#include <boost/regex.hpp>

// boost::regex version
// boost regex example
//compile:  g++ -std=c++11  regex_boost.cc -lboost_regex 
std::vector<std::string> ls_dir(const std::string& dname, const boost::regex& match){
    std::vector<std::string> files;
    struct dirent * entry;
    DIR *dir = opendir(dname.c_str());
    if(dir == NULL){
        return files;
    }

    std::cout << "open dir success" <<std::endl;
    while((entry = readdir(dir)) != NULL){
        std::string fname =(entry->d_name);
        std::cout << "files " << fname << std::endl; 
        if(fname != "." && fname != ".."){
            if(boost::regex_match(fname, match)){
                files.push_back(fname);
            }
        }
    }
}
int main()
{
    std::vector<std::string> files = ls_dir("/sys/class/drm",boost::regex("card\\d+"));
    //std::vector<std::string> files = ls_dir("/home/hhb/work/learn/test/advanced/cpp_tutorial/regex/test",boost::regex("card\\d+"));
    for(std::string cardname : files)
    {
        std::cout << cardname << std::endl;
    }
    return 0;
}
