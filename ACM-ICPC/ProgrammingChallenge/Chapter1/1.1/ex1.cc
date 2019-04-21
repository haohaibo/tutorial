/*
*
*      Filename: ex1.cc
*
*        Author: Haibo Hao
*        Email : haohaibo01@gmail.com
*   Description: ---
*        Create: 2019-04-21 02:49:29
* Last Modified: 2019-04-21 02:49:29
**/
#include <cstdio>

#define MAX_IN 50

// 有n张写有数字的纸片,有放回的抽取4次，判断是否存在抽取4次和为m的方案
int main()
{
    int n, m, k[MAX_IN];

    scanf("%d%d", n, m);

    for (int i = 0; i < n; ++i)
    {
        scanf("%d", &k[i]);
    }

    bool result = false;
    // 四重循环枚举
    for (int a = 0; a < n; ++a)
    {
        for ( int b = 0; b < n; ++b)
        {
            for ( int c = 0; c < n; ++c)
            {
                for ( int d = 0; d < n; ++d)
                {
                    if (k[a] + k[b] + k[c] + k [d] == m)
                    {
                        result = true;
                    }
                }
            }
        }
    }

    if (result) puts("Yes");
    else puts("No");
    return 0;
}

