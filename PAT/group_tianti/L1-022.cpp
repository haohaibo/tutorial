/*
*
*      Filename: L1-022.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-05-04 10:36:10
* Last Modified: 2017-05-04 11:06:19
**/
#include <iostream>
#include <stdio.h>
using namespace std;
int main()
{
    int N;
    scanf("%d",&N);
    int data;
    int even = 0, old = 0;
    while(--N >= 0)
    {
        scanf("%d",&data);
        if(data%2 == 0) // even
        {
            ++even;
        }else
        {
            ++old;
        }
    }
    printf("%d %d\n",old,even);
    return 0;
}

