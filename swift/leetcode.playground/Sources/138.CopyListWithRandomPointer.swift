import Foundation

/*
 A linked list is given such that each node contains an additional random pointer which could point to any node in the list or null.

 Return a deep copy of the list.

 The Linked List is represented in the input/output as a list of n nodes. Each node is represented as a pair of [val, random_index] where:

 val: an integer representing Node.val
 random_index: the index of the node (range from 0 to n-1) where random pointer points to, or null if it does not point to any node.


 Example 1:

 Input: head = [[7,null],[13,0],[11,4],[10,2],[1,0]]
 Output: [[7,null],[13,0],[11,4],[10,2],[1,0]]
 Example 2:

 Input: head = [[1,1],[2,1]]
 Output: [[1,1],[2,1]]
 Example 3:

 Input: head = [[3,null],[3,0],[3,null]]
 Output: [[3,null],[3,0],[3,null]]
 Example 4:

 Input: head = []
 Output: []
 Explanation: Given linked list is empty (null pointer), so return null.


 Constraints:

 -10000 <= Node.val <= 10000
 Node.random is null or pointing to a node in the linked list.
 Number of Nodes will not exceed 1000.
 */

public class CopyListWithRandomPointer {

    public class Node {
        public var val: Int
        public var next: Node?
        public var random: Node?
        public init(_ val: Int) {
            self.val = val
            self.next = nil
            self.random = nil
        }
    }

    public init() {}

    public func copyRandomList(_ head: Node?) -> Node? {
        var visited = [ObjectIdentifier: Node]()
        var pointer = head
        while pointer != nil {
            guard let unwrappedPointer = pointer else {
                continue
            }
            visited[ObjectIdentifier(unwrappedPointer)] = Node(unwrappedPointer.val)
            pointer = unwrappedPointer.next
        }
        pointer = head
        while pointer != nil {
            guard let unwrappedPointer = pointer else {
                continue
            }
            visited[ObjectIdentifier(unwrappedPointer)]?.next = unwrappedPointer.next.flatMap { visited[ObjectIdentifier($0)] }
            visited[ObjectIdentifier(unwrappedPointer)]?.random = unwrappedPointer.random.flatMap { visited[ObjectIdentifier($0)] }
            pointer = unwrappedPointer.next
        }
        return head.flatMap { visited[ObjectIdentifier($0)] }
    }
}
