/*
*
*      Filename: pure_virtual_function_2.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-09-03 21:29:03
* Last Modified: 2017-09-03 21:45:28
**/

#include <iostream>
#include <cstdio>

namespace ns {
    class Base {
        public :
            virtual void Vfunc() = 0;
            int x;
    };
    //void Base::Vfunc(){
    //    x = 3;
    //    std::cout << x << std::endl;
    //}

    class Derived : public Base {
        public :
            void Vfunc(){
                //Base::Vfunc();
                x = 4;
                std::cout << "in Derived" << std::endl;
                std::cout << x << std::endl;
            }
    };

}
int main(int argc, char* argv[]){

    // invalid new-expression of abstract class type ‘ns::Base’
    //ns::Base* pb = new ns::Base;
    
    ns::Base* pb = new ns::Derived;
    pb->Vfunc();
    delete pb;

    return 0;
}
