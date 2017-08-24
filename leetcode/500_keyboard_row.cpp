class Solution {
public:
    vector<string> findWords(vector<string>& words) {
       map<char,int> keyboard;
        keyboard.insert(pair<char,int>('q',1));
        keyboard.insert(pair<char,int>('Q',1));
        keyboard.insert(pair<char,int>('w',1));
        keyboard.insert(pair<char,int>('W',1));
        keyboard.insert(pair<char,int>('e',1));
        keyboard.insert(pair<char,int>('E',1));
        keyboard.insert(pair<char,int>('r',1));
        keyboard.insert(pair<char,int>('R',1));
        keyboard.insert(pair<char,int>('t',1));
        keyboard.insert(pair<char,int>('T',1));
        keyboard.insert(pair<char,int>('y',1));
        keyboard.insert(pair<char,int>('Y',1));
        keyboard.insert(pair<char,int>('u',1));
        keyboard.insert(pair<char,int>('U',1));
        keyboard.insert(pair<char,int>('i',1));
        keyboard.insert(pair<char,int>('I',1));
        keyboard.insert(pair<char,int>('o',1));
        keyboard.insert(pair<char,int>('O',1));
        keyboard.insert(pair<char,int>('p',1));
        keyboard.insert(pair<char,int>('P',1));
        
        keyboard.insert(pair<char,int>('a',2));
        keyboard.insert(pair<char,int>('A',2));
        keyboard.insert(pair<char,int>('s',2));
        keyboard.insert(pair<char,int>('S',2));
        keyboard.insert(pair<char,int>('d',2));
        keyboard.insert(pair<char,int>('D',2));
        keyboard.insert(pair<char,int>('f',2));
        keyboard.insert(pair<char,int>('F',2));
        keyboard.insert(pair<char,int>('g',2));
        keyboard.insert(pair<char,int>('G',2));
        keyboard.insert(pair<char,int>('h',2));
        keyboard.insert(pair<char,int>('H',2));
        keyboard.insert(pair<char,int>('j',2));
        keyboard.insert(pair<char,int>('J',2));
        keyboard.insert(pair<char,int>('k',2));
        keyboard.insert(pair<char,int>('K',2));
        keyboard.insert(pair<char,int>('l',2));
        keyboard.insert(pair<char,int>('L',2));

        keyboard.insert(pair<char,int>('z',3));
        keyboard.insert(pair<char,int>('Z',3));
        keyboard.insert(pair<char,int>('x',3));
        keyboard.insert(pair<char,int>('X',3));
        keyboard.insert(pair<char,int>('c',3));
        keyboard.insert(pair<char,int>('C',3));
        keyboard.insert(pair<char,int>('v',3));
        keyboard.insert(pair<char,int>('V',3));
        keyboard.insert(pair<char,int>('b',3));
        keyboard.insert(pair<char,int>('B',3));
        keyboard.insert(pair<char,int>('n',3));
        keyboard.insert(pair<char,int>('N',3));
        keyboard.insert(pair<char,int>('m',3));
        keyboard.insert(pair<char,int>('M',3));

        string word;
        int line;
        int flag = 1;
        vector<string> find;
        for(size_t i = 0; i < words.size(); ++i){
            flag = 1;
            if(words[i].length() >= 1){
                line = keyboard[words[i][0]];
                for(size_t j = 1; j < words[i].length(); ++j){
                    if(keyboard[words[i][j]] != line){
                        flag = 0;
                        break;
                    }
                }
            }
            if(flag == 1)
                find.push_back(words[i]);    
        }
        
        return find;
        
    }
};
