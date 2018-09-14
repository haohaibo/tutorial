/*
 *
 *      Filename: test2.cc
 *
 *        Author: Haibo Hao
 *        Email : haohaibo@ncic.ac.cn
 *   Description: ---
 *        Create: 2017-08-14 19:47:42
 * Last Modified: 2017-08-14 19:47:42
 **/
#include <iostream>
#include <stdio.h>
#include <stdlib.h>

// compile : g++ test2.cc -std=c++11
// pre-process: g++ -E test2.cc -o test2.i

[[gnu::noreturn]] void failed_abort(const char* msg, const char* file, int line)
{
    printf("FAILED: %s: %s:%i\n", msg, file, line);
    std::abort();
}

#define EXPECT(...) \
    if(!(__VA_ARGS__)) \
failed_abort(#__VA_ARGS__,__FILE__,__LINE__)

/* Constructs type name from a struct */
#define MIOPEN_DECLARE_OBJECT(name) \
    struct name                     \
    {                               \
    };                              \
    typedef struct name* name##_t;

int main()
{
    int n = 100;
    EXPECT(n == 100);
    /* Create miopenTensorDescriptor_t type */
    MIOPEN_DECLARE_OBJECT(miopenTensorDescriptor);

    miopenTensorDescriptor_t t;
    return 0;
}

