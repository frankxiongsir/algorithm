/*
 * @lc app=leetcode.cn id=94 lang=swift
 *
 * [94] 二叉树的中序遍历
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

    

    func inorderTraversal(_ root: TreeNode?) -> [Int] {
        var ans : [Int] = [Int]()
        middle(root, &ans)
        return ans
    }

    
    func middle(_ root: TreeNode?, _ ans: inout [Int]) {
        
        /// 第二步写结束条件
        guard let _ = root else {
            
            return  
        }

        /// 第一步先写逻辑
        /// 先遍历左子树
        middle(root?.left, &ans)        
        /// 根节点插入
        if let val = root?.val {
            ans.append(val)
        }        
        /// 最后遍历右子树
        middle(root?.right, &ans)
        
    }
}
// @lc code=end

