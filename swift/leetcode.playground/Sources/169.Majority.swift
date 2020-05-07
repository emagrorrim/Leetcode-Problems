import Foundation

/*
 Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.

 You may assume that the array is non-empty and the majority element always exist in the array.

 Example 1:

 Input: [3,2,3]
 Output: 3
 Example 2:

 Input: [2,2,1,1,1,2,2]
 Output: 2
 */

public func majorityElement(_ nums: [Int]) -> Int {
    var map = [Int: Int]()
    nums.forEach { map[$0] = (map[$0] ?? 0) + 1 }
    return map.filter { $0.value > nums.count / 2 }.first?.key ?? 0
}

public func majorityElement2(_ nums: [Int]) -> Int {
    var times = 0
    var candidate: Int? = nil
    nums.forEach {
        if times == 0 {
            times += 1
            candidate = $0
        } else if $0 == candidate {
            times += 1
        } else {
            times -= 1
        }
    }
    return candidate ?? Int.min
}

/* 169.Majority
* majorityElement([3, 3, 4])
*/
