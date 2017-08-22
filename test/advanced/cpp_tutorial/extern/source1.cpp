/*
*
*      Filename: source1.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-22 09:57:08
* Last Modified: 2017-08-22 10:13:56
**/

#include "header.h"

// it needs to be defined somewhere
int global_x;

int main(int argc, char* argv[]){

    // set global_x here
    global_x = 9;
    print_global_x();

    return 0;
}
