class Solution {
public:
    bool checkPossibility(vector<int>& nums) {
        int count=0;
        if(nums.size()==1){
            return true;
        }
        int inc=0;
        int dec=0;
        int pos;
        for(int i=0;i<nums.size()-1;++i){
            if(nums[i]>nums[i+1]){
                ++dec;
                pos=i;
            }
        }
        
        if(dec==0){
            return true;
        }else{
            if(dec==1){
                vector<int> v1=nums;
                vector<int> v2=nums;
                v1.erase(v1.begin()+pos);
                v2.erase(v2.begin()+pos+1);
                int p=0,q=0;
                for(int i=0;i<v1.size()-1;++i){
                    if(v1[i]>v1[i+1]){
                        ++p;
                    }
                }
                if(p==0){
                    return true;
                }
                
                for(int i=0;i<v2.size()-1;++i){
                    if(v2[i]>v2[i+1]){
                        ++q;
                    }
                }
                if(q==0){
                    return true;
                } 
                
                return false;
                
            }else{
                return false;
            }           
        }
    }
};
