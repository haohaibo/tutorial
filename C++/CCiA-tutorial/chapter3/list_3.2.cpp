/*
*
*      Filename: list_3.2.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-05-31 20:16:43
* Last Modified: 2017-05-31 20:40:06
**/
#include <iostream>
#include <mutex>

class some_data {
  int a;
  std::string b;

 public:
  void do_someting() {}
};

class data_wrapper {
 private:
  some_data data;
  std::mutex m;

 public:
  template <typename Function>
  void process_data(Function func) {
    std::lock_guard<std::mutex> l(m);
    func(data);
  }
};

some_data *unprotected;

void malicious_function(some_data &protected_data) {
  unprotected = &protected_data;
}

data_wrapper x;

void foo() {
  x.process_data(malicious_function);

  // 在mutex无保护的情况下访问保护数据
  unprotected->do_someting();
}

int main() {
  foo();
  return 0;
}
