/*
*
*      Filename: test1.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-08-10 04:30:33
* Last Modified: 2017-08-10 04:37:57
**/
#include <iostream>
using namespace std;

void fun(int a,...)
{
    int *temp = &a;
    temp++;
    for(int i=0;i<a;++i)
    {
        cout << *temp << endl;
        ++temp;
    }
}
int main()
{
    int a = 1;
    int b = 2;
    int c = 3;
    int d = 4;
    fun(4,a,b,c,d);
    return 0;
}
