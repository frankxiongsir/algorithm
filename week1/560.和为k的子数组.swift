/*
 * @lc app=leetcode.cn id=560 lang=swift
 *
 * [560] 和为K的子数组
 */

// @lc code=start
class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
        /// 连续、和为K、返回个数
        var count:Int = 0
        for start in (0..<nums.count) {
            var sum = nums[start]
            if sum == k {
                count += 1
            }
            for end in (start + 1..<nums.count) {
                sum += nums[end]
                if sum == k {
                    count += 1
                }
            }
        }
        return count
    }
}
// @lc code=end

