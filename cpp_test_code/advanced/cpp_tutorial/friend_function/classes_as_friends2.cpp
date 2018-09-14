/*
*
*      Filename: classes_as_friends2.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-09-19 23:20:23
* Last Modified: 2017-09-19 23:47:40
**/
#include<iostream>
#include<cstdio>


namespace ns {
    template<class T>
    T max(T a, T b){
        return (T)0;
    }
    class YourOtherClass;

    class YourClass {
        friend YourOtherClass; // Declear a friend class
        public:
            YourClass() : topSecret(0) {}
            void printMember() {
                std::cout << topSecret << std::endl;
            }
        private:
            int topSecret;
    };
    
    class YourOtherClass {
        public:
            void change(YourClass& yc, int x){
                yc.topSecret = x;
                std::cout << yc.topSecret << std::endl;
            }
    };
}

using namespace ns;
using namespace std;

int main(){
    ns::YourClass yc;
    ns::YourOtherClass yoc;
    yoc.change(yc, 5);

     
    int m=5,n=6;
    cout << max(m,n) << endl;
}

