#include <iostream>
#include <unordered_set>

using namespace std;

struct myHash
{
    size_t operator()(pair<int,int>__val)const
    {
        return static_cast<size_t>(__val.first*101 + __val.second);
    }
};

int main(int argc, char* argv[])
{
    unordered_set<pair<int,int>,myHash> S;
    int x,y;
    while(cin >> x >> y)
    {
        S.insert(make_pair(x,y));
    }

    for(auto it = S.begin();it!=S.end();++it)
    {
        cout << it->first << " " << it->second << endl;
    }
    return 0;
}
