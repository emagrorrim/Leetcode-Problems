import Foundation

public func superEggDrop(_ K: Int, _ N: Int) -> Int {
    var map: [String: Int] = [:]
    var m = 0

    while (map[key(K, m)] ?? -1) < N {
        m += 1
        for k in 1...K {
            map[key(k, m)] = 1 + (map[key(k - 1, m - 1)] ?? 0) + (map[key(k, m - 1)] ?? 0);
        }
    }
    return m
}

func key(_ k: Int, _ m: Int) -> String {
    return "\(k)-\(m)"
}
