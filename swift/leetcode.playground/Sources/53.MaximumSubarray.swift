import Foundation

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
