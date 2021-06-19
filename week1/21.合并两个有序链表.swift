/*
 * @lc app=leetcode.cn id=21 lang=swift
 *
 * [21] 合并两个有序链表
 */

// @lc code=start
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        /// 需要合并后的链表 head，需要一个移动节点pre
        /// l1链表 l2链表如果 l1小于pre next指向l1，移动l1，移动pre
        /// l1链表 l2链表如果 l1大于pre next指向l2，移动l2，移动pre
        var ll1 = l1
        var ll2 = l2
        
        let headNode = ListNode.init(0)
        var pre: ListNode? = headNode
        while ll1 != nil && ll2 != nil  {
            if ll1!.val < ll2!.val {
                pre?.next = ll1
                ll1 = ll1?.next
            } else {
                pre?.next = ll2
                ll2 = ll2?.next
            }
            pre = pre?.next
        }
        if (ll1 != nil) {
            pre?.next = ll1
        }
        if (ll2 != nil) {
            pre?.next = ll2
        }
        return headNode.next
    }
}
// @lc code=end

