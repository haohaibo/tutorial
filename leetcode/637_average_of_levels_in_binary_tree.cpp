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
  vector<double> averageOfLevels(TreeNode* root) {
    vector<double> res;
    queue<TreeNode*> qt;
    qt.push(root);

    while (!qt.empty()) {
      long aver = 0, count = 0;
      queue<TreeNode*> temp;
      while (!qt.empty()) {
        ++count;
        TreeNode* pnode = qt.front();
        qt.pop();
        aver += pnode->val;
        if (pnode->left != NULL) {
          temp.push(pnode->left);
        }
        if (pnode->right != NULL) {
          temp.push(pnode->right);
        }
      }
      res.push_back((aver * 1.0) / count);
      qt = temp;
    }

    return res;
  }
};
