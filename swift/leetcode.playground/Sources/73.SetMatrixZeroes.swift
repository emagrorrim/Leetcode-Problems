import Foundation

func setZeroes(_ matrix: inout [[Int]]) {
    var zeroLines = [Int]()
    var zeroColumns = [Int]()
    matrix.enumerated().makeIterator().forEach { (i, rows) in
        rows.enumerated().makeIterator().forEach { (j, columns) in
            if matrix[i][j] == 0 {
                zeroLines.append(i)
                zeroColumns.append(j)
            }
        }
    }
    matrix.enumerated().makeIterator().forEach { (i, rows) in
        rows.enumerated().makeIterator().forEach { (j, columns) in
            if zeroLines.contains(i) || zeroColumns.contains(j) {
                matrix[i][j] = 0
            }
        }
    }
}
