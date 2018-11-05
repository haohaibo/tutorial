/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val; *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
 public:
  ListNode* insertionSortList(ListNode* head) {
    if (head == NULL) {
      return head;
    }
    ListNode* new_head = new ListNode(0);
    new_head->next = head;
    ListNode* cur = head;
    ListNode* pre = new_head;
    while (cur) {
      if (cur->next && cur->next->val < cur->val) {
        while (pre->next->val < cur->next->val) {
          pre = pre->next;
        }
        ListNode* temp = pre->next;
        pre->next = cur->next;
        cur->next = cur->next->next;
        pre->next->next = temp;

        pre = new_head;
      } else {
        cur = cur->next;
      }
    }
    ListNode* res = new_head->next;
    delete new_head;
    return res;
  }
};
