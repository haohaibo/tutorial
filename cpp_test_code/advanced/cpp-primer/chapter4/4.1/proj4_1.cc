/*
*
*      Filename: proj4_1.cc
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-12 09:57:47
* Last Modified: 2017-04-12 09:57:47
**/
#include <iostream>
#include <string>
using std::cin;
using std::cout;
using std::endl;
using std::string;

int main() {
  // both buf_size and max_files are const
  const unsigned buf_size = 512, max_files = 20;
  int staff_size = 28;
  char input_buffer[buf_size];
  string fileTable[max_files + 1];

  double salaries[staff_size];

  const unsigned array_size = 3;
  int ia[array_size] = {0, 1, 2};
  string str_array[array_size] = {"hi", "bye"};
  cout << str_array[0] << endl;

  char ca1[] = {'C', '+', '+'};        // no null
  char ca2[] = {'C', '+', '+', '\0'};  // explicit null
  char ca3[] = "C++";                  // null terminator added automatically
  return 0;
}
