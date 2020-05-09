import Foundation

/*
 The n-queens puzzle is the problem of placing n queens on an n×n chessboard such that no two queens attack each other.

 Given an integer n, return all distinct solutions to the n-queens puzzle.

 Each solution contains a distinct board configuration of the n-queens' placement, where 'Q' and '.' both indicate a queen and an empty space respectively.

 Example:

 Input: 4
 Output: [
  [".Q..",  // Solution 1
   "...Q",
   "Q...",
   "..Q."],

  ["..Q.",  // Solution 2
   "Q...",
   "...Q",
   ".Q.."]
 ]
 Explanation: There exist two distinct solutions to the 4-queens puzzle as shown above.
 */

class NQueens {
    func solveNQueens(_ n: Int) -> [[String]] {
        var queenPositions = [[Int]]()
        posite(n, row: 0, cols: [], diagonals: [], antiDiagonals: [], queenPositions: &queenPositions)
        return generateNQueens(n, queenPositions: queenPositions)
    }

    func posite(_ n: Int, row: Int, cols: [Int], diagonals: Set<Int>, antiDiagonals: Set<Int>, queenPositions: inout [[Int]]) {
        if row >= n {
            queenPositions.append(cols)
            return
        }
        for col in 0..<n {
            if cols.contains(col) || diagonals.contains(row - col) || antiDiagonals.contains(row + col) {
                 continue
            }
            posite(n, row: row + 1, cols: cols + [col], diagonals: diagonals.union([row - col]), antiDiagonals: antiDiagonals.union([row + col]), queenPositions: &queenPositions)
        }
    }

    func generateNQueens(_ n: Int, queenPositions: [[Int]]) -> [[String]] {
        return queenPositions.map {
            $0.map { col in
                var row = Array(repeating: ".", count: n)
                row[col] = "Q"
                return row.joined()
            }
        }
    }
}
