/*
*
*      Filename: 331-2.cpp
*
*        Author: Haibo Hao
*        Email : haohaibo@ncic.ac.cn
*   Description: ---
*        Create: 2017-06-09 11:43:05
* Last Modified: 2017-06-09 11:43:06
**/
class Solution {
public:
    bool isValidSerialization(string preorder) {
        int diff = 0;
        if(preorder.size() == 0)
        {
            return true;
        }else
        {
            if(preorder.size() == 1)
            {
                if(preorder[0] == '#')
                {
                    return true;
                }else
                {
                    return false;
                }
            }
            if(preorder[0] == '#')
            {
                diff -= 1;
            }else
            {
                diff += 2;
            }
            for(int i = 1; i < preorder.size() ; ++i)
            {
                if(preorder[i] != ',' && preorder[i] != '"')
                {
                   if(preorder[i] == '#')
                   {
                       diff -= 1;
                        cout << "# " << diff << " i " << i << endl;
                   }else
                   {
                       diff += 2;
                       diff -= 1;
                       while(preorder[i+1] != ',' && preorder[i+1] != '#' && preorder[i+1] != '"')
                       {
                            ++i;    
                       }
                        cout <<"num " << diff << " i " << i << endl;
                   }
                }
               
            }
            cout << diff << endl;
            cout << preorder.size() << endl;
            if(diff == 0)
            {
                return true;
            }else
            {
                return false;
            }
        }
    }
};

