/*
 * Author: Haibo Hao
 * Date  : 2017.4.5
 * Email : haohaibo@ncic.ac.cn
 * */
#include <iostream>
using namespace std;

struct absInt {
    int operator() (int aval)
    {
        return val < 0 ? -val : val;
    }

}
int main(int argc, char* argv)
{

    return 0;
}
