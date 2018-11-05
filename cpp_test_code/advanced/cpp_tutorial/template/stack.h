/*
*
*      Filename: stack.h
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-06-01 11:11:52
* Last Modified: 2017-06-01 11:11:52
**/
template <class T>
class Stack {
 public:
  Stack();
  ~Stack();
  void push(T t);
  T pop();
  bool isEmpty();

 private:
  T *m_pT;
  int m_maxSize;
  int m_size;
};

#include "stack.cpp"
