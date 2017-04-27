#include <iostream>
#include <stdio.h>
using namespace std;

int main()
{
    int N;
    char C;
    scanf("%d %c",&N,&C);
    int row;
    if((N/2.0 - N/2) >= 0.5)
    {
        row = N/2 + 1;
    }else
    {
        row = N/2;
    }
    for(int i = 0; i < row; ++i)
    {
        for(int j = 0; j < N; ++j)
        {
            printf("%c",C);
        }
        printf("\n");
    }
    return 0;
}
