/*
*
*      Filename: method.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-06-01 10:46:47
* Last Modified: 2017-06-01 10:59:21
**/

template<typename T>
void swap(T &t1, T &t2)
{
    T temp;
    temp = t1;
    t1 = t2;
    t2 = temp;
}

