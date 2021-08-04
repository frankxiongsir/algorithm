/*
 * @lc app=leetcode.cn id=200 lang=swift
 *
 * [200] 岛屿数量
 */

// @lc code=start
class Solution {
    class DisjointSet {
        var count: Int
        var fa: [Int]
        var rank: [Int]
        init(_ grid: [[Character]]) {
            let m = grid.count
            let n = grid[0].count 
            count = 0 
            rank = Array(repeating: 0, count: m * n)
            fa = Array(repeating: -1, count: m * n)
            for i in 0 ..< m {
                for j in 0 ..< n {
                    if grid[i][j] == "1" {
                        count += 1
                        fa[i * n + j] = i * n + j
                    }
                    rank[i * n + j] = 0
                }
            } 
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
                if rank[rootx] > rank[rooty] {
                    fa[rooty] = rootx
                } else if rank[rootx] < rank[rooty] {
                    fa[rootx] = rooty
                } else {
                    fa[rooty] = rootx
                    rank[rootx] += 1
                }
                count -= 1
            }
        }

        func getCount() -> Int {
            return count
        } 
    }

    func numIslands(_ grid: [[Character]]) -> Int {
        var grid = grid
        let nr = grid.count 
        let nc = grid[0].count
        var numOfIslands = 0
        var uf: DisjointSet = DisjointSet(grid)
        for r in 0 ..< nr {
            for c in 0 ..< nc {
                if grid[r][c] == "1" {
                    grid[r][c] = "0" 
                    if r - 1 >= 0 && grid[r - 1][c] == "1" {
                        uf.union(r * nc + c, (r + 1) * nc + c)
                    }
                    if r + 1 < nr && grid[r + 1][c] == "1" {
                        uf.union(r * nc + c, (r + 1) * nc + c)
                    }
                    if c - 1 >= 0 && grid[r][c - 1] == "1" {
                        uf.union(r * nc + c, r * nc + c - 1)
                    }
                    if c + 1 < nc && grid[r][c + 1] == "1" {
                        uf.union(r * nc + c, r * nc + c + 1)
                    }
                }
            }
        }
        return uf.getCount()
    }
}
// @lc code=end

