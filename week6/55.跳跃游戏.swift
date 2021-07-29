/*
 * @lc app=leetcode.cn id=55 lang=swift
 *
 * [55] 跳跃游戏
 */

// @lc code=start
class Solution {
    func canJump(_ nums: [Int]) -> Bool {

        var dist = 0

        for (index, item) in nums.enumerated() {
            
            /// 当前位置小于能到达最远位置
            if (index <= dist) {
                /// 更新最远能到达位置
                dist = max(dist, index + item)
                /// 最远能到达位置出界，则跳出
                if (dist >= nums.count - 1) {
                    return true
                }
                
            }
            
        } 
        return false
    }
}
// @lc code=end

