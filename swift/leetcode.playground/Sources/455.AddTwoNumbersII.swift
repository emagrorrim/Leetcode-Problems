import Foundation

public class AddTwoNumbersII {
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }

    public func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var stack1 = Stack<Int>()
        var stack2 = Stack<Int>()
        var pointer1 = l1
        var pointer2 = l2
        while pointer1 != nil {
            stack1.push(pointer1!.val)
            pointer1 = pointer1?.next
        }
        while pointer2 != nil {
            stack2.push(pointer2!.val)
            pointer2 = pointer2?.next
        }
        var carry = 0
        var head: ListNode? = nil
        while !stack1.isEmpty || !stack2.isEmpty {
            let sum = (stack1.pop() ?? 0) + (stack2.pop() ?? 0) + carry
            carry = sum / 10
            let last = head
            head = ListNode(sum % 10)
            head?.next = last
        }
        if carry != 0 {
            let last = head
            head = ListNode(carry)
            head?.next = last
        }
        return head
    }
}
