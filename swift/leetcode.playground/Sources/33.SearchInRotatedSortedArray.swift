import Foundation

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
