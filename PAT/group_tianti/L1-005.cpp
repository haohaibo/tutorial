/*
*
*      Filename: L1-005.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-04-26 10:53:30
* Last Modified: 2017-04-26 10:53:30
**/
#include <iostream>
#include <stdio.h>
#include <string>
#include <vector>
#include <algorithm>

using namespace std;

typedef struct {

    //string SN(12,'0');
    string SN;
    int MN;
    int TN;
}STU_INFO;

int main()
{
    int N;
    scanf("%d",&N);
    //STU_INFO *students = (STU_INFO*)malloc(N*sizeof(STU_INFO));
    STU_INFO *students = new STU_INFO[N];
    for(int i=0; i < N; ++i)
    {
        cin >> students[i].SN;
        scanf("%d",&students[i].MN);
        scanf("%d",&students[i].TN);
    }

    int M,MN;
    scanf("%d",&M);
    for(int i = 0; i < M; ++i)
    {
       scanf("%d",&MN);
       for(int j = 0; j < N; ++j)
       {
           if(students[j].MN == MN)
           {
               cout << students[j].SN << " " << students[j].TN << endl;
               break;
           }
       }
    }
    return 0;
}

