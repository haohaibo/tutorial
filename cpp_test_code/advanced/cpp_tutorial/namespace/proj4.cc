/*
*
*      Filename: proj4.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-07-27 01:16:31
* Last Modified: 2017-07-27 01:16:31
**/
#include <iostream>
using namespace std;
namespace first_space{
    void func(){
       cout << "Inside first_space" << endl; 
    }

    namespace seconde_space{
        void func(){
            cout << "Inside seconde_space" << endl;
        }
    }

}

using namespace first_space;
int main()
{
    func();
    cout << "---------" << endl;
    seconde_space::func();
    return 0;
}
