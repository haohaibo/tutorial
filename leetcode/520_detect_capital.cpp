class Solution {
public:
    bool detectCapitalUse(string word) {
        if(word.length() == 1){
            return true;
        }else{
                int kind = 0;
                int true_flag = 1, false_flag = 1;
            if(isupper(word[0])){
                for(int i = 1; i < word.length(); ++i){
                    if(isupper(word[i]) && true_flag == 1){
                        ++kind;
                        true_flag = 0;
                    }
                    if(!isupper(word[i]) && false_flag == 1){
                        ++kind;
                        false_flag = 0;
                        cout << word[i] << endl;
                    }
                   
                    if(kind == 2){
                        return false;
                    }
                }
                return true;
            }else{
                for(int i = 1 ; i < word.length(); ++i){
                    if(isupper(word[i])){
                        return false;
                    }
                }
                return true;
            }

        }
    }
};
