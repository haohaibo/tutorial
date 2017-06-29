/*
*
*      Filename: shared_ptr.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-06-28 18:51:22
* Last Modified: 2017-06-29 00:10:58
**/
#include <iostream>
#include <string>
#include <list>
#include <vector>
#include <memory>

// factory返回一个shared_ptr,指向一个动态分配的对象
std::shared_ptr<int> factory(int arg)
{
    return std::make_shared<int> (arg);
}

void use_factory(int arg)
{
    std::shared_ptr<int> p = factory(arg);
    
} // p离开了作用域,它指向的内存会自动释放掉

int main()
{
    /*  
     * shared_ptr 类
     */
    // 默认初始化的智能指针保存着一个空指针
    // 和vector类似,智能指针也是模板
    std::shared_ptr<std::string> p1;
    std::shared_ptr<std::list<int> > p2; 
    // 在if判断中p1用作一个条件判断，若p指向一个对象，则为true
    if(p1 && p1->empty())
    {
        *p1 = "hi"; 
        std::cout << *p1 << std::endl;
    }

    
    // --- make_shared 函数 (感觉跟new有点像)
    std::shared_ptr<int> p3 = std::make_shared<int> (23333);
    std::cout << *p3 << std::endl;
    std::shared_ptr<std::string> p4 = std::make_shared<std::string> (6,'6');  
    std::cout << *p4 << std::endl;
    std::shared_ptr<int> p5 = std::make_shared<int> ();
    std::cout << *p5 << std::endl;
    
    // p6指向一个动态分配的空vector<string>
    auto p6 = std::make_shared<std::vector<std::string>> ();

    // --- shared_ptr拷贝和赋值操作
    // p 指向的对象现在只有p一个引用者
    auto p = std::make_shared<int> (222); 
    // p和q指向相同对象，该对象有2个引用者
    auto q(p);

    auto r = std::make_shared<int> (42); // r指向的int现在只有一个引用对象
    // 给r赋值q,令它指向另外一个地址
    // 递增q指向的对象的引用计数
    // 递减原来r指向的对象的引用计数
    // r原来指向的对象已没有引用者,会自动释放
    r = q;

    auto p7 = factory(6);
    std::cout << "*p7 = " << *p7 << std::endl;
    return 0;
}

