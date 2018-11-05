/*
*
*      Filename: A_2_1.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: Deleted functions
*        Create: 2017-06-05 13:42:18
* Last Modified: 2017-06-05 15:16:47
**/
#include <iostream>

#if 0 
// 通常为了避免进行拷贝操作，会将拷贝构造函数和
// 拷贝赋值操作符声明为私有成员，并且不进行实现
class no_copies
{
    public:
        no_copies()
        {}
    private:
        no_copies(no_copies const&); //无实现
        no_copies& operator=(no_copies const&); //无实现
};
#endif

// 在C++11中，可以通过添加 = delete 将一个函数声明为删除函数
class no_copies {
 public:
  no_copies() {}

  // 拷贝构造函数
  no_copies(no_copies const&) = delete;
  // 赋值操作
  no_copies& operator=(no_copies const&) = delete;
};
int main() {
  no_copies a;
  // no_copies b(a); // 编译错误
  return 0;
}
