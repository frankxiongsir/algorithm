/*
 * @lc app=leetcode.cn id=18 lang=swift
 *
 * [18] 四数之和
 */

// @lc code=start
class Solution {
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        var result = [[Int]]()
        let sortNums = nums.sorted()
        for i in (0..<sortNums.count) {
            // 去重
            if i > 0 && sortNums[i] == sortNums[i - 1] {
                continue
            }
            
            for j in (i+1..<sortNums.count) {
                // 去重
                if (j > i+1 && sortNums[j] == sortNums[j - 1]) {
                    continue
                }
                
                var l = j + 1
                var r = sortNums.count - 1

                while (l < r) {
                    let sum = sortNums[i] +  sortNums[j] + sortNums[l] + sortNums[r]
                    
                    if (sum > target) {
                        r -= 1
                    } else if (sum < target) {
                        l += 1
                    } else {
                        result.append([sortNums[i], sortNums[j], sortNums[l], sortNums[r]])

                        // 去重
                        while (l < r && sortNums[l] == sortNums[l + 1]) {
                            l += 1
                        }
                        while (l < r && sortNums[r] == sortNums[r - 1]) {
                            r -= 1
                        }
                        r -= 1
                        l += 1
                    }
                }
            }
        }

        return result
    }
}
// @lc code=end

