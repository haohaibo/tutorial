/*
*
*      Filename: L1-008.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-27 00:09:00
* Last Modified: 2017-04-27 00:09:00
**/
#include <iostream>
#include <stdio.h>

using namespace std;

int main(int argc, char* argv[])
{
    int A,B;
    scanf("%d",&A);
    scanf("%d",&B);
    int count = 0;
    int sum = 0;
    for(int i = A; i <= B; ++i)
    {
        sum += i;
        printf("%5d",i);
        ++count;

        if(count < 5 && i == B)
        {
            printf("\n");
        }

        if(count == 5)
        {
            printf("\n");
            count = 0;
        }
    }
    printf("Sum = %d\n",sum);
    return 0;
}

