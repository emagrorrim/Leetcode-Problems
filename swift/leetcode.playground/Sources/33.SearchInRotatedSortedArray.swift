import Foundation

/*
 Suppose an array sorted in ascending order is rotated at some pivot unknown to you beforehand.

 (i.e., [0,1,2,4,5,6,7] might become [4,5,6,7,0,1,2]).

 You are given a target value to search. If found in the array return its index, otherwise return -1.

 You may assume no duplicate exists in the array.

 Your algorithm's runtime complexity must be in the order of O(log n).

 Example 1:

 Input: nums = [4,5,6,7,0,1,2], target = 0
 Output: 4
 Example 2:

 Input: nums = [4,5,6,7,0,1,2], target = 3
 Output: -1
 */

func search(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count > 0 else {
        return -1
    }
    return _search(nums, target, 0, nums.count - 1)
}

func _search(_ nums: [Int], _ target: Int, _ start: Int, _ end: Int) -> Int {
    if start > end {
        return -1
    }
    let mid = end - start < 0 ? (end + start + nums.count) / 2 % nums.count : (end + start) / 2
    if nums[mid] == target {
        return mid
    } else if nums[mid] < nums[end] {
        if nums[mid] < target && nums[end] >= target {
            return _search(nums, target, mid + 1, end)
        } else {
            return _search(nums, target, start, mid - 1)
        }
    } else {
        if nums[mid] > target && nums[start] <= target {
            return _search(nums, target, start, mid - 1)
        } else {
            return _search(nums, target, mid + 1, end)
        }
    }
}
