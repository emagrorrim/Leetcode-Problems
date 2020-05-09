import Foundation

/*
 Given a binary tree, find its maximum depth.

 The maximum depth is the number of nodes along the longest path from the root node down to the farthest leaf node.

 Note: A leaf is a node with no children.

 Example:

 Given binary tree [3,9,20,null,null,15,7],

     3
    / \
   9  20
     /  \
    15   7
 return its depth = 3.
 */

class MinAndMaxDepthOfBinaryTree {
    class TreeNode {
        var val: Int
        var left: TreeNode?
        var right: TreeNode?

        init(_ val: Int) {
            self.val = val
            self.left = nil
            self.right = nil
        }
    }
    func maxDepthUsingRecursion(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        return max(maxDepthUsingRecursion(root.left), maxDepthUsingRecursion(root.right))
    }

    func maxDepthUsingBFS(_ root: TreeNode?) -> Int {
        return minAndmaxDepthUsingBFS(root).max
    }

    func minDepthUsingBFS(_ root: TreeNode?) -> Int {
        return minAndmaxDepthUsingBFS(root).min
    }

    func minAndmaxDepthUsingBFS(_ root: TreeNode?) -> (min: Int, max: Int) {
        guard let root = root else {
            return (0, 0)
        }
        var queue = [root]
        var minDepth = 0
        var maxDepth = 0
        var depth = 0
        while queue.count > 0 {
            depth += 1
            let length = queue.count
            for _ in 0..<length {
                let node = queue[0]
                if node.left == nil && node.right == nil {
                    maxDepth = max(maxDepth, depth)
                    minDepth = minDepth == 0 ? depth : min(minDepth, depth)
                }
                queue.remove(at: 0)
                node.left.flatMap { queue.append($0) }
                node.right.flatMap { queue.append($0) }
            }
        }
        return (min: minDepth, max: maxDepth)
    }

    func improvedMinDepthUsingBFS(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        var queue = [root]
        var depth = 0
        while queue.count > 0 {
            depth += 1
            let length = queue.count
            for _ in 0..<length {
                let node = queue[0]
                if node.left == nil && node.right == nil {
                    return depth
                }
                queue.remove(at: 0)
                node.left.flatMap { queue.append($0) }
                node.right.flatMap { queue.append($0) }
            }
        }
        return 0
    }
}
