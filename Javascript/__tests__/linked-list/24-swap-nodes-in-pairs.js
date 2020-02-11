/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */
/**
 * @param {ListNode} head
 * @return {ListNode}
 */
var swapPairs = function (head) {
  if (head === null || head.next === null) {
    return head;
  }
  const doneHead = swapPairs(head.next.next);
  const next = head.next;
  next.next = head;
  head.next = doneHead;
  return next;
};