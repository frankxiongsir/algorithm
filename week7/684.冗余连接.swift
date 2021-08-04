/*
 * @lc app=leetcode.cn id=684 lang=swift
 *
 * [684] 冗余连接
 */

// @lc code=start
class Solution {
    class DisjointSet {
        /// muban
        var fa: [Int]
        init(_ size: Int) {
            fa = Array<Int>(0..<size)
        }

        func find(_ i: Int) -> Int {
            
            if i == fa[i] {
                return i
            }
            fa[i] = find(fa[i])
            return fa[i]
        }

        func union(_ x: Int, _ y: Int) {
            let rootx = find(x)
            let rooty = find(y)
            if rootx != rooty {
                fa[rootx] = rooty
            }
        }

        public func connected(x: Int, y: Int) -> Bool {
            let xRoot = find(x)
            return xRoot == find(y)
        }
    }

    func findRedundantConnection(_ edges: [[Int]]) -> [Int] {
        /// 初始化并查集模板
        var uf = DisjointSet(edges.count + 1)
        for edge in edges {
            /// 两个顶点不属于同一个连接，则合并
            if !uf.connected(x: edge.first!, y: edge.last!) {
                uf.union(edge.first!, edge.last!)
            } else {
                return edge
            }
        }
        return []
    }
}
// @lc code=end

