/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */
/**
 * @param {ListNode} head
 * @param {number} k
 * @return {ListNode}
 */
var reverseKGroup = function (head, k) {
  let nextHead = head;
  let tail = head;
  for (let i = 0; i < k; ++i) {
    if (nextHead === null) {
      return head;
    }
    tail = nextHead;
    nextHead = nextHead.next;
  }
  tail.next = null;
  const newHead = reverseList(head);
  head.next = reverseKGroup(nextHead, k);
  head = tail;
  return head;
};

var reverseList = function (head) {
  if (head === null || head.next === null) {
    return head;
  }
  let tail = reverseList(head.next);
  head.next.next = head;
  head.next = null;
  return tail;
};
