/*
 * @lc app=leetcode.cn id=58 lang=swift
 *
 * [58] 最后一个单词的长度
 */

// @lc code=start
class Solution {
    func lengthOfLastWord(_ s: String) -> Int {

        let a = s.split(separator: " ")
        if (a.count < 1) {
            return 0
        }
        return a[a.count - 1].count
    }
}
// @lc code=end

