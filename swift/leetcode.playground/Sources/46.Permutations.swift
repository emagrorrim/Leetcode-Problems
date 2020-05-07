import Foundation

/*
 Given a collection of distinct integers, return all possible permutations.

 Example:

 Input: [1,2,3]
 Output:
 [
   [1,2,3],
   [1,3,2],
   [2,1,3],
   [2,3,1],
   [3,1,2],
   [3,2,1]
 ]
 */

func permute(_ nums: [Int]) -> [[Int]] {
    return _permute(nums, prefix: [])
}

func _permute(_ nums: [Int], prefix: [Int]) -> [[Int]] {
    if nums.count <= 0 {
        return [prefix]
    }
    return nums.enumerated().makeIterator().reduce([]) {
        return $0 + _permute(nums.removing(at: $1.offset), prefix: prefix + [$1.element])
    }
}
