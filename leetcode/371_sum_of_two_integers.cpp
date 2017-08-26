class Solution {
public:
    int getSum(int a, int b) {
        int sum=a^b;
        int carray=(a&b)<<1;
        int temp;
        while(carray!=0){
            temp = sum^carray;
            carray=(sum&carray)<<1;
            
            sum=temp;
        }
        return sum;
    }
};
