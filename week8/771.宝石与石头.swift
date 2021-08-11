/*
 * @lc app=leetcode.cn id=771 lang=swift
 *
 * [771] 宝石与石头
 */

// @lc code=start
public struct HashSet<T: Hashable> {
    fileprivate var dictionary = Dictionary<T, Bool>()

    public init() {

    }

    public mutating func insert(_ element: T) {
        dictionary[element] = true
    }

    public mutating func remove(_ element: T) {
        dictionary[element] = nil
    }

    public func contains(_ element: T) -> Bool {
        return dictionary[element] != nil
    }

    public func allElements() -> [T] {
        return Array(dictionary.keys)
    }

    public var count: Int {
        return dictionary.count
    }

    public var isEmpty: Bool {
        return dictionary.isEmpty
    }
}

class Solution {
    func numJewelsInStones(_ jewels: String, _ stones: String) -> Int {
        /// hash  o(m+n)
        var jewelDic = HashSet<Character>()
        for j in jewels {
            jewelDic.insert(j)
        }
        var res = 0
        for s in stones {
            if (jewelDic.contains(s)) {
                res += 1
            }
        }
        return res
    }
}
// @lc code=end

