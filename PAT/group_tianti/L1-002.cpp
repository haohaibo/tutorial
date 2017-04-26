/*
 *
 *      Filename: L1-002.cpp
 *
 *        Author: Haibo Hao
 *        Email : haohaibo@ncic.ac.cn
 *   Description: ---
 *        Create: 2017-04-26 00:46:18
 **/
#include <iostream>
#include <string>
#include <stdio.h>
#include <algorithm>
using namespace std;
int main()
{
    int N;
    char ch;
    scanf("%d %c",&N,&ch);
    if(N<=0)
    {
        // do nothing
    }else 
    {
        if((N < 6) && (N > 0))
        {
            printf("%c\n",ch);
            printf("%d\n",N-1);
        }else
        {
            int i=0;
            while(true)
            {
                if(((6+2*(i-1))*i) <= N-1)
                {
                    ++i;
                }else
                {
                    break;
                }
            }
            --i;
            int An,n;
            n = i;
            for(int j = n, p = 0; j >= 0 ; --j, ++p)
            {
                for(int temp = 0; temp < (n-j); ++temp)
                {
                    printf(" ");
                }
                for(int k = 0; k < (2*j + 1); ++k)
                {
                    printf("%c",ch);
                }
                printf("\n");
            }
            for(int j = 1; j <= n; ++j)
            {
                for(int temp = 0; temp < (n-j); ++temp)
                {
                    printf(" ");
                }
                for(int k = 0; k < (2*j + 1); ++k)
                {
                    printf("%c",ch);
                }
                printf("\n");
            }
            printf("%d\n",N - (4 + 2*n)*n - 1);
        }

    }
    return 0;
}


