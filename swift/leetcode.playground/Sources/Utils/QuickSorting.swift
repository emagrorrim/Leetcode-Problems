import Foundation

public func quickSort<T: Comparable>(_ array: inout [T]) -> [T] {
    _quickSort(&array, start: 0, end: array.count - 1)
    return array
}

private func _quickSort<T: Comparable>(_ array: inout [T], start: Int, end: Int) {
    if start > end {
        return
    }
    let mid = (start + end) / 2
    let temp = array[mid]
    array[mid] = array[end]
    array[end] = temp
    var i = start
    var j = end - 1
    while i <= j {
        if array[i] <= array[end] {
            i += 1
        } else if array[i] > array[end] {
            let temp = array[i]
            array[i] = array[j]
            array[j] = temp
            j -= 1
        }
    }
    array[end] = array[i]
    array[i] = temp
    _quickSort(&array, start: start, end: i - 1)
    _quickSort(&array, start: i + 1, end: end)
}

/*
 var array = [3, 4, 5, 1, 8, 5, 73, 12, 734, 63, 4]
 quickSort(&array)
 */
