/*
*
*      Filename: list_3.1.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-05-31 17:29:32
* Last Modified: 2017-05-31 20:16:20
**/

#include <algorithm>
#include <iostream>
#include <list>
#include <mutex>

std::list<int> some_list;
std::mutex some_mutex;

void add_to_list(int new_value) {
  std::lock_guard<std::mutex> guard(some_mutex);
  some_list.push_back(new_value);
}

bool list_contains(int value_to_find) {
  std::lock_guard<std::mutex> guard(some_mutex);
  return std::find(some_list.begin(), some_list.end(), value_to_find) !=
         some_list.end();
}

int main() {
  add_to_list(100);
  std::cout << "contains(2) = " << list_contains(2) << "\n"
            << "contains(100) = " << list_contains(100) << std::endl;
}
