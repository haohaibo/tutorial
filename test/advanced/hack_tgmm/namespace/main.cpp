#include <iostream>

namespace mylib
{
    extern "C"
    {
        #include "mylib/mylib.h"
        #include "mylib/array.h"
        #include "mylib/image.h"
        #include "mylib/histogram.h"
    }
}

int main(int argc, char** argv)
{
    mylib::Dimn_Type imageSize[3];
    imageSize[0] = 151;
    imageSize[1] = 101;
    imageSize[2] = 29;
    std::cout << imageSize[2] << std::endl;    
    //mylib::Use_Zero_Boundary();
    return 0;

}
