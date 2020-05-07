import Foundation

/*
 Given a non-empty binary tree, find the maximum path sum.

 For this problem, a path is defined as any sequence of nodes from some starting node to any node in the tree along the parent-child connections. The path must contain at least one node and does not need to go through the root.

 Example 1:

 Input: [1,2,3]

        1
       / \
      2   3

 Output: 6
 Example 2:

 Input: [-10,9,20,null,null,15,7]

    -10
    / \
   9  20
     /  \
    15   7

 Output: 42
 */

public class BinaryTreeMaximumPathSum {
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

    public init() {}

    func maxPathSum(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }

        let maxPathSumFromLeft = maxPathSumFromNode(root.left)
        let maxPathSumFromRight = maxPathSumFromNode(root.right)
        let maxSum = root.val
            + (maxPathSumFromLeft > 0 ? maxPathSumFromLeft : 0)
            + (maxPathSumFromRight > 0 ? maxPathSumFromRight : 0)
        let leftMaxSum = maxPathSum(root.left)
        let rightMaxSum = maxPathSum(root.right)
        var results: [Int] = [maxSum]
        root.left.flatMap { _ in results.append(leftMaxSum) }
        root.right.flatMap { _ in results.append(rightMaxSum) }

        return results.max() ?? 0
    }

    func maxPathSumFromNode(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        let maxPath = max(maxPathSumFromNode(root.left), maxPathSumFromNode(root.right))
        return root.val + (maxPath > 0 ? maxPath : 0)
    }
}
