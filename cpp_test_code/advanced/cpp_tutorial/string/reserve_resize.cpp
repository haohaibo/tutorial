/*
*
*      Filename: reserve.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-21 16:48:07
* Last Modified: 2017-08-21 17:09:43
**/
#include <iostream>
#include <string>
#include <cstdio>

// ref: http://blog.csdn.net/freecloud_insky/article/details/47058597

int main(int argc, char* argv[]){
    std::string str = "readon";
    std::cout << "size " << str.size() << std::endl;
    std::cout << "capacity " << str.capacity() << std::endl;
    // reserve为容器预留足够的空间，避免不必要的重复分配,
    // 分配空间>=函数的参数，影响capacity
    str.reserve(30);
    std::cout << "capacity " << str.capacity() << std::endl;

    // resize调整容器中有效数据区域的大小，如果尺寸变小，原来数据多余的截掉。
    // 若尺寸变大，不够的数据用该函数第二个参数填充，影响size
    str.resize(3);
    std::cout << str << std::endl;
    std::cout << "size " << str.size() << std::endl;
    std::cout << "capacity " << str.capacity() << std::endl;

    str.resize(10,'a');
    std::cout << str << std::endl;
    std::cout << "size " << str.size() << std::endl;
    std::cout << "capacity " << str.capacity() << std::endl;

    return 0;
}

