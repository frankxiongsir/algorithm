/*
 * @lc app=leetcode.cn id=771 lang=swift
 *
 * [771] 宝石与石头
 */

// @lc code=start
class Solution {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        var jewelDic = [Character : Int]()
        for j in jewels {
            jewelDic[j] = 1
        }
        var res = 0
        for s in stones {
            if let _ = jewelDic[s] {
                res += 1
            }
        }
        return res
    }
}
// @lc code=end

