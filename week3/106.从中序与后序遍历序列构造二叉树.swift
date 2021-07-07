/*
 * @lc app=leetcode.cn id=106 lang=swift
 *
 * [106] 从中序与后序遍历序列构造二叉树
 */

// @lc code=start
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */

class Solution {
    func buildTree(_ inorder: [Int], _ postorder: [Int]) -> TreeNode? {
        return build(inorder, 0, inorder.count - 1, 
                    postorder, 0, postorder.count - 1)
    }

    func build(_ inorder: [Int], _ l1: Int, _ r1: Int,
               _ postorder: [Int], _ l2: Int, _ r2: Int) -> TreeNode? {
        /// 判断终止条件
        if l1 > r1 {
            return nil
        }

        /// 根据后序数组找到根节点
        let root = TreeNode.init(postorder[r2])
        var middle = l1
        while inorder[middle] != root.val {
            middle += 1
        }
        /// 根据根节点找到中序数组中的 左、右子树
        let leftSize = middle - l1
        let rightSize = r1 - middle
        /// 构建左右子树
        /// l1-r1对应中序数组的起点、终点坐标
        /// l2-r2对应后序数组的起点、终点坐标
        root.left = build(inorder, l1, l1 + leftSize - 1, postorder, l2, l2 + leftSize - 1) 
        root.right = build(inorder, middle + 1, middle + rightSize, postorder, l2 + leftSize, r2 - 1)
        return root
    }
}
// @lc code=end

