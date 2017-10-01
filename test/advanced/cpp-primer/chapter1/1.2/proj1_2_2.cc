/*
 * Author: Haibo Hao
 * Date  : 2017.4.6
 * Email : haohaibo@ncic.ac.cn
 * */

#include <iostream>
int main()
{
    std::cout << "Enter two numbers: " << std::endl;
    int v1, v2;
    std::cin >> v1 >> v2;
    std::cout << "The sum of " << v1 << " and "
              << v2 << " is " << v1 + v2 << std::endl;
    std::cerr << "cerr: standard error" << std::endl;
    std::clog << "clog: log info" << std::endl;

    std::cout << "test";
    // 在C++中，一个表达式产生一个运算结果，它由一个或多个运算对象和(通常)一个运算符组成
    // << 为输出运算符
    // endl是一个被称为操纵符的特殊值
    // 写入endl的效果是结束当前行，并将与设备关联的缓冲区(buffer)中的内容刷到设备中
    std::cout << std::endl;
    return 0;
}
