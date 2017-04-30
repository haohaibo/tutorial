#include <iostream>
#include <stdio.h>
#include <string>
#include <vector>
#include <algorithm>
using namespace std;

int main()
{
    int N, K;
    string ID;
    vector< vector<string> > data;
    vector<string> line;
    scanf("%d",&N);
    for(int i= 0; i < N; ++i)
    {
        scanf("%d",&K);
        for(int j= 0; j < K; ++j)
        {
            cin >> ID;
            line.push_back(ID);
        }

        data.push_back(line);
        line.clear();
    } 
    int M;
    scanf("%d",&M);
    vector<string> query;
    for(int i = 0; i < M; ++i)
    {
        cin >> ID;
        if(find(query.begin(),query.end(),ID) == query.end())
        {
            query.push_back(ID);
        }
    }

    bool flag = true;
    int count = 0;
    for(int i = 0; i < query.size(); ++i)
    {
        flag = true;
        for(int j = 0; j < N; ++j)
        {
            if((find(data[j].begin(), data[j].end(), query[i]) != data[j].end()))
            {
                
                if(data[j].size() >= 2)
                {
                    flag = false;
                    break;
                }
                if(data[j].size() == 1)
                {
                    flag = true;
                    break;
                }
            }

        }
        
        if(flag == true)
        {
            ++count;
            if(count == 1) 
            {
                cout << query[i];
            }else
            {
                cout << " " << query[i];
            }
        }
    } 
    if(count == 0)
    {
        cout << "No one is handsome" << endl;
    }else
    {
        cout << endl;
    }

    return 0;
}
