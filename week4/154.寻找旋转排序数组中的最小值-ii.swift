/*
 * @lc app=leetcode.cn id=154 lang=swift
 *
 * [154] 寻找旋转排序数组中的最小值 II
 */

// @lc code=start
class Solution {
    func findMin(_ nums: [Int]) -> Int {
        var left = 0
        var right = nums.count - 1

        while left < right {

            let mid = left + (right - left ) >> 1
            
            /// 有重复数字
            /// 如果index = mid 小，则最小在左边区域，缩小到 left ~ mid
            if nums[mid] < nums[right] {
                right = mid
            } else if (nums[mid] > nums[right]) {
            /// 如果index = mid 大，则最小在右边区域，缩小到 mid+1 ~ right
                left = mid + 1
            } else {
            /// 如果index = mid 等于 right，有重复数字，移除重复数字再比较
                right = right - 1 
            }
        }
        return nums[left]
    }
}
// @lc code=end

