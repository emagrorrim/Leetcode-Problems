import Foundation

class MergeTwoLists {
    public class ListNode {
        public var val: Int
        public var next: ListNode?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
        }
    }

    public func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard l1 != nil, l2 != nil else {
            return l1 ?? l2
        }
        var l1Cur = l1
        var l2Cur = l2
        let lr: ListNode? = l1!.val < l2!.val ? l1 : l2
        var lrCur: ListNode? = nil
        while l1Cur != nil && l2Cur != nil {
            if lrCur == nil {
                if l1Cur!.val < l2Cur!.val {
                    lrCur = l1Cur
                    l1Cur = l1Cur?.next
                } else {
                    lrCur = l2Cur
                    l2Cur = l2Cur?.next
                }
                continue
            }
            if l1Cur!.val < l2Cur!.val {
                lrCur?.next = l1Cur
                lrCur = lrCur?.next
                l1Cur = l1Cur?.next
            } else {
                lrCur?.next = l2Cur
                lrCur = lrCur?.next
                l2Cur = l2Cur?.next
            }
        }
        lrCur?.next = l1Cur ?? l2Cur
        return lr
    }
}
