import Foundation

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
    var minDepth = 0
    var maxDepth = 0
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
