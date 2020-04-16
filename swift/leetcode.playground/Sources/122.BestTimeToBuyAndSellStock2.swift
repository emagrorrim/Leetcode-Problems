import Foundation

public func maxProfit(_ prices: [Int]) -> Int {
    if prices.count == 0 {
        return 0
    }
    var valley: Int = prices[0]
    var peak: Int = -1
    var profit = 0
    for i in 0..<prices.count {
        if peak > valley && prices[i] < peak {
            profit += (peak - valley)
            valley = prices[i]
            peak = -1
        } else if prices[i] <= valley {
            valley = prices[i]
        } else if prices[i] > peak {
            peak = prices[i]
        }
    }
    if (peak != -1 && valley != -1) {
        profit += (peak - valley)
    }
    return profit
}

public func maxProfit2(_ prices: [Int]) -> Int {
    if prices.count == 0 {
        return 0
    }
    var yesterday: Int = prices[0]
    var profit = 0
    for i in 1..<prices.count {
        if prices[i] > yesterday {
            profit += prices[i] - yesterday
        }
        yesterday = prices[i]
    }
    return profit
}

/*
    expect(maxProfit([7,1,5,3,6,4])).toEqual(7)
    expect(maxProfit([1,2,3,4,5])).toEqual(4)
    expect(maxProfit([7,6,4,3,1])).toEqual(0)
    expect(maxProfit([8,6,4,3,3,2,3,5,8,3,8,2,6])).toEqual(15)
 */
