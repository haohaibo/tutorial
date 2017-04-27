#include <iostream>
#include <stdio.h>
using namespace std;

int main()
{
    string number;
    cin >> number;
    double negative = 0, even = 1;
    int size, two_count = 0;
    
    if(number[0] == '-')
    {
        negative = 0.5;
        size = number.size() - 1;
    }else
    {
        size = number.size();
    }

    if((number[number.size() -1] - '0')%2 == 0)
    {
        even = 2;
    }

    for(int i = 0; i < number.size(); ++i)
    {
        if(number[i] == '2')
        {
            ++two_count;
        }

    }  
    double result = ((double)two_count/(size))*(1 + negative)*even*100;
    printf("%.2f%%\n",result);
    return 0;
}
