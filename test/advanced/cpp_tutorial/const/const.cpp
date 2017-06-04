/*
*
*      Filename: const.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: C/C++ const总结 
*        Create: 2017-06-04 17:53:41
* Last Modified: 2017-06-04 20:21:19
**/
#include <iostream>
#include <vector>

/*
 * const 是C/C++中的常量修饰符，即所修饰的对象为常量(immutable)
 * 常量类型的变量或对象的值是不能被更新的
 **/

// 2. const常量有数据类型，而宏常量没有数据类型。
// 编译器可以对const常量进行类型安全检查，而对宏常量
// 只能进行字符串替换，没有类型安全检查
// 并且在字符替换时可能会产生意料不到的错误
void f(const int i)
{
    // 对传入的参数进行类型检查，不匹配时进行提示

    // 3. 可以保护被修饰的东西
    // 防止意外的修改，增强程序的健壮性
    //例如 i = 23333; 编译器报错
}

// 5. 为函数重载提供了一个参考
class A
{
    void f(int i)
    {
        // do something
    }

    // 上一个函数的重载
    void f(int i) const
    {
        // do something 
    }
};

// 值传递
void fun(std::vector<int> d)
{
    d.push_back(1);
    d.push_back(4);
    for(int i = 0; i < d.size(); ++i)
    {
        std::cout << "d[" << i << "] = " << d[i] << std::endl; 
    }
}

// take the parameter as a const lvalue reference and 
// make the copy internally
void process_copy(std::vector<int> const &vec_)
{
    std::vector<int> vec(vec_);
    vec.push_back(7);
    vec.push_back(6);
    for(int i = 0; i < vec.size(); ++i)
    {
        std::cout << "vec[" << i << "] = " << vec[i] << std::endl; 
    }
}
int main()
{
    // ---const的作用---
    // 1. 可以定义常量
    const int MAX = 10000;
    std::cout << "MAX = " << MAX << std::endl;
    //MAX = 1; // error: assignment of read-only variable 'MAX'
    //可以看出MAX现在是只读的变量，不能再修改

    // 2. 便于进行类型检查 
    // 见上面void f(const int i)函数
    int i = 9;
    f(i);

    // 4. 可以很方便的进行参数的调整和修改
    // 和宏定义一样，可以做到不变则已，一变都变

    std::vector<int> data;
    data.push_back(2);
    data.push_back(3);
    data.push_back(3);
    // 值传递
    fun(data);
    std::cout << "---------------------" << std::endl;
    process_copy(data); 
    std::cout << "---------------------" << std::endl;
    
    for(int i = 0; i < data.size(); ++i)
    {
        std::cout << "data[" << i << "] = " << data[i] << std::endl; 
    }

    return 0;
}

