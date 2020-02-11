/**
 * 141.
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} head
 * @return {boolean}
 */
var hasCycle = function (head) {
  if (head === null) {
    return false;
  }
  let slow = head;
  let fast = head;
  while (fast && slow) {
    if (fast.next === null) {
      return false;
    }
    fast = fast.next.next;
    slow = slow.next;
    if (fast === slow) {
      return true;
    }
  }
  return false;
};

/**
 * 142.
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
var detectCycle = function (head) {
  let array = new Set();
  while (head) {
    if (array.has(head)) {
      return head;
    }
    array.add(head);
    head = head.next;
  }
  return null;
};