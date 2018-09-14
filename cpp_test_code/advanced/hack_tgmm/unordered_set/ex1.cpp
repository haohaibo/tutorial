/*
 * Author: Haibo Hao
 * Date  : 2017.4.3
 * Email : haohaibo@ncic.ac.cn
 * */
#include <iostream>
#include <stdio.h>
#include <unordered_set>
namespace ClassFoo
{
    void PrintIntDoubleUnorderedSet(std::unordered_set<int>& m, char* pre)
    {
        std::unordered_set<int>::iterator it;
        std::cout << pre;
        for(it = m.begin(); it!=m.end();it++)
        {
            std::cout << *it << " ";
        }
        std::cout << std::endl;
    }
    void UnOrderedSetExample1()
    {
        std::unordered_set<int> foo1;
        
        // 普通插入
        foo1.insert(1);
        
        // 带暗示插入, std::pair<int,double>等价于
        // std::unordered_set<int,double>::value_type
        foo1.insert(foo1.end(),2);

        // 插入一个范围
        std::unordered_set<int> foo2;
        foo2.insert(3);
        foo2.insert(4);
        foo2.insert(5);
        foo1.insert(foo2.begin(), foo2.end());

        PrintIntDoubleUnorderedSet(foo1, "foo1 after insert eles: ");

        // 查找主键4
        std::unordered_set<int>::iterator it;
        it = foo1.find(4);
        if(it != foo1.end())
        {
            std::cout << "foo1.find(4): ";
            std::cout << *it << std::endl;
        }

        // 删除上面找到的主键
        if ( it != foo1.end())
        {
            foo1.erase(it);
        }
        PrintIntDoubleUnorderedSet(foo1, "删除主键为4的元素后的foo1: ");

        // 遍历删除主键为2的元素
        for(it = foo1.begin();it != foo1.end();it++)
        {
            // 遍历删除主键等于2的元素
            // 要注意，删除元素会使迭代范围发生变化
            if(*it == 2)
            {
                foo1.erase(it);
                break;
            }
        }

        // 内部数据
        std::cout << "bucket_count: " << foo1.bucket_count() << std::endl;
        std::cout << "max_bucket_count: " << foo1.max_bucket_count() << std::endl;
        std::cout << "bucket_size: " << foo1.bucket_size(0) << std::endl;
        std::cout << "load_factor: " << foo1.load_factor() << std::endl;
        std::cout << "max_load_factor: "<< foo1.max_load_factor() << std::endl;
        
        PrintIntDoubleUnorderedSet(foo1,"删除主键为2的元素后的foo1: ");
        foo1.clear();
        PrintIntDoubleUnorderedSet(foo1, "清空后的foo1: ");  

    }
}


int main(int argc, char** argv)
{
    ClassFoo::UnOrderedSetExample1();
    return 0;
}
