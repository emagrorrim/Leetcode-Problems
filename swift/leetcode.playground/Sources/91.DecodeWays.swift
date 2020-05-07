import Foundation

/*
 A message containing letters from A-Z is being encoded to numbers using the following mapping:

 'A' -> 1
 'B' -> 2
 ...
 'Z' -> 26
 Given a non-empty string containing only digits, determine the total number of ways to decode it.

 Example 1:

 Input: "12"
 Output: 2
 Explanation: It could be decoded as "AB" (1 2) or "L" (12).
 Example 2:

 Input: "226"
 Output: 3
 Explanation: It could be decoded as "BZ" (2 26), "VF" (22 6), or "BBF" (2 2 6).
 */

class DecodeWays {
    var cache = [String: Int]()

    func numDecodings(_ s: String) -> Int {
        guard s.first != "0" else {
            return 0
        }
        guard s.count > 1 else {
            return 1
        }
        if let r = cache[s] {
            return r
        }
        if (Int(s.prefix(2)) ?? 0) > 0 && (Int(s.prefix(2)) ?? 0) <= 26 {
            let r = numDecodings(String(s.dropFirst())) + numDecodings(String(s.dropFirst().dropFirst()))
            cache[s] = r
            return r
        } else {
            let r = numDecodings(String(s.dropFirst()))
            cache[s] = r
            return r
        }
    }
}
