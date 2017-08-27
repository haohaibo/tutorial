class Solution {
public:
    int maxCount(int m, int n, vector<vector<int>>& ops) {
        int a=m,b=n;
        for(int i=0;i<ops.size();++i){
            a = a > ops[i][0] ? ops[i][0] : a;
            b = b > ops[i][1] ? ops[i][1] : b;
        }
        return a*b;
    }
};
