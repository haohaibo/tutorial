/*
*
*      Filename: A_2_2.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: move only class
*        Create: 2017-06-05 15:17:14
* Last Modified: 2017-06-05 15:40:16
**/
#include <iostream>
#include <memory>

class move_only {
  // 智能指针
  std::unique_ptr<int> data;

 public:
  move_only() {}
  move_only(const move_only&) = delete;
  move_only(move_only&& other) : data(std::move(other.data)) {}
  move_only& operator=(const move_only&) = delete;
  move_only& operator=(move_only&& other) {
    data = std::move(other.data);
    return *this;
  }
};
int main() {
  move_only m1;
  // move_only m2(m1); //拷贝构造函数已删除
  move_only m3(std::move(m1));
  return 0;
}
