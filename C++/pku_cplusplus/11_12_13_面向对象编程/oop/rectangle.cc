/*
 * Author: Haibo Hao
 * Email : haohaibo@ncic.ac.cn
 * Copyright (C) 2017 NCIC
 **/

#include <iostream>

/*
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
   */
class CRectangle{
    public:
        int width, hight;
        // 成员函数的声明
        void Init(int width_, int hight_);
        int Area();
        int Perimeter();
};
// 成员函数的定义 
void CRectangle::Init(int width_, int hight_){
    width = width_;
    hight = hight_;
}
int CRectangle::Area(){
    return width*hight;
}
int CRectangle::Perimeter(){
    return 2*(width + hight);
}
// 另一种输出结果的方式
void PrintRectangle(CRectangle &r){
    std::cout << r.Area() << "," << r.Perimeter() << std::endl;
}

int main(int argc, char* argv[]){
    int width, hight;
    std::cin >> width >> hight;
    CRectangle r;
    r.Init(width, hight);
    std::cout << "The sizeof CRectangle: ";
    std::cout << sizeof(CRectangle) << std::endl;
    std::cout << r.Area() << "," << r.Perimeter() << std::endl;
    PrintRectangle(r);
    return 0;
}
