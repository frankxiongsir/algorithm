/*
 * @lc app=leetcode.cn id=875 lang=swift
 *
 * [875] 爱吃香蕉的珂珂
 */

// @lc code=start
class Solution {
    func minEatingSpeed(_ piles: [Int], _ h: Int) -> Int {
        var lo = 1;
        var hi = 1_000_000_000;
        while (lo < hi) {
            var mi = (lo + hi) / 2;
            if (!possible(piles, h, mi)) {
                lo = mi + 1;
            }

            else {
                hi = mi;
            }
        }

        return lo;

    }

    
    func possible(_ piles: [Int], _ h: Int, _ k: Int) -> Bool {
        var time = 0
        for p in piles {
            time += (p - 1) / k + 1 
        }
        return time <= h
    }
    
}
// @lc code=end

