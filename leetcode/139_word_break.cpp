class Solution {
public:
    bool wordBreak(string s, vector<string>& wordDict) {
        if(wordDict.size() == 0)
            return false;
        vector<bool> dp(s.length()+1, false);
        dp[0] = true;
        
        for(int i=1; i <= s.length(); ++i){
            
            for(int j=i-1; j >=0; --j){
                if(dp[j] == true){
                    if(find(wordDict.begin(),wordDict.end(),s.substr(j,i-j)) != wordDict.end()){
                        dp[i] = true;
                        break;
                    }
                }
            }
        }
        
        return dp[s.length()];
    }
};
