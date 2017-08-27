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
    TreeNode* convertBST(TreeNode* root) {
        vector<int> keys;
        Inorder(root, keys);
        InorderAdd(root, keys);
        return root;
    }
    void Inorder(TreeNode* root, vector<int>& keys){
        if(root == NULL){
            return; 
        }
        
        Inorder(root->left, keys);
        keys.push_back(root->val);
        Inorder(root->right, keys);
    }
    
    void InorderAdd(TreeNode* root, vector<int>& keys){
        if(root == NULL)
            return;
        
        InorderAdd(root->left, keys);
        int temp = 0;
        for(int i=0;i<keys.size();++i){
            if(keys[i]>root->val){
                temp+=keys[i];
            }
        }
        root->val += temp;
        InorderAdd(root->right, keys);
    }
};
