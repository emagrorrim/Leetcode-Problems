import Foundation

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
