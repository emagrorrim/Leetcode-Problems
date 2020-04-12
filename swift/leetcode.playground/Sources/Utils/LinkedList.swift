import Foundation

public struct LinkedList<T> {
    public class Node {
        public var val: T
        public var next: Node?

        init(_ val: T) {
            self.val = val
        }
    }

    var start: Node?

    public init() {}

    public mutating func insert(val: T, atIndex index: Int) {
        let (pre, cur) = _searchNode(at: index)
        if cur == nil {
            pre?.next = Node(val)
        } else {
            let node = Node(val)
            node.next = cur
            pre?.next = node
        }
    }

    public mutating func append(_ val: T) {
        guard let start = start else {
            self.start = Node(val)
            return
        }
        var cur: Node = start
        while cur.next != nil {
            cur = cur.next!
        }
        cur.next = Node(val)
    }

    public func remove(_ node: Node) {
        let (pre, cur) = _search(node)
        guard let foundNode = cur else {
            return
        }
        pre?.next = foundNode.next
        foundNode.next = nil
    }

    public func search(_ node: Node) -> Node? {
        return _search(node).cur
    }

    public func searchNode(at index: Int) -> Node? {
        return _searchNode(at: index).cur
    }

    private func _search(_ node: Node) -> (pre: Node?, cur: Node?) {
        guard let start = start else {
            return (nil, nil)
        }
        var cur: Node = start
        while cur.next != nil && cur.next !== node {
            cur = cur.next!
        }
        return (cur, cur.next)
    }

    private func _searchNode(at index: Int) -> (pre: Node?, cur: Node?) {
        guard let start = start else {
            return (nil, nil)
        }
        var i = 0
        var cur: Node = start
        while cur.next != nil && i < index - 1 {
            cur = cur.next!
            i += 1
        }
        return (cur, cur.next)
    }

    public var description: String {
        var description = ""
        var cur = self.start
        while cur != nil {
            description += cur === self.start ? "(\(cur!.val))" : " => (\(cur!.val))"
            cur = cur?.next
        }
        return "[\(description)]"
    }
}

/*
 var ls = LinkedList<Int>()
 ls.append(1)
 ls.append(2)
 print(ls.description)
 ls.insert(val: 3, atIndex: 1)
 print(ls.description)
 ls.insert(val: 4, atIndex: 1)
 print(ls.description)
 ls.insert(val: 5, atIndex: 100)
 print(ls.description)
 ls.remove(ls.searchNode(at: 1)!)
 print(ls.description)
 */
