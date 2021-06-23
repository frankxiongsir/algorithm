/*
 * @lc app=leetcode.cn id=88 lang=swift
 *
 * [88] 合并两个有序数组
 */

// @lc code=start
class Solution {
    // func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        
    //     var i = m - 1
    //     var j = n - 1
        
    //     for index in (0..<m+n).reversed() {
    //         if j < 0 || (i >= 0 && nums1[i] >= nums2[j]) {
    //             nums1[index] = nums1[i]
    //             print(nums1[i])
    //             print(index)
                
    //             i = i - 1
    //         } else {
    //             nums1[index] = nums2[j]
    //             print(nums2[j])
    //             j = j - 1
    //         }
    //     }
    // }
    
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
            
        nums1 = [Int](nums1[0..<m])
        for item in nums2 {
            nums1.append(item)
        }
        nums1 = nums1.sorted()
    }
}
// @lc code=end

