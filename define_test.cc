/*
*
*      Filename: define_test.cc
*
*        Author: Haibo Hao
*        Email : haohaibo01@gmail.com
*   Description: ---
*        Create: 2019-04-16 02:53:17
* Last Modified: 2019-04-16 02:53:17
**/
#include <iostream>

#define TEST(parent, testName) \
    struct parent##testName     \
    {                           \
        void Run();         \
    };

TEST(tutShuffle, HMMA)

int main()
{
    return 0;
}

