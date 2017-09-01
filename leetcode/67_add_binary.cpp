class Solution {
public:
    string addBinary(string a, string b) {
        char carray =  '0';
        string res;
        int pos_a = a.length() - 1;
        int pos_b = b.length() - 1;
        
        while(pos_a>=0 && pos_b >=0){
            if(carray == '0'){
                if((a[pos_a] == '0' && b[pos_b] == '1') || (a[pos_a] == '1' && b[pos_b] == '0')){
                    res.push_back('1');
                    carray = '0';
                }
                if(a[pos_a] == '0' && b[pos_b] == '0'){
                    res.push_back('0');
                    carray = '0';
                }
                if(a[pos_a] == '1' && b[pos_b] == '1'){
                    res.push_back('0');
                    carray = '1';
                }
            }else{
                if((a[pos_a] == '0' && b[pos_b] == '1') || (a[pos_a] == '1' && b[pos_b] == '0')){
                    res.push_back('0');
                    carray = '1';
                }
                if(a[pos_a] == '0' && b[pos_b] == '0'){
                    res.push_back('1');
                    carray = '0';
                }
                if(a[pos_a] == '1' && b[pos_b] == '1'){
                    res.push_back('1');
                    carray = '1';
                }
            }
            --pos_a;
            --pos_b;
        }
        
        while(pos_a >= 0){
            if(carray == '0'){
                res.push_back(a[pos_a]);
                carray == '0';
            }else{
                if(a[pos_a] == '0'){
                    res.push_back('1');
                    carray = '0';
                }else{
                    res.push_back('0');
                    carray = '1';
                }
            }
            --pos_a;
        }
        while(pos_b >= 0){
            if(carray == '0'){
                res.push_back(b[pos_b]);
                carray == '0';
            }else{
                if(b[pos_b] == '0'){
                    res.push_back('1');
                    carray = '0';
                }else{
                    res.push_back('0');
                    carray = '1';
                }
            }
            --pos_b;
        }
        if(carray == '1')
            res.push_back('1');
        
        reverse(res.begin(),res.end());
        return res;
    }
};
