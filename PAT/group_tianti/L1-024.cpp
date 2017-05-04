/*
*
*      Filename: L1-024.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-05-04 11:34:25
* Last Modified: 2017-05-04 12:29:41
**/
#include <iostream>
#include <stdio.h>
using namespace std;

int main()
{
    int D;
    scanf("%d",&D);
    printf("%d\n",(D - 1 + 2)%7 + 1);
    return 0;
}

