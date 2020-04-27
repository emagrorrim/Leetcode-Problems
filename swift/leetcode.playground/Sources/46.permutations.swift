import Foundation

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
