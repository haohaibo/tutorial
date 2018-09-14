/*
* Author: Haibo Hao
* Email : haohaibo@ncic.ac.cn
* Copyright (C) 2017 NCIC
**/

#include <iostream>
#include <fstream>
#include <sstream>

int main(){

    std::ifstream file("test_file.txt");
    char arr[10];
    //file.read(arr,10);
    // tellg 返回内置指针当前的位置
    //std::cout << file.tellg() << std::endl;
    std::cout << std::string::size_type(file.tellg()) << std::endl;
    file.close();

    // 
    std::ostringstream out;
    out << "testing..." << std::endl;
    std::cout << out.str() << std::endl;
    return 0;
}
