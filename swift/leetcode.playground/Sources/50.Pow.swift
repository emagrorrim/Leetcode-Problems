import Foundation

/*
 Implement pow(x, n), which calculates x raised to the power n (xn).

 Example 1:

 Input: 2.00000, 10
 Output: 1024.00000
 Example 2:

 Input: 2.10000, 3
 Output: 9.26100
 Example 3:

 Input: 2.00000, -2
 Output: 0.25000
 Explanation: 2-2 = 1/22 = 1/4 = 0.25
 Note:

 -100.0 < x < 100.0
 n is a 32-bit signed integer, within the range [−231, 231 − 1]
 */

public func myPow(_ x: Double, _ n: Int) -> Double {
    if n < 0 {
        return 1 / myPow(x, -n);
    }
    if n == 0 {
        return 1
    }
    return n % 2 == 0 ? myPow(x * x, n / 2) : x * myPow(x * x, (n - 1) / 2)
}

public func myPow2(_ x: Double, _ n: Int) -> Double {
    var localN = n < 0 ? -n : n
    var localX = n < 0 ? 1/x : x
    var result: Double = 1
    while localN >= 1 {
        (result, localX, localN) = localN % 2 == 0
            ? (result, localX * localX, localN / 2)
            : (result * localX, localX * localX, (localN - 1) / 2)
    }
    return result
}

/* 50.Pow
* myPow(0.00001, 2147483647)
* myPow(2, 10)
*/
