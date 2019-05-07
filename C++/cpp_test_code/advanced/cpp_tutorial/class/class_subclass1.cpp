/* *
*      Filename: class_subclass1.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-09-26 09:41:38
* Last Modified: 2017-09-26 10:08:31
**/
#include <cstdio>
#include <iostream>

class Base {
 public:
  Base() { std::cout << "Base constructor" << std::endl; }
  virtual ~Base() { std::cout << "Base deconstructor" << std::endl; }
};

class subClass : public Base {
 public:
  subClass() { std::cout << "subClass constructor" << std::endl; }
  ~subClass() { std::cout << "subClass deconstructor" << std::endl; }
};

int main() {
  // subClass sub1;
  std::cout << "============" << std::endl;
  // subClass* psub1 = new subClass;
  std::cout << "*==========*" << std::endl;

  Base* p = new subClass;
  delete p;
  std::cout << "***********" << std::endl;
  subClass* p_sub = new subClass;
  delete p_sub;
}
