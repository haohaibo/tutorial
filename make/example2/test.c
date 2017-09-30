/*
*
*      Filename: test.c
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-09-30 20:03:29
* Last Modified: 2017-09-30 20:03:29
**/
#include <stdio.h>
#include <unistd.h>

int main(int argc, char* argv[]){
    char* tty = ttyname(0);
    printf("tty is %s\n", tty);
    return 0;
}

