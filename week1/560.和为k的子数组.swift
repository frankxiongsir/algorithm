/*
 * @lc app=leetcode.cn id=560 lang=swift
 *
 * [560] 和为K的子数组
 */

// @lc code=start
class Solution {
    func subarraySum(_ nums: [Int], _ k: Int) -> Int {
         /// 连续、和为K、返回个数
        var numsCopy = nums
        numsCopy.insert(0, at: 0)
        
        var sum = [Int](repeatElement(0, count: numsCopy.count))
        for i in (1..<numsCopy.count) {
            sum[i] = sum[i - 1] + numsCopy[i]
        }
        
        var count:[Int:Int] = [0:1]
        var ans = 0
        
        for i in (1..<numsCopy.count) {
            if let c = count[sum[i] - k] {
                ans += c
            }
            count[sum[i]] = (count[sum[i]] ?? 0) + 1
        }
        
        return ans
    }
}
// @lc code=end

