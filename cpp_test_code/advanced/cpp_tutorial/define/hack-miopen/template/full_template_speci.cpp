/*
 *
 *      Filename: full_template_speci.cpp
 *
 *        Author: Haibo Hao
 *        Email : haohaibo@ncic.ac.cn
 *   Description: ---
 *        Create: 2017-08-19 05:35:54
* Last Modified: 2017-08-19 06:23:30
 **/
#include <cstdio>
#include <iostream>

/* explicit full template specialization */
// ref: http://en.cppreference.com/w/cpp/language/template_specialization
namespace ns {
// // 全特化类模板
// template <>
//     class A<int, double>{
//         int data1;
//         double data2;
//     };

// // 函数模板
// template <>
//     int max(const int lhs, const int rhs){
//         return lhs > rhs ? lhs : rhs;
//     }

// primary template
template <typename T>
struct is_void : std::false_type {};

// explicit specialization for T = void
template <>
struct is_void<void> : std::true_type {};
}

int main(int argc, char* argv[]) {
  // std::cout << ns::max(3,6) << std::endl;

  // for any type T other than void, the
  // class is derived from false_type
  std::cout << ns::is_void<char>::value << "\n";

  // but when T is void, the class is derived
  // from true_type
  std::cout << ns::is_void<void>::value << std::endl;
}
