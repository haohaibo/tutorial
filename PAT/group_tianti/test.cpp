#include <iostream>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
using namespace std;
int main(int argc, char* argv[])
{
    int x = 2, y = 31;
    long max;
    max = pow(x,y) - 1;
    long fact = 1;
    int fact_num =13, i = 13;
    while(i>=1)
    {
        fact *= i;
        --i;
    }
    cout << "fact(" << fact_num << ") is \n" << fact << endl; 
    cout << max << endl; 
    return 0;
}
