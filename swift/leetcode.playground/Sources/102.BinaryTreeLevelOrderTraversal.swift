import Foundation

/*
 Given a binary tree, return the level order traversal of its nodes' values. (ie, from left to right, level by level).

 For example:
 Given binary tree [3,9,20,null,null,15,7],
     3
    / \
   9  20
     /  \
    15   7
 return its level order traversal as:
 [
   [3],
   [9,20],
   [15,7]
 ]
 */

class Solution {
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
}
