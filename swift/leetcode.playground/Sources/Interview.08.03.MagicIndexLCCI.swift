import Foundation

public class MagicIndexLCCI {
    public init() {}

    public func findMagicIndex(_ nums: [Int]) -> Int {
        return findMagicIndex(nums, 0, nums.count - 1)
    }

    public func findMagicIndex(_ nums: [Int], _ start: Int, _ end: Int) -> Int {
        if nums.count == 0 || start > end {
            return -1
        }
        let mid = (start + end) / 2
        let left = findMagicIndex(nums, start, mid - 1)
        if left != -1 {
            return left
        } else if mid == nums[mid] {
            return mid
        } else {
            return findMagicIndex(nums, mid + 1, end)
        }
    }

    public func findMagicIndex_1(_ nums: [Int]) -> Int {
        for (i, num) in nums.enumerated() {
            if i == num {
                return i
            }
        }
        return -1
    }
}
