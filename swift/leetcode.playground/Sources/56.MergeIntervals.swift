import Foundation

/*
 Given a collection of intervals, merge all overlapping intervals.

 Example 1:

 Input: [[1,3],[2,6],[8,10],[15,18]]
 Output: [[1,6],[8,10],[15,18]]
 Explanation: Since intervals [1,3] and [2,6] overlaps, merge them into [1,6].
 Example 2:

 Input: [[1,4],[4,5]]
 Output: [[1,5]]
 Explanation: Intervals [1,4] and [4,5] are considered overlapping.
 NOTE: input types have been changed on April 15, 2019. Please reset to default code definition to get new method signature.
 */

func merge(_ intervals: [[Int]]) -> [[Int]] {
    if intervals.count <= 1 {
        return intervals
    }
    let sorted = intervals.sorted { $0[0] < $1[0] }
    var result = [[Int]]()
    var currentLower = sorted[0][0]
    var currentHigher = sorted[0][1]
    for i in 1..<sorted.count {
        if sorted[i][0] > currentHigher {
            result.append([currentLower, currentHigher])
            currentLower = sorted[i][0]
            currentHigher = sorted[i][1]
        } else {
            currentLower = min(sorted[i][0], currentLower)
            currentHigher = max(sorted[i][1], currentHigher)
        }
    }
    result.append([currentLower, currentHigher])
    return result
}

/*
 merge([[1,3],[2,6],[8,10],[15,18]])
 merge([[2,6],[1,3],[8,10],[15,18]])
 merge([[0,4],[0,1]])
 */
