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
    bool isSymmetric(TreeNode* root) {
        if(root==NULL)
            return true;
        return sym(root->left,root->right);
    }
    
    bool sym(TreeNode* p, TreeNode* q){
        if(p==NULL && q==NULL){
            return true;
        }else{
            if(p==NULL || q==NULL){
                return false;
            }else{
                if(p->val != q->val){
                    return false;
                }else{
                    return sym(p->left,q->right)&&sym(p->right,q->left);
                }
            }
        }
    }
};
