/*
*
*      Filename: list_2.2.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-05-29 17:15:44
* Last Modified: 2017-05-29 17:31:39
**/
#include <iostream>
#include <thread>

void do_something(int &i) { ++i; }

struct func {
  int &i;

  func(int &i_) : i(i_) {}

  void operator()() {
    for (unsigned int j = 0; j < 1000000; ++j) {
      do_something(i);
    }
  }
};

void do_something_in_current_thread() {}

void f() {
  int some_local_state = 0;
  func my_func(some_local_state);
  std::thread t(my_func);
  try {
    do_something_in_current_thread();
  } catch (...) {
    t.join();
    throw;
  }
  t.join();
}

int main() {
  f();
  return 0;
}
