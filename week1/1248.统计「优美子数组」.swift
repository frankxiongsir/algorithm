/*
 * @lc app=leetcode.cn id=1248 lang=swift
 *
 * [1248] 统计「优美子数组」
 */

// @lc code=start
class Solution {
    func numberOfSubarrays(_ nums: [Int], _ k: Int) -> Int {
        /// 先插入0转坐标1~n
        var numsMut = nums
        numsMut.insert(0, at: 0)
        
        /// 取模变成0，1，前缀和
        var sum:[Int] = [Int](repeating: 0, count: numsMut.count)
        for index in (1..<numsMut.count) {
           
            sum[index] = sum[index-1] + numsMut[index] % 2
        }
        /// 计数count
        var count:[Int] = [Int](repeating: 0, count: numsMut.count)
        for index in (0..<numsMut.count) {
            count[sum[index]] += 1
        }
        /// 统计 = k的子数组个数
        var ans = 0
        for index in (1..<numsMut.count) {
            if sum[index] - k >= 0 {
                ans += count[sum[index] - k]
            }
        }
        return ans
    }
}
// @lc code=end

