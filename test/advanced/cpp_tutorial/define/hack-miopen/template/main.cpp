/*
*
*      Filename: main.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-28 00:08:30
* Last Modified: 2017-08-28 09:27:33
**/
#include <iostream>
#include "set_abcw.hpp"

int main(int argc, char* argv[])
{
    double d;
    float s;
    MIOpenGEMM::setabcw::test<double>(d);
    MIOpenGEMM::setabcw::test<float>(s);

    MIOpenGEMM::setabcw::print<double>();
    MIOpenGEMM::setabcw::print<float>();
    return 0;
}

