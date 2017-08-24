class Solution {
public:
    int findComplement(int num) {
        int index = 0;
        while(pow(2,index) <= num){
            ++index;
        }
        
        int out = -num - 1;
        int mask = pow(2,index) - 1;
        out = out & mask;
        return out;
    }
};
