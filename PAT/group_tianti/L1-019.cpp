#include <iostream>
#include <stdio.h>

using namespace std;

int main()
{
    int A_capacity, B_capacity;
    int N;
    scanf("%d",&A_capacity);
    scanf("%d",&B_capacity);
    scanf("%d",&N);

    int A_speak, A_show, B_speak, B_show;
    int A_current = 0, B_current = 0;
    while(N > 0)
    {

        scanf("%d",&A_speak);
        scanf("%d",&A_show);
        scanf("%d",&B_speak);
        scanf("%d",&B_show);

        if(((A_show == (A_speak + B_speak))&&(B_show == (A_speak + B_speak)))
                || ((A_show != (A_speak + B_speak))&&(B_show != (A_speak + B_speak))))
        {
            --N;
            continue;
        }else
        {
            if(A_show == (A_speak + B_speak))
            {
                ++A_current;
            }else
            {
                ++B_current;
            }

            if(A_current > A_capacity)
            {
                printf("A\n");
                printf("%d\n",B_current);
                break;
            }
            if(B_current > B_capacity)
            {
                printf("B\n");
                printf("%d\n",A_current);
                break;
            }
            --N;
        }

    }
    return 0;
}
