/*
 * @lc app=leetcode.cn id=697 lang=swift
 *
 * [697] 数组的度
 */

// @lc code=start
class Solution {
    func findShortestSubArray(_ nums: [Int]) -> Int {
        /// 存储key=数组元素；value=数组元素出现次数
        var du = [Int:Int]()
        /// 存储key=数组元素；value=数组元素出现的坐标集
        var indexArray = [Int:[Int]]()

        for (index, item) in nums.enumerated() {
            /// 得到数组元素对应的次数map
            if let count = du[item] {
                du[item]! = count + 1
            } else {
                du[item] = 1
            }
            /// 得到数组元素对应的坐标集合map，坐标数组有序
            if let indexs = indexArray[item] {
                var temp = indexs
                temp.append(index)
                indexArray[item] = temp
            } else {
                indexArray[item] = [index]
            }
        }
        print(du)
        print(indexArray)
        
        /// 得到是最大度的元素的集合
        var maxArray = [Int]()
        var max = 0
        for (key, value) in du {
            if (value >= max) {
                if (value > max) {
                    maxArray.removeAll()
                }
                maxArray.append(key)
                max = value
            }
        }
        print(maxArray)
        print(max)
        /// 遍历最大度元素的集合，算出集合中[坐标结束 - 坐标开始]最小的值
        var ans = 50000
        for item in maxArray {
            if let indexs = indexArray[item] {
                ans = min(ans, indexs[indexs.count-1] - indexs[0]) 
            }
        }
        return ans + 1
    }
}
// @lc code=end

