/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */
/**
 * @param {ListNode} l1
 * @param {ListNode} l2
 * @return {ListNode}
 */

class ListNode {
    constructor(val) {
    this.val = val;
    this.next = null;
  }

  appending(val) {
    this.next = new ListNode(val);
    return this.next;
  }
}

var addTwoNumbers = function (l1, l2) {
  return add(l1, l2, 0);
};

var add = (n1, n2, carry) => {
  if (n1 == null) {
    return carry ? add(new ListNode(carry), n2, 0) : n2;
  }

  if (n2 == null) {
    return carry ? add(new ListNode(carry), n1, 0) : n1;
  }

  const result = n1.val + n2.val + carry;
  const currentNode = new ListNode(result % 10);
  const nextCarry = parseInt(result / 10);
  currentNode.next = add(n1.next, n2.next, nextCarry);
  return currentNode;
};

describe("addTwoNumbers(l1, l2)", () => {
  describe("given input: (2 -> 4 -> 3) + (5 -> 6 -> 4)", () => {
    it("returns (7 -> 0 -> 8)", () => {
      const l1 = new ListNode(2);
      l1.appending(4).appending(3);
      const l2 = new ListNode(5);
      l2.appending(6).appending(4);
      const expectedResult = new ListNode(7);
      expectedResult.appending(0).appending(8);
      expect(addTwoNumbers(l1, l2)).toEqual(expectedResult)
    });
  });
});

