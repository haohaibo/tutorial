/**
 * Definition for singly-linked list.
 * struct ListNode {
 *     int val;
 *     ListNode *next;
 *     ListNode(int x) : val(x), next(NULL) {}
 * };
 */
class Solution {
public:
    bool hasCycle(ListNode *head) {
        set<ListNode*> nodes;
        ListNode* p = head;
        if(p==NULL){
            return false;
        }
        bool flag=false;
        while(p!=NULL){
            if(nodes.find(p)==nodes.end()){
                nodes.insert(p);
                p=p->next;
            }else{
                flag=true;
                break;
            }
        }
        return flag;
    }
};
