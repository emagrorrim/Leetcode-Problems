import Foundation

public struct BinaryTree<T: Comparable> {
    public class Node {
        public var left: Node?
        public var right: Node?
        public var value: T

        public init(_ val: T) {
            self.value = val
        }
    }

    public var root: Node?

    public init() {}

    public init(_ array: [T]) {
        let sorted = array.sorted()
        self.init(sorted: sorted, start: 0, end: sorted.count - 1)
    }

    private init(sorted: [T], start: Int, end: Int) {
        if start > end {
            return
        }
        let center = (start + end) / 2
        let value = sorted[center]
        root = Node(value)
        root?.left = BinaryTree(sorted: sorted, start: start, end: center - 1).root
        root?.right = BinaryTree(sorted: sorted, start: center + 1, end: end).root
    }

    public func inOrderTraversal() -> [T] {
        return inOrderTraversal(from: root)
    }

    private func inOrderTraversal(from node: Node?) -> [T] {
        guard let node = node else {
            return []
        }
        return inOrderTraversal(from: node.left) + [node.value] + inOrderTraversal(from: node.right)
    }

    public func preOrderTraversal() -> [T] {
        return preOrderTraversal(from: root)
    }

    private func preOrderTraversal(from node: Node?) -> [T] {
        guard let node = node else {
            return []
        }
        return [node.value] + preOrderTraversal(from: node.left) + preOrderTraversal(from: node.right)
    }

    public func postOrderTraversal() -> [T] {
        return postOrderTraversal(from: root)
    }

    private func postOrderTraversal(from node: Node?) -> [T] {
        guard let node = node else {
            return []
        }
        return postOrderTraversal(from: node.left) + postOrderTraversal(from: node.right) + [node.value]
    }

    public func depthFirstTraversal() -> [T] {
        return preOrderTraversal()
    }

    public func breadthFirstTraversal() -> [T] {
        return (root.flatMap { [$0.value] } ?? []) + breadthFirstTraversal(from: root)
    }

    private func breadthFirstTraversal(from node: Node?) -> [T] {
        guard let node = node else {
            return []
        }
        var queue: [T] = []
        (node.left?.value).flatMap { queue.append($0) }
        (node.right?.value).flatMap { queue.append($0) }
        return queue + breadthFirstTraversal(from: node.left) + breadthFirstTraversal(from: node.right)
    }

    public func inOrderTraversalWithoutRecurse() -> [T] {
        var result: [T] = []
        var stack = Stack<Node>()
        guard let root = root else {
            return []
        }
        var cur: Node? = root
        while cur != nil || !stack.isEmpty {
            while cur != nil {
                cur.flatMap { stack.push($0) }
                cur = cur?.left
            }
            let node = stack.pop()
            node.flatMap { result.append($0.value) }
            cur = node?.right
        }
        return result
    }
}

/*
 let bt = BinaryTree<Int>([2, 5, 21, 3, 6, 9, 12, 738])
 bt.inOrderTraversal()
 bt.preOrderTraversal()
 bt.postOrderTraversal()
 bt.depthFirstTraversal()
 bt.breadthFirstTraversal()
 bt.inOrderTraversalWithoutRecurse()
 */
