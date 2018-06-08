/*
* Author: Haibo Hao
* Email : haohaibo@ncic.ac.cn
* Copyright (C) 2017 NCIC
**/

#include <iostream>

class CRectangle{
    public:
        int width, hight;

        void Init(int width_, int hight_){
            width = width_;
            hight = hight_;
        }

        int Area(){
            return width*hight;
        }
        
        int Perimeter(){
            return 2*(width + hight);
        }
};

int main(int argc, char* argv[]){
    int width, hight;
    std::cin >> width >> hight;
    CRectangle r;
    r.Init(width, hight);
    std::cout << "The sizeof CRectangle: ";
    std::cout << sizeof(CRectangle) << std::endl;
    std::cout << r.Area() << std::endl;
    std::cout << r.Perimeter() << std::endl;
    
    return 0;
}
