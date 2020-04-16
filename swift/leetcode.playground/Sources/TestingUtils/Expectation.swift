import Foundation

public class Expectation<T: Comparable> {
    private let val: T

    init(_ val: T) {
        self.val = val
    }

    public func toEqual(_ anotherVal: T) -> String {
        return val == anotherVal ? "✅" : "❌"
    }
}

public func expect<T: Comparable>(_ val: T) -> Expectation<T> {
    return Expectation<T>(val)
}
