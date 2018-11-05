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
  TreeNode* sortedArrayToBST(vector<int>& nums) {
    if (nums.size() == 0) {
      return NULL;
    }
    if (nums.size() == 1) {
      return new TreeNode(nums[0]);
    }

    int middle = nums.size() / 2;
    TreeNode* root = new TreeNode(nums[middle]);
    vector<int> left(nums.begin(), nums.begin() + middle);
    vector<int> right(nums.begin() + middle + 1, nums.end());

    root->left = sortedArrayToBST(left);
    root->right = sortedArrayToBST(right);
    return root;
  }
};
