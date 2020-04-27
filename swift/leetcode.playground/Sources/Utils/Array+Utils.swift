import Foundation

public extension Array {
    public func removing(at index: Int) -> Array {
        var copy = self
        copy.remove(at: index)
        return copy
    }
}
