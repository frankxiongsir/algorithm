/*
 * @lc app=leetcode.cn id=697 lang=swift
 *
 * [697] 数组的度
 */

// @lc code=start
class Solution {
    func findShortestSubArray(_ nums: [Int]) -> Int {
        ///存储key=数组元素；
        ///value=数组[元素出现的次数，元素第一次出现坐标，元素最后一次出现坐标]
        var du = [Int:[Int]]()

        for (index, item) in nums.enumerated() {
            /// 得到数组元素对应的次数及坐标
            if let array = du[item] {
                var temp = array
                temp[0] += 1
                temp[2] = index
                du[item] = temp
            } else {
                du[item] = [1, index, index]
            }
        }
        print(du)
        
        var maxDu = 0
        var minLen = 0

        for (index, item) in du {
            let arr = item
            if maxDu < arr[0] {
                maxDu = arr[0]
                minLen = arr[2] - arr[1] + 1;
            } else if (maxDu == arr[0]) {
                if (minLen > arr[2] - arr[1] + 1) {
                    minLen = arr[2] - arr[1] + 1;
                }
            }
        }

        return minLen
    }
}
// @lc code=end

