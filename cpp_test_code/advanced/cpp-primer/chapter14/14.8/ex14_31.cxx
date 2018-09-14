/*
 * Author: Haibo Hao
 * Date  : 2017.4.5
 * Email : haohaibo@ncic.ac.cn
 * */

#include <iostream>
#include <stdlib.h>
using namespace std;

// struct if_then_else
struct if_then_else
{
    int operator() (int p1, int p2, int p3)
    {
        if(p1)
        {
            return p2;
        }else
        {
            return p3;
        }
    }
};

int main(int argc, char** argv)
{
    if_then_else myObj;
    int data1 = atoi(argv[1]);
    int data2 = atoi(argv[2]);
    int data3 = atoi(argv[3]);
    int res = myObj(data1, data2, data3);
    cout << "res = " << res << endl;
    return 0;
}
