/*
 * @lc app=leetcode.cn id=130 lang=swift
 *
 * [130] 被围绕的区域
 */

// @lc code=start
class Solution {
    func solve(_ board: inout [[Character]]) {
        // 如果只有1-2行/列，则无须修改矩阵，因为都是在边界上
        guard board.count > 2, board.first!.count > 2 else { return }
        let row = board.count
        let column = board.first!.count
        // 遍历矩阵顶部和底部
        for j in 0..<column {
            // // 顶部： board[0][j]
            // dfs(&board, 0, j)
            // // 底部： board[row-1][j]
            // dfs(&board, row-1, j)

            bfs(&board, 0, j)
            bfs(&board, row-1, j)

        }
        // 遍历左边和右边，注意左右边角已经在上面中遍历
        for i in 1..<row-1 {
            // // 左边：board[i][0]
            // dfs(&board, i, 0)
            // // 右边：board[i][column-1]
            // dfs(&board, i, column-1)

            bfs(&board, i, 0)
            bfs(&board, i, column-1)
        }

        for i in 0..<row {
            for j in 0..<column {
                if board[i][j] == "-" {
                    // 将无须修改的 O 重置回 O
                    board[i][j] = "O"
                } else if board[i][j] == "O" {
                    board[i][j] = "X"
                }
            }
        }
    }

    let directions = [(0, 1), (0, -1), (1, 0), (-1, 0)]

    // 深度优先搜索
    func dfs(_ board: inout [[Character]], _ i: Int, _ j: Int) {
        guard board[i][j] == "O"  else { return }
        // 把与边界的 O 相连的 O 都先标记为 “-” 代表这部分的 O 无须修改为 X
        board[i][j] = "-"
        // 往当前位置四个方向进行查找
        for direct in directions {
            var newI = i + direct.0
            var newJ = j + direct.1
            if newI >= 0, newI < board.count, newJ >= 0, newJ < board.first!.count {
                dfs(&board, newI, newJ)
            }
        }
    }

    // 广度优先搜索
    func bfs(_ board: inout [[Character]], _ i: Int, _ j: Int) {
        guard board[i][j] == "O" else { return }
        var queue = [(Int, Int)]()
        // 添加初始值到队列里
        queue.append((i, j))
        while !queue.isEmpty {
            let size = queue.count
            for i in 0..<size {
                let current = queue.removeFirst()
                var i = current.0
                var j = current.1
                if board[i][j] == "O" {
                    board[i][j] = "-"
                    for direct in directions {
                        var newI = i + direct.0
                        var newJ = j + direct.1
                        if newI >= 0, newI < board.count, 
                        newJ >= 0, newJ < board.first!.count, 
                        board[newI][newJ] == "O" {
                            queue.append((newI, newJ))
                        }
                    }
                }
            }
        }
    }
}

// @lc code=end

