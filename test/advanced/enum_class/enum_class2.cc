/*
*
*      Filename: enum_class2.cc
*
*        Author: Haibo Hao
*        Email : haohaibo01@gmail.com
*   Description: ---
*        Create: 2018-08-06 19:38:51
* Last Modified: 2018-08-06 19:38:51
**/

#include <iostream>
#include <cstdio>


enum class EnumClass : int // set size of enum
{
    Zero, One, Two, Three, Four
};

union Union // This will allow us to convert
{
    EnumClass ec;
    int i;
};

int main(){
    using namespace std;

    // Convert from strongly typed enum to int
    Union un;
    un.ec = EnumClass::Three;

    cout << "un.i = " << un.i << endl;


    // Convert from int to strongly typed enum
    Union un2;
    un2.i = 0;
    if( un2.ec == EnumClass::Zero){
        cout << "true" << endl;
    }
    
    return 0;
}
