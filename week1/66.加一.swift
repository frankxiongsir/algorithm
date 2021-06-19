/*
 * @lc app=leetcode.cn id=66 lang=swift
 *
 * [66] 加一
 */

// @lc code=start
class Solution {
    func plusOne(_ digits: [Int]) -> [Int] {
        /// 1、+1不进位的情况
        /// 2、+1进位的情况
        /// 3、特殊为0的情况
        var result:[Int] = digits
        /// 进位tag
        var flag:Int = 1
        
        for i in (0..<digits.count).reversed() {
            let temp = result[i] + flag
            result[i] = temp % 10
            flag = temp / 10
        }
        if flag != 0 {
            result.insert(flag, at: 0)
        }
        return result
    }
}
// @lc code=end

