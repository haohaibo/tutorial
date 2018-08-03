/*
*
*      Filename: bool.cc
*
*        Author: Haibo Hao
*        Email : hhao@nvidia.com
*   Description: ---
*        Create: 2018-08-03 00:28:01
* Last Modified: 2018-08-03 00:28:01
**/
#include <iostream>

int main(){
    bool isLock{false};
    if(isLock == false){
        std::cout << "not lock" << std::endl;
    }else{
        std::cout << "locked" << std::endl;
    }
    return 0;
}

