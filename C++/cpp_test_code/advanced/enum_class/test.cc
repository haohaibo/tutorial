/*
*
*      Filename: test.cc
*
*        Author: Haibo Hao
*        Email : haohaibo01@gmail.com
*   Description: ---
*        Create: 2018-11-06 19:07:12
* Last Modified: 2018-11-06 19:07:12
**/
#include <iostream>

enum class S
{
    A,
    B,
    C,
    D
};
int main()
{
    S s = S::C;
    switch(s)
    {
        case S::A:
            std::cout << "S::A" << std::endl;
            break;
        case S::B:
            std::cout << "S::B" << std::endl;
            break;
        case S::C:
            std::cout << "S::C" << std::endl;
            break;
        case S::D:
            std::cout << "S::D" << std::endl;
            break;
    }
}

