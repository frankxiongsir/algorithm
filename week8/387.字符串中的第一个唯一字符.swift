/*
 * @lc app=leetcode.cn id=387 lang=swift
 *
 * [387] 字符串中的第一个唯一字符
 */

// @lc code=start
class Solution {
    func firstUniqChar(_ s: String) -> Int {
        /// 字符 ：index
        var dic = [Character : Int]()
        for (index, char) in s.enumerated() {
            
            if let _ = dic[char] {
                /// 重复元素剔除，标记-1
                dic[char] = -1
            } else {
                dic[char] = index
            }
        }

        /// 代码虽然看着简答一些，但是时间变慢了 75.54%
        var res = s.count
        for item in dic {
            
            if (item.value != -1 && item.value < res) {
                res = item.value
            }
        }
        return res == s.count ? -1 : res
    }
}
// @lc code=end