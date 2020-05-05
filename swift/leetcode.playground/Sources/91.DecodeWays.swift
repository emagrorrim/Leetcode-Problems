import Foundation

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
