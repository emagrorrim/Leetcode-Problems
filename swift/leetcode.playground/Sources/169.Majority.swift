import Foundation

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
