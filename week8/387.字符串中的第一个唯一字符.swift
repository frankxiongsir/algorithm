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
        let res = dic.values.sorted(by: <)
        let res2 = res.filter{ (x) -> Bool in x >= 0}
        return res2.count > 0 ? res2[0] : -1
    }
}
// @lc code=end

