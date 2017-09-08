class Solution {
public:
    vector<vector<int>> generate(int numRows) {
        vector<vector<int>> res;
        res.resize(numRows);
        
        for(int i=0;i<numRows;++i){
            res[i].resize(i+1);
            res[i][0] = 1;
            res[i][res[i].size()-1]=1;
        }
        
        for(int i=1;i<numRows-1;++i){
            int k=1;
            for(int j=0;j<res[i].size()-1;++j){
                res[i+1][k] = res[i][j] + res[i][j+1];
                ++k;
            }
        }
        
        return res;
    }
};
