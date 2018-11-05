/*
*
*      Filename: const2.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-10-02 11:51:30
* Last Modified: 2017-10-02 12:20:48
**/
#include <cstdio>
#include <iostream>
#include <vector>

namespace ns {
class Name {
 public:
  void setName(const std::string &s) const;
  void showName() const;

  void setAge(int age_) { age = age_; }
  void showAge() const { std::cout << "age = " << age << std::endl; }

 private:
  char *m_sName;
  int age;
};

void Name::setName(const std::string &s) const {
  // m_sName = s.c_str(); // 错误，不能修改m_sName

  for (int i = 0; i < s.size(); ++i) {
    m_sName[i] = s[i];
  }
}

void Name::showName() const {
  std::cout << m_sName << std::endl;
  printf("%lx\n", (unsigned long)m_sName);
}
}

int main() {
  std::string s = "hello";
  ns::Name *myname = new ns::Name;
  // myname->setName(s);
  // myname->showName();
  myname->setAge(5);
  myname->showAge();
  return 0;
}
