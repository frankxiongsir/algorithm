/*
 * @lc app=leetcode.cn id=70 lang=swift
 *
 * [70] 爬楼梯
 */

// @lc code=start
class Solution {
    func climbStairs(_ n: Int) -> Int {
        
        var fx = Array(repeating: 0, count: n+1)

        fx[0] = 1
        fx[1] = 1
        /// f(x) = f(x-1) + f(x-2)
        for i in 2..<n+1 {
            fx[i] = fx[i-1] + fx[i-2]
        }
        return fx[n]
    }
}
// @lc code=end

