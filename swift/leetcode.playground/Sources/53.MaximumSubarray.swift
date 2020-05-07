import Foundation

/*
 Given an integer array nums, find the contiguous subarray (containing at least one number) which has the largest sum and return its sum.

 Example:

 Input: [-2,1,-3,4,-1,2,1,-5,4],
 Output: 6
 Explanation: [4,-1,2,1] has the largest sum = 6.
 Follow up:

 If you have figured out the O(n) solution, try coding another solution using the divide and conquer approach, which is more subtle.
 */

func maxSubArray(_ nums: [Int]) -> Int {
    var maximum = Int.min
    var sum = 0
    nums.forEach {
        sum += $0
        maximum = max(sum, maximum)
        sum = max(sum, 0)
    }
    return maximum
}
