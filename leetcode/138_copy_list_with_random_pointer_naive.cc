/*
 *
 *      Filename: 138_copy_list_with_random_pointer.cc
 *
 *        Author: Haibo Hao
 *        Email : haohaibo@ncic.ac.cn
 *   Description: ---
 *        Create: 2017-11-20 21:21:35
 * Last Modified: 2017-11-20 21:21:35
 **/
/**
 * Definition for singly-linked list with a random pointer.
 * struct RandomListNode {
 *     int label;
 *     RandomListNode *next, *random;
 *     RandomListNode(int x) : label(x), next(NULL), random(NULL) {}
 * };
 */
class Solution {
 public:
  RandomListNode *copyRandomList(RandomListNode *head) {
    if (head == NULL) return NULL;
    RandomListNode *newhead = new RandomListNode(head->label);
    RandomListNode *p = newhead;
    RandomListNode *q = head->next;
    while (q) {
      RandomListNode *temp = new RandomListNode(q->label);
      p->next = temp;
      p = temp;
      q = q->next;
    }

    q = head;
    p = newhead;
    while (q) {
      RandomListNode *t1 = head, *t2 = newhead;
      while (t1 != q->random) {
        t1 = t1->next;
        t2 = t2->next;
      }
      p->random = t2;
      q = q->next;
      p = p->next;
    }
    return newhead;
  }
};
