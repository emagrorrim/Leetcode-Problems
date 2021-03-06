import Foundation

/*
 Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

 For example, given n = 3, a solution set is:

 [
   "((()))",
   "(()())",
   "(())()",
   "()(())",
   "()()()"
 ]
 */

public func generateParenthesis(_ n: Int) -> [String] {
    return generateParenthesis("", left: n, right: n)
}

func generateParenthesis(_ cur: String, left: Int, right: Int) -> [String] {
    if left == 0 && right == 0 {
        return cur == "" ? [] : [cur]
    } else if left == 0 && right > 0 {
        return generateParenthesis("\(cur))", left: left, right: right - 1)
    }
    if left == right {
        return generateParenthesis("\(cur)(", left: left - 1, right: right)
    } else {
        return generateParenthesis("\(cur)(", left: left - 1, right: right) + generateParenthesis("\(cur))", left: left, right: right - 1)
    }
}
