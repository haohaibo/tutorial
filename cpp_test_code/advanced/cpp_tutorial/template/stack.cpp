/*
*
*      Filename: stack.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-06-01 11:14:57
* Last Modified: 2017-06-01 11:36:38
**/

template<class T>
Stack<T>::Stack()
{
    // Stack的最大容量
    m_maxSize = 100;
    // 当前栈中元素的个数
    m_size = 0;
    m_pT = new T[m_maxSize];
}

template<class T>
Stack<T>::~Stack()
{
    delete [] m_pT;
}

template<class T>
void Stack<T>::push(T t)
{
   m_size++;
   m_pT[m_size -1] = t;
}

template<class T>
T Stack<T>::pop()
{
   m_size--;
   T t = m_pT[m_size];
   return t;
}

template<class T>
bool Stack<T>::isEmpty()
{
    // 这种写法很巧妙
    return m_size == 0;
}
