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
        Inorder(root);
        return root;
    }
    int great_sum=0;
    void Inorder(TreeNode* root){
        if(root == NULL){
            return; 
        }
        
        Inorder(root->right);
        great_sum += root->val;
        root->val = great_sum;
        Inorder(root->left);
    }
};
