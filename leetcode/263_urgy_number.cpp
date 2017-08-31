class Solution {
public:
    bool isUgly(int num) {
        bool flag = true;
        if(num <= 0){
            return false;
        }
        while(flag){
            flag = false;
            if(num%2 == 0){
                num = num/2;
                flag = true;
            }
            
            if(num%3 == 0){
                num = num/3;
                flag = true;
            }
            
            if(num%5 == 0){
                num = num/5;
                flag = true;
            }
        }
        
        if(num == 1){
            return true;
        }else{
            return false;
        }
    }
};
