/*
*
*      Filename: source1.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-22 09:57:08
* Last Modified: 2017-12-03 14:18:12
**/

//ref : https://stackoverflow.com/questions/10422034/when-to-use-extern-in-c
#include "header.h"

// it defined here 
int global_x;

int main(int argc, char* argv[]){

    // set global_x here
    global_x = 9;
    print_global_x();

    return 0;
}
