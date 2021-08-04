/*
 * @lc app=leetcode.cn id=45 lang=swift
 *
 * [45] 跳跃游戏 II
 */

// @lc code=start
class Solution {
    func jump(_ nums: [Int]) -> Int {

        let n = nums.count

        var dp = Array(repeating: 0, count: n)

        var j = 0
        for i in (1..<n) {
            while (j + nums[j] < i) {
                j += 1
            }
            dp[i] = dp[j] + 1
        }
        return dp[n-1]
    }
}
