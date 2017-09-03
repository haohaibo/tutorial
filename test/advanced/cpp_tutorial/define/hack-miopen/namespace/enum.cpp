/*
 *
 *      Filename: enum.cpp
 *
 *        Author: Haibo Hao
 *        Email : haohaibo@ncic.ac.cn
 *   Description: ---
 *        Create: 2017-09-03 18:30:07
* Last Modified: 2017-09-03 18:41:26
 **/
#include <iostream>
#include <vector>

namespace ns {
    namespace nsHP {
        enum eChiral {
            MIC = 0,
            PAD,
            PLU,
            LIW,
            MIW,
            WOS,
            nChiralHP
        };
    }
}

int main(int argc, char* argv[]){
    std::cout << ns::nsHP::MIC << std::endl;
    std::cout << ns::nsHP::nChiralHP << std::endl;

    // 仅于c++11及之后允许
    // ref: http://zh.cppreference.com/w/cpp/language/enum
    std::cout << ns::nsHP::eChiral::nChiralHP << std::endl;
}

