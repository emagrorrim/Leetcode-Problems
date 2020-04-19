import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else {
        return []
    }
    var queue: [TreeNode] = [root]
    var result: [[Int]] = []
    while !queue.isEmpty {
        var level = [Int]()
        let length = queue.count
        for _ in 0..<length {
            level.append(queue[0].val)
            queue[0].left.flatMap { queue.append($0) }
            queue[0].right.flatMap { queue.append($0) }
            queue.remove(at: 0)
        }
        result.append(level)
    }
    return result
}
