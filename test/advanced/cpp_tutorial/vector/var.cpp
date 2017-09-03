/*
*
*      Filename: var.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-09-03 10:40:09
* Last Modified: 2017-09-03 10:44:37
**/
#include <iostream>
#include <cstdio>
#include <vector>

int main(int argc, char* argv[]){
    std::vector<int> p = {1, 2, 3};
    std::vector<int> (q) = {3, 4, 6};
    
    for(auto ele : p){
        std::cout << ele << std::endl;
    }
    std::cout << std::endl;
    for(auto ele : q){
        std::cout << ele << std::endl;
    }
}

