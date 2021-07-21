/*
 * @lc app=leetcode.cn id=1011 lang=swift
 *
 * [1011] 在 D 天内送达包裹的能力
 */

// @lc code=start
class Solution {
        func shipWithinDays(_ weights: [Int], _ D: Int) -> Int {
        var right = 0
        var left = weights[0]
        for i in 0..<weights.count {
            left = max(left, weights[i])
            right += weights[i]
        }
        while left < right {
            let mid = left + (right - left)/2
            if days(weights, mid) > D {
                left = mid + 1
            } else {
                right = mid
            }
        }
        return left
    }

    func days(_ weights: [Int], _ unit: Int) -> Int {
        var days = 1
        var curCount = 0
        for i in 0..<weights.count {
            if curCount + weights[i] > unit {
                curCount = 0
                days += 1
            }
            curCount += weights[i]
        }
        return days
    }
}
// @lc code=end

