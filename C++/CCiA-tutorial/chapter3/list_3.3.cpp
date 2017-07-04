/*
*
*      Filename: list_3.3.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-06-01 10:17:03
* Last Modified: 2017-06-05 10:47:53
**/
#include <iostream>
#include <queue>
#include <deque>

// deque双端队列
template<typename T, typename Container=std::deque<T> >
class stack
{
    public:
        // 传入左值const引用
        explicit stack(const Container&);
        // 传入右值引用 
        explicit stack(Container&& = Container());
        template <class Alloc> explicit stack(const Alloc&);
        template <class Alloc> stack(const Container&, const Alloc&);
        template <class Alloc> stack(Container&&, const Alloc&);
        template <class Alloc> stack(stack&&, const Alloc&);

        bool empty() const;
        size_t size() const;
        T& top();
        T const& top() const;
        void push(T const&);
        void push(T&&);
        void pop();
        void swap(stack&&);
}; 

int main()
{
    return 0;
}
