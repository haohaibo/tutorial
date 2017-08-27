class Solution {
public:
    char findTheDifference(string s, string t) {
        multiset<char> tset;
        for(int i=0;i<t.length();++i){
            tset.insert(t[i]);
        }
        for(int i=0;i<s.length();++i){
            if(tset.count(s[i]) >= 1){
                tset.erase(tset.lower_bound(s[i]));
            }       
        }
        
        for(multiset<char>::iterator it=tset.begin();it!=tset.end();++it){
            return *it;
        }
    }
};
