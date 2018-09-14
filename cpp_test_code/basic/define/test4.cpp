#include <iostream>
using namespace std;

#define Fun(x, a, b) \
if(x)\
    x=a + b;\
else\
    x = a - b

int main(int argc, char** argv)
{
    int p1 = 3, p2 = 5, p3 = 10;
    Fun(p1, p2, p3); 
    cout << p1 << endl;
    return 0;
}
