import Foundation

public struct Stack<T> {
  private var storage: [T] = []

  public mutating func push(_ val: T) {
    storage.append(val)
  }

  public mutating func pop() -> T? {
    guard let last = storage.last else {
      return nil
    }
    storage = storage.dropLast()
    return last
  }

  public var top: T? {
    return storage.last
  }

  public var isEmpty: Bool {
    return storage.count == 0
  }
}
