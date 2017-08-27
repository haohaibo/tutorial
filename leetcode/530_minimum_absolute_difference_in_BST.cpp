/**
 * Definition for a binary tree node.
 * struct TreeNode {
 *     int val;
 *     TreeNode *left;
 *     TreeNode *right;
 *     TreeNode(int x) : val(x), left(NULL), right(NULL) {}
 * };
 */
class Solution {
public:
    int getMinimumDifference(TreeNode* root) {
        vector<int> keys;
        Inorder(root, keys);
        return min;
    }
    int min=INT_MAX;
    void Inorder(TreeNode* root, vector<int>& keys){
        if(root == NULL){
            return ;
        }
        Inorder(root->left, keys);
        keys.push_back(root->val);
        if(keys.size()>=2){
            if(min > (keys[keys.size()-1] - keys[keys.size()-2])){
                min = keys[keys.size()-1] - keys[keys.size()-2];
            }
        }
        Inorder(root->right, keys);
    }
};
