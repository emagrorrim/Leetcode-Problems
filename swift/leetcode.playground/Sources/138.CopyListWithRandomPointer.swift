import Foundation

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
