/*
*
*      Filename: list_3.4.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-06-05 10:48:26
* Last Modified: 2017-06-05 13:40:16
**/
#include <exception>
#include <iostream>
#include <memeory>

struct empyt_stack : std::exception {
  const char* what() const throw();
};

template <typename T>
class threadsafe_stack {
 public:
  threadsafe_stack();
  threadsafe_stack(const threadsafe_stack&);
  threadsafe_stack& operator=(const threadsafe_stack&) = delete;

  delete : void push(T new_value);
  std::shared_ptr<T> pop();
  void pop(T& value);
  bool empty() const;
};

int main() { return 0; }
