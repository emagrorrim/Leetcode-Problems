import Foundation

/*
 Implement int sqrt(int x).

 Compute and return the square root of x, where x is guaranteed to be a non-negative integer.

 Since the return type is an integer, the decimal digits are truncated and only the integer part of the result is returned.

 Example 1:

 Input: 4
 Output: 2
 Example 2:

 Input: 8
 Output: 2
 Explanation: The square root of 8 is 2.82842..., and since
              the decimal part is truncated, 2 is returned.

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/sqrtx
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */

class MySqrt {
    func mySqrt(_ x: Int) -> Int {
        return Int(sqrt(Double(x), accuracy: 0.01))
    }

    func sqrt(_ x: Double, accuracy: Double) -> Double {
        print(accuracy)
        if x < 0 {
            fatalError("Invalid Parameter: x can not be less than 0")
        }
        if x == 0 || x == 1 { return x }
        var upper = x
        var lower = 0.0
        var mid = x / 2.0
        while abs(upper - lower) >= accuracy || mid * mid > x {
            if mid == x / mid {
                break
            } else if mid > x / mid {
                upper = mid
            } else {
                lower = mid
            }
            mid = lower + (upper - lower) / 2
        }
        print(lower, mid, upper)
        if Int(lower) * Int(lower) == Int(x) { return floor(lower) }
        if Int(upper) * Int(upper) == Int(x) { return floor(upper) }
        return mid * mid > x ? lower : mid
    }
}
