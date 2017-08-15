/*
*
*      Filename: main.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-15 20:10:16
* Last Modified: 2017-08-15 20:17:09
**/
#include<iostream>
#include<cstdio>
#include<cstdlib>
#include"test.hpp"

struct input_tensor_fixture
{
    void run()
    {
        std::cout << "running input_tensor_fixture" << std::endl;
    }
};

int main()
{
    run_test<input_tensor_fixture>();

    return 0;
}

