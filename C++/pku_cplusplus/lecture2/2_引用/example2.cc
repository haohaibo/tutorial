/*
* Author: Haibo Hao
* Email : haohaibo@ncic.ac.cn
* Copyright (C) 2017 NCIC
**/

#include <iostream>
//       定义2个引用类型
void swap(int &a, int &b){
    int temp;
    temp = a;
    a = b;
    b = temp;
}
int n = 4;
// 引用作为函数的返回值
int & SetValue(){
    return n;
}

int main(int argc, char* argv[]){
    int a = 3, b = 5;
    swap(a, b);
    std::cout << "a = " << a << 
        ", b = " << b << std::endl;
    SetValue() = 30;
    std::cout << "n = " << n << std::endl;

    // 常引用
    // 不能通过常引用去修改其引用的内容
    int value = 100;
    const int & c = value;
    value = 200;
    // 编译错
    //c = 300;
    std::cout << "value = " << value << std::endl;
    return 0;
}
