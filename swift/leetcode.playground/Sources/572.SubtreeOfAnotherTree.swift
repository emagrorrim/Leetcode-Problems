import Foundation

/*
 Given two non-empty binary trees s and t, check whether tree t has exactly the same structure and node values with a subtree of s. A subtree of s is a tree consists of a node in s and all of this node's descendants. The tree s could also be considered as a subtree of itself.

 Example 1:
 Given tree s:

      3
     / \
    4   5
   / \
  1   2
 Given tree t:
    4
   / \
  1   2
 Return true, because t has the same structure and node values with a subtree of s.


 Example 2:
 Given tree s:

      3
     / \
    4   5
   / \
  1   2
     /
    0
 Given tree t:
    4
   / \
  1   2
 Return false.
 */

class Solution {
    public class TreeNode {
        public var val: Int
        public var left: TreeNode?
        public var right: TreeNode?
        public init() { self.val = 0; self.left = nil; self.right = nil; }
        public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
        public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
            self.val = val
            self.left = left
            self.right = right
        }
    }

    var treePreOrderedDescriptions = [ObjectIdentifier: String]()
    var treeInOrderedDescriptions = [ObjectIdentifier: String]()

    func isSubtree(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if s == nil && t == nil {
            return true
        }
        if let s = s, let t = t {
            let preOrderS = preOrderTraversal(from: s).joined(separator: "-")
            let preOrderT = preOrderTraversal(from: t).joined(separator: "-")
            return preOrderS.contains(preOrderT)
        }
        return false
    }

    func isSubtree_2(_ s: TreeNode?, _ t: TreeNode?) -> Bool {
        if s == nil && t == nil {
            return true
        }
        if let s = s, let t = t {
            return describe(node: s) == describe(node: t)
                || isSubtree(s.left, t)
                || isSubtree(s.right, t)
        }
        return false
    }

    private func preOrderTraversal(from node: TreeNode?) -> [String] {
        guard let node = node else {
            return ["NULL"]
        }
        return ["\(node.val)"] + preOrderTraversal(from: node.left) + preOrderTraversal(from: node.right)
    }

    private func inOrderTraversal(from node: TreeNode?) -> [String] {
        guard let node = node else {
            return ["NULL"]
        }
        return inOrderTraversal(from: node.left) + ["\(node.val)"] + inOrderTraversal(from: node.right)
    }

    func describe(node: TreeNode?) -> String {
        guard let node = node else {
            return ""
        }
        let preOrder = treePreOrderedDescriptions[ObjectIdentifier(node)]
            ?? preOrderTraversal(from: node).map{ "\($0)" }.joined(separator: "-")
        treePreOrderedDescriptions[ObjectIdentifier(node)] = preOrder
        let inOrder = treeInOrderedDescriptions[ObjectIdentifier(node)]
            ?? inOrderTraversal(from: node).map{ "\($0)" }.joined(separator: "-")
        treeInOrderedDescriptions[ObjectIdentifier(node)] = inOrder
        return "\(preOrder)+\(inOrder)"
    }
}
